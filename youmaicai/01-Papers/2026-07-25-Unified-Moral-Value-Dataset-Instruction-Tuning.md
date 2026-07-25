# 🥬 Unified Moral-Value Dataset for Instruction Tuning

## 元信息

| 标题 | A Unified Moral-Value Dataset for Instruction Tuning |
|------|------|
| **arXiv** | [2607.21279](https://arxiv.org/abs/2607.21279) |
| **类别** | cs.CL |
| **关键词** | moral values, instruction tuning, value alignment, ETHICS, UNIMORAL, SOCIAL-CHEM-101, RLHF |

## 核心贡献

1. **统一三大道德价值观数据集**：ETHICS、UNIMORAL、SOCIAL-CHEM-101 → 统一格式 {scenario, value_framework, label}

2. **三阶段 Pipeline**：
   - **Stage 1**：数据预处理 + 跨框架标签补全（ModernBERT 训练的 NE Generator 和 MF Generator）
   - **Stage 2**：Self-prompting 生成 instruction-response 模板
   - **Stage 3**：TULU3 SFT pipeline 微调

3. **Value-Action Gap 评估**：检验模型道德倾向与实际行为的一致性

## 数据集来源

| 数据集 | 框架 | 规模 |
|--------|------|------|
| **ETHICS** | 规范伦理学 (Normative Ethics) | 130K+ 样本 |
| **UNIMORAL** | 道德基础理论 (Moral Foundations) | 完整道德决策流程 |
| **SOCIAL-CHEM-101** | 社会规范 (Social Norms) + RoTs | 日常道德判断 |

## 价值框架

### 规范伦理学 (Normative Ethics)
- Deontology（义务论）
- Utilitarianism（功利主义）
- Justice（正义）
- Virtue（美德）
- Commonsense（常识道德）
- Right-based（权利基础）

### 道德基础理论 (Moral Foundations)
- Care vs. Harm（关爱 vs. 伤害）
- Fairness vs. Cheating（公平 vs. 欺骗）
- Loyalty vs. Betrayal（忠诚 vs. 背叛）
- Authority vs. Subversion（权威 vs. 颠覆）
- Sanctity vs. Degradation（圣洁 vs. 堕落）

## 数据生成器

### NE Generator（Normative Ethics）
- ModernBERT 二分类：scenario + ethics_type → binary label
- 训练数据：ETHICS + UNIMORAL

### MF Generator（Moral Foundations）
- ModernBERT 多分类：scenario + moral foundation type → rating 0-4
- 任务形式：回归 / 分类 / 序数分类

## Self-Prompting

GPT-5.2 根据 prompt 工程原则生成 JSON 格式的 instruction-response 模板，与道德场景结合。

## 评估

- **General Tasks**：OLMES benchmark（ARC-Challenge, BoolQ, CommonsenseQA, HellaSwag, MMLU, etc.）
- **Value Tasks**：Value-Action Gap benchmark
  - Task 1：State Value Inclination（道德倾向）
  - Task 2：Select Value-Informed Action（道德行为）
  - 分析两个任务之间的一致性（value-action gap）

## 局限性

- Self-prompting 依赖 GPT-5.2
- 数据混合比例的影响尚需系统研究
- 仅在部分模型上验证

## 建议

- **是否推荐使用**：**是**（价值对齐研究方向）
- **适用场景**：LLM 道德对齐、instruction tuning、数据集构建
- **相关方向**：RLHF、DPO、Constitutional AI、价值对齐

## 链接

- **arXiv**: https://arxiv.org/abs/2607.21279
- **数据集**: https://huggingface.co/datasets/teohzzh/value-for-instruction-tuning

---

*🥬 油麦菜知识库 | 生成时间: 2026-07-25*
