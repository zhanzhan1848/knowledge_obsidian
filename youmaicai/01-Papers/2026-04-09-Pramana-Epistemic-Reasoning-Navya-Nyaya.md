# Pramana: Fine-Tuning Large Language Models for Epistemic Reasoning through Navya-Nyaya

## 元信息
| 标题 | Pramana: Fine-Tuning Large Language Models for Epistemic Reasoning through Navya-Nyaya |
|------|------|
| 作者 | Sharath Sathish |
| 链接 | [原文](https://arxiv.org/abs/2604.04937) |
| arXiv | arXiv:2604.04937v1 |
| 领域 | cs.AI |

## 核心贡献
1. 提出 **Pramana** 方法，通过在 Navya-Nyaya 逻辑（2500年历史的印度推理框架）上微调 LLMs，使其具备显式认识论推理能力
2. Navya-Nyaya 强制执行结构化 6 阶段推理：SAMSHAYA（疑问分析）→ PRAMANA（证据源识别）→ PANCHA AVAYAVA（5成员三段论）→ TARKA（反事实验证）→ HETVABHASA（谬误检测）→ NIRNAYA（确定知识与假设的区分）
3. 在 55 个 Nyaya 结构化逻辑问题上微调 Llama 3.2-3B 和 DeepSeek-R1-Distill-Llama-8B，Stage 1 达到 100% 语义正确率

## 模型架构
- 基座模型：Llama 3.2-3B, DeepSeek-R1-Distill-Llama-8B
- Navya-Nyaya 6阶段推理框架：
  1. SAMSHAYA - 怀疑分析
  2. PRAMANA - 证据源识别
  3. PANCHA AVAYAVA - 5成员三段论（含universal rules）
  4. TARKA - 反事实验证
  5. HETVABHASA - 谬误检测
  6. NIRNAYA - 确定（区分知识与假设）

## 训练方法
- **数据集**：55个 Nyaya 结构化逻辑问题（约束满足、布尔SAT、多步演绎）
- **Stage 1 结果**：100% 语义正确率，尽管严格格式遵循率仅40%——表明模型即使格式执行不完美也能内化推理内容
- **消融实验**：格式提示和温度对性能有关键影响，各阶段最优配置不同

## 核心洞察
- Apple 研究人员向数学问题添加无关上下文时，LLM 性能下降 65%，暴露了表面推理下的脆弱模式匹配
- 认识论差距（epistemic gap）：无法将声明 trace 到可验证证据，限制了 AI 在需要论证的领域的可靠性
- 与通用 chain-of-thought prompting 不同，Navya-Nyaya 提供了标准推理方法中缺失的认知脚手架

## 局限性
- 数据集规模较小（55个问题）
- 格式强制执行与语义正确率的矛盾需要进一步研究

## 资源
- 模型、数据集、训练基础设施已发布在 Hugging Face

## 建议
- **是否推荐阅读**：是
- **适用场景**：推理能力增强、可靠性AI、知识追踪
