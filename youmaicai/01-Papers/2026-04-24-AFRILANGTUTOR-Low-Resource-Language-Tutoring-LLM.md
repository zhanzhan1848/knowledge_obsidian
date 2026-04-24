---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, fine-tuning, sft, dpo, low-resource-languages, african-languages]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.20996
---

# AFRILANGTUTOR: Advancing Language Tutoring and Culture Education in Low-Resource Languages with LLMs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AFRILANGTUTOR: Advancing Language Tutoring in Low-Resource Languages with LLMs |
| **作者** | Tadesse Destaw Belay, Shahriar Kabir Nahin, Israel Abebe Azime, Ocean Monjur, Shamsuddeen Hassan Muhammad, Seid Muhie Yimam, Anshuman Chhabra |
| **发表** | arXiv cs.CL 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.20996) |
| **arXiv** | arXiv:2604.20996 |
| **代码/数据** | [HuggingFace](https://huggingface.co/afrilang-edu) |
| **领域** | cs.CL |

---

## 核心贡献

> 为低资源非洲语言构建 AFRILANGDICT (194.7K 词典) → AFRILANGEDU (78.9K SFT+DPO 数据) → AFRILANGTUTOR 模型

1. **AFRILANGDICT**：194.7K 非洲语言-英语词典条目
2. **AFRILANGEDU**：78.9K 多轮师生问答训练数据（SFT + DPO）
3. **SFT+DPO 组合**：比单一方法提升 1.8%-15.5%

---

## 技术方案

### 数据构建流程

```
词典条目 (AFRILANGDICT)
    ↓ 自动生成
语言学习材料 (AFRILANGEDU)
    ↓ SFT + DPO
AFRILANGTUTOR
```

### 模型训练

- **基础模型**: Llama-3-8B-IT, Gemma-3-12B-IT
- **语言**: 10 种非洲语言
- **训练方法**: SFT → DPO 组合

### 实验结果

- SFT+DPO 比单独 SFT 提升 1.8%-15.5%（LLM-as-a-judge 评估，4 个维度）
- 持续超越基座模型

---

## 局限性

- 依赖词典数据质量
- 仅 10 种非洲语言
- 评估基于 LLM-as-a-judge

---

## 相关工作

- [[SFT]]
- [[DPO]]
- [[Low-Resource NLP]]

---

## 实现建议

- **适用场景**: 低资源语言 NLP、教育辅助
- **核心洞察**: 词典 → 问答增强是低资源语言的有效数据策略
