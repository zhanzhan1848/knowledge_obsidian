# 每日 LLM/NLP 论文总结 — 2026-07-23

## 今日概览

共收录 **8 篇**论文，主要集中在以下方向：

| 方向 | 论文数 | 占比 |
|------|--------|------|
| LLM 训练与优化 | 3 | 37.5% |
| 推理与 RL | 2 | 25% |
| 可解释性与安全 | 1 | 12.5% |
| RAG 与检索 | 1 | 12.5% |
| Agent 系统 | 1 | 12.5% |

---

## 重点论文速览

### 🔥 SLAI T-Rex — DeepSeek-V4 全参数 Post-training（⭐ 重点）
在昇腾 NPU 上实现万亿参数 MoE 模型全参数 post-training，MFU 34.22%（2.93x 提升），OR 任务零样本 Pass@1 达 71.81%，超越 GPT-5.4-Mini。

### 🔥 RIPO — 黎曼等距策略优化（⭐ 重点）
揭示 PPO-Clip 探索崩溃的本质原因（欧氏度量 vs 黎曼流形几何失配），提出 RIPO 在黎曼流形上保证等距更新，AIME24 比 GRPO 提升 60%。

### 🔥 SLPO — 隐式推理的 Outcome-Reward RL（⭐ 重点）
将 outcome-reward RL 引入自回归隐式推理器，解决隐式轨迹无法 per-step credit assignment 的难题，Pass@$k$ 提升，难实例获得更长隐式计算。

### Hypernetwork Scaling Laws — 知识注入
首次系统研究超网络知识注入的 scaling laws，OOD 泛化能力优于 LoRA 和全量微调。

### RECAP — 激活解释可验证性
揭示重建测试的结构性缺陷（无法惩罚独立错误陈述），提出共训练探针方法，对抗场景下检测撒谎 AUC 0.95。

### Rubric-Oriented Retrieval — 文档集评估
超越独立相关性评分，考虑文档间冗余/冲突/互补关系，SetwiseEvalKit 28K rubric，Rubric4Setwise 用更少文档达最优生成。

### DocOps — Agent 文档操作基准
揭示 Agent 在长程耦合文档任务上的 3 类失败模式：状态跟踪崩溃、浅层验证、结构破坏性编辑。

### SoftReason — 可微神经符号推理
全流程可微的感知-推理架构，将即时后果算子提升为可学习可微算子，用于 KVQA。

---

## 技术趋势

1. **RL + 推理 scaling 持续深化**：从显式 CoT 向隐式推理延伸，RIPO/SLPO 分别从几何和信用分配角度突破
2. **知识注入走向 Scaling Laws 研究**：从方法设计到系统性的 scaling law 表征
3. **可解释性走向对抗鲁棒**：不仅解释正确，还要能检测撒谎（RECAP）
4. **Agent 评估基准深化**：从单任务评估走向复杂工作流和状态管理能力评估

---

## 同步信息

- **收录论文**: 8 篇
- **存储路径**: `youmaicai/01-Papers/`
- **Git 同步**: ✅ 已同步至 `https://github.com/zhanzhan1848/knowledge_obsidian.git`
