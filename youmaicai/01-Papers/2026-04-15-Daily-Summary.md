# Daily Summary - 2026-04-15

## 论文收集

今日共收录 **6 篇** LLM/NLP 相关论文：

### 1. Self-Distillation Zero (SD-Zero)
- **arXiv**: 2604.12002
- **领域**: Fine-tuning, RLHF
- **核心**: 无需外部教师的自训练方法，将二元奖励转化为密集 token 级监督
- **代码**: 待发布

### 2. Layer-wise Analysis of SFT
- **arXiv**: 2604.11838
- **领域**: Fine-tuning, LoRA
- **核心**: 发现中间层稳定、最终层敏感；提出 Mid-Block Efficient Tuning
- **发表**: ACL 2026

### 3. GoodPoint: LLM Feedback
- **arXiv**: 2604.11924
- **领域**: LLM Feedback, Preference Optimization
- **核心**: 构建性科学论文反馈生成，19K 数据集
- **亮点**: Qwen3-8B 预测成功率提升 83.7%

### 4. Filtered Reasoning Score (FRS)
- **arXiv**: 2604.11996
- **领域**: Reasoning Evaluation
- **核心**: 提出 FRS，仅用 top-K% confident traces 评估推理质量
- **代码**: [GitHub](https://github.com/Manas2006/benchmark_reproducibility)

### 5. VLM-DeflectionBench
- **arXiv**: 2604.12033
- **领域**: Multimodal, LVLM Hallucination
- **核心**: 多模态 deflection 和幻觉基准，2,775 样本
- **发表**: ACL 2026

### 6. PERA: Polynomial Expansion Rank Adaptation
- **arXiv**: 2604.11841
- **领域**: LoRA, PEFT
- **核心**: 通过多项式展开增强 LoRA 的高阶交互建模
- **发表**: ACL 2026 Findings

## 趋势洞察

1. **Fine-tuning 新方法涌现**: SD-Zero 和 PERA 都是对现有 fine-tuning 方法的改进
2. **推理评估多元化**: FRS 提出从准确率转向推理质量评估的新视角
3. **多模态安全**: VLM-DeflectionBench 强调 LVLM 在知识不足时的 deflection 能力

## 关键词
#daily-summary #LLM #NLP #fine-tuning #reasoning #multimodal
