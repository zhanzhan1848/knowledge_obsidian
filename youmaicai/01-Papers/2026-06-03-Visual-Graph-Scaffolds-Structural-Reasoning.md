# Visual Graph Scaffolds for Structural Reasoning in Large Language Models

## 元信息
| 标题 | Visual Graph Scaffolds for Structural Reasoning in Large Language Models |
|------|-----|
| 作者 | Runlin Lei, Xiaokui Xiao, Zhewei Wei |
| 链接 | [原文](https://arxiv.org/abs/2606.02673) |
| arXiv | arXiv:2606.02673 |
| 发表 | 2026-06-01 |
| 领域 | cs.AI, cs.LG |
| 代码 | - |

## 核心贡献
1. **研究问题**：图结构对 LLMs 的价值不仅在于提供外部知识，还在于组织推理过程。
2. **核心发现**：存在明显的**模态差距（modality gap）**：
   - 当图结构被扁平化为文本时，去除直接答案提示后收益大幅下降
   - **视觉图引导**即使没有直接答案线索仍然有效，且优势在监督微调和 KL 散度蒸馏后仍保持
3. **任务设定**：多跳问答任务，将教师提供的推理迹重写为图思维导图用于指导学生模型

## 方法细节

### 实验设置
- **任务**：Multi-hop question answering
- **对比条件**：文本图引导 vs 视觉图引导（有/无直接答案提示）
- **训练方法**：监督微调 + KL-based distillation

### 关键发现
| 条件 | 推理效率 | 答案质量 |
|------|---------|---------|
| 文本图（有答案提示） | ✓ | ✓ |
| 文本图（无答案提示） | ✗ | ↓ |
| 视觉图（有答案提示） | ✓ | ✓ |
| 视觉图（无答案提示） | ✓ | ✓（优势保持） |

### 核心结论
- 图结构对 LLMs 的价值不仅在于作为外部知识结构，更应作为**视觉脚手架**用于组织推理
- 视觉格式保留了图结构的结构化信息，而文本扁平化丢失了关键结构线索

## 核心创新点
- 首次系统研究图结构作为 LLMs 内部推理辅助工具的作用
- 揭示视觉 vs 文本图表示的模态差距，为可解释 AI 和思维可视化提供新思路

## 标签
#LLM #reasoning #graph #multi-hop-QA #visual-scaffolding