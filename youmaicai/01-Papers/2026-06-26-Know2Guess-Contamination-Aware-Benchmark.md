# Know2Guess: A Contamination-Aware Multi-Zone Benchmark for Knowledge-Boundary Evaluation in LLMs

## 元信息
| 标题 | Know2Guess: A Contamination-Aware Multi-Zone Benchmark for Knowledge-Boundary Evaluation in Large Language Models |
|------|-----|
| 作者 | Renwei Meng, Bowen Zhang, Jian Wang, Xican Wang, Haoyi Wu, Xuanyan Qiu, Shengan Yang |
| 链接 | [原文](https://arxiv.org/abs/2606.26101) |
| arXiv | arXiv:2606.26101 |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-04-30 |

## 核心贡献
1. **Contamination-Aware Benchmark**: 1,200 items，5 个领域，含污染风险元数据和明确的 abstention 期望
2. **Multi-Zone Design**: 测量从可回答知识到预期未知拒绝的转换
3. **Dual Parser**: 官方 strict parser + normalized robustness parser
4. **评估 FLAN-T5, Qwen2.5-Instruct, Llama-3-Instruct**

## 核心发现
- Qwen2.5-3B-Instruct 获得最佳整体可靠性
- Answer-expected zones 仍然困难
- Calibration 仍然较差，benign-item refusal 持续存在
- Prompt 和 parser robustness 分析保持了主要排名

## Benchmark 结构
- **1,200 items** across five domains
- Explicit abstention expectations
- Contamination-risk metadata
- Dual parsing: strict parser + normalized robustness parser

## 评估维度
- Answerability（可回答性）
- Abstention（拒绝回答）
- Refusal（拒绝行为）
- Contamination（数据污染）

## 代码
https://github.com/renweimeng/Know2Guess-A-Contamination-Aware-Multi-Zone-Benchmark

## 标签
#LLM #evaluation #benchmark #contamination #knowledge-boundary #calibration