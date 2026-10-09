---
type: paper
created: 2026-10-09
updated: 2026-10-09
tags: [paper, light-tracing, differentiable-rendering, path-tracing, reservoir-sampling, constant-memory, SIGGRAPH-Asia-2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.10847
venue: SIGGRAPH Asia 2026 Technical Communications
year: 2026
---

# ResLRB: Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing |
| **方法名** | ResLRB (Reservoir Light Replay Backpropagation) |
| **作者** | （待确认） |
| **发表** | SIGGRAPH Asia 2026 Technical Communications (4 pages) |
| **链接** | [原文](https://arxiv.org/abs/2610.10847) |
| **DOI** | [10.48550/arXiv.2610.10847](https://doi.org/10.48550/arXiv.2610.10847) |
| **代码** | 未公开 |

---

## 核心贡献

> 提出 **ResLRB**：通过**流式加权 reservoir sampling** 在 primal pass 期间对 adjoint 计算图进行**随机压缩**，只保留每条光路的单一代表性传感器连接，使得 light tracing 的反向传播**内存与路径长度、传感器连接数无关**，梯度仍是无偏估计。

1. **常数内存反向传播**：峰值内存 ≈ 单次散射事件求导的内存，与路径长度/分支数解耦
2. **加权 reservoir 压缩**：前向时通过 streaming weighted reservoir 随机保留每条光路的一个传感器连接
3. **确定性重放**：反向时用相同 PRNG 序列重放路径，仅对保留的连接反向传播
4. **无偏梯度估计**：单连接采样仍是无偏估计（reservoir 保证）
5. **解决 splatting 分支问题**：adjoint path replay 原本无法处理 splatting 的多分支配接，本工作填补此空白

---

## 技术方案

### 核心问题

Light tracing（光子映射/双向路径追踪）的微分比 view path tracing 困难：

- 每个散射顶点都可能向多个传感器**splat**（非分支结构假设不成立）
- 自动微分记录的计算图大小 = 路径上的传感器连接数 → 内存爆炸
- 现有 adjoint path replay（用于 view path）无法直接处理 splatting

### 核心思想：Reservoir-based 压缩

```
光路 (light path) p：
  V_0 (光源) → V_1 → V_2 → ... → V_L (终止)
  在每个 V_i，可能 splat 到多个传感器像素 {S_1, S_2, ...}

ResLRB 流程：
  1. Primal pass：对每条光路，用加权 reservoir 采样保留一个 (S_j, w_j)
  2. Adjoint pass：确定性地重放路径（用同 PRNG），仅对保留的 S_j 求导
```

### 关键技术

| 技术 | 说明 |
|------|------|
| Streaming weighted reservoir | 单遍流式采样，保持加权无偏 |
| PRNG-determined replay | 反向时用同种子重放路径，无须存储 |
| Adjoint pruning | 仅反向传播到保留的传感器连接 |
| Memory = O(1) | 峰值内存仅取决于单次散射求导 |
| Unbiased estimator | 单连接采样仍给出无偏梯度 |

### 与相关方法的对比

| 方法 | 适用场景 | 内存复杂度 |
|------|---------|-----------|
| Path Replay Backpropagation | view path tracing | O(depth) |
| Radiative Backpropagation | 单连接 light path | O(depth) |
| Light Replay Backpropagation | 通用 light path | O(connections × depth) |
| **ResLRB（本工作）** | **通用 light path** | **O(1)** |

---

## 公式

Light path 上的传感器连接集：

```math
\mathcal{C}(\mathbf{p}) = \{(S_j, w_j) : j = 1, \ldots, N(\mathbf{p})\}
```

加权 reservoir 采样保留一个连接 $(S^\star, w^\star)$，满足：

```math
\mathbb{P}[(S^\star, w^\star) = (S_j, w_j)] \propto w_j
```

梯度估计：

```math
\nabla_\theta \mathcal{L} \approx \sum_{\mathbf{p}} \frac{N(\mathbf{p})}{1} \cdot \frac{w^\star(\mathbf{p})}{W(\mathbf{p})} \cdot \nabla_\theta f(\mathbf{p}, S^\star)
```

其中 $W(\mathbf{p}) = \sum_j w_j$。无偏性由 reservoir sampling 保证。

---

## 实验结果

- **场景**: 含复杂 splatting 的 light tracing 场景（推测）
- **基线**: Light Replay Backpropagation（无压缩）
- **结果**:
  - 内存：常数（vs. O(connections × depth)）
  - 梯度仍无偏
  - 峰值内存仅约单次散射求导

---

## 局限性

- 梯度方差可能略高于完整反向传播（因单连接采样）
- 实现需深度集成到现有可微 light tracer
- 仅 Technical Communication，详细实验数据有限

---

## 相关工作

- [[Path-Replay-Backpropagation]]
- [[Radiative-Backpropagation]]
- [[Light-Replay-Backpropagation]]
- [[Reservoir-Sampling]]
- [[Mitsuba-3-Differentiable]]

---

## 实现建议

- **实现难度**: 高（需要改造可微 light tracer 内部表示）
- **预期性能**: 内存降低数个量级，速度略慢于完整反向
- **适用场景**:
  - 大规模 inverse rendering 中的 light path 求导
  - 复杂体积/参与介质优化（光子映射类算法）
  - 训练神经材质/光源表示
- **推荐度**: ⭐⭐⭐⭐ （解决真实工程问题，对优化复杂光路场景是关键）
