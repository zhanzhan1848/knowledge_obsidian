# InflationAgent: Inflation-Aware Routing for Agentic LLM Systems

## 元信息
| 标题 | Not All Tokens Are Equal: Inflation-Aware Routing for Agentic LLM Systems |
|------|-----|
| 作者 | Heming Fu, Shan Lin, Qianqian Xie, Guojun Xiong |
| 链接 | [原文](https://arxiv.org/abs/2608.13571) |
| arXiv | arXiv:2608.13571 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. **Token Inflation 概念**：agentic 系统中重试开销导致真实 workflow 成本与单次调用成本的差距，定义为两者之比
2. **CoT Branching Entropy (CBE)**：完全基于本地推理的预执行难度信号，AUROC 0.887 预测高 inflation
3. **InflationAgent 四阶段路由器**：
   - 跨模型层级和任务类型系统性测量 token inflation
   - 发现 7B 模型在多跳问答上 inflation 高达 4.25x
   - 使用 Semantic Exchange Rate (SER) = 预期准确率/预测真实成本选择模型
   - Fresh-escalation 策略丢弃失败链再路由到更强模型

## 关键发现
- FrugalGPT 等系统基于单次调用成本路由，低估困难任务实际成本超过 2x
- 转发失败推理链给 GPT-4o 会导致准确率下降高达 34.8pp
- GSM8K 固定预算下：InflationAgent 94.7% vs FrugalGPT 91.0%，同时节省 31% tokens

## 核心公式
```
Token Inflation = 真实 workflow 成本 / 单次调用成本
Semantic Exchange Rate (SER) = 预期准确率 / 预测真实成本
```

## 实验结果
- GSM8K: 94.7% 准确率 (vs 91.0% FrugalGPT)，节省 31% tokens
- 多跳问答 inflation 高达 4.25x (7B 模型)
- CBE 预测高 inflation: AUROC 0.887

## 局限性
- 需要为不同模型层级校准 inflation 预测
- 跨任务泛化需进一步验证
