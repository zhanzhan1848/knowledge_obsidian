---
type: paper
created: 2026-08-22
updated: 2026-08-22
tags: [reasoning, test-time-compute, adaptive, efficiency]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2608.20256
---

# Learning When to Think: Adaptive Reasoning for Test-Time Compute Allocation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Learning When to Think: Adaptive Reasoning for Test-Time Compute Allocation |
| **作者** | Gijs Kassenaar, Zhao Yang, Vincent François-Lavet |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2608.20256) |
| **arXiv** | arXiv:2608.20256 |

---

## 核心贡献

> 提出端到端三模态自路由推理模型，让模型自适应选择推理程度（不推理/简短推理/扩展推理），在保持精度的同时大幅削减推理 token 预算。

1. **端到端三模态自路由**：无独立路由器，在响应第一个 token 选择推理模式
2. **硬性 token 上限 + 形状化奖励**：确保三种模式在特定长度区间是最优的
3. **效率显著提升**：MATH-500 减少 41% token，GSM8K 减少 76%

---

## 技术方案

### 三模态路由架构

```
输入提示 → 追加指令 → LLM Policy → 第一个 token: NOTHINK/SHORT/LONG → 对应模式执行
```

### 奖励曲面设计

```math
r_i = \begin{cases} 
b_{NT} \cdot \gamma_{NT}^{L_i} & \text{正确, NoThink} \\
b_S \cdot \gamma_S^{L_i} & \text{正确, Short} \\
b_L & \text{正确, Long} \\
0.0 & \text{错误, 有效路由} \\
-0.5 & \text{路由 token 缺失}
\end{cases}
```

**默认参数**：$b_{NT}=1.3, b_S=1.2, b_L=1.0$，交叉点 $L^*_{NT}≈800$, $L^*_S≈3000$

### 平衡项（防模式崩溃）

```math
A_i \leftarrow A_i + \beta_{bal} \cdot (p^* - f_{mode}(i))
```

---

## 实验结论

- **数据集**: MATH-500, GSM8K, AIME
- **模型**: 1.5B 蒸馏模型
- **结果**:
  | 基准 | 基础模型 | 路由器 | 节省比例 |
  |------|---------|--------|---------|
  | GSM8K（简单） | 1,930 | 459 | **76%（4.2×）** |
  | MATH-500（中等） | 4,743 | 2,811 | **41%（1.7×）** |
  | AIME（困难） | 12,266 | 10,716 | **13%（1.1×）** |

- 最终路由分布：NoThink ~20%, Short ~32%, Long ~47%

---

## 局限性

1. **简单问题仍有浪费**：NoThink 准确率 66.8% vs 基础模型 79.6%
2. **困难问题提升有限**：AIME 仅减少 13% token
3. **模式切换开销**：路由 token 本身消耗少量资源

---

## 实现建议

- **实现难度**: 中等（GRPO 训练）
- **预期性能**: 推理效率 40-76% 提升
- **适用场景**: 资源受限部署、实时推理、批量处理

---

## 相关工作

- [[Chain-of-Thought]] - 思维链
- [[Test-time Scaling]] - 测试时扩展
- [[Reasoning Efficiency]] - 推理效率优化
