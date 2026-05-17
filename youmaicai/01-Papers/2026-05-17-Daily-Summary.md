# 2026-05-17 Daily Summary

> 🥬 每日 LLM/NLP 论文追踪

## 今日论文收集

| 序号 | 论文 | 领域 | 亮点 |
|------|------|------|------|
| 1 | MeMo: Memory as a Model | LLM Architecture | 冻结 LLM + 独立记忆模型编码新知识 |
| 2 | Grep vs Vector for Agentic Search | LLM Agent | Grep 在 RAG 中普遍优于向量检索 |
| 3 | AsyncFC: Asynchronous Function Calling | LLM Inference | 异步并行函数调用，3.39-4.36× 加速 |
| 4 | SRT: Self-Recall Thinking | Dialogue | 多轮对话 +14.7% 延迟改善 |
| 5 | PPOW: Speculative Decoding with RL | Inference | Window 级 RL 优化，6.29-6.52 acceptance |
| 6 | Premature Closure in LLMs | Safety | 医学场景下 55-81% false-action rate |
| 7 | COTCAgent: Clinical CoT Reasoning | Medical AI | Baichuan-M2 Top-1 90.47% |
| 8 | ML-Embed: 3D Matryoshka Multilingual | Embedding | ICML 2026, 9/17 MTEB 新记录 |
| 9 | GranuRAG: Multi-Granularity Evidence | Multimodal | 元素级检索，+29.2% 相对基线 |
| 10 | LLM Strategic Behavior Under Observation | Social AI | 人类监控 > AI 监控引发更强正式化 |

## 今日趋势观察

### 1. LLM Agent 架构成为研究热点
- Grep vs Vector 检索比较、AsyncFC 异步执行、SRT 自召回机制
- 核心问题：如何在保持性能的同时降低延迟

### 2. Safety & Reliability 持续受关注
- Premature Closure 定义和量化是重要贡献
- 医学 AI 中的 false-action rates 达到危险水平

### 3. 多模态 RAG 向细粒度发展
- 从场景/图像级 → 元素级检索
- 可验证性和可解释性成为关键需求

### 4. 推理优化成为工程热点
- Speculative Decoding 的 RL 优化
- 异步函数调用实现模型解码与执行的 overlap

## 重点关注

### 🔥 高优先级
- **AsyncFC**: 生产环境函数调用的延迟优化，实用价值高
- **PPOW**: 推理加速的 RL 方法，3.39-4.36× 加速比
- **Premature Closure**: 医学 AI 安全性的重要警示

### 📚 研究价值
- **MeMo**: 知识更新的新范式，冻结 LLM 的插件式记忆
- **COTCAgent**: 医疗推理的 CoT 改进，90.47% Top-1
- **ML-Embed**: ICML 2026 接收，多语言 embedding 的重要突破

## 同步信息
- 📁 本日新增笔记: 10 篇
- 📂 存储路径: ~/knowledge-vault/youmaicai/01-Papers/
- 🔄 Git 同步: 待执行

---
*生成时间: 2026-05-17 14:18 UTC*