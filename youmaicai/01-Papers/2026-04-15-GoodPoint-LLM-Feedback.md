# GoodPoint: Learning Constructive Scientific Paper Feedback from Author Responses

## 元信息
| 标题 | GoodPoint: Learning Constructive Scientific Paper Feedback from Author Responses |
|------|-----|
| 作者 | Jimin Mun, Chani Jung, Xuhui Zhou, Hyunwoo Kim, Maarten Sap |
| 链接 | [原文](https://arxiv.org/abs/2604.11924) |
| arXiv | arXiv:2604.11924 |

## 核心贡献
1. 研究 **构建性反馈生成** (constructive feedback generation) 任务
2. 提出 **GoodPoint-ICLR** 数据集：19K ICLR 论文，带有作者回应标注的反馈
3. 提出 GoodPoint 训练方法，结合 fine-tuning 和 preference optimization

## 方法

### 数据集构建
- 沿两个作者中心维度标注反馈：validity 和 author action
- 利用作者回应中的成功信号

### 训练方法
- Fine-tuning on valid and actionable feedback
- Preference optimization on real and synthetic preference pairs

## 实验结果
- GoodPoint-trained Qwen3-8B 在预测成功率上比基线模型提升 **83.7%**
- 在 feedback matching 任务上达到 SOTA，超越 Gemini-3-flash
- 通过专家人类研究验证

## 核心洞察
- LLMs 应 **augment and empower researchers**，而非自动化研究

## 相关领域
- LLM Feedback
- Scientific Writing
- Preference Optimization
- Human-AI Collaboration

## 关键词
#LLM #feedback #preference-optimization #scientific-writing
