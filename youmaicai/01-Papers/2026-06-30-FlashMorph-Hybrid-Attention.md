# FlashMorph: Morphing into Hybrid Attention Models

## 元信息
| 标题 | Morphing into Hybrid Attention Models |
|------|------|
| 作者 | Disen Lan et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.30562) |
| arXiv | arXiv:2606.30562 [cs.CL] |
| 类别 | Attention Mechanism, Transformer Efficiency, Long Context |

## 核心贡献
1. **问题**：Hybrid attention model 效果依赖哪些层保留 full attention，现有方法依赖启发式策略，忽略层间依赖性
2. **FlashMorph (Fast LAyer Selection for Hybrid MORPHing)**：
   - 将 hybrid layer selection 表述为**预算约束的子集优化问题**
   - 两阶段流程：
     - Stage 1: 构建**morphable model**（每层配备 linear-attention branch），冻结所有权重，在合成长上下文检索数据上联合优化 layerwise gates + linearization regularization
     - Stage 2: 在预设 full-attention 预算下离散化 gates → 实例化 hybrid architecture → logits distillation + long-context finetuning

## 方法对比
| 方法 | Layer Selection | 权重更新 | 正则化 |
|------|----------------|---------|--------|
| Heuristic | 固定模式 | Full | 无 |
| FlashMorph | 可学习 gates | Frozen | Linearization |

## 关键公式
- **Linearization Regularization**: 鼓励模型依赖 linear attention 以提升效率
- **Gate Discretization**: 在 full-attention 预算约束下二值化 gates

## 实验结果
- 发现更有效的 hybrid 配置
- 保留强 long-context recall 和通用 benchmark 性能
- 显著降低 layer selection 成本

## 局限性
- 合成数据分布可能与真实长上下文分布存在 gap
- 离线 gate 优化无法适应动态 workload

## 建议
- **适用场景**：长上下文 LLM 部署、边缘设备上的 LLM serving
- **推荐指数**: ⭐⭐⭐⭐
- **亮点**：首个将 layer selection 形式化为优化问题的方法，效率与效果兼顾

---

## 相关资源
- PDF: https://arxiv.org/pdf/2606.30562
- HTML: https://arxiv.org/html/2606.30562v1
