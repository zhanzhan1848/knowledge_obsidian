---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, crowd-simulation, VAE, latent-embedding, behavior-analysis, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.39563
---

# Trajeform: Embedding Crowd Data

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Trajeform: Embedding Crowd Data |
| **作者** | Marilena Lemonari, Panayiotis Charalambous, Yiorgos Chrysanthou |
| **发表** | arXiv preprint (cs.GR / cs.LG), 2026-10-29 (14 pages, 17 figures, 5 tables) |
| **链接** | [原文](https://arxiv.org/abs/2610.39563) |
| **DOI** | - |
| **代码** | - |

---

## 核心贡献

> Trajeform — 群体轨迹的行为级连续嵌入：在真实轨迹数据上训练重建 VAE，学习保留行为特性的连续潜空间，用于评估模拟器可信度。

1. **行为级嵌入** — 既有评测多关注轨迹级差异，Trajeform 转向**行为级相似性**，学习保留行为特征的连续嵌入。
2. **重建 VAE** — 在真实轨迹上训练 encoder，可直接编码合成模拟器轨迹以比较嵌入分布。
3. **辅助分析能力** — 嵌入可用于分析模拟器的主行为、评估受控环境（如骑行）数据是否覆盖真实行为空间。
4. **三模拟器对比** — CCP、modCCP、RVO 与真实数据集对比，潜空间分析 + 分布指标 + 从聚合后验采样生成轨迹。

---

## 技术方案

### 核心思想

机器学习驱动的群体模拟能从轨迹数据学到自然行为，但其能力高度依赖训练数据的多样性。评测模拟器泛化到真实数据时，多数指标只看轨迹级差异，而**行为级相似性**才是模拟器可信度的真正尺度。

Trajeform 的做法：训练一个**重建 VAE**，让 encoder 学到真实群体轨迹的连续嵌入空间，使得：
- 嵌入的分布差异 ≈ 行为可信度差异
- 可以从聚合后验采样生成轨迹，检验潜空间是否"张得开"真实行为

### 关键技术

| 技术 | 说明 |
|------|------|
| 重建 VAE | 在真实轨迹上训练，学习连续嵌入 |
| 行为级相似性度量 | 替代轨迹级差异指标 |
| 嵌入分布比较 | 编码模拟器输出，与真实分布对比 |
| 聚合后验采样 | 从潜空间生成轨迹做生成式评估 |
| 多模拟器对比 | CCP / modCCP / RVO |
| 潜空间分析 | 主行为与覆盖度分析 |

---

## 公式

```math
// 重建 VAE 目标
\mathcal{L} = \mathbb{E}_{q}\Big[ \log p_\theta(\mathbf{X} \mid \mathbf{z}) \Big] - \mathrm{KL}\big(q(\mathbf{z}|\mathbf{X}) \,\|\, p(\mathbf{z})\big)
// 行为可信度（概念式）
D_{\text{behavior}}(\mathcal{S}_1, \mathcal{S}_2) = \mathrm{KL}\Big( \mathbb{E}_{\mathbf{X}\sim\mathcal{S}_1}[q(\mathbf{z}|\mathbf{X})] \;\|\; \mathbb{E}_{\mathbf{X}\sim\mathcal{S}_2}[q(\mathbf{z}|\mathbf{X})] \Big)
```

---

## 代码片段

```python
# 概念伪代码：Trajeform 评测流程
vae = train_reconstruction_vae(real_trajectories)     # 在真实数据上训练
z_real = vae.encode(real_trajectories)
for name, sim in [("CCP", ccp), ("modCCP", modccp), ("RVO", rvo)]:
    z_sim = vae.encode(sim.generate())
    kl = torch.distributions.kl_divergence(z_real.mean, z_sim.mean)
    print(name, "behavior divergence:", kl)
samples = vae.sample(aggregate_posterior)              # 生成式评估
```

---

## 实验结论

- **数据集**: 真实群体轨迹数据集（地面真值）+ 补充数据（受控环境如骑行采集）
- **基线**: CCP、modCCP、RVO 三个模拟器；轨迹级指标对比
- **结果**:
  - 学到的潜空间捕获了真实数据中有意义的行为依赖
  - 嵌入分布可作为合成数据可信度的附加度量
  - 可用于指导未来轨迹模型的训练
  - 潜空间分析能揭示模拟器的主行为模式与行为空间覆盖度

---

## 局限性

- 需要大量真实轨迹数据训练 VAE
- 嵌入空间的行为语义未做显式标注（不可解释性）
- 仅评估人群行为，未覆盖外观渲染

---

## 与团队相关

- 与墨鱼丸 (moyuwan): **"潜空间嵌入作为模拟器可信度指标"** 是可迁移的评测范式——可用于评估路径追踪器/运动模糊算法的输出分布合理性
- 关联：[[2026-10-31_UniffordInteractor-Unified-Affordance-HOI]]

---

## 实现建议

- **实现难度**: 低中
- **预期性能**: 评测工具性质，开销小
- **适用场景**: 群体模拟器调参、行为数据质量评估、合成数据可信度审核
- **优先级**: 低（评测方法论，非渲染管线）
