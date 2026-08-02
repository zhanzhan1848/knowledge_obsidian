# β-OPSD: Deriving with Policy Optimization, Training with Self-Distillation

## 元信息
| 标题 | β-OPSD: Deriving with Policy Optimization, Training with Self-Distillation |
|------|-----|
| 作者 | Jiawei Xu, Minghui Liu, Juzheng Zhang, Tom Goldstein, Furong Huang |
| 链接 | [原文](https://arxiv.org/abs/2607.28582) |
| arXiv | arXiv:2607.28582 |
| 类别 | cs.LG |
| 发表 | 2026-07-30 |

## 核心贡献

1. **理论分析**：揭示 vanilla OPSD 是 β=1 的更广泛策略优化家族成员
2. **β-OPSD 框架**：将 β 从隐式固定值转变为可控正则化参数
3. **最优策略推导**：推导出参考策略和特权教师之间的几何插值作为最优策略
4. **高效实现**：通过混合 token 级 logits，高效近似昂贵的策略优化

## 核心问题

On-policy Self-Distillation (OPSD) 是改进推理语言模型的有前景方法，但在实践中仍然脆弱：
- 成功运行通常需要大量工程努力
- 缺乏理论理解导致方法难以泛化

## 方法

### 理论洞察
Vanilla OPSD 等价于 β=1 的策略优化家族：
- β 加权 KL 惩罚，将学生锚定到参考策略
- 这个等价性将 β 从隐式值转变为可控参数
- 产生更通用的公式，在参考策略接近度和特权教师指导之间进行权衡

### 最优策略
β-OPSD 的最优策略是参考策略和特权教师之间的几何插值

### 高效实现
直接优化 RL 目标成本高、方差大。解决方案：
1. 将闭式解转化为蒸馏目标
2. 每种 β 值选择参考到教师路径上的目标
3. 通过混合 token 级 logits 高效实现
4. Return-to-go 信用分配进一步对齐 token 更新与序列级目标

## 实验结果

在数学推理基准上的实验表明：
- β-OPSD 一致优于 vanilla OPSD
- 改善了优化稳定性
- 提升了下游推理性能

## 关键公式

**β-OPSD 目标**：
最优策略 π* 是参考策略 π_ref 和特权教师 π_t 之间的几何插值：

$$\pi^* \propto \pi_{ref}^{\beta} \odot \pi_t^{1-\beta}$$

其中 β 控制参考策略和教师指导之间的权衡。

## 局限性

- 主要在数学推理任务上验证
- 超参数 β 需要调优
- 在其他领域（如代码生成）的效果待验证

## 建议

- 可与其他推理增强技术（如 CoT、Self-Consistency）结合
- β 值的自动选择值得进一步研究
