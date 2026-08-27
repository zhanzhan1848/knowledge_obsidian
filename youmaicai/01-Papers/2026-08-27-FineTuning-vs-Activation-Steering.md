# Does Fine-Tuning Undo Activation Steering? Behavioural Recovery Without Weight-Edit Reversal

## 元信息
| 标题 | Does Fine-Tuning Undo Activation Steering? Behavioural Recovery Without Weight-Edit Reversal |
|------|------|
| 作者 | Philipp E. Glass et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.24988) |
| arXiv | arXiv:2608.24988 |
| 发表 | EMNLP 2026 Main |

## 核心贡献
1. **首次系统研究激活 steering 在微调后的稳定性**：在 5 个 instruction-tuned 模型（3B-14B）上测试 SFT 和 RLHF 后 activation steering 的存活情况
2. **揭示 mechanic durability vs functional vulnerability 的矛盾**：权重编辑几乎不被影响（mean vector recovery ρ=0.004），但行为上 steering 效果在 SFT 下平均下降 64%
3. **发现微调通过正交方向消除 steering 效果**：fine-tuning 更新方向与 steering 方向近乎正交（mean cosθ=0.074），说明微调并非"逆转"steering 机制，而是在正交方向上覆盖行为

## 模型架构
- 测试模型：5 个 instruction-tuned 模型（3B-14B 参数规模）
- Steering 任务：refusal suppression（拒绝抑制）和 brevity induction（简洁性诱导）

## 关键发现

### 行为层面
- **SFT 下 steering 退化**：refusal ablation 在 SFT 后平均损失 64% 的效果
- **RLHF 下稳定性**：取决于训练数据是否与目标行为矛盾

### 机制层面
```math
\text{mean vector recovery} = \rho = 0.004
\text{cosine similarity} = \cos\theta = 0.074
```
权重向量几乎完全保留，但行为被覆盖。

### 核心矛盾
> 激活 steering 在机制层面极为耐久（mechanistically durable），但在功能层面脆弱（functionally vulnerable）。Steering 编辑的权重向量几乎不变，但下游微调可以在正交方向上重写行为。

## 实验设置
- **任务**：refusal suppression、brevity induction
- **微调方式**：non-adversarial SFT、RLHF
- **评估**：行为测试 + 机制探测（mean vector recovery）

## 结论与建议
1. Activation steering 适合预部署嵌入，但需在下游训练后重新验证
2. 机制稳定 ≠ 功能稳定——两者需独立评估
3. 下游微调对 steering 效果的影响取决于训练数据与目标行为的冲突程度

## 局限性
- 非对抗性微调场景，未测试刻意去除 steering 的攻击性微调

## 建议
- **是否推荐使用**：是（在预部署阶段），但需注意下游微调的干扰
- **适用场景**：对齐先验嵌入、行为控制

## 相关研究
- Activation Steering: [[Activation Steering]]
- RLHF: [[RLHF]]
- Fine-tuning: [[Fine-tuning]]

---
*标签*: #activation-steering #fine-tuning #rlhf #empirical-study #EMNLP2026
