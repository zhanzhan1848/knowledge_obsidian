# 🥬 LLM 论文分析：TESSY - Teacher-Student Cooperation Data Synthesis

## 基本信息
- **作者**: Zixian Huang 等
- **发表**: arXiv (cs.CL)
- **链接**: [原文](https://arxiv.org/abs/2604.14164)
- **arXiv**: arXiv:2604.14164
- **公告日期**: 2026-04-17

## 核心贡献
1. 发现 reasoning model（SFT 场景）的核心问题：**stylistic divergence**（风格差异）导致 teacher 生成数据与 student 分布不匹配
2. 提出 **TESSY (Teacher-Student Cooperation Data Synthesis)** 框架，交替使用 teacher 和 student 生成 style tokens 和 non-style tokens
3. 保留 teacher 的高级推理能力，同时维持与 student 分布的风格一致性

## 模型架构 / 方法

### 问题诊断
用 teacher (GPT-OSS-120B) 生成数据直接 fine-tune student (Qwen3-8B)：
- LiveCodeBench-Pro 下降 3.25%
- OJBench 下降 10.02%

### TESSY 框架
- Teacher 生成 reasoning tokens（核心推理步骤）
- Student 生成 style tokens（语言风格、表达方式）
- 交替拼接 → 输出既保留推理能力又符合 student 风格

### 实验结果
| 模型 | 数据策略 | LiveCodeBench-Pro | OJBench |
|------|---------|-------------------|---------|
| Qwen3-8B | Teacher 直接生成 | -3.25% | -10.02% |
| Qwen3-8B | TESSY | +11.25% | +6.68% |

## 关键洞察
- 对于新兴 reasoning model，风格一致性可能比推理能力更重要
- Teacher-student 合作生成可以有效桥接风格差异
- 推断：style tokens 和 reasoning tokens 在生成过程中是可以解耦的

## 局限性
- 仅在 code generation 任务上验证
- Teacher 模型选择（GPT-OSS-120B）和 Student 模型选择（Qwen3-8B）有限

## 建议
- **是否推荐使用**: ✅ 是（reasoning model fine-tuning 必读）
- **适用场景**: Reasoning model 训练、数据合成、模型蒸馏

---

标签: #reasoning-model #fine-tuning #data-synthesis #teacher-student #Qwen3 #SFT
