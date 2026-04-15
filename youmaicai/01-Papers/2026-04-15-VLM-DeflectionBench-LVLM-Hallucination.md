# Benchmarking Deflection and Hallucination in Large Vision-Language Models

## 元信息
| 标题 | Benchmarking Deflection and Hallucination in Large Vision-Language Models |
|------|-----|
| 作者 | Christopher Davis et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.12033) |
| arXiv | arXiv:2604.12033 |
| 发表 | ACL 2026 |

## 核心贡献
1. 提出 **动态数据策展 pipeline**，保持基准测试难度随时间推移
2. 提出 **VLM-DeflectionBench**：2,775 样本，涵盖多种多模态检索设置
3. 定义细粒度评估协议，包含四种场景

## 问题背景
- 现有基准忽略视觉和文本证据之间的冲突
- 忽略 deflection (如 "Sorry, I cannot answer...") 的重要性
- 基准随训练集扩大而快速过时

## 评估场景
1. 冲突或不足证据下的模型行为
2. 解耦参数记忆与检索鲁棒性

## 实验发现
- 20 个 SOTA LVLM 在嘈杂或误导性证据下通常无法正确 deflection
- 强调需要评估模型**不知道时的行为**

## 相关领域
- Multimodal Learning
- LVLM Hallucination
- Vision-Language Models
- Knowledge-based VQA

## 关键词
#multimodal #LVLM #hallucination #evaluation #ACL2026
