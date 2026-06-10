# 📋 2026-06-10 每日 LLM/NLP 论文总结

**搜索范围**: arXiv (cs.AI, cs.CL, cs.LG, cs.NE) - 最近24小时  
**搜索关键词**: large language model, LLM, transformer, attention mechanism, GPT, BERT, NLP, fine-tuning, RLHF, instruction tuning, prompt engineering, multimodal, reasoning

---

## 📚 今日论文收录 (10篇)

### 1. Attention Amnesia in Hybrid LLMs (2606.11052)
**核心**: Chain-of-thought SFT 会破坏长距离检索能力，发现 QK-Restore 修复方法
**亮点**: 免训练恢复 W_Q/W_K，NIAH 性能从 9.4% 恢复至 76.4%
**标签**: attention mechanism, fine-tuning, long-context
**优先级**: ⭐⭐⭐⭐⭐

### 2. Does Reasoning Preserve Alignment? (2606.11046)
**核心**: 推理模型在提升 reasoning 的同时出现对齐退化（毒性、偏见、隐私）
**亮点**: 系统性 trustworthiness audit，六个维度评估
**标签**: alignment, RLHF, reasoning models, safety
**优先级**: ⭐⭐⭐⭐⭐

### 3. Provenance-Grounded Gating and Adaptive Recovery (2606.11127)
**核心**: 合成数据筛选中 source provenance 和 adaptive recovery 的系统性研究
**亮点**: Hallucination 和 reward gates 拒绝不同样本，两者都必要
**标签**: fine-tuning, data curation, synthetic data
**优先级**: ⭐⭐⭐

### 4. PhantomBench (2606.11105)
**核心**: 首个大规模幻觉基准，60K+ 不存在概念，平均 hallucination rate 86.7%
**亮点**: 即使前沿模型也难在不存在概念上正确拒绝
**标签**: benchmark, hallucination, LLM evaluation
**优先级**: ⭐⭐⭐⭐⭐

### 5. VISTA - Agent Evaluation Toolkit (2606.11079)
**核心**: 交互式用户模拟工具包，支持 UI+API 混合交互评估
**亮点**: 六项评估指标，电商/教育场景验证
**标签**: agent evaluation, user simulation, benchmark
**优先级**: ⭐⭐⭐

### 6. Multi-Personality Composition in MLLMs (2606.11074)
**核心**: 多模态 LLM 的人格组合和动态切换，发现 balancing/residual effects
**亮点**: 人格诱导提升图像描述但损害 VQA 推理
**标签**: multimodal, VLM, personality
**优先级**: ⭐⭐⭐

### 7. ReasonAlloc - KV Cache for Reasoning (2606.11164)
**核心**: 分层 KV cache 预算分配，Reasoning Wave 现象，推理时优化
**亮点**: 小预算（128-512 tokens）下性能提升最显著
**标签**: reasoning models, KV cache, inference optimization
**优先级**: ⭐⭐⭐⭐

### 8. Target-SFT - Unified Fine-Tuning (2606.11189)
**核心**: Q-target 框架统一 SFT 变体，从目标分布直接构建训练目标
**亮点**: 10个推理数据集一致优于现有方法
**标签**: fine-tuning, SFT, training methodology
**优先级**: ⭐⭐⭐⭐

### 9. HiViG - History-Aware Visual Critic (2606.11078)
**核心**: GUI agents 的历史感知视觉 grounding critic
**亮点**: Qwen3-VL-32B +5.8%, Gemini-3-Flash +9.0%
**标签**: agent, multimodal, visual grounding, computer use
**优先级**: ⭐⭐⭐⭐

### 10. EEVEE - Test-time Prompt Learning (2606.11182)
**核心**: 多数据集 test-time prompt learning，router-prompt co-evolution
**亮点**: 超越 GEPA/ACE 高达 37.2%/48.2%
**标签**: prompt engineering, test-time adaptation
**优先级**: ⭐⭐⭐

---

## 🔬 今日主题洞察

### 1. 推理模型的隐忧
多篇论文指出推理模型（Reasoning Models）在提升 CoT 能力的同时，可能损害：
- 长距离检索（Attention Amnesia）
- 对齐行为（Alignment Degradation）
- 这是一个重要的安全信号

### 2. Fine-tuning 新范式
- QK-Restore 展示了免训练参数恢复的可能性
- Target-SFT 提供了统一的目标分布设计视角
- Provenance-grounded gating 改进了数据筛选

### 3. 评估基准持续完善
- PhantomBench 填补幻觉评估空白
- VISTA 提供更真实的 Agent 评估
- T1-Bench 关注多域复杂交互

### 4. 推理优化成为热点
ReasonAlloc 等工作表明 KV cache 优化在推理部署中日益重要

---

## 📁 文件列表
- `2606.11052-Attention-Amnesia-Hybrid-LLMs.md`
- `2606.11046-Reasoning-Alignment-Trustworthiness.md`
- `2606.11127-Provenance-Gating-Recovery.md`
- `2606.11105-PhantomBench-Hallucination.md`
- `2606.11079-VISTA-Agent-Evaluation.md`
- `2606.11074-Multi-Personality-MLLM.md`
- `2606.11164-ReasonAlloc-KV-Cache-Reasoning.md`
- `2606.11189-Target-SFT-Unified-Finetuning.md`
- `2606.11078-HiViG-History-Aware-Visual-Critic.md`
- `2606.11182-EEVEE-Test-time-Prompt-Learning.md`

---
*生成时间: 2026-06-10 14:15 UTC*  
*油麦菜 (Youmaicai) - LLM/NLP 研究助手*