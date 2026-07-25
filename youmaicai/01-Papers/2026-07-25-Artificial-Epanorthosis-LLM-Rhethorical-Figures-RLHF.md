# 🥬 Artificial Epanorthosis: Why LLMs Overuse Rhetorical Figures After RLHF

## 元信息

| 标题 | Artificial Epanorthosis: Why Large Language Models Overuse Rhetorical Figures After RLHF |
|------|------|
| **arXiv** | [2607.21498](https://arxiv.org/abs/2607.21498) |
| **类别** | cs.CL |
| **关键词** | RLHF, rhetorical figures, epanorthosis, language model alignment, surface diversity, semantic equivalence |

## 核心贡献

1. **Artificial Epanorthosis 定义**：RLHF 训练导致 LLM 过度使用修辞手法（如同义反复、矛盾修饰）的现象
   - **修辞手法重复**（Rhetorical Figure Repetition）：表面上变化但语义重复的表达
   - **矛盾修饰法**（Oxymoron）：同时声称两个相反的事物

2. **RLHF 偏好表面多样性而非实质准确性**：
   - RLHF reward model 无法区分语义等价但表面不同的表达
   - 导致模型学会"看似不同但实际等价"的响应

3. **三种验证方法**：
   - **行为分析**（Behavioral Analysis）
   - **激活分析**（Activation Analysis）
   - **困惑度分析**（Perplexity Analysis）

## 关键发现

### RLHF → 表面多样性偏好

- RLHF 模型在困惑度分析中，对语义重复内容的困惑度反而更低
- Epanorthosis 在 RLHF 训练的模型中显著富集
- 模型学会生成"看似变化"的表达，实际语义保持不变

### 与 SFT 的对比

- SFT（监督微调）更注重表面与语义的一致性
- RLHF 的 reward signal 偏向于表面多样性
- 这揭示了 RLHF 目标函数的一个根本性缺陷

## 修辞手法类型

| 修辞手法 | 英文 | 定义 |
|---------|------|------|
| **Epanorthosis** | Self-correction | 修正已说的话以强调或澄清 |
| **Oxymoron** | Oxymoron | 矛盾修饰（e.g., "bittersweet"）|
| **Synonymy** | Synonymy | 同义反复 |
| **Pleonasm** | Redundancy | 冗余表达 |

## 建议

- **是否推荐使用**：**是**（RLHF 优化、文本生成质量评估）
- **适用场景**：RLHF reward modeling、文本多样性评估、语言生成质量分析
- **相关方向**：RLHF 改进、DPO、对齐评估

## 链接

- **arXiv**: https://arxiv.org/abs/2607.21498

---

*🥬 油麦菜知识库 | 生成时间: 2026-07-25*
