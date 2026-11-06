---
tags: [几何, 网格简化, QEM, 边折叠, 顶点分裂, Delaunay三角剖分, Mip纹理, 拓扑优化, 新视角合成, 网格压缩]
date: 2026-11-06
source: arXiv
arxiv_id: 2611.06974
venue: cs.GR (NeurIPS 2026 accepted, 2026-11-04 submission)
status: processed
agent_id: wawaicai
authors: Zhihao Tang, Youjia Zhang, Mingbo Zhao, Wei Yang
url: https://arxiv.org/abs/2611.06974
project: https://t2-splat.github.io/
pdf: https://arxiv.org/pdf/2611.06974
---

# T²-Splat: Adaptive Topology Mesh Splatting with Texture Residuals

> 把「拓扑自适应」与「外观精修」解耦：Stage I 用 QEM 边折叠 + 梯度驱动顶点分裂动态演化网格拓扑，Stage II 在**冻结的**网格上用逐面 Mip-纹理补高频细节。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | T²-Splat: Adaptive Topology Mesh Splatting with Texture Residuals |
| **作者** | Zhihao Tang, Youjia Zhang, Mingbo Zhao, Wei Yang |
| **发表** | arXiv cs.GR / cs.CV，**NeurIPS 2026 接收** |
| **链接** | [原文](https://arxiv.org/abs/2611.06974) |
| **项目页** | https://t2-splat.github.io/ |
| **篇幅** | 27 页 |

---

## 核心贡献

> 三角形 splatting 为保持外观细节常需**过度细分**。本文把「拓扑自适应」从「外观精修」中解耦：Safe RDT 初始化连通性 → Dynamic Topology Evolution (DTE) 通过边折叠/顶点分裂自适应重分配三角形 → 逐面残差 Mip-纹理在**固定网格**上以尺度自适应滤波精修外观。面数预算可低至原始的 **10%**。

1. **Safe RDT（Safe Restricted Delaunay Triangulation）** —— 带约束面选择的 RDT 初始化，保证连通性、流形性、单一面扇。
2. **DTE（Dynamic Topology Evolution）** —— QEM 边折叠 + 梯度驱动顶点分裂的联合优化。
3. **优化器状态缝合（Optimizer State Stitching）** —— 边折叠/分裂时迁移 Adam 一阶/二阶矩，保住优化历史。
4. **逐面残差 Mip-纹理** —— 零初始化保证从 Stage I 无损过渡；三线性 Mip 采样抑制走样。
5. **效果**：Mip-NeRF 360 上 PSNR 比 MeshSplatting **+0.71 dB**，OpenGL 下 **236 FPS**（MeshSplatting 126 FPS），网格文件 **62 MB**（vs 152 MB，−59%），面数 2.7M（vs 7.3M）。

---

## 技术方案

### 核心思想

**两阶段解耦**是本文最关键的架构决策：

```
Stage I (几何与拓扑优化)          Stage II (外观精修)
─────────────────────────         ─────────────────────
Point Cloud → Triangle soup        冻结拓扑 + 顶点位置 + 不透明度
  → Densify & Prune                → 逐面残差 Mip-纹理 + 顶点 SH
  → Safe RDT (连通性初始化)          → 尺度自适应滤波
  → DTE: Edge Collapse ⇄ Vertex Split
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Safe RDT** | 从 RDT 候选面出发，按「到输入 triangle soup 的距离、无符号法向一致性、三角形质量」过滤排序；沿边前沿**贪心生长**一致取向的曲面，保证：① 无重复面 ② 每边至多 2 个相邻面 ③ 每个被用顶点有单一连通面扇。**仅改连通性与绕序**，保留顶点位置/外观/不透明度及优化器状态 |
| **QEM 边折叠** | 面平面 `p_f = [a_f,b_f,c_f,d_f]ᵀ` → 四次矩阵 `K_f = p_f p_fᵀ`；顶点累积 `Q_v = Σ_{f∈F(v)} K_f`（开放边界加虚拟平面）；合并后 `Q_uv = Q_u + Q_v`，最优新顶点解齐次二次型 `v̄* = argmin v̄ᵀ[Q_uv]v̄`；奇异时退化为离散候选 `{u, v, (u+v)/2}` |
| **折叠代价函数** | `Cost(e) = w_q·(QEM 误差/median(E_q) + ε) + w_c·‖c_u − c_v‖² + w_a·\|α_u − α_v\|` —— 抑制跨外观/不透明度不连续处的折叠 |
| **单纯链接条件（Simplicial Link Condition）** | `LkM(u) ∩ LkM(v) = LkM({u,v})`；并拒绝：经内部边连接两个边界顶点、合并后顶点扇非法、局部面退化/取向反转；同批次接受的折叠其受影响的一环邻域**互不相交** |
| **梯度驱动顶点分裂** | 透视补偿梯度分数 `g_i^c = ‖∇_{v_i} L‖·d_i`（`d_i` 为相机空间深度），跨 N_i 训练视图归一化累积 `ḡ_i^c = (1/N_i)Σ_k g_{i,k}^c`；高分顶点在**最长邻边中点**插入新顶点 `v_new = (v_i+v_j)/2`，一个三角形拆成两个并保向 |
| **优化器状态缝合** | 边折叠：`m_new = (A_u m_u + A_v m_v)/(A_u+A_v)`（按关联面积加权）；顶点分裂：保留父点 `k` 与新中点 `k'` 继承父状态，一阶矩做反向扰动 `Δm = 10⁻³√v_k ⊙ z, z~N(0,I)` |
| **逐面残差纹理** | 每面一个可学习 `T_f ∈ R^{R×R×3}`，**零初始化**保证 Stage I 无损过渡；重心坐标 → 局部 UV `(u,v) = (w_j, w_k)`；**镜像映射** `u+v>1` 时 `T_f(u,v) = T_f(1−v, 1−u)` |
| **尺度自适应三线性采样** | 由屏幕空间导数估计 Mip 层级 `λ = log2(max(√(∂u/∂x²+∂v/∂x²), √(∂u/∂y²+∂v/∂y²)) + ε)`，`D=⌊λ⌋, δ=λ−D`，在相邻 Mip 层间三线性插值 → 天然低通滤波，抑制闪烁 |
| **可微光栅化** | 三角形指示函数替换为软窗口 `I(p) = (ReLU(φ(p)/φ(s)))^σ`，`φ` 为屏幕空间有符号距离场，`s` 为投影三角形的内心；`σ` 从 1.0 线性退火到 0.0001；不透明度重参数化为 `α_i = α_floor + (1−α_floor)·sigm(a_i)` |

### 关键公式

**QEM 顶点最优位置**

$$
\bar{v}^* = \arg\min_{\bar{v}} \bar{v}^{\top}\begin{bmatrix}Q_{uv}\end{bmatrix}\bar{v},
\qquad \bar{v} = [x, y, z, 1]^{\top}
$$

**折叠代价**

$$
\mathrm{Cost}(e) = w_q\left(\frac{(\bar{v}^*)^\top [Q_{uv}] \bar{v}^*}{\mathrm{median}(E_q)} + \epsilon\right) + w_c\|c_u - c_v\|^2 + w_a|\alpha_u - \alpha_v|
$$

**顶点分裂梯度分数**

$$
g_i^c = \|\nabla_{v_i} L\| \cdot d_i, \qquad \bar{g}_i^c = \frac{1}{N_i}\sum_{k=1}^{N_i} g_{i,k}^c
$$

**Mip 层级估计**

$$
\lambda = \log_2\left(\max\left(\sqrt{\left(\frac{\partial u}{\partial x}\right)^2 + \left(\frac{\partial v}{\partial x}\right)^2}, \sqrt{\left(\frac{\partial u}{\partial y}\right)^2 + \left(\frac{\partial v}{\partial y}\right)^2}\right) + \epsilon\right)
$$

**残差纹理合成**

$$
C(p,d) = \underbrace{C_{\text{base}}(p,d)}_{\text{视角相关基色}} + \underbrace{C^{\lambda}_{\text{res}}(u,v)}_{\text{空间残差纹理}}
$$

---

## 实验结论

- **硬件**：单张 NVIDIA RTX 6000 Ada (48 GB)；35,000 次迭代（30,000 几何优化 + 5,000 纹理精修）
- **数据集**：Mip-NeRF 360、Tanks & Temples、DTU
- **基线**：2DGS、MiLo、GOF、RaDe-GS、Gaussian Wrapping、Triangle Splatting、MeshSplatting

### 网格化新视角合成（Table 1）

| Method | Mesh | Color | Connect | Mip360 PSNR↑ | LPIPS↓ | SSIM↑ | #Verts | T&T PSNR↑ | LPIPS↓ | SSIM↑ | #Verts |
|--------|------|-------|---------|-------------|--------|--------|---------|-----------|--------|--------|--------|
| 3DGS | – | – | – | 27.21 | 0.214 | 0.815 | – | 23.14 | 0.183 | 0.841 | – |
| 2DGS | ✗ | ✗ | ✓ | 15.36 | 0.474 | 0.498 | 2M | 14.23 | 0.485 | 0.569 | 16M |
| GOF | ✗ | ✗ | ✓ | 20.78 | 0.465 | 0.573 | 33M | 21.69 | 0.326 | 0.690 | 12M |
| RaDe-GS | ✗ | ✗ | ✓ | 23.56 | 0.361 | 0.668 | 31M | 20.51 | 0.344 | 0.659 | 10M |
| MiLo | ✓ | ✗ | ✓ | 24.09 | 0.323 | 0.688 | 7M | 21.46 | 0.348 | 0.706 | 4M |
| Gaussian Wrapping | ✓ | ✗ | ✓ | 25.10 | 0.289 | 0.752 | 12M | 20.98 | 0.367 | 0.700 | 6M |
| Triangle Splatting | ✓ | ✓ | ✗ | 21.05 | 0.462 | 0.558 | 3M | 17.27 | 0.402 | 0.600 | 6M |
| MeshSplatting | ✓ | ✓ | ✓ | 24.78 | 0.310 | 0.728 | 3M | 20.52 | 0.287 | 0.745 | 2M |
| **T²-Splat** | ✓ | ✓ | ✓ | **25.49** | **0.234** | **0.779** | **2M** | 21.12 | **0.213** | **0.795** | **1M** |

### DTU Chamfer 距离（Table 2，15 场景均值）

| Method | Mean CD↓ |
|--------|----------|
| 3DGS | 1.96 |
| 2DGS | 0.80 |
| GOF | 0.74 |
| RaDe-GS | 0.68 |
| MiLo | 0.68 |
| Triangle Splatting | 1.08 |
| MeshSplatting | 0.89 |
| Gaussian Wrapping | 0.49 |
| **T²-Splat** | **0.68** |

> 3 个场景（63, 83, 105）上误差最低；联合第二-best 均值。多数场景优于 MeshSplatting → 说明 **DTE 模块（边折叠 + 顶点分裂）确实提升了网格质量**。

### OpenGL 渲染效率（Table 3，Garden 场景，1920×1080，MacBook Air M3）

| Method | FPS↑ | Storage↓ | #Faces↓ |
|--------|------|-----------|---------|
| GOF | OOM | 1.8 GB | 92.1M |
| RaDe-GS | OOM | 1.1 GB | 60.8M |
| MiLo | 82 | 314 MB | 14.9M |
| MeshSplatting | 126 | 152 MB | 7.3M |
| Gaussian Wrapping | 40 | 638 MB | 31.2M |
| **T²-Splat** | **236** | **62 MB** | **2.7M** |

> 帧率为 MeshSplatting 的 **1.87×**，存储减少 **59%**，面数减少 **63%**。

### 极端网格简化（Table 4，Garden 场景）

| Method | PSNR↑ | LPIPS↓ | SSIM↑ | #Faces↓ |
|--------|-------|--------|--------|---------|
| RaDe-GS | 22.67 | 0.21 | 0.743 | 60.8M |
| GOF | 22.99 | 0.26 | 0.706 | 92.1M |
| 2DGS | 21.90 | 0.32 | 0.608 | 10.6M |
| MiLo | 23.29 | 0.22 | 0.738 | 14.9M |
| MeshSplatting | 24.70 | 0.22 | 0.762 | 7.3M |
| Gaussian Wrapping | 23.45 | 0.27 | 0.717 | 31.2M |
| **Ours (100%)** | **25.68** | **0.15** | **0.818** | **2.7M** |
| Ours (50%) | 25.38 | 0.17 | 0.801 | 1.4M |
| Ours (10%) | 23.93 | 0.30 | 0.697 | 0.3M |

> 50% 配置（1.4M 面）在 PSNR/LPIPS/SSIM 上**全面超过 MeshSplatting 的 7.3M 面**；10% 配置（0.3M 面）仍达 23.93 dB。

### 消融（Table 5，Mip-NeRF 360 九场景均值）

| Safe RDT | DTE | MipTex | PSNR↑ | LPIPS↓ | SSIM↑ | #Faces↓ | Time(min)↓ |
|:--------:|:---:|:------:|-------|--------|--------|---------|------------|
| – | – | – | 24.66 | 0.30 | 0.734 | 5.3M | 54 |
| ✓ | – | – | 24.81 | 0.31 | 0.740 | 3.0M | 43 |
| ✓ | ✓ | – | 25.12 | 0.29 | 0.756 | 2.5M | 57 |
| ✓ | – | 4×4 | 25.20 | 0.27 | 0.762 | 3.0M | 65 |
| ✓ | – | 8×8 | 25.31 | 0.24 | 0.769 | 3.0M | 81 |
| ✓ | ✓ | 4×4 | 25.43 | 0.26 | 0.775 | 2.5M | 72 |
| **✓** | **✓** | **8×8** | **25.49** | **0.23** | **0.779** | **2.5M** | 83 |

> Safe RDT 主要贡献**连通性合法性 + 面数减半**（5.3M→3.0M）；DTE 贡献**质量**（PSNR +0.31）；MipTex 贡献**高频外观**（LPIPS 0.29→0.23）。

---

## 复杂度分析

- **Safe RDT**：RDT 候选面生成 O(F log F)（排序）+ 贪心生长 O(F)；全部在 GPU 上可并行
- **QEM 边折叠**：四次数矩阵求最小解 = 解 4×4 线性方程 O(1)；但**折叠代价排序** O(E log E)；每次折叠需更新邻接 O(deg)
- **顶点分裂**：需累积 N_i 训练视图的梯度 → **需在所有训练视图上反向传播**，是 DTE 的主要开销（训练时额外 57−43 = 14 min）
- **单纯链接条件检查**：O(deg(u)·deg(v)) 局部
- **逐面 Mip-纹理**：纹理内存 O(F · R² · 3)；Mip 金字塔平均池化 O(F·R²)；三线性采样 O(1)/像素
- **前向渲染**：软窗口 + 深度排序 alpha 混合，与 MeshSplatting 同量级
- **总训练时间**：83 min（RTX 6000 Ada）

## 数值稳定性

- **软光栅化退火**：`σ` 从 1.0 → 0.0001 保证早期梯度平滑可流，末期收敛为不透明实心三角形（`α_floor→1, σ→0`）；末期退化为单次采样 `C_base = c_{T_n}(p,d)·I(p)`，over-drawing 归零
- **优化器状态缝合**：避免拓扑变更后 Adam 动量失效导致的收敛震荡 —— 这是本文的**关键技术细节**，很多类似工作在此处不稳定
- **单纯链接条件**：保证折叠不产生非流形；同批次折叠一环邻域不相交 → 并行安全
- **零初始化残差纹理**：保证 Stage II 起点不劣于 Stage I（无损过渡）
- **镜像映射**：稳定边界插值，防止 UV 域边界采样伪影与梯度不一致
- **Mip 采样**：抑制远距离视角闪烁的机制性保证

---

## 局限性

- 论文未显式讨论「拓扑演化导致的长期训练不收敛」风险，但承认训练时间从 54 min 增至 83 min（DTE + MipTex 的开销）
- 逐面 Mip-纹理的存储随面数线性增长；10% 预算下的绝对存储未单独报告
- 主要面向**单目多视角新视角合成**，非通用网格处理工具

---

## 相关工作

- [[MeshSplatting]] — 直接基线
- [[TriangleSplatting]] · [[2DGS]] · [[MiLo]] · [[GaussianWrapping]]
- [[QEM]] — 二次误差度量边折叠（本文 DTE 的核心）
- [[RestrictedDelaunayTriangulation]] — Safe RDT 的基础
- [[VertexSplit]] — 细分/自适应细化
- [[MipTexture]] — 多分辨率纹理滤波
- [[2026-11-06-DC-SQEM-Medial-Mesh-Dual-Contouring]] — 同日论文（网格提取 + 拓扑清理）
- [[2026-11-06-Representation-Aware-Closed-Surface-Parameterization]] — 同日论文

---

## 实现建议

- **实现难度**: **中-高**（工程量大：Safe RDT + DTE + 优化器状态缝合 + Mip 纹理管线 + 可微光栅化）
- **预期性能**: 单卡 RTX 6000 Ada 83 min/场景；输出 2.7M 面网格 → OpenGL 236 FPS
- **适用场景**:
  - **游戏 / 实时渲染资产压缩** —— 直接输出标准 OpenGL 兼容的带色 PLY，2.7M 面 62 MB，是 MeshSplatting 的 1/3
  - **需要「外观细节 + 网格可编辑」并存的资产管线** —— 残差纹理解耦了外观与几何
  - **3DGS → 网格的传统管线替代** —— 免去后处理网格提取与神经纹理场
- **工程注意**:
  - **优化器状态缝合是最容易出错的部分**，照抄论文公式（边折叠用关联面积加权；分裂用一阶矩反向扰动 `Δm = 10⁻³√v ⊙ z`）
  - Safe RDT 的**取向一致性**与**单面扇约束**是连通性别被后续折叠破坏的前提
  - 若只需静态资产，Stage II 可只做 4×4 纹理（时间 +22 min，LPIPS 0.26 vs 0.23）
  - DTE 的梯度分数需跨全部训练视图累积 → 建议每 N 步做一次拓扑更新而非每步
- **依赖项**: PyTorch + 自写可微光栅化（或 `nvdiffrast`）；`libigl` 可用于 Safe RDT 的约束 Delaunay 部分；无现成 DTE 开源实现（需自行实现或申请作者代码）

---

*Generated by 黄喉 (wawaicai) at 2026-11-06*
