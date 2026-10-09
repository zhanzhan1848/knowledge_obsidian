---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, foveated-rendering, real-time-rendering, judder, temporal-aliasing, perception, noise, Gabor]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.10811
venue: arXiv preprint
year: 2026
---

# Masking Judder in Foveated Rendering with Phase-Shifted Noise

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Masking Judder in Foveated Rendering with Phase-Shifted Noise |
| **作者** | （待确认） |
| **发表** | arXiv preprint (2026-10-08, 11 pages) |
| **链接** | [原文](https://arxiv.org/abs/2610.10811) |
| **DOI** | [10.48550/arXiv.2610.10811](https://doi.org/10.48550/arXiv.2610.10811) |
| **代码** | 未公开 |

---

## 核心贡献

> 利用 **Gabor 核相位调制**（phase shift）**模拟平滑运动感知**：在 foveated rendering 的低帧率外周区域，通过平移的 Gabor 噪声带在感知上**掩盖 judder**，避免完全重新渲染噪声；并给出基于角速度与帧率的**频带选择公式**，确保不引入新的运动 aliasing。

1. **感知运动合成**：相位调制 Gabor 核产生"伪平滑运动"感知
2. **频带选择公式**：根据屏幕角速度 + 帧率选频带，避免 motion aliasing
3. **降低计算成本**：不重新渲染噪声，仅相位平移
4. **用户实验验证**：显著扩展 judder-free 角速度范围
5. **与现有噪声方法互补**：与 foveated 噪声（空间细节恢复）协同

---

## 技术方案

### 核心问题

Foveated rendering 在外周以更低时空分辨率渲染以节省算力，但**低帧率**导致 **judder**（运动不流畅）。传统 temporal blur 抑制 judder 但丢细节；额外渲染噪声恢复空间细节但**不能修复运动线索损失**。

### 核心思想：相位=感知运动

Gabor 核 $G(\mathbf{x}, \phi) = \cos(\mathbf{k} \cdot \mathbf{x} + \phi) \cdot W(\mathbf{x})$ 的**纯相位移动** $\phi(t) = \mathbf{k} \cdot \mathbf{v} \cdot t$ 不会改变空间频谱，但**人眼视觉系统将相位的时间演化解读为运动**。这构成低成本"伪运动"合成。

### 关键技术

| 技术 | 说明 |
|------|------|
| Phase-shifted Gabor kernel | 调制核相位 → 感知运动 |
| Frequency band selection | 基于角速度 + 帧率避免 motion aliasing |
| Perceptual velocity synthesis | 无需重新渲染 |
| Foveated + phase-noise coupling | 与空间 foveated noise 协同 |

### 频带选择条件

```
噪声中心频率 f 选择：
- 上限：f < framerate / (2 × angular_velocity)  （Nyquist for velocity）
- 下限：f > retinal_resolution_at_periphery    （避免亚阈值感知）
```

---

## 公式

Gabor 核（移动坐标）：

```math
G(\mathbf{x}, t; \mathbf{k}, \phi) = \cos\!\big(\mathbf{k} \cdot \mathbf{x} + \phi(t)\big) \cdot W(\mathbf{x})
```

时变相位（合成运动）：

```math
\phi(t) = \mathbf{k} \cdot \mathbf{v}_{\text{desired}} \cdot t + \phi_0
```

频带约束（避免 motion aliasing）：

```math
\frac{|\mathbf{k}|}{2\pi} < \frac{f_{\text{render}}}{2 \, |\omega_{\text{screen}}|}
```

其中 $\omega_{\text{screen}}$ 是屏幕角速度（rad/s），$f_{\text{render}}$ 是当前帧率。

---

## 实验结果

- **用户实验**: N 名受试者（具体数量未在 abstract 给出）
- **结果**:
  - judder-free 角速度范围**显著扩大**
  - 不引入新的运动 aliasing
  - 与 foveated 空间噪声方法兼容

---

## 局限性

- 仅对 Gabor 类核成立，其他噪声模式需重新分析
- 用户感知模型为线性近似，极端外周可能偏差
- 需要知道精确的角速度（依赖眼动追踪）

---

## 相关工作

- [[Foveated-Rendering]]
- [[Gabor-Perception]]
- [[Temporal-Aliasing]]
- [[Judder-Reduction]]

---

## 实现建议

- **实现难度**: 低-中（GPU shader 中实现简单）
- **预期性能**: 极低开销（每帧每像素 1 次 Gabor 评估）
- **适用场景**:
  - VR/AR 头显的 foveated rendering 流水线
  - 高速运动游戏的 judder 缓解
  - 任何受限带宽场景下的"感知运动"合成
- **推荐度**: ⭐⭐⭐⭐ （低成本高收益，可立即集成到实时引擎）
