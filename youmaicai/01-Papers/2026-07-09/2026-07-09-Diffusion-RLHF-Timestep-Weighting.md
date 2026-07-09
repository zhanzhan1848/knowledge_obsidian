# 🥬 LLM 论文分析：Selective Timestep Weighting for Diffusion RLHF

## 基本信息
- **作者**: Soumik Mukhopadhyay et al.
- **发表**: arXiv cs.LG/cs.AI/cs.CV | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07693](https://arxiv.org/abs/2607.07693)
- **关键词**: Diffusion Model, RLHF, Sample Efficiency, PPO

---

## 核心贡献

1. **问题**: 扩散模型 RLHF 反馈效率极低，现有方法需要大量人类或 reward model 评估

2. **核心观察**: 扩散轨迹中 reward 信息分布不均——不是所有去噪 timestep 或轨迹对学习贡献相同

3. **两大策略**:

   **策略1 — Per-timestep 权重**:
   - 在策略优化期间对去噪步骤重新加权
   - 与 PPO 最优收敛性质理论关联
   - 经验近似权重趋势

   **策略2 — 经验回放机制**:
   - 优先保留信息丰富的轨迹
   - 模型复用历史样本而非反复查询新 reward

4. **结果**: 相同超参数下，样本效率提升最高 **6×**

---

## 与标准 Diffusion RLHF 对比

| 方法 | 样本效率 |
|------|---------|
| 标准 Diffusion RLHF | 1× |
| **Ours (Timestep Weighting + Replay)** | **6×** |

---

## 局限性

- 聚焦扩散模型，不直接适用于自回归 LLM
- 理论分析依赖 PPO 框架

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: 扩散模型 alignment、图像/视频生成、AI-generated content alignment
