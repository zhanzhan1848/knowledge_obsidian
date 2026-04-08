# Pramana: Fine-Tuning Large Language Models for Epistemic Reasoning through Navya-Nyaya

## 元信息

| 标题 | Pramana: Fine-Tuning Large Language Models for Epistemic Reasoning through Navya-Nyaya |
|------|------|
| 作者 | Sharath Sathish |
| 链接 | [原文](https://arxiv.org/abs/2604.04937) |
| arXiv | arXiv:2604.04937 |
| 领域 | cs.AI |
| 发表 | 2026-04-08 |

## 核心贡献

1. **Pramana 框架**：首个将 Navya-Nyaya（古印度逻辑框架，2500年历史）引入 LLM 推理训练的系统性方法
2. **6阶段结构化推理**：SAMSHAYA（疑问分析）→ PRAMANA（证据源识别）→ PANCHA AVAYAVA（五段论）→ TARKA（反事实验证）→ HETVABHASA（谬误检测）→ NIRNAYA（知识确认）
3. **实验验证**：在 Llama 3.2-3B 和 DeepSeek-R1-Distill-Llama-8B 上 fine-tune，55个 Nyaya 结构化逻辑问题（约束满足、布尔 SAT、多步推理），Stage 1 达到 100% 语义正确率

## 模型架构

- **Base Models**: Llama 3.2-3B, DeepSeek-R1-Distill-Llama-8B
- **训练数据**: 55个 Nyaya 结构化逻辑问题（constraint satisfaction, Boolean SAT, multi-step deduction）
- **两阶段训练**: Stage 1 达到 100% 语义正确率，但格式严格遵循率仅 40%——说明模型即使格式不完美也能内化推理内容

## 训练方法

- **Navya-Nyaya 逻辑 fine-tuning**：将古代逻辑方法论显式编码为训练信号
- **Ablation 关键发现**：格式提示（format prompting）和 temperature 对性能影响显著，最优配置因阶段而异
- **资源释放**：所有模型、数据集、训练基础设施已发布在 Hugging Face

## 核心洞察

> Apple 研究者向数学问题添加无关上下文后，LLM 性能下降 65%——揭示了表层推理背后的脆弱模式匹配。Pramana 通过 epistemology（认识论）方法填补这一认知差距。

## 局限性

- 仅在 55 个结构化逻辑问题上验证，泛化性待更多测试
- 格式严格遵循率仅 40%，说明结构化强制执行仍有挑战
- Navya-Nyaya 的完整形式化需要领域专业知识

## 关键词

#fine-tuning #reasoning #epistemic #Navya-Nyaya #Llama #DeepSeek #Chain-of-Thought

## 相关论文

- Apple ML Research: LLM 在无关上下文存在时性能下降 65%

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
