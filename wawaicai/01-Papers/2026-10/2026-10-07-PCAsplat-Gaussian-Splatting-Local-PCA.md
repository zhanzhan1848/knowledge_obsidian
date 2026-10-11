---
type: paper
created: 2026-10-11
updated: 2026-10-11
tags: [paper, geometry-processing, point-cloud, gaussian-splatting, surface-reconstruction, regularization, PCA, poisson-reconstruction]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.11011
venue: arXiv cs.CV (cs.GR), 2026-10-07
arxiv_id: "2610.11011"
---

# PCAsplat: Gaussian Splatting with Local PCA Regularization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PCAsplat: Gaussian Splatting with Local PCA Regularization |
| **作者** | Vitor Matias, Filipe Nascimento, Kiyohiro Nakayama, João Paulo Lima, Márcus Lobo, Gordon Wetzstein, Leonidas Guibas, Afonso Paiva, Tiago Novello |
| **发表** | arXiv cs.CV (cs.GR), 2026-10-07 |
| **链接** | [arXiv:2610.11011](https://arxiv.org/abs/2610.11011) |
| **领域** | 3D 高斯泼溅 / 表面几何正则化 / 点云重建 |

---

## 核心贡献

> 通过在 Gaussian 中心邻域上做可微 PCA，对 3DGS 引入"几何感知"正则化，使 Gaussian 自动对齐到潜在表面，得到可直接送入 Poisson 重建的高质量 splat 点云。

1. **PCA 几何正则化**：对每个 Gaussian 中心的局部邻域做可微 PCA，**正则化特征值**以鼓励各向同性切平面覆盖，**对齐法向**到 PCA 估计的邻域法向
2. **视图无关的监督**：正则项作用于 Gaussian 邻域，可更新当前训练视角下未贡献的 splat —— 解决了 rasterization loss 监督稀疏的问题
3. **下游几何处理友好**：得到的 surface-aligned splat 可直接用于点云分割、Poisson 重建、网格抽取

---

## 技术方案

### 核心问题

3DGS 现有方法几乎完全依赖 rasterization-based 光度损失：
- 只有当前视角相机射线命中的 splat 才有梯度
- 被遮挡 / 贡献小的 splat 缺乏几何信号 → "floaters"
- 生成的 splat 集合**不直接等于**高质量点云，难以接 Poisson / 网格抽取

### 核心思想：Local PCA Regularization

对每个 Gaussian $g_i$ 的 k-NN 邻域 $\{p_j\}_{j\in N(i)}$：

1. **特征值正则化**：约束 PCA 特征值 $\lambda_0 \geq \lambda_1 \geq \lambda_2$ 使得 $\lambda_0/\lambda_1 \to 1$，$\lambda_0/\lambda_2 \gg 1$（切平面各向同性 + 法向方向尖锐）
2. **法向对齐**：让 Gaussian 的定向椭球的最小特征向量方向 $\mathbf{n}_i$ 对齐 PCA 最小特征向量 $\mathbf{v}_2$
3. **损失项**：

$$
\mathcal{L}_{\text{PCA}} = \sum_i \left( \underbrace{\left\| \frac{\lambda_1}{\lambda_0} - 1 \right\|^2}_{\text{各向同性}} + \underbrace{\max\left(0, 1 - \frac{\lambda_2}{\lambda_0}\right)}_{\text{尖锐法向}} + \underbrace{\left\| 1 - \mathbf{n}_i^\top \mathbf{v}_2 \right\|}_{\text{法向对齐}} \right)
$$

### 关键技术

| 技术 | 说明 |
|------|------|
| Differentiable PCA | 在 k-NN 邻域上做协方差 SVD，整体可微 |
| Eigenvalue ratio regularizer | 切平面各向同性 + 法向尖锐 |
| Normal alignment | splat 椭球最小轴 vs PCA 第三主成分 |
| View-independent gradient | 正则项不依赖当前视角 → 解决遮挡 splat 失管 |
| Surface-aligned splat | 输出即可作为 Poisson 重建输入 |

---

## 实验结论

- **数据集**: DTU, Tanks and Temples, NeRF Synthetic
- **基线**: 3DGS / PGSR / 2DGS / Splatfacto / 等 rasterization-only 3DGS 变体
- **关键结果**:
  - 表面近似更接近参考表面（Chamfer ↓, F-score ↑）
  - Floaters 大幅减少（数量与占空比双重下降）
  - 生成的 splat 可直接 Poisson 重建，得到可下游使用网格
  - 在 NVS 和 mesh extraction 上仍具竞争力
- **下游任务**: 点云分割、Poisson 重建均无需重新训练

---

## 局限性

- **k-NN 邻域敏感**：邻域大小 $k$ 是关键超参，过小欠正则化，过大失局部性
- **PCA 计算开销**：每步在所有 Gaussian 上做邻域 PCA → 计算量增大
- **依赖训练阶段几何**：在训练的早期阶段表面尚未形成时，PCA 信号可能不稳定
- **未与其他正则项组合的消融**：与 opacity pruning / scale regularization 的交互尚未充分研究

---

## 与本知识库其他笔记的关系

- [[M-plicits]] - 多尺度神经隐式表面（另一种"稳健表面"思路）
- [[SubDGuide]] - 网格→SubD 重建（下游处理模块）
- [[PhysLDM]] - 体积网格物理仿真
- [[Surface-Aligned Splats as Point Clouds]] (待创建) - 主题笔记

---

## 实现建议

- **实现难度**: 中（PCA 可微 + k-NN 工程 + 损失集成）
- **依赖项**:
  - PyTorch + 3DGS 实现（gsplat / diff-gaussian-rasterization）
  - 可微 PCA / SVD（PyTorch `torch.linalg.eigh` 即可）
  - libigl 或 Open3D（k-NN、Poisson 重建下游）
- **可复用模块**:
  - 邻域构建：torch-cluster 或自定义 KD-Tree
  - 特征值比正则项可直接在 loss 中实现
- **预期性能**: 训练时间增加 15-30%，但显著降低 floater 数量
- **适用场景**: 需要"高质量 splat-as-point-cloud"的下游任务（几何处理、CAD 拟合）

---

## 🥬 可行性结论

✅ **推荐关注** — 这是 3DGS 与传统几何处理之间的一座"桥梁"工作。
- 学术价值：把 3DGS 从纯渲染视角拉到几何视角，提供了一个"渲染损失 + 几何正则"的清晰范式
- 工程价值：直接输出 surface-aligned splat，可省去一套后处理流程
- 推荐下一步：在内部 3DGS 流水线中集成此 PCA 正则项，并对比 Poisson 重建质量
