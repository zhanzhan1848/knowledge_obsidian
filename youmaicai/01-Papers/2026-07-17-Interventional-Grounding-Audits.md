# Interventional Grounding Audits

## 元信息
| 标题 | Interventional Grounding Audits: Black-Box Premise-Dependency Tests for LLM Chain-of-Thought via Predicate Substitution |
|------|------|
| 作者 | Hironao Nakamura |
| 链接 | [原文](https://arxiv.org/abs/2607.13069) |
| arXiv | arXiv:2607.13069 |
| 会议 | ICLR 2026 Workshop on Logical Reasoning of LLMs |
| 领域 | cs.AI, cs.CL, cs.LO |

## 核心贡献
1. **Interventional Grounding Audits**: 提出黑盒、步骤级别的 premise dependency 测试方法
2. **Predicate Substitution**: 替换目标谓词为新符号，重运行模型检查推理步骤是否改变
3. **"Right Answer, Wrong Reasoning" 检测**: 发现 66% 正确解决问题包含不可检测的错误推理步骤

## 方法

### 核心思想
- 干预单个 premise：将目标谓词替换为新鲜符号
- 重运行模型并检查每个推理步骤的规范谓词形式是否改变
- 在 ProntoQA 上评估（包含 gold proof trees）

### 评估结果
- F1 = 0.806（证明树依赖检测）
- F1 = 0.885（谓词决定依赖）
- Recall = 100%
- 显著优于 self-consistency baseline（F1 = 0.343）

### 关键发现
- 66% 正确解决问题包含至少一个 aligned step，对直接证明树依赖不敏感
- 这些步骤涉及 entity-introduction premises（已知盲点）

## 实验设置
- **数据集**: ProntoQA（50 个问题）
- **模型**: GPT-4o

## 代码
- GitHub 仓库提供 audit certificates、raw outputs 和 reproduction scripts
