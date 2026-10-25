---
type: paper
created: 2026-10-25
updated: 2026-10-25
tags: [paper, 渲染, 图像处理, 大核滤波, 可微优化, Polyphase, 空间变换, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://doi.org/10.1145/3799902.3811160
---

# DPF: Differentiable Polyphase Filtering for Large-Kernel Approximation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DPF: Differentiable Polyphase Filtering for Large-Kernel Approximation |
| **作者** | Zhe Cao, Zhizhen Wu, Zhonggui Chen, Rui Wang, Yuchi Huo |
| **单位** | 浙江大学 CAD&CG 国家重点实验室 / 厦门大学 / 中国传媒大学 |
| **发表** | ACM SIGGRAPH 2026 Conference Papers ('26), 2026 |
| **链接** | [原文](https://doi.org/10.1145/3799902.3811160) |
| **DOI** | 10.1145/3799902.3811160 |
| **代码** | 未公开（论文中未提供 arXiv / 项目页链接） |

---

## 核心贡献

> 把大核滤波的稀疏分解从「固定分辨率优化」推广到 **Polyphase（多相）框架**：支持**跨分辨率**的可微稀疏核优化，同时对**空间变化（spatially-variant）稠密核**同样有效。

1. **Polyphase 框架**：以多相分解形式表达稀疏核，使优化可在**不同分辨率**上进行 —— 突破以往方法只能固定分辨率处理的限制。
2. **最快的大核近似**：在论文指标下取得**迄今为止最快的近似**结果。
3. **空间变化稠密核**：方法对**空间变化（spatially-varying）稠密核**依然高度有效。
4. **两个效率增强技术**：
   - **Spatial-to-Depth 变换**：把 2D 滤波转为深度维操作
   - **Asymmetric Intensity-Decoupled 变换**：非对称强度解耦
5. **Layer-Adaptive Filtering**：处理**核尺寸空间变化**的场景 —— 融合多层核实现快速滤波。

---

## 技术方案

### 核心思想

```
大核滤波 (如 bloom / 虚化 / 阴影柔化 / 降噪)
   ↓ 传统：把大核分解为多个稀疏小核（并行加速友好）
   ↓ 已有方法：基于优化的近似 —— 限制在固定分辨率
DPF:
   Polyphase 分解 → 稀疏核在多相子空间上参数化
   ↓ → 跨分辨率可微优化
   ↓ + Spatial-to-Depth / Asymmetric Intensity-Decoupled → 效率
   ↓ + Layer-Adaptive → 核尺寸空间变化
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Polyphase Filtering** | 将核分解为 $\frac{1}{L}\sum_{l=0}^{L-1} h_l(n-l)$ 的多相形式，各相独立可微优化 |
| **跨分辨率优化** | 多相参数天然对应不同采样相位 → 单一优化同时覆盖多分辨率 |
| **Spatial-to-Depth 变换** | 空间滤波 → 深度方向滤波，利用深度维并行度提升效率 |
| **Asymmetric Intensity-Decoupled 变换** | 解耦非对称强度特征，降低优化难度 |
| **Layer-Adaptive Filtering** | 融合多个层级的核以应对**空间变化的核尺寸** |
| **可微优化** | 整个稀疏核参数集可微 → 可嵌入端到端可微渲染管线 |

---

## 公式

```math
h(n) = \sum_{l=0}^{L-1} h_l\big(n - l\big)
\qquad\Longleftrightarrow\qquad
H(z) = \sum_{l=0}^{L-1} z^{-l} H_l(z)
\quad\text{(多相 / polyphase 分解)}
```

```math
\text{Spatial-to-Depth:}\quad
\underbrace{(h * I)}_{\text{2D 空间卷积}}
\;\xrightarrow{\ \text{reshape}\ }\;
\underbrace{\hat{h} * \hat{I}}_{\text{深度维 1D 卷积}}
\quad\Longrightarrow\quad \text{并行度提升}
```

```math
\text{Layer-Adaptive:}\quad
h_{\text{eff}}(n) = \sum_{k} w_k(n)\, h^{(k)}(n),
\qquad \text{各层 } h^{(k)} \text{ 对应不同核尺寸}
```

---

## 代码片段

```python
# 概念示意：Polyphase 可微稀疏核优化
import torch

class PolyphaseSparseKernel(torch.nn.Module):
    """把大核分解为 L 个相位的稀疏核，支持跨分辨率共享参数。"""
    def __init__(self, num_phases: int = 4, kernel_size: int = 17):
        super().__init__()
        # 每相一个稀疏支撑（中心 + 若干抽头），参数可微
        self.weights = torch.nn.Parameter(
            torch.randn(num_phases, kernel_size) * 1e-3)
        self.taps = torch.nn.Parameter(torch.zeros(num_phases, kernel_size))

    def forward(self, img):
        # 1) 按相位抽取子采样序列（polyphase）
        phases = [img[..., p::num_phases] for p in range(self.num_phases)]
        # 2) 每相用稀疏核做 1D 滤波（深度维并行）
        outs = [torch.nn.functional.conv1d(
                    p.permute(2, 0, 1).unsqueeze(1),   # B,C,1,W
                    w.view(1, 1, -1), padding='same')
                .squeeze(1) for p, w in zip(phases, self.weights)]
        # 3) 重新交织回原分辨率
        return interleave_phases(outs, self.num_phases)

    def loss(self, img, target):
        return torch.nn.functional.mse_loss(self.forward(img), target)
```

---

## 实验结论

- **数据集**: 图像后处理 / 视频特效的大核滤波任务（多分辨率、含空间变化核尺寸场景）
- **基线**: 既有的基于优化的稀疏核近似方法（SOTA）
- **结果**:
  - 取得**迄今为止最快的大核近似**
  - 在**计算性能与视觉质量**两方面均显著优于既有 SOTA
  - 对**空间变化稠密核**同样高度有效（多数先前方法在此失效）
  - 跨分辨率优化后，单套参数即可服务多分辨率输出

---

## 局限性

- **代码与项目页均未公开**，仅有 ACM 论文页 → 复现成本高
- 依赖优化求解（离线训练成本）
- 论文聚焦图像/视频后处理，未涉及 3D 场景光追中的直接应用（如大核阴影滤波、间接光低通）

---

## 相关工作

- [[2026-10-25-Gabor-Fields-Orientation-Selective-LOD-Volume-Rendering]] — 互补：核的频谱选择性
- [[2026-10-25-Adaptive-Streaming-Perceptual-FrameRate-Resolution]] — 互补：感知质量驱动
- [[2026-10-09-Tabula-Rasa-Unit-Variance-Noise]] — 相关：噪声分布与滤波
- [[2026-07-20-SIGGRAPH-2026-Path-Space-Stylization]] — 相关：path-space 图像域操作

---

## 实现建议

- **实现难度**: **中**（多相分解 + 稀疏支撑参数化 + 可微优化，工程模式清晰）
- **预期性能**: 「最快近似」定性结论；具体加速比与质量数值需查论文表格（本次摘要未给出具体倍数）
- **适用场景**: 实时后处理管线（bloom / DOF / 阴影柔化 / 时域降噪），以及**需要跨分辨率共享参数**的场景
- **⭐ 优先级**: **中** — 偏图像处理而非渲染核心，但对「可微后处理 + 跨分辨率参数共享」这一模式有工程价值；**Polyphase 分解 + 稀疏支撑可微参数化**是值得记住的通用技巧

---

## 备注

- 无 arXiv 预印本、无公开代码；通过 OpenAlex API 抓取摘要
- SIGGRAPH 2026 会议论文，此前批次遗漏，本次补齐
