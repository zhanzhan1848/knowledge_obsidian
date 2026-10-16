# Knowledge That Is Linear Before Fine-Tuning Generalizes After It

## 元信息
| 标题 | Knowledge That Is Linear Before Fine-Tuning Generalizes After It |
|------|---------------------------------------------------------------|
| 作者 | Faridoun Mehri, Hinrich Schütze (LMU Munich) |
| 链接 | [原文](https://arxiv.org/abs/2610.22300) |
| arXiv | arXiv:2610.22300 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.CL, cs.AI, cs.LG |
| 代码/数据 | [GitHub](https://github.com/NightMachinery/active-inert-facts) |

## 核心贡献
1. **提出"活跃事实"与"惰性事实"的区分**：LLM 召回的事实 ≠ 支持泛化的事实
   - **Active facts**：能支撑泛化超出自身召回的事
   - **Inert facts**：能召回但不能在新任务中泛化
2. **实验设置**：构造新关系（如 Paris→crab，Europe→crab）。在子集上微调后，看是否能在共享原答案的测试主体（如 Munich）上泛化
3. **强相关性发现**：跨 11 个 LM、70 个关系，**预训练表征中关系的可线性读出程度** 与 **微调后的泛化能力** 相关性高达 **Pearson r = 0.87–0.92**

## 关键洞察
> "Whether a new relation generalizes depends less on whether its facts can be recalled than on how readily their shared structure can be read out linearly."

## 实验结果
- 11 个语言模型 × 70 个关系
- Pearson 相关 r ∈ [0.87, 0.92]
- **控制变量均验证**：fine-tuning subject 数、答案数、模型在原始关系上的准确率、主体在预训练文本中出现频率 —— 单独和联合控制下都不影响结论
- **稳健性验证**：标签随机化、微调种子、13 个其他语义类别标签替换 —— 均成立
- **可逆映射发现**：将错误的泛化标签映射回原答案，分布偏向线性探针预测而非预训练模型自身

## 方法论
```python
# 实验构造
original_relation = {Paris: Europe, Tokyo: Asia, ...}  # pretrained
new_labels = {Europe: crab, Asia: zebra, ...}  # arbitrary remap
finetune_set = {Paris: crab, Tokyo: zebra}  # subset
test = {Munich: ?, ...}  # same original answer → should generalize
```

## 实践指导
### 如何预测 fine-tuning 任务的泛化能力
1. 在微调前，对预训练表征跑线性探针
2. 关系线性可读出程度 r 越高，fine-tuning 后越可能泛化
3. 可以作为**fine-tuning 数据选择与任务可行性评估**的工具

## 相关工作
[[Fine-Tuning]] [[Linear-Probes]] [[Knowledge-Generalization]] [[Mechanistic-Interpretability]] [[Representation-Engineering]]

## 局限性
- 仅 70 个关系，覆盖可能不够广
- 未覆盖全部模型家族
- 仅关注事实性关系，复杂推理未涉及

## 与其他研究的关系
- 与 [[Mechanistic-Interpretability]] 系列工作呼应：模型表征的几何结构决定其学习能力
- 与 [[In-Context-Learning]] 形成对照：ICL 不更新参数，fine-tuning 更新参数但泛化机制仍受表征限制

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
