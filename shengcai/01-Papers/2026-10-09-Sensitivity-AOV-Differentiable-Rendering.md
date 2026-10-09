---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, differentiable-rendering, AOV, inverse-rendering, sensitivity-analysis, SIGGRAPH-Asia-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.10852
venue: SIGGRAPH Asia 2026 Technical Communications
year: 2026
---

# Sensitivity as an Arbitrary Output Variable for Differentiable Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Sensitivity as an Arbitrary Output Variable for Differentiable Rendering |
| **作者** | （待确认） |
| **发表** | SIGGRAPH Asia 2026 Technical Communications (4 pages) |
| **链接** | [原文](https://arxiv.org/abs/2610.10852) |
| **DOI** | [10.48550/arXiv.2610.10852](https://doi.org/10.48550/arXiv.2610.10852) |
| **代码** | 未公开 |

---

## 核心贡献

> 将**敏感性 (sensitivity)** 作为可微渲染的**一等公民输出**（first-class AOV）：类似 deferred shading 思想，一次反向传播填充敏感性 buffer，之后从不同视角、对象粒度、参数类型**自由读取**而无需重新求导。

1. **Sensitivity AOV 概念**：定义并形式化"敏感性 AOV"，作为可微渲染的标准输出
2. **参数层次填充**：单次 reverse-mode 填充整个参数层次的敏感性 buffer
3. **自由视角读取**：从任意观察视角查看敏感性，类比 deferred shading
4. **对象/参数粒度**：图像空间敏感性可按对象、按参数类型聚合
5. **正向/反向模式对偶**：明确 reverse-mode 与 forward-mode 各自定位

---

## 技术方案

### 核心思想

当前可微渲染框架把"对场景参数的导数"作为一次性输出，没有标准化的可视化/分析接口。本工作提出：**导数也应该像颜色、深度、AO 一样作为 AOV**——存在 buffer 中，可被多种工具消费。

```
对偶性对照：
- 原始图像 AOV → 在 buffer 中 → 多种 shader/inspector 读取
- 敏感性 AOV  → 在 buffer 中 → 多种分析工具读取（参数可视化、视角投影、参数类型聚合）
```

### 关键技术

| 技术 | 说明 |
|------|------|
| Reverse-mode AOV population | 一次反向传播填充敏感性 buffer |
| Parameter hierarchy indexing | 按场景图层次索引参数 |
| View decoupling | 客观定义相机与检查相机分离 |
| Forward/Reverse mode duality | 与 forward-mode 形式对比 |
| Texture-coordinate transport | per-texel 字段通过 UV 携带 |

### 应用场景

- **逆向渲染调试**：可视化"哪个参数影响哪部分图像"
- **梯度选择性优化**：只优化高敏感参数
- **可微渲染理解工具**：教学、研究

---

## 公式

对于客观函数 $\mathcal{L}$，对参数 $\theta_j$ 的敏感性：

```math
S(\mathbf{x}, j) = \frac{\partial \mathcal{L}}{\partial \theta_j}\bigg|_{\text{at pixel } \mathbf{x}}
```

AOV buffer 在像素 $\mathbf{x}$ 处的值：

```math
\mathbf{A}_{\text{sens}}(\mathbf{x}) = \left[\frac{\partial \mathcal{L}}{\partial \theta_1}, \frac{\partial \mathcal{L}}{\partial \theta_2}, \ldots, \frac{\partial \mathcal{L}}{\partial \theta_K}\right]^\top
```

通过纹理坐标 transport 到 per-texel：

```math
\mathbf{T}_{\text{sens}}(\mathbf{u}) = \mathbf{A}_{\text{sens}}(\pi(\mathbf{u}))
```

---

## 实验结果

- **类型**: 概念验证 / scaffolding 论文（4 页）
- **结果**: 提出 AOV 框架，展示若干读取应用

---

## 局限性

- 概念性论文，尚未与现有可微渲染器（Mitsuba 3、Dr.Jit）深度集成
- 4 页 Technical Communication 篇幅，具体性能数据有限

---

## 相关工作

- [[Mitsuba-3-Differentiable-Renderer]]
- [[Dr.Jit-Differentiable-Just-In-Time-Compilation]]
- [[Path-Replay-Backpropagation]]
- [[Deferred-Shading]]

---

## 实现建议

- **实现难度**: 高（需要可微渲染器内部支持 + buffer 管理）
- **预期性能**: 单次反向传播 + 多次查询（增量成本低）
- **适用场景**:
  - 复杂场景的逆向渲染调试
  - 大规模参数优化（按敏感性剪枝）
  - 可微渲染研究/教学工具
- **推荐度**: ⭐⭐⭐ （概念有价值，需结合实际引擎验证）
