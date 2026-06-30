# Regime-Aware Peer Specialization for Robust RAG under Heterogeneous Knowledge Conflicts (RAPS-DA)

## 元信息
| 标题 | Regime-Aware Peer Specialization for Robust RAG under Heterogeneous Knowledge Conflicts |
|------|------|
| 作者 | Bo Wang, Heyan Huang, Yaolin Li, Yanghao Zhou, et al. (BIT) |
| 链接 | [原文](https://arxiv.org/abs/2606.30518) |
| arXiv | arXiv:2606.30518 [cs.CL] |
| 类别 | RAG, Fine-tuning, Knowledge Conflicts, On-Policy Distillation |

## 核心贡献
1. **问题定义**：RAG 面临知识冲突的可靠性光谱（Reliable → Partially Reliable → Adversarial），现有方法 regime-agnostic supervision 导致冲突学习信号混合
2. **RAPS-DA (Regime-Aware Peer Specialization with Difficulty Annealing)**：
   - **Sample-level**: 将冲突分为三个 regime（Grounding/Arbitration/Resistance），每个 regime 训练一个 peer specialist，通过 hard routing 分发样本
   - **Token-level**: Dual-layer selector 使用三个诊断信号（inter-teacher disagreement, student-teacher divergence, student entropy）过滤/加权 token
   - **Difficulty Annealing**: 稳定化 regime-routing 和 token-selection 的交互
3. **核心洞察**：收益来自固定模型规模下的 specialization，而非更强的 teacher；peer specialists 仅在训练时存在，部署时无需 regime labels

## 三种 Regime
| Regime | 上下文可靠性 | 期望行为 |
|--------|------------|---------|
| Grounding (GG) | 可靠 | 整合外部证据 |
| Arbitration (AA) | 混合质量 | 选择性信任 |
| Resistance (RR) | 对抗性 | 拒绝/忽略 |

## 关键方法
- **On-Policy Reverse-KL Supervision**: 以 base model 为隐式 KL anchor
- **Hard Routing**: 消除跨 regime 的矛盾梯度更新
- **Token Selection**: 三信号驱动 mask + 软权重

## 实验结果
- 5 个冲突场景 + 2 个 OOD benchmarks
- 超越所有 prompting、decoding、fine-tuning、RL 和 single-teacher baselines

## 局限性
- 需要预先定义 regime 分类标准
- Hard routing 可能导致 regime 边界样本的错误路由

## 建议
- **适用场景**：知识密集型 RAG 场景、检索上下文可能冲突的应用
- **推荐指数**: ⭐⭐⭐⭐
- **亮点**：首次提出 regime-aware RAG 训练框架，系统性解决知识冲突问题

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30518
- HTML: https://arxiv.org/html/2606.30518v1
