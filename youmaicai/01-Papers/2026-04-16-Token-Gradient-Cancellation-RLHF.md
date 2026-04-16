# 🥬 LLM 论文分析：Token Gradient Cancellation for Intra-Group RLHF

## 基本信息
- **标题**: Design Conditions for Intra-Group Learning of Sequence-Level Rewards: Token Gradient Cancellation
- **作者**: Zijian Zeng et al. (Alibaba Group, Tsinghua University)
- **发表**: arXiv:2604.13088 [cs.LG, cs.AI] — ICML
- **链接**: [原文](https://arxiv.org/abs/2604.13088)
- **日期**: 2026-04-04

## 核心贡献

1. **必要条件**: 在 token 级别维持 **gradient exchangeability** 是群内学习稳定性的必要条件——使弱信用/高频 token 的梯度可相互抵消

2. **两个破坏 exchangeability 的机制**:
   - **Asymmetric Clipping**: 非对称截断破坏 token 因子化结构中的 exchangeability
   - **Sequence Coupling**: 序列耦合（s_i = ∏_t r_{i,t}）使群内取消仅在零测度集成立 → "non-cancellation" 是结构性常态

3. **两种修复变换**:
   - **Group-Constant (Min-Replace)**: w_min ≜ min(w_j)，统一群内权重尺度
   - **Adv-Orthogonal Reweighting**: 投影去除权重与 advantage 的相关性

4. **实验验证**: DFPO 在 HMMT25, AIME25, LiveCodeBench 上验证三个预测（计算效率↑、收敛稳定性↑、最终性能↑）

## 核心公式

### 群内比较目标（通用形式）
```
𝒥(θ) = 𝔼_x [1/G ∑_{i=1}^G ∑_{t=1}^{T_i} ω_{i,t}(τ_i; θ) Â_i]
```
其中 Â_i 是群内相对优势（advantage），∑ Â_i = 0

### 群内取消条件
```
(1/G) ∑_{i=1}^G Â_i ∇_θ ω_{i,t⋆} = 0
```
若共享 token 携带无区分性的信用信息（弱相关 token），则违反群内取消会导致无效更新

### Proposition 3.1 (KL 漂移)
当 non-cancellation 发生时：
```
KL(π_{θ+}(·|h⋆) ‖ π_θ(·|h⋆)) = (1/2)η² g_{t⋆}^⊤ F_θ(h⋆) g_{t⋆} + O(η³‖g_{t⋆}‖³) > 0
```
→ 无效更新（reward-irrelevant drift）系统性累积

### Corollary 3.2 (熵崩溃)
当等价解集合 {y_a, y_b} 的 log-odds drift 持续累积：
```
Δ log(π(y_a)/π(y_b)) = η·c(x)(κ(y_a;θ) - κ(y_b;θ))
```
若符号保持一致 → 二元熵 h(p_k) → 0（熵崩溃）

### GRPO vs GSPO 梯度对比

**GRPO (Token-Factorized)** — 可交换：
```
∇_θ 𝒥_tok^(t⋆) = (ρ/2)(Â_1 + Â_2) ∇_θ log π_θ(a⋆|h⋆) = 0  ✓
```

**GSPO (Sequence-Coupled)** — 不可交换：
```
∇_θ 𝒥_seq^(t⋆) = (Aρ/2)(u_2(θ) - u_1(θ)) ∇_θ log π_θ(a⋆|h⋆) ≠ 0  ✗
除非 u_1(θ) = u_2(θ)（零测度）
```

### 修复变换

**Transformation 1: Group-Constant**
```
w_min ≜ min_j w_j(τ_j; θ)
w̃_i ≜ w_min, ∀i
```

**Transformation 2: Adv-Orthogonal**
```
w̃ = w - (Â^⊤ w / ‖Â‖²₂) Â
```

## 可验证预测

1. **计算效率**: Steps(Score ≥ κ) ↓
2. **收敛稳定性**: Jitter₂(m^ours) < Jitter₂(m^base)
3. **最终性能**: Score_final ↑（减少灾难性遗忘）

## 局限性

- 理论分析基于线性区域近似（忽略 min/clip 的分段效应）
- 修复变换引入的计算开销未详细评估
- 主要在数学推理任务验证，其他任务类型泛化待确认

## 建议

- **是否推荐使用**: 是（RLHF/推理模型训练必读）
- **适用场景**: GRPO, GSPO, DAPO 等群内比较 RL 方法的理论理解与改进
- **相关论文**: GRPO, GSPO, DAPO, [2604.13206](./2026-04-16-Numerical-Instability-Chaos-LLM.md) (LLM 不稳定性)
