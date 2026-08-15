# From Monolithic to Modular: Segment-level Automatic Prompt Optimization

## 元信息
| 标题 | From Monolithic to Modular: Segment-level Automatic Prompt Optimization |
| 作者 | Nikita Kulin, Viktor Zhuravlev, Artur Khairullin, Sergey Muravyov, Ilya Makarov, Daniil Sukhorukov, Ekaterina Averkova |
| 链接 | [原文](https://arxiv.org/abs/2608.11219) |
| arXiv | arXiv:2608.11219 |
| 会议 | IJCAI-ECAI 2026 Workshop on RobustifAI (Robustifying Generative AI for Reliable, Safe, and Human-Centric Systems) |
| 代码 | 未在文中明确提供 GitHub 链接 |

## 核心贡献
1. **SAPO (Segment-level APO)**：将 prompt 分解为 role、context、tasks、output_format 四个显式 segment，替代整体重写，实现精准靶向优化
2. **两阶段生成流程**：先基于 top-5 / bottom-5 examples 做 segment 级诊断和建议提取，再生成保留强 segment、修改弱 segment 的候选 prompt
3. **统一单 LLM 方案**：使用 static meta-prompts + structured outputs 完成 segmentation、weakness analysis、candidate generation，不依赖多个模型协作
4. **保守更新机制**：仅在 validation 性能提升时接受候选；同分时优先选择与当前 prompt 编辑距离最小的变体

## 四段式 Prompt 分解
- **Role** (`s_role`)：定义模型行为角色（分类器、摘要者、分析师等）
- **Context** (`s_context`)：任务背景、输入注入、领域约束（包含 {input} 占位符）
- **Tasks** (`s_tasks`)：可执行的要求和决策规则，是修正模糊指令的主要着力点
- **Output format** (`s_output_format`)：响应格式和格式化约束，对分类标签、短答案等严格格式任务至关重要

## 两阶段生成
1. **Stage A — Evidence extraction & diagnosis**：在 train set 上评估当前 prompt，按 metric 排序提取 top-5 和 bottom-5 examples；对离散指标（如 ExactMatch）采用 class-aware 策略，确保 evidence 具有对比性；静态 meta-prompt + structured output 推断 `weak_segments`、`strong_segments`、`recommendations`
2. **Stage B — Candidate synthesis**：同一 LLM 接收当前 prompt、分解结果、weak/strong 标签和建议，生成 K=5 个候选；约束条件：保留 `strong_segments`，优先修改 `weak_segments`；在 validation 上评估，同分时取编辑距离最小者

## 优化循环要点
- **Validation-gated acceptance**：仅当候选 validation 分数超过当前 prompt 才接受更新，保证单调非降
- **Edit-distance tie-break**：同分时选最近候选，减少破坏性重写
- **Train/Val/Test 严格分离**：防止 selection leakage

## 实验结果
| Dataset | Task Type | Metric |
|---|---|---|
| SQuADv2 | Extractive QA | BERTScore F1 |
| TweetEval | Social NLP Classification | F1 |
| XSUM | Abstractive Summarization | BERTScore F1 |
| CommonGen | Constrained Commonsense Generation | BERTScore F1 |
| GSM8K | Mathematical Reasoning | ExactMatch |

- **Models**: GPT-3.5-Turbo, GPT-4o-mini
- **Protocol**: train=150 / val=100 / test=all；K=5 candidates；temperature=0
- **vs Zero-shot, APE, OPRO, EvoPrompt, GEPA, StraGO**：平均分数最优
  - GPT-3.5-Turbo：最佳 baseline 比 SAPO 低 **+5.13%**
  - GPT-4o-mini：最佳 baseline 比 SAPO 低 **+7.25%**
- GSM8K 和 XSUM 收益最大，与段级控制在精确答案推理和严格格式约束场景中的价值一致
- GPT-4o-mini 上 SAPO 在**所有 5 个数据集**均超越所有 baseline

## 与相关工作的定位
- **vs APE/OPRO/EvoPrompt**：这些方法做全局 prompt 级重写；SAPO 做 segment 级定向修改
- **vs GEPA/StraGO**：SAPO 显式保留强段、修改弱段，带 edit-distance 保守 tie-break
- **vs DSPy/TextGrad**：SAPO 保持黑盒 APO 的部署简洁性，无需编程式框架
- SAPO 位于静态 meta-prompting + 结构化优化的交叉点：保留黑盒易用性，同时引入段级可控性和约束更新

## 局限性
- 四段式分解是手工设计的，可能不适用于所有 prompt 结构；自动发现段边界是未来方向
- 实验仅覆盖 GPT-3.5-Turbo 和 GPT-4o-mini，小模型（如 Llama、Mistral）上的效果未验证
- 依赖 train/val 分割进行 evidence extraction，在低资源场景下成本较高
- 未探索段间交互（修改某段对其他段产生的跨段干扰）

## Tags
#LLM #prompt-engineering #APO #optimization #segment-level #SAPO #IJCAI-ECAI-2026
