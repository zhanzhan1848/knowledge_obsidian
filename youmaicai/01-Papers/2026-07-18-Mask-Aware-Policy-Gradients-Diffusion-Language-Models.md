# 🥬 LLM 论文分析：Mask-Aware Policy Gradients for Diffusion Language Models

## 基本信息
- **标题**: Mask-Aware Policy Gradients for Diffusion Language Models
- **作者**: Haran Raajesh, Kulin Shah, Adam Klivans, Philipp Krähenbühl
- **机构**: UT Austin
- **发表**: arXiv (COLM 2026 接收)
- **链接**: [原文](https://arxiv.org/abs/2607.15200) | [代码](https://github.com/Haran71/mask-aware-policy-gradients)
- **arXiv**: arXiv:2607.15200
- **领域**: cs.CL (RL for LLM / Diffusion Language Model)

## 核心贡献
1. 将 MDLM（Masked Diffusion Language Model）生成建模为**两阶段动作 MDP**：每个去噪步骤包含 token 预测和位置重掩码两个决策
2. 推导出策略梯度自然分解为 **token 项 + masking 项**，现有方法只优化 token 项，忽略了 unmasking 顺序的优化
3. 提出**概率性重掩码 (Probabilistic Remasking)**：用 Plackett-Luce 分布替代确定性 top-K 选择，使 unmasking 顺序可微、可优化
4. 在数学推理和代码生成基准上达到 SOTA：GSM8K 87.1%, MATH500 44.2%, HumanEval 44.0%, MBPP 53.4%

## 背景：MDLM 的挑战

### 自回归模型
```
πθ(x1:n | c) = ∏k=1:n πθ(xk | x<k, c)
```
log-likelihood 直接可求，策略梯度 tractable。

### MDLM
文本生成为迭代去噪过程：从全 [MASK] 序列开始，逐步预测 token 和决定哪些位置 unmmask。
- 挑战：log-likelihood 是所有产生 x 的轨迹的边缘分布，不可直接计算
- 现有方法：ELBO 变体 或 轨迹方法，但都**忽略 unmasking 顺序**

## 核心方法

### 两阶段动作 MDP
每个去噪步骤 t：
1. **Token 预测**: z^t ~ πθ(· | z^{t-1}, c)
2. **Unmask 选择**: U_t ⊆ {k: z^{t-1}_k = [MASK]}

### 概率性重掩码 (Plackett-Luce)
```math
punmask(ui=x | u<i, z^{t-1}, z^t) = 
  exp(v^t_x / τ) / Σ_j exp(v^t_j / τ)
```
温度 τ → 0 恢复贪婪 top-K；τ > 0 定义了可优化的分布。

### 策略梯度分解
```math
∇θ J(θ) = E[ R(c, z^T) × Σ_t ( ∇θ log punmask(Ut | ...) + ∇θ log πθ(z^t | ...) ) ]
```

## 实验结果

| 模型 | GSM8K (128) | MATH500 (128) | HumanEval (128) | MBPP (128) |
|------|-------------|--------------|-----------------|------------|
| LLaDA-8B-Inst | 69.5 | 28.2 | 27.4 | 36.2 |
| GDPO | 78.4 | 33.2 | 26.2 | 43.6 |
| **Ours** | **81.0** | **37.4** | **33.2** | **47.1** |

- 比最佳基线 GDPO 提升：GSM8K +2.5%, MATH500 +4.0%, HumanEval +2.2%, MBPP +2.2%

## 关键洞察
1. **Unmasking 顺序本身包含优化信号**：改变 unmasking 顺序可以在 token 概率不变的情况下影响最终奖励
2. **仅优化 token 项会遗漏改进方向**：论文提供了最小反例证明
3. Position term 无需额外参数，从模型自己的 logits 计算

## 代码关键片段
```python
# 概率性重掩码采样
def sample_unmasking(logits, k, tau):
    probs = softmax(logits / tau)
    # Plackett-Luce 顺序采样
    unmasked = []
    remaining = set(range(len(logits)))
    for _ in range(k):
        p = probs[list(remaining)] / probs[list(remaining)].sum()
        idx = np.random.choice(list(remaining), p=p)
        unmasked.append(idx)
        remaining.remove(idx)
    return unmasked
```

---
*📅 录入日期: 2026-07-18 | 来源: arXiv cs.CL | COLM 2026 接收论文*
