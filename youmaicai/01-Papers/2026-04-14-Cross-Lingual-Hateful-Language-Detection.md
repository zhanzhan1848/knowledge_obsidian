# Toward Generalized Cross-Lingual Hateful Language Detection with Web-Scale Data and Ensemble LLM Annotations

## 基本信息
| 标题 | Toward Generalized Cross-Lingual Hateful Language Detection with Web-Scale Data and Ensemble LLM Annotations |
|------|------|
| 作者 | Dang H. Dang, Jelena Mitrović, Michael Granitzer |
| 机构 | University of Passau |
| 链接 | [原文](https://arxiv.org/abs/2604.09625) |
| arXiv | arXiv:2604.09625 |
| 会议 | LREC 2026 |
| 领域 | cs.CL |

## 核心贡献

1. **Web-scale 无标签数据**：通过 OpenWebSearch.eu (OWS) 爬取四种语言（英、德、西、越南）的无标签网络文本，证明大规模无标注数据可提升多语言仇恨言论检测。

2. **继续预训练提升 BERT**：通过在 OWS 无标签文本上继续 MLM 预训练后进行监督微调，在 16 个基准上平均 macro-F1 提升约 3%，低资源设置下提升更大。

3. **LLM Ensemble 合成标注**：使用四个开源 LLM（Mistral-7B, Llama3.1-8B, Gemma2-9B, Qwen2.5-14B）通过三种集成策略产生合成标注。

4. **LightGBM 元学习器最优**：在均值平均、多数投票、LightGBM 元学习器三种集成策略中，LightGBM 始终表现最佳。

## 方法

### 两大策略

#### 策略一：继续预训练 + 监督微调
```
BERT-base → Continue MLM on OWS texts → Supervised Fine-tuning
```
- 在无标签网络文本上继续 MLM
- 然后进行监督微调
- 结果：平均 macro-F1 +3%，低资源设置提升更大

#### 策略二：LLM 集成合成标注
使用四个开源 LLM 生成合成标注：

| LLM | 规模 |
|-----|------|
| Mistral-7B | 7B |
| Llama3.1-8B | 8B |
| Gemma2-9B | 9B |
| Qwen2.5-14B | 14B |

三种集成策略：
1. **Mean Averaging**：概率均值
2. **Majority Voting**：多数投票
3. **LightGBM Meta-learner**：LightGBM 元学习器 ← 始终最优

## 实验结果

### 继续预训练效果
| 场景 | Macro-F1 提升 |
|------|--------------|
| 平均（16个基准） | +3% |
| 低资源设置 | 提升更大 |

### LLM Ensemble 合成标注效果
| 微调模型 | 效果 |
|---------|------|
| Llama3.2-1B | +11% pooled F1 |
| Qwen2.5-14B | +0.6% |

### 关键发现
- **组合策略**：无标注文本 + LLM 集成标注对小模型和低资源语言最有价值
- 大模型（Qwen2.5-14B）从合成标注中获益有限

## 局限性

- LLM 集成可能继承原始模型的偏见
- 跨语言泛化能力受语言资源分布影响
- LightGBM 元学习器需要额外的训练成本

## 建议
- **是否推荐使用**：是
- **适用场景**：低资源语言的仇恨言论检测、小模型部署场景
- **备注**：将大规模无标注文本与 LLM 合成标注结合的思路可推广到其他 NLP 任务

---
* 🥬 油麦菜 | LLM 论文分析 | 2026-04-14
