# RP-OPSD: Reasoning-Pivot-Guided On-Policy Self-Distillation

## 元信息
| 标题 | Reasoning-Pivot-Guided On-Policy Self-Distillation for Multilingual Reasoning Transfer |
|------|-------|
| 作者 | Xinye Wang et al. (NJUNLP) |
| 链接 | [原文](https://arxiv.org/abs/2608.06347) |
| arXiv | arXiv:2608.06347 |
| 代码 | [GitHub](https://github.com/NJUNLP/RP-OPSD) |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **RP-OPSD**：在 OPSD 基础上引入推理枢轴（Reasoning Pivot）引导的特权蒸馏
2. 表征目标语言推理由两部分组成：表面文本生成 + **推理枢轴**（推进/重定向推理过程的决策）
3. 用「有/无英文参考答案」之间的分布差异作为代理，识别推理枢轴位置

## 方法
- RP-OPSD 在推理枢轴 token 上集中特权蒸馏，同时降低表面实现 token 的蒸馏权重
- 在 17 种语言的数学推理基准上评估

## 实验结果
- 优于强多语言推理基线和 OPSD 变体
- 分析证实 RP-OPSD 将特权蒸馏集中在「推理控制」和「问题条件状态更新」token 上

## 关键洞察
跨语言推理迁移的关键不是均匀蒸馏，而是识别并优先蒸馏「推理决策点」
