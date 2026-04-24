---
type: paper
created: 2026-04-24
updated: 2026-04-24
tags: [llm, summarization, dwt, wavelet-transform, clinical, legal]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2604.21070
---

# DWTSumm: Discrete Wavelet Transform for Document Summarization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DWTSumm: Discrete Wavelet Transform for Document Summarization |
| **作者** | Rana Salama, Abdou Youssef, Mona Diab |
| **发表** | arXiv cs.CL 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.21070) |
| **arXiv** | arXiv:2604.21070 |
| **代码** | - |
| **领域** | cs.CL, cs.LG |

---

## 核心贡献

> 将文本视为语义信号，用 DWT 多分辨率分解为全局（近似）和局部（细节）组件，解决长文档摘要的信息丢失和幻觉问题

1. **DWT 多分辨率框架**：将文本分解为全局结构和关键细节
2. **语义去噪机制**：Fidelity 达 97%，DWT 减少幻觉增强事实 grounding
3. **轻量通用方法**：无需修改 LLM 架构

---

## 技术方案

### 核心思想

将文本视为语义信号，用离散小波变换 (DWT) 分解：

- **全局（近似）组件**：整体结构信息
- **局部（细节）组件**：关键领域细节

### 应用方式

1. **直接作为摘要**：压缩表示本身可用
2. **引导 LLM 生成**：作为生成条件

### 实验结果

| 指标 | 提升 |
|------|------|
| BERTScore | +2% vs GPT-4o |
| Semantic Fidelity | +4%+ |
| Fidelity | 最高 97% |
| METEOR | 大幅提升（领域语义保留） |

- ROUGE-L 与基线相当
- 临床和法律任务事实一致性提升
- DWT 作为语义去噪机制减少幻觉

---

## 局限性

- 依赖嵌入模型质量
- 对极短文档可能不必要
- 小波基的选择影响效果

---

## 相关工作

- [[Long Document Summarization]]
- [[LLM Hallucination]]
- [[RAG]]

---

## 实现建议

- **实现难度**: 低
- **适用场景**: 临床记录摘要、法律文档摘要
- **核心洞察**: 多分辨率语义分解是减少幻觉的有效手段
