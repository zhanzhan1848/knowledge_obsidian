---
type: paper
created: 2026-10-25
updated: 2026-10-25
tags: [paper, 渲染, 流媒体, 感知质量, 帧率自适应, 分辨率自适应, HVS, 神经网络, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://www.cl.cam.ac.uk/research/rainbow/projects/adaptive_streaming/
---

# Streaming of rendered content with adaptive frame rate and resolution

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Streaming of rendered content with adaptive frame rate and resolution |
| **作者** | Yaru Liu, Joseph G. March, Rafał K. Mantiuk |
| **单位** | University of Cambridge（Rainbow Group / Computer Lab） |
| **发表** | ACM SIGGRAPH 2026 Conference Proceedings, 2026 |
| **链接** | [原文](https://doi.org/10.1145/3799902.3811136) |
| **DOI** | 10.1145/3799902.3811136 |
| **论文 PDF** | https://www.cl.cam.ac.uk/~yl962/Yaru_streaming_of_rendered_content_with_adaptive_frame_rate_and_resolution.pdf |
| **相关项目** | ALSaRR（自适应局部着色与刷新率）、MARRR（运动质量模型）、ColorVideoVDP |

---

## 核心贡献

> 利用**人类视觉系统（HVS）的时空感知极限**，在**带宽约束**下**同时自适应调整帧率与分辨率**，而非传统做法只降分辨率。轻量神经网络预测最优 (帧率, 分辨率) 组合，以**感知质量**为目标。

1. **联合调整帧率 + 分辨率**：现有方案以固定帧率（30/60 fps）渲染，带宽受限时**只降分辨率** → 感知质量次优。本文**同时**调整两者。
2. **感知驱动**：利用 HVS 的**时空感知极限**，把「感知质量」而非像素保真度作为优化目标。
3. **轻量神经网络预测器**：输入 = 传输带宽 + 内容 + 运动速度；输出 = 最优 (帧率, 分辨率) 组合。
4. **Codec-agnostic**：与编解码器无关，**对现有渲染基础设施只需极小改动**。
5. **感知视频质量指标标注的大型数据集**随论文发布。

---

## 技术方案

### 核心思想

```
传统：服务器固定 30/60 fps 渲染 → 带宽不足 → 只降分辨率
                              ✗ 感知质量次优（高运动时低分辨率的代价被低估）

本文：轻量神经网络
  输入: 带宽 B, 内容特征 C, 运动速度 v
  输出: (fps, resolution) 最优组合
  训练: 大规模渲染内容数据集 + 感知视频质量指标标注（AR-DAVID）
  部署: codec-agnostic，渲染基础设施改动极小
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **联合 (fps, resolution) 决策** | 同时优化时间与空间采样率，而非只调其一 |
| **HVS 时空感知模型** | 以人眼时空分辨极限为依据，判断「少传多少还能被看见」 |
| **轻量网络预测器** | 运行时由带宽 + 运动速度实时选择参数 |
| **感知质量指标标注** | 训练标签来自感知视频质量度量（而非 PSNR/SSIM） |
| **运动速度输入** | 运动越大 → 降帧率代价越小（运动掩盖），可省更多带宽 |
| **Codec-agnostic** | 不绑定具体视频编码方案 |
| **AR-DAVID 数据集** | 主动采样（ASAP）+ 贝叶斯成对比较（pwcmp）构建的大规模标注集 |

---

## 公式

```math
\text{决策目标}:\quad
(\hat{f}, \hat{r}) = \arg\max_{\substack{f \le f_{\max}\\ r \in \mathcal{R}}}
\underbrace{Q_{\text{pers}}(\text{content}, f, r, v)}_{\text{感知视频质量}}
\quad \text{s.t.}\quad
\underbrace{\text{bitrate}(f, r) \le B}_{\text{带宽约束}}
```

```math
\text{感知质量对帧率的敏感度（运动依赖）}:\quad
\frac{\partial Q_{\text{pers}}}{\partial f}
\;\propto\; \frac{1}{v} \quad\Longrightarrow\quad
\text{高运动场景可容忍更低帧率}
```

---

## 代码片段

```python
# 概念示意：轻量网络预测最优 (fps, resolution)
import torch, torch.nn as nn

class AdaptiveStreamPredictor(nn.Module):
    """输入: 带宽 + 内容特征 + 运动速度; 输出: 最优 (fps, resolution) 组合。"""
    def __init__(self, content_dim: int = 256):
        super().__init__()
        self.net = nn.Sequential(
            nn.Linear(content_dim + 2, 128), nn.ReLU(),   # +2: bandwidth, motion velocity
            nn.Linear(128, 64), nn.ReLU(),
            nn.Linear(64, 2),                              # (fps, log2 resolution)
        )

    def forward(self, content_feat, bandwidth, motion_velocity):
        x = torch.cat([content_feat,
                        bandwidth.view(-1, 1),
                        motion_velocity.view(-1, 1)], dim=-1)
        fps_log, res_log = self.net(x)
        fps = torch.exp(fps_log).clamp(1, 60)          # 帧率上限
        res = 2 ** res_log.round()                      # 分辨率（2 的幂）
        return fps, res

# 训练标签：感知视频质量指标（AR-DAVID），而非 PSNR
# loss = perceptual_quality_loss(rendered_at(fps, res), ground_truth)
```

---

## 实验结论

- **数据集**: 大规模渲染内容数据集，标签为**感知视频质量指标**（AR-DAVID；用 ASAP 主动采样 + pwcmp 贝叶斯成对比较构建）
- **基线**: 服务器固定帧率 + 带宽受限时降分辨率的传统策略
- **结果**:
  - 在**带宽约束**下显著提升**感知质量**，同时**降低渲染成本**
  - 预测器为**轻量**网络，运行时开销小
  - **codec-agnostic**，对现有渲染基础设施**改动极小**
  - 在真实内容与合成内容上均有效

---

## 局限性

- 训练依赖**感知质量标注数据集**（标注成本高）；跨内容类型泛化需验证
- 假设运动速度等特征可在服务端/客户端廉价获得
- 只优化**感知质量**，未直接约束**渲染 GPU 成本**（虽声称可降低）
- 不涉及客户端解码与显示延迟的联合优化

---

## 相关工作

- [[2026-10-25-LightOpt-Lights-Optimization-Real-Time-Rendering]] — 互补：渲染侧光源精简
- [[2026-10-25-RCGP-Resource-Contracts-Graphics-Programming]] — 互补：工程契约
- [[2026-10-09-Foveated-Rendering-Phase-Shifted-Noise-Judder]] — 相关：foveated 渲染
- [[2026-07-19-AlSaRR-Perceptual-Adaptive-Local-Shading]] — 相关的自适应着色/刷新率工作

---

## 实现建议

- **实现难度**: **中**（感知质量模型 + 轻量预测器 + 参数选择逻辑；无复杂渲染算法）
- **预期性能**: 感知质量提升（相对传统只降分辨率策略）；渲染成本下降（帧率降低直接省 GPU）
- **适用场景**: **云渲染 / 移动端串流**（游戏串流、AR 远程渲染）、带宽受限的边缘渲染
- **⭐ 优先级**: **中** — 偏系统与感知交叉方向，对渲染算法本身无直接贡献；但**「用感知指标而非像素指标做训练标签」**这一方法论值得记住；Cambridge Rainbow Group（Mantiuk，感知质量领域权威）出品，方法论可信

---

## 备注

- 无 arXiv 预印本；通过项目页 + OpenAlex API 抓取摘要
- SIGGRAPH 2026 会议论文，此前批次遗漏，本次补齐
