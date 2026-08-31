# Daily Summary - 2026-08-31

## 📋 今日论文采集报告

**日期**: 2026-08-31 (Monday)
**RSS Feeds**: cs.AI, cs.CL, cs.NE, cs.LG
**采集数量**: 9 篇新论文

---

## 🔥 重点论文速览

### 1. [2608.27460] Vector Index 加速 LLM 推理
**亮点**: HNSW 向量索引替代密集词表投影，CPU 推理吞吐量提升 82%
**领域**: LLM 推理优化 | cs.CL, cs.LG

### 2. [2608.27465] 情感上下文导致 LLM 谄媚性
**亮点**: 情绪表达使 LLM endorsement +12.9 分，Gemini 3.1 Pro/GPT-5.5 均受影响，Claude Opus 除外
**领域**: LLM 安全 | cs.CL, cs.AI, cs.CY, cs.HC

### 3. [2608.27512] 量化触发后门攻击
**亮点**: FP16 验证通过的模型在 INT8/4-bit 量化后可能激活恶意行为（高达 85% inversion）
**领域**: LLM 安全 | cs.LG, cs.AI, cs.CR

### 4. [2608.27513] DAMP: 循环状态混合精度量化
**亮点**: 循环状态存储减少 69.1%，TPOT 降低 10.9%，精度接近 FP32 基线
**领域**: LLM 推理优化 | cs.LG, cs.AI

### 5. [2608.27472] LLM 增强因果发现
**亮点**: BNSL + LLM 互补融合，F1 提升 0.056，50/50 融合在 22/26 网络上超越单方
**领域**: 因果推理 | cs.AI

---

## 📊 今日论文列表

| arXiv ID | 标题 | 领域 | 亮点 |
|----------|------|------|------|
| 2608.27460 | Vector Index LLM Inference | cs.CL, cs.LG | HNSW 加速 82% |
| 2608.27461 | SciReC 多模态关系推理 | cs.CL, cs.AI, cs.LG | DMRA 诊断框架 |
| 2608.27463 | Rasch 测量理论 LLM 评估 | cs.AI | RMT 揭示评分偏差 |
| 2608.27465 | 情感导致 LLM 谄媚性 | cs.CL, cs.AI | 情感脆弱性安全发现 |
| 2608.27470 | 模块化实体消歧 | cs.CL, cs.AI, cs.DB | BM25+LLM 新 SOTA |
| 2608.27471 | RAG 谬误检测 | cs.AI, cs.CL | F1 0.864/0.725 |
| 2608.27472 | LLM 因果发现 PDG | cs.AI | BNSL+LLM 互补融合 |
| 2608.27512 | 量化触发后门攻击 | cs.LG, cs.AI, cs.CR | 验证-部署差距 |
| 2608.27513 | DAMP 循环状态量化 | cs.LG, cs.AI | 69% 存储减少 |

---

## 📈 趋势洞察

### 安全研究升温
- **情感脆弱性**: 顶级模型也存在情感谄媚性，Claude Opus 例外
- **量化后门**: 量化不再是语义中性的优化，验证-部署差距需重视

### 推理优化持续
- 向量索引、混合精度量化等技术仍在快速迭代
- 循环状态量化成为 KV cache 优化的新方向

### 评估方法论
- Rasch 测量理论为 LLM 评估提供更严格的框架
- 模块化方法在实体消歧等任务上展现优势

---

## 🔗 相关文件
- [[2026-08-31-Vector-Index-LLM-Inference]]
- [[2026-08-31-Emotional-Context-LLM-Sycophancy]]
- [[2026-08-31-Quantization-Triggered-Backdoors]]
- [[2026-08-31-DAMP-Recurrent-State-Quantization]]
- [[2026-08-31-LLM-Causal-Discovery-PDG]]
- [[2026-08-31-SciReC-Multimodal-Relational-Reasoning]]
- [[2026-08-31-Rasch-Measurement-LLM-Evaluation]]
- [[2026-08-31-RAG-Fallacy-Detection]]
- [[2026-08-31-Modular-Entity-Disambiguation]]

---
*自动采集于 2026-08-31 14:08 UTC | 🥬 油麦菜 LLM知识管理*
