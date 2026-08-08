# CalibForge: Adversarial Solver Calibration for Terminal Tasks

## 元信息
| 标题 | Adversarial Solver Calibration for Scaling Learnable Terminal Tasks |
|------|-------|
| 作者 | Fanzhe Meng et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06352) |
| arXiv | arXiv:2608.06352 |
| 代码 | [GitHub](https://github.com/AweAI-Team/CalibForge) |
| 数据 | [HuggingFace](https://huggingface.co/datasets/AweAI-Team/CalibForge) |
| 领域 | cs.LG, cs.CL |

## 核心贡献
1. 提出 **CalibForge**：自主终端任务合成系统，通过对抗性 solver calibration 修订候选任务
2. 两种 calibration 策略：Multi-solver（异构 solver 池内分歧）和 Contrastive solver（强 pass / 弱 fail 关系）
3. 构建 5,431 个校准终端任务

## 方法
- 可验证 + 适当难度是有效终端任务的核心
- Multi-solver calibration：针对 solver 池内不一致
- Contrastive solver calibration：针对指定强-弱关系
- 两者共同 operationalize「以 demonstrated solvability 为锚的 solver-relative learnable zone」

## 实验结果
- Terminal-Bench 2.0: 32.58% 和 47.57%
- 最大提升：Terminal-Bench 2.0 +24.71pp, SWE-bench Pro +27.68pp, Doc2Repo +30.04pp

## 关键洞察
solver-relative learnability 是构建有效可迁移 agent 训练数据的实用目标
