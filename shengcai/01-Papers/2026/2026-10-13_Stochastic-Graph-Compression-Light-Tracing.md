---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, path-tracing, light-tracing, differentiable-rendering, memory, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.10847
---

# Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Stochastic Graph Compression for Constant-Memory Differentiable Light Tracing |
| **作者** | Linas Beresna |
| **发表** | SIGGRAPH Asia 2026 Technical Communications |
| **链接** | [原文](https://arxiv.org/abs/2610.10847) |
| **DOI** | 10.1145/3829339.3847837 |
| **代码** | - |

---

## 核心贡献

> Reservoir Light Replay Backpropagation (ResLRB) — 反向模式可微 light tracing，内存与路径长度及每路径 sensor connections 数无关。

1. **流式加权 Reservoir 采样** — 在 primal 阶段为每条 light path 随机保留单个代表 sensor connection。
2. **伪随机序列重构路径** — 反向时确定性地按原 PRNG 序列复现路径，仅通过保留连接反向传播。
3. **常量内存反向** — 峰值内存仅相当于一次散射事件的反向传播。

---

## 技术方案

### 核心思想

> 朴素 AD 处理 light tracing 时，记录的计算图随路径上有效 sensor 连接数线性增长。Adjoint path replay 解决了 viewpoint path tracing 的深度依赖问题，但 light path 的 splatting 多分支结构使其不可直接迁移。ResLRB 在 primal 阶段用 streaming weighted reservoir 压缩 adjoint graph。

### 关键技术

| 技术 | 说明 |
|------|------|
| Streaming Weighted Reservoir | 每路径采样单个代表性 sensor connection |
| 确定性路径重构 | 用相同 PRNG 状态序列恢复原路径 |
| 单散射反向复杂度 | 峰值内存 = 一次散射事件的反向 |
| 无偏梯度估计 | 保持估计无偏性 |

---

## 公式

```math
\text{Memory}_{\text{peak}} = O(1) \quad (\text{vs } O(\text{path length} \times \text{sensor connections}) \text{ naive})

\widehat{\nabla \theta} = \mathbb{E}_{c \sim \text{Reservoir}} \left[ c \cdot \nabla_\theta \text{Replay}(c; \theta) \right]
```

---

## 代码片段

```cpp
// 概念伪代码：primal 阶段
for each light_path:
    for each scattering_vertex v:
        for each visible_sensor s:
            reservoir.add(s, weight = throughput);
        // 只保留一个 sensor connection per path

// 反向阶段
for each light_path:
    s = reservoir.get_retained();
    ReplayDeterministic(path, s);  // 用相同 PRNG
    Backpropagate(s);
```

---

## 实验结论

- **方法**: 论文技术报告（SIGGRAPH Asia 2026 TC）
- **基线**: 朴素 AD 的 light tracing
- **结果**:
  - 内存随路径长度常数
  - 内存随每路径 sensor connections 数常数
  - 保持无偏梯度估计

---

## 局限性

- 单次保留仅一个 sensor connection，梯度方差相对朴素方法上升
- Reservoir 采样质量依赖于 path importance
- 适用于 reverse-mode AD，前向模式暂无对应方案

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 离线渲染反传优化的参考
- 不同iable rendering: 与 SIGGRAPH Asia 2026 配套的 sensitivity AOV 论文互补
