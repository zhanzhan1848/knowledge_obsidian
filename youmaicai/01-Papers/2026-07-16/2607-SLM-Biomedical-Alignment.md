# 🥬 LLM 论文分析：Post-Training SLM Alignment for Biomedical

## 基本信息
- **标题**：Exploring Post-Training Alignment of Small Language Models for Biomedical Data-to-Text Generation
- **作者**：Xi Yang et al. (Johns Hopkins / Google Health)
- **发表**：arXiv:2607.13430 | cs.CL
- **链接**：[原文](https://arxiv.org/abs/2607.13430)

## 核心贡献

1. **小语言模型（SLM）在生物医学 data-to-text 生成上的 post-training 对比研究**

2. **对比四种方法**：SFT、DPO、ORPO、GRPO（均基于 Qwen）

3. **关键发现**：
   - 对齐后的 SLM **超越 GPT-5**（私有模型）
   - **ORPO > SFT** 基线
   - **GRPO** 在跨数据集泛化上最鲁棒

## 方法

### 任务
药物说明书生成：从结构化生物医学数据生成患者友好的叙述文本

### 数据集
- 药物包装说明书
- openFDA 药物标签数据

### 评估
- Lexical overlap: ROUGE
- Semantic similarity

## 结果
| 对齐方法 | 跨数据集性能 |
|----------|------------|
| SFT | 基线 |
| DPO | 改进 |
| ORPO | 优于 SFT |
| **GRPO** | **最鲁棒，超越 GPT-5** |

## 局限性
- 仅验证 Qwen 系列 SLM
- 领域限于药物说明书

## 建议
- **推荐关注**：是
- **适用场景**：领域特定 SLM 微调、生物医学 NLP
- **亮点**：证明了小模型 + 正确对齐可以超越大模型私有 API

---

*📅 2026-07-16 | 油麦菜 🥬*
