---
type: paper
created: 2026-11-06
updated: 2026-11-06
tags: [paper, 渲染, 网格泼溅, 新视角合成, 三角网格, 拓扑优化, QEM, 纹理残差, mipmap, 可微光栅化, NeurIPS2026, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.06974
---

# T²-Splat: 自适应拓扑网格泼溅 + 纹理残差（把外观从几何里解耦出来）

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | T²-Splat: Adaptive Topology Mesh Splatting with Texture Residuals |
| **作者** | Zhihao Tang, Youjia Zhang, Mingbo Zhao, Wei Yang |
| **发表** | arXiv 2026-11-04（cs.GR），**NeurIPS 2026** |
| **链接** | [原文](https://arxiv.org/abs/2611.06974) · [HTML](https://arxiv.org/html/2611.06974v1) · [项目页](https://t2-splat.github.io/) |
| **DOI** | — |
| **代码** | 项目页提供（代码与数据） |

---

## 核心贡献

> **三角形泼溅把新视角合成接回了传统图形管线，但往往需要**过量细分**才能保住外观细节。** 本文把**拓扑自适应**与**外观精修**彻底**解耦**：Stage I 用 Safe RDT + Dynamic Topology Evolution 动态分配三角形预算；Stage II 在**固定网格**上用**逐面残差 Mip-texture** 注入高频细节。

1. **Safe RDT（Safe Restricted Delaunay Triangulation）**：从无结构三角形汤构造**流形网格**——按到输入汤的距离、法向一致性、三角形质量**过滤并排序**，再沿边界**贪心生长**出**朝向一致**的表面，保证**无重复面、每条边至多两个面、每个顶点单一连通面扇**；允许开放边界与多连通分量。
2. **Dynamic Topology Evolution（DTE）**：用 **QEM 边折叠**（移除平坦区冗余三角形、保留边界）+ **梯度驱动顶点分裂**（给几何复杂区补自由度）**动态再分配三角形预算**。
3. **逐面残差 Mip-texture**（零初始化）+ **尺度自适应过滤** + 三线性采样 → 把高频外观**注入而不扰动已优化的几何**，且天然抗锯齿。
4. **极端网格预算下的鲁棒性**：可支撑低至**原始面数 10%** 的预算。

---

## 技术方案

### 核心思想

**预备：MeshSplatting 的可微三角光栅化**

每个顶点存位置 $\mathbf{v}_i$、不透明度 logit $a_i$、球谐系数 $\mathbf{c}_i$。像素颜色由顶点属性的重心插值得到：

$$C_{\text{base}}(p,d)=w_i\mathbf{c}_i(d)+w_j\mathbf{c}_j(d)+w_k\mathbf{c}_k(d),\qquad w_i+w_j+w_k=1$$

**软化离散三角形指示函数**（让三角光栅化端到端可微）：

$$I(p)=\left(\operatorname{ReLU}\!\left(\frac{\phi(p)}{\phi(s)}\right)\right)^{\sigma}$$

- $\phi(p)$：2D 三角形在图像空间的**有符号距离场**（内负外正，边界为零）
- $\mathbf{s}$：投影三角形的**内心（incenter）** → 中心处分数为 1，边缘为 0
- $\sigma$：平滑度参数

**不透明度重参数化**：

$$\alpha_i=\alpha_{\text{floor}}+(1-\alpha_{\text{floor}})\cdot\operatorname{sigm}(a_i)$$

**深度序 alpha 混合**：

$$C_{\text{base}}(p,d)=\sum_{n=1}^{N}c_{T_n}(p,d)\,\alpha_{T_n}I(p)\prod_{m=1}^{n-1}(1-\alpha_{T_m}I(p))$$

**关键的收敛设计**：
> 训练时 $\sigma$ 从 **1.0**（平滑梯度、利于梯度流）**线性退火**到 **0.0001**，同时 $\alpha_{\text{floor}}\to 1$ → 表示**平滑收敛到实心不透明三角形**。
> 末端形式简化为 $C_{\text{base}}(p,d)=c_{T_n}(p,d)I(p)$，**每像素只需一次求值** → **over-drawing 归零**，显著加速，并**原生兼容标准游戏引擎**。

**为什么要 DTE**：上述收敛过程会**生成冗余三角形**，而**几何复杂区可能缺乏足够自由度** → 用渐进式网格操作（顶点分裂 + 边折叠）优化拓扑。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Safe RDT** | 在 RDT 交集测试保留的候选面上，按**到输入三角形汤的距离**、**无符号法向一致性**、**三角形质量**过滤并排序；然后沿边缘前沿**贪心生长**出一致朝向的表面。**只更新面连接与绕序**，**保留顶点位置、外观、不透明度及其优化器状态** |
| **QEM 边折叠** | 面平面方程 $\mathbf{p}_f=[a_f,b_f,c_f,d_f]^T$ → 四次型 $K_f=\mathbf{p}_f\mathbf{p}_f^T$；顶点累积 $Q_v=\sum_{f\in\mathcal{F}(v)}K_f$（**开放边界加虚拟平面**）；候选边 $e=(u,v)$ 合并后 $Q_{uv}=Q_u+Q_v$，最优新顶点位置最小化齐次四次型误差 |
| **梯度驱动顶点分裂** | 由梯度信号决定在哪里**增加自由度**（几何复杂区） |
| **优化器状态拼接（Optimizer State Stitching）** | 拓扑编辑时**保留并迁移优化器状态** → 避免优化进度被重置 |
| **逐面残差 Mip-texture** | 零初始化，组织成 **Mip-texture 金字塔**（Ewins et al. 1998）。**把高频外观注入而不扰动已优化几何**；**尺度自适应过滤** + **三线性采样** → 极端压缩下仍能高质量抗锯齿渲染 |
| **两阶段解耦** | Stage I 专注几何/拓扑；Stage II **在固定网格上**优化残差纹理与顶点 SH 系数 → **外观精修不再破坏几何** |

---

## 公式

```math
C_{\text{base}}(p,d)=w_i c_i(d)+w_j c_j(d)+w_k c_k(d),\qquad w_i+w_j+w_k=1
```

```math
I(p)=\left(\operatorname{ReLU}\!\left(\frac{\phi(p)}{\phi(s)}\right)\right)^{\sigma}
```

```math
\alpha_i=\alpha_{\text{floor}}+(1-\alpha_{\text{floor}})\cdot\operatorname{sigm}(a_i)
```

```math
C_{\text{base}}(p,d)=\sum_{n=1}^{N}c_{T_n}(p,d)\,\alpha_{T_n}I(p)\prod_{m=1}^{n-1}(1-\alpha_{T_m}I(p))
```

```math
K_f=\mathbf{p}_f\mathbf{p}_f^{T},\qquad Q_v=\sum_{f\in\mathcal{F}(v)}K_f
```

```math
Q_{uv}=Q_u+Q_v,\qquad
\bar{v}^{*}=\arg\min_{\bar{v}}\bar{v}_h^{T}Q_{uv}\bar{v}_h,\quad \bar{v}_h=[x,y,z,1]^T
```

---

## 实验结论

- **数据集**: Mip-NeRF 360、Tanks & Temples、DTU（15 场景测 Chamfer Distance）、Deep Blending
- **基线**: 3DGS、Triangle Splatting、MeshSplatting、GOF、MiLo、RaDe-GS 等

**主结果（Tab. 1，网格新视角合成）**：
- Mip-NeRF 360 上**全面超越 SOTA 的 MeshSplatting**（PSNR、LPIPS、SSIM），且**顶点数与面数更少**
- Tanks & Temples 上 **LPIPS 与 SSIM 最佳**（GOF 与 MiLo 的 PSNR 更高）
- 相比 MeshSplatting：**PSNR +0.71 dB**（Mip-NeRF 360，摘要口径）

**DTU（Tab. 2）**：15 个场景的 Chamfer Distance，**3 个场景最优**；**多数场景优于 MeshSplatting** → 证明 **DTE 的边折叠与顶点分裂确实提升了网格质量**

**渲染效率与存储（Tab. 4，Garden 场景，MacBook Air M3，同一 OpenGL 配置）**：

| 指标 | MeshSplatting | **T²-Splat** |
|------|---------------|-------------|
| FPS | 126 | **236**（**1.87×**） |
| 网格文件大小 | 152 MB | **62 MB**（**−59%**） |
| GOF / RaDe-GS | 超显存 | — |

> **这是本文最有工程说服力的一组数字**：在**标准 OpenGL 管线**里跑出 236 FPS，且网格文件小 59%。存储与 FPS 指的是补充材料中描述的**烘焙顶点着色 PLY 表示**。

**极端网格简化（Tab. 4）**：
- 完整模型：PSNR **25.68**、LPIPS **0.15**，仅 **2.7M 面**
- **50% 配置**：PSNR / LPIPS / SSIM **均优于 MeshSplatting**，只用 **1.4M 面**（对比 MeshSplatting 的 7.3M）
- **10% 配置**：**0.3M 面**，PSNR 23.93、LPIPS 0.30、SSIM 0.697
- 对比：GOF 需要 **92.1M** 面、MiLo 需要 **14.9M** 面才维持保真度

**消融（Tab. 10，用差值表示）**：

| 比较 | ΔPSNR | ΔLPIPS | ΔSSIM | Δ时间(min) |
|------|--------|---------|--------|-----------|
| (b)→(c)：加 DTE | +0.31 | −0.02 | +0.016 | +14 |
| (e)→(g)：加 DTE（$8^2$ 纹理） | +0.18 | −0.01 | +0.010 | +2 |
| (c)→(f)：加 $4^2$ 精修 | +0.31 | −0.03 | +0.019 | +15 |
| (f)→(g)：$4^2$ → $8^2$ | +0.06 | −0.03 | +0.004 | +11 |
| (a)→(g)：完整配置 | **+0.83** | **−0.07** | **+0.045** | +29 |

- **DTE 单独贡献 +0.31 dB**（代价 +14 min）；**$4^2$ 精修 +0.31 dB**；完整配置累计 **+0.83 dB**
- 分辨率越高收益递减（$8^2$ vs $4^2$ 仅 +0.06 dB）→ **$4^2$ 残差纹理是性价比拐点**

**Tanks & Temples 分场景（Tab. 11）**：Truck PSNR 22.91 / LPIPS 0.167 / SSIM 0.836；Train PSNR 19.32 / LPIPS 0.259 / SSIM 0.753

**定性结果**：相比基线的**模糊纹理或几何扭曲**，T²-Splat 用**逐面纹理有效消除纹理扭曲**，保留**显著更锐利的高频细节**（细小文字、精细表面图案），并维持更好的结构完整性。

---

## 局限性

- **训练时间代价明显**：完整配置比基线多 **+29 分钟**（消融差值口径）→ 实时性受限
- DTE 的拓扑编辑需仔细的**优化器状态迁移**才能不损失优化进度
- 极低预算（10%，0.3M 面）下质量明显下降（PSNR 23.93 / LPIPS 0.30）→ 存在实用下限
- 依赖 **OpenGL 顶点着色烘焙**流程，跨引擎迁移需重新实现
- 未报告显存占用数据

---

## 相关工作

- [[2026-11-06_P-MGS-Perceptual-Gaussian-Allocation]] — **同期同方向**（网格 + 高斯的分配问题），两篇对照读收益大
- [[2026-11-06_HIBS-Hierarchical-Incremental-Beta-Splatting]]
- MeshSplatting（可微三角光栅化 + 三角形汤）、Triangle Splatting、GOF、MiLo、RaDe-GS
- MobileNeRF（本文 $\sigma$ 退火设计借鉴其收敛形式）

---

## 实现建议

- **实现难度**: **中高**。需要实现软指示函数的可微三角光栅化、$\sigma$ 退火、Safe RDT、DTE（QEM 折叠 + 梯度分裂 + 优化器状态拼接）、Mip-texture 金字塔
- **预期性能**: Mip-NeRF 360 上 **PSNR +0.71 dB**（vs MeshSplatting）、**OpenGL 236 FPS（1.87×）**、**网格体积 −59%**、面数可压到 10%
- **适用场景**:
  - **需要接入标准游戏引擎 / 传统图形管线**的高保真新视角合成（这是本文的立项目标）
  - **VRAM / 下载体积敏感**的场景
  - 需要在**极端网格预算**下工作（本文给出的 50% 配置仍优于 MeshSplatting 的全量）
- **可借鉴的通用技巧**:
  1. **「拓扑自适应」与「外观精修」两阶段解耦** — 外观精修不再扰动已优化的几何。这是很通用的工程分层
  2. **残差 Mip-texture + 尺度自适应过滤** — 纹理作为残差而非替换，可叠加在任意基础表示上
  3. **$\sigma$ 退火 + $\alpha_{\text{floor}}\to 1$** — 让可微表示在训练末期**退化为标准实心三角形**，**零 over-drawing、原生兼容游戏引擎**。这个「训练期可微、推理期退化」的模式极具工程价值
  4. **QEM 折叠 + 梯度分裂的互补** — 用经典几何简化处理平坦区、用梯度信号处理复杂区
  5. **优化器状态拼接** — 拓扑/结构变更时保留优化器状态，避免重训练
  6. **$4^2$ 是残差纹理分辨率的性价比拐点** — 有具体数字可直接用
- **优先级建议**: 🟡 **P1** — 若目标是把神经渲染成果**接入现有游戏引擎**，本文的「训练期可微、推理期标准三角形」路线是最实用的参考
