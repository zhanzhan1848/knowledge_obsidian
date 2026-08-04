# 🥬 LLM 论文分析：Cost-Effective Automated Judging of Natural-Language Mathematical Proofs

## 基本信息
- **作者**：Benjamin Grayzel
- **发表**：arXiv:2608.00004 (cs.CL, cs.AI, cs.LG)
- **链接**：[原文](https://arxiv.org/abs/2608.00004) | [PDF](https://arxiv.org/pdf/2608.00004)
- **arXiv**：arXiv:2608.00004

## 核心贡献
1. 证明便宜的开源模型（GPT-OSS 120B、DeepSeek-V4 Flash、Gemma-4 31B）可以与前沿模型（Claude Opus 4.7、Gemini 3.1 Pro）在数学证明自动评分上达到统计无差异的水平，成本降低 100 倍
2. 发现 all-three-pass（一票否决制）共识规则效果最好：要求三个模型全部通过才能判定正确，具有最高的 pass-agreement 和 precision，且重复运行间差异最小
3. majority vote 与单个最强模型性能相当，未能带来额外提升

## 研究背景
- 数学推理系统评估中，自然语言数学证明的评分是一项重复性高成本工作
- 前沿 LLM judges 成本高昂

## 方法
- 在 IMO-GradingBench 的 200-instance 验证样本和 1000-instance 完整基准上评估
- 给定候选证明、标准证明和人工评分规则
- 比较三种 cheap judges 与前沿模型的人类 pass/fail 一致率
- 探索多种共识规则（majority vote、unanimous agreement 等）

## 核心发现
| 模型 | 与人类一致性 | 相对成本 |
|------|-------------|---------|
| GPT-OSS 120B / DeepSeek-V4 Flash / Gemma-4 31B | 与前沿模型统计无差异 | $1 (100× cheaper) |
| Claude Opus 4.7 / Gemini 3.1 Pro | 基准 | $100 |

**最佳共识策略**：all-three-pass（unanimous agreement）

## 局限性
- all-three-pass 规则是 post-hoc 发现的，需要独立复现
- 测试在 IMO-GradingBench 上，其他领域泛化性待验证

## 建议
- **是否推荐使用**：是
- **适用场景**：数学推理系统评估、教育自动化评分

## 相关研究
- IMO-GradingBench 基准
- LLM-as-judge 范式

---
*标签*: #LLM-judge #math-reasoning #cost-effective #proof-evaluation #arXiv-2026-08
