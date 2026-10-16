# Subspace Tuning (SST): Mitigating Forgetting in Continual Learning

## 元信息
| 标题 | Towards Continual Learning: Mitigating Forgetting With Subspace Tuning |
|------|-------------------------------------------------------------------|
| 作者 | Arnav Chavan, Kusha Sareen, Rishabh Tiwari, Abhranil Chandra, Johan Obando-Ceron, Kurt Keutzer, Scott Niekum, Inderjit S Dhillon, Devvrit Khatri |
| 链接 | [原文](https://arxiv.org/abs/2610.22293) |
| arXiv | arXiv:2610.22293 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.LG, cs.AI |

## 核心贡献
1. **Subspace Tuning (SST)**：限制每次权重更新只发生在**底部奇异子空间**，避免沿主奇异方向变化
2. **理论洞察**：SFT 沿主方向更新导致灾难性遗忘；on-policy 方法（RL、自蒸馏）则规避之；SST 桥接这两者
3. **三个关键机制**：
   - 紧致子空间保护
   - 密集梯度估计
   - 简单 refresh 机制
4. **强结果**：保护 99% 的权重子空间大幅提升保留能力，几乎消除大模型 regime 下的遗忘

## 方法论
```math
\Delta W_{SST} = U_{\perp}\Sigma_{\perp}V_{\perp}^T \cdot g
```
- $U, V$：权重矩阵 $W$ 的左/右奇异向量
- 保留 principal directions（top singular subspace）
- 更新限制在 bottom singular subspace 上

### 三组件设计
| 组件 | 作用 |
|------|------|
| **Tight Subspace Protection** | 99% 子空间保持不变 → 模型不离原分布太远 |
| **Dense Gradient Estimation** | 在 allowed subspace 中仍可密集学习 |
| **Refresh Mechanism** | 周期性调整保护区，避免僵化 |

## 实验结果
- 与 SFT、自蒸馏等 baseline 对比：明显改善"学习-遗忘"的 Pareto 前沿
- **保留能力↑、目标任务性能保持**
- **KL Drift**：比 baseline recipes 低 2-4 倍
- **模型/数据规模↑** → 行为更明显（大模型 regime 几乎消除遗忘）

## 关键洞察
- 在 SFT 中把梯度限制到 bottom singular subspace = 给 fine-tuning 加"几何形状约束"
- 与之前基于 orthogonal 的 fine-tuning 方法（如 OFT、BOFT）相比：更强的学习能力

## 相关工作
[[Continual-Learning]] [[Catastrophic-Forgetting]] [[Parameter-Efficient-FT]] [[SVD-Based-FT]] [[LoRA]] [[OFT]]

## 局限性
- 仍需 SVD 分解（每层一次），部署成本高于 LoRA
- 仅在 NLP/LLM 任务验证，未明确扩展到 ViT / 多模态
- "Refresh 机制"超参可能需要针对不同模型调整

## 实践建议
- **何时用 SST**：多次迭代 fine-tuning 时、跨任务部署时、需保留 base 能力时
- **替代 LoRA 的场景**：客户希望保留更多 base 能力（如垂直领域 chatbot）
- 与 LoRA 正交：可与 LoRA 叠加或选其一

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
