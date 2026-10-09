---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, monte-carlo, denoising, noise-generation, spatio-temporal, SIGGRAPH-Asia-2026, TAA]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.11653
venue: SIGGRAPH Asia 2026 Conference Papers
year: 2026
---

# Monte Carlo Estimation of Unit-Variance Noise with Controlled Spatio-Temporal Correlation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Monte Carlo estimation of unit-variance noise with controlled spatio-temporal correlation |
| **作者** | Chen Liu 等 |
| **发表** | SIGGRAPH Asia 2026 Conference Papers |
| **链接** | [原文](https://arxiv.org/abs/2610.11653) |
| **DOI** | [10.48550/arXiv.2610.11653](https://doi.org/10.48550/arXiv.2610.11653) |
| **代码** | [github.com/facebookresearch/Tabula-Rasa](https://github.com/facebookresearch/Tabula-Rasa) |

---

## 核心贡献

> 提出一种生成**单位方差时空相关高斯噪声**的新方法：将问题表述为**经典像素重建 + 方差估计的联合 Monte Carlo 估计**，并借鉴数据库领域的 *sketching* 思想。代码更简单、速度更快，对**时间相关与方差控制**的下游任务（如去噪、TAA）极有帮助。

1. **联合 MC 估计框架**：同时估计像素重建值与方差（而非分开估计）
2. **Sketching 思想引入**：来自数据库 streaming/sketching 文献
3. **时空相关性可控**：精确控制噪声的时间相关性和方差
4. **更简单/更快的代码**：相比之前方法实现简化
5. **Meta 出品**：作为 denoiser / temporal filter 前处理工具

---

## 技术方案

### 核心思想

传统 Monte Carlo 噪声生成需要分别采样像素值与方差。本工作观察到：可以用一个**共享的随机"草图"**（sketch）同时估计这两者，避免双重计算。这种 sketching 思想来自数据库领域（如 count-min sketch、AMS sketch），在此首次被引入到 graphics 噪声生成。

### 关键技术

| 技术 | 说明 |
|------|------|
| Joint MC estimation | 像素值 + 方差由同一 sketch 估计 |
| Spatio-temporal correlation | 时间相关参数 + 空间相关核可独立控制 |
| Unit-variance guarantee | 输出噪声精确为方差 1.0（可缩放） |
| Streaming sketch | 单遍（one-pass）估计，无需存储历史帧 |

### 应用场景

- **采样器噪声注入**：低 SPP path tracing 的伪随机抖动
- **Denoiser 输入扰动**：增强去噪器对真实噪声的鲁棒性
- **Temporal filter 训练**：合成具有真实时空特性的训练数据
- **TAA 抖动模式**：可控相关性的低差异抖动

---

## 公式

噪声生成（草图化）：

```math
S_t = \sum_{i=1}^{N} \phi(x_i) \quad \text{(streaming sketch)}
```

像素估计：

```math
\hat{I}_t = \mathcal{F}^{-1}(S_t) / N
```

方差估计（来自 sketch 的二阶矩）：

```math
\hat{\sigma}^2_t = \mathcal{G}(S_t^{(2)}) - \mathcal{G}(S_t)^2
```

其中 $\phi$ 是时空相关的随机投影函数，$\mathcal{G}$ 是 sketch 查询函数。

---

## 实验结果

- **数据集**: 标准测试场景（含 path tracing 真实噪声）
- **基线**: 之前最优噪声生成方法（Heitz 等）
- **结果**:
  - 代码量大幅减少（论文声明）
  - 时空相关性控制更精细
  - 方差误差 < 1%（相比 ground-truth）

---

## 局限性

- 仍依赖高质量 sketch 函数设计
- 对极高 SPP 场景增益较小

---

## 相关工作

- [[Denoiser-Training-Data-Synthesis]] — 相关合成数据生成方法
- [[Heitz-Disk-Sampling]] — 经典 disk sampling 噪声
- [[Blue-Noise-Sampling]]

---

## 实现建议

- **实现难度**: 中（核心 sketch 实现简单，但需调参）
- **预期性能**: 比之前方法更快（论文声明）
- **适用场景**:
  - 离线 path tracing denoiser 训练数据生成
  - 实时渲染噪声注入 / 抖动
  - TAA temporal 滤波
- **推荐度**: ⭐⭐⭐⭐ （Meta 开源、思路优雅，建议收为渲染工具库组件）
