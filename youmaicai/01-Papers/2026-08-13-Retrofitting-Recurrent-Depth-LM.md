# Retrofitting Recurrent Depth into a Pretrained Language Model

## 元信息
| 标题 | Retrofitting Recurrent Depth into a Pretrained Language Model: Installation, Extrapolation, Transfer, and Retention at Two Parameter Budgets |
| 作者 | Mark Shapiro |
| 链接 | [原文](https://arxiv.org/abs/2608.11233) |
| arXiv | arXiv:2608.11233 [cs.CL] |
| 代码 | 未在文中明确提供（HTML页面未包含GitHub链接） |

## 核心贡献
1. **两次身份保持循环改造（Identity-Preserving Retrofit）**：将 Qwen2.5-0.5B-Instruct 拆分为 Prelude + Recurrent Block + Coda，在单循环路径上复现基座计算，且循环权重跨迭代绑定（weight-tied）。
2. **两种参数预算下均可安装**：可在 6M 前向激活参数的 LoRA adapter 配置（基座权重冻结）和 180M 全量参数全量微调两种预算下安装循环深度机制。
3. **持久化的循环索引潜在计算**：精确的中间状态监督安装了一个迭代转换，在仅评估最终答案时仍能保持运作，且超出直接支持的视野范围，证明训练的是可复用程序而非仅可检索内容。
4. **支持缩放表征**：在训练收敛的支持深度 4-12 上，阈值交叉有效性前沿达到 1.44-1.50 倍的监督支持，在深度 18 时保持 70% 准确率。
5. **注册的密集控制对比**：循环系统在相同冻结合成行上显著优于直接和序列化 scratchpad 密集方案，尤其在深度 10 以后。
6. **保留能力的验证与破坏边界**：在循环安装训练后，手术改造的循环 Qwen 在通用能力上非劣于基座（通过 preregistered ARC battery），但其他训练制度会检测到真实损伤，定义了全量块继续微调在此基座上的失败边界。
7. **优化器交互发现**：将学习率控制表述为组合投影某一层的梯度缩放在 Adam 族和正交优化器下均静默失败，解决方案是将该层作为独立张量放入独立优化器参数组。

## 模型架构
**整体分割**：Qwen2.5-0.5B-Instruct 被拆分为三个区域：
- **Prelude**（前奏）：模型的前部 transformer 层
- **Recurrent Block**（循环块）：中间 transformer 层，被循环执行多次（weight-tied，共享权重）
- **Coda**（尾声）：模型的尾部 transformer 层

**关键设计**：
- **Identity-Preserving One-Loop Path**：单循环路径在循环附加激活失效时重现基座计算，保证改造后模型在 loop=1 时非劣于基座
- **Re-Entry Bridge**：可训练的桥接层，在后续循环中重新注入 Prelude 表示，将携带状态与输入上下文重新对齐，防止激活 off-manifold
- **Halting**：在正确时机读取预测输出（循环中正确深度读取），避免状态携带超过答案深度

**参数预算**：
- Full-block：182M 优化器标记参数，180.6M 前向激活参数
- Adapter（rank-16 LoRA）：6.01M 前向激活参数，基座权重冻结

## 关键发现
- **6M adapter vs 180M full-block**：两种预算均能安装循环机制；adapter 在深度 11 之前略优，full-block 在更远深度更优
- **Extrapolation to ~1.5x supervised depth**：支持缩放前沿达到 1.44-1.50 倍监督支持，在深度 18 时保持 70% 准确率（有尾部天花板，非无限外推）
- **7.6x faster than comparable models**：循环模型比 scratchpad 训练模型快 7.6 倍，输出 token 更少
- **Catastrophic interference boundary**：逆任务可独立学习（63/64），但在保留已安装机制和通用能力的同时无法通过继续训练获得，揭示了灾难性干扰边界
- **持久化机制**：精确中间状态监督安装的迭代转换在仅最终答案评判的退火后仍然存活，证明是训练进的可复用程序而非终端答案查找

## 实验结果
| 实验 | 结果 |
|------|------|
| ARC battery (loop=1) | 非劣于基座（preregistered 83.8% vs 84.0% base） |
| Adapter vs Full-block overall | 83.8% vs 84.0%（几乎持平） |
| Adapter vs Full-block through depth 11 | Adapter 领先 |
| Beyond depth 10 | 循环模型 53% vs scratchpad 2.5% 保留率 |
| Overall comparison | 循环模型 84% vs scratchpad 模型 72% |
| Speed | 循环模型比 scratchpad 快 7.6 倍 |
| Verbal fine-tuning | Full-block 达到 79-86% on 受控 verbal renderings |
| Zero-shot transfer | 两种预算下均最小 |
| Adapter verbal from installed mechanism | 比匹配的新鲜训练高 18.6 分 |
| 逆任务 | 单独可学（63/64），但无法在保留原机制下继续获得 |

## 局限性
1. **灾难性干扰边界**：逆任务可独立学习但无法在保留已安装机制下获得，揭示了当前方法的边界
2. **有限外推**：深度外推有尾部天花板（非无限），约 1.44-1.50 倍监督支持后性能下降
3. **零样本迁移最小**：两种预算下零样本迁移均较小，需要针对任务进行 verbal fine-tuning
4. **学习深度选择未解决**： Learned depth selection remains an open problem for future investigation
5. **基座依赖**：方法依赖于 Qwen2.5-0.5B-Instruct，在其他模型上的泛化待验证
6. **全量块 vs Adapter 的权衡**：小预算足以安装和运行，大预算买的是更远深度外推能力

## Tags
#LLM #reasoning #recurrent #latent-computation #transformer #Qwen #ARC #depth-extrapolation #catastrophic-interference #LoRA #retrofit
