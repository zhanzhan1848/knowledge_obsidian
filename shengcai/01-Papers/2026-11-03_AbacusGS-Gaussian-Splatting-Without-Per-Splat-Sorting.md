---
type: paper
created: 2026-11-03
updated: 2026-11-03
tags: [paper, 渲染, 光栅化, Gaussian-Splatting, WebGL, 深度排序, 性能优化, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.01534
---

# AbacusGS: Gaussian Splatting without Per-Splat Sorting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AbacusGS: Gaussian Splatting without Per-Splat Sorting |
| **作者** | Jiacheng Ding, Yanliang Qi, Cong Guo, Peihua Mai |
| **发表** | arXiv 2026-11-01（cs.CV / cs.GR），10 pages, 5 figures, 6 tables |
| **链接** | [原文](https://arxiv.org/abs/2611.01534) |
| **DOI** | [10.48550/arXiv.2611.01534](https://doi.org/10.48550/arXiv.2611.01534) |
| **代码** | 论文称 "The code will be released"（未给出链接） |

---

## 核心贡献

> 把 3DGS **逐 splat 深度排序**这一每帧开销，换成**「八叉树分箱 + 每箱固定轴向的可逆存储序」**的两级排序：每帧只排序**可见箱**（约为 splat 数的 1/31），箱内顺序在写入时确定、靠一个点积决定正读还是倒读。

1. **两级混合序（two-level blending order）**：先按箱质心深度排序可见箱，再在箱内沿写入时选定轴 `a_b` 的升序（或倒序）混合；箱内顺序在**写一次**后固定，运行时零成本。
2. **可逆存储序（reversible stored order）**：箱轴 `a_b` 取「训练相机→箱质心」方向的主特征向量（`P_c v_b c v_b^T`），使得相机沿 `+a_b` 看时存储序即前→后，沿 `−a_b` 看时倒过来即前→后。
3. **序感知微调（order-aware fine-tuning）**：在可微 tile 光栅化器中把深度键替换为 `κ_i = 2¹² r(b_i) + ℓ_i`（箱序排名 + 箱内位置），前向与反向**使用同一顺序**训练，误差被微调吸收。
4. **紧凑格式**：每 splat **17 字节**，含相对于八叉树单元的量化位置、形状/颜色码本索引；并提供共享该顺序的 **CUDA tile 渲染器**。

---

## 技术方案

### 核心思想

3DGS 的排序成本随 N 线性增长，且**每帧都要重做**——但对于一个静态场景，绝大多数 splat 的相对顺序在相机缓慢移动时并不改变。AbacusGS 的洞察是：**不需要逐 splat 精确序，只需要一个足够接近、且可被微调吸收误差的近似序**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **自适应八叉树分箱** | 按 splat 中心的 **48-bit Morton code** 排序，在其上建自适应八叉树；叶节点为「最多含 K=128 个 splat 的最大八叉树节点」，深度 16 仍超限则切成 K 个一块。箱内 splat 在存储上占据**连续区间**（类似 CSR 行） |
| **箱的元数据** | 起始偏移、所属八叉树单元、剔除半径（culling radius）、轴 `a_b` |
| **箱序：质心深度排序** | 按 `z̄_b = f·(μ̄_b − o)` 排序。论文指出**不用 BSP 精确可见序**：splat 会跨越单元边界，当分裂面近乎平行于视线时 BSP 序可能先画远 splat；质心深度序更贴近模型训练时用的逐 splat 深度序 |
| **箱内可逆存储序** | 写入时按 `a_b · μ_i` 升序存储。运行时 `s_b = sign((μ̄_b − o)·a_b)`：>0 正读，<0 倒读。**每箱仅需 1 次点积** |
| **序感知微调** | 把 tile 光栅化器的深度键换成 `κ_i = 2¹² r(b_i) + ℓ_i`；箱划分与存储序在微调期间**冻结**（它们是存储格式的一部分），禁用 densification；浮点模型训 3,000 步，紧凑模型训 10,000 步 |
| **紧凑格式** | 位置相对八叉树单元，每轴 10 bit；opacity、3 个 DC 颜色系数、mean log-scale 各 8 bit；16-bit 索引选形状码本（scale 各向异性 + rotation），另 16-bit 索引选 SH band 1~3 颜色码本；两个码本各 65,536 项，由**敏感度加权 k-means**得到 |
| **多绘制调用** | `glMultiDrawElementsIndirect`，每可见箱一条 20 字节的 indirect command，**不上传逐 splat 索引**，顶点着色器用 `gl_DrawID` 反查 `s[b]` 决定正/倒读 |
| **前向微调 vs 存储格式** | 浮点模型（用于对比质量）与紧凑模型（17B/splat）都存在；紧凑格式的码本量化与排序共享同一套顺序 |

### 排序误差分析

两级序在两个条件同时成立时**等于 3DGS 的中心深度序**：(a) 可见箱的深度区间不重叠；(b) 每个箱的存储轴与视线平行。实际中邻近箱在共享面附近深度重叠、箱轴只对部分相机平行，故误差**局部化**在相邻箱对与单箱内——这正是序感知微调能高效修正的原因。

---

## 公式

```math
// 3DGS 的 alpha 混合（顺序 \pi 下的像素颜色）
C(p)=\sum_{k=1}^{n} c_{\pi(k)}\,\alpha_{\pi(k)}(p)\,
\prod_{j<k}\left(1-\alpha_{\pi(j)}(p)\right)

// 深度排序键
z_i = f\cdot(\mu_i-o)

// 箱质心深度（箱序）
\bar{z}_b = f\cdot(\bar{\mu}_b-o)

// 两级混合序
\pi=\left[\rho_{b_1},\rho_{b_2},\dots,\rho_{b_V}\right],
\qquad \bar{z}_{b_1}\le\bar{z}_{b_2}\le\cdots\le\bar{z}_{b_V}

// 可逆存储序的方向位（每箱 1 次点积）
s_b=\operatorname{sign}\left((\bar{\mu}_b-o)\cdot a_b\right)

// 箱轴：训练相机→箱质心方向的主特征向量
a_b=\text{principal eigenvector}\!\left(P_c\,v_b c v_b^{\top}\right)

// 序感知微调的合成深度键（箱序排名 + 箱内位置）
\kappa_i = 2^{12}\,r(b_i) + \ell_i
```

---

## 代码片段

```glsl
// 顶点着色器：按 gl_DrawID 反查箱方向，正读或倒读
// (概念伪码，取自论文 Fig.2)
uint b = uint(gl_DrawID);
uint n = boxCount[b];
uint s = boxSign[b];          // +1 或 -1
uint k = uint(gl_VertexID);
uint i = (s > 0) ? k : (n - 1 - k);
uint j = boxStart[b] + i;     // 连续区间索引
// project splat j -> EWA quad
// 硬件混合，保持 3DGS 的 over 算子
```

```cpp
// 多绘制提交（每可见箱一条 indirect command）
for (auto& box : visible_boxes) {
    glMultiDrawElementsIndirect(GL_TRIANGLES, /*mode*/ 0,
                                 GL_UNSIGNED_INT, /*count*/ box.n,
                                 /*instancecount*/ 1,
                                 /*first*/ box.start);
    // 方向由顶点着色器用 gl_DrawID 查表决定，无需上传逐 splat 索引
}
```

---

## 实验结论

- **数据集**: 13 个标准 3DGS 场景（论文报告的对比集）。
- **基线**: 逐 splat 排序的 3DGS（同等微调）；另在图 3 中与 **StochasticSplats（16 spp）**、未微调的两级序做定性对比。
- **结果**:
  - 相比**同等微调**的 3DGS，平均仅损失 **0.13 dB PSNR**。
  - 在 **CPU 排序的 OpenGL 观察器**中，AbacusGS 渲染帧速度为逐 splat 排序的 **4.5×**。
  - 未微调时 Truck 路面出现可见斑块（24.69 dB）；微调后 25.50 dB，接近 3DGS 的 25.77 dB。
  - StochasticSplats 在 16 spp 下噪声明显（22.52 dB），AbacusGS 25.50 dB。
- **性能**: 每帧排序 V 个箱（V ≈ N/31，平均每箱 31 个 splat）+ V 次点积，取代 3DGS 的 N 键排序与 N 索引上传。

---

## 局限性

1. **质量有小幅损失**：平均 -0.13 dB PSNR，且未微调时可见排序斑块，依赖序感知微调这一额外训练阶段（浮点 3,000 步 / 紧凑 10,000 步）。
2. **箱序不是精确可见序**：采用质心深度序而非 BSP 精确序，邻近箱在共享面附近仍可能错序。
3. **箱轴的相机假设**：`a_b` 来自训练相机的统计方向；对 **360° 环绕**采集方向均值抵消，主轴仍可定义，但对**偏离训练视角**的新相机，排序误差增大（论文 4.4 节专门度量了这一项）。
4. 微调期间禁用 densification，无法同时扩容量。
5. 代码当时尚未公开。

---

## 相关工作

- [[2026-10-26_RxGS-Relightable-Gaussian-Stylization]] — 3DGS 可重光照
- Voxlines — 最接近的先验设计（体素内沿坐标轴存储顺序并反向读取）
- Depth-presorted triangle lists / presorted index buffers — 预排序三角列表与索引缓冲
- StopThePop / OneSweep / FlashGS / HiGS / WebSplatter / Texture3dgs — GPU 排序加速谱系
- Duplex-GS / StreamingGS / Hierarchical 3DGS / Octree-GS / V3DG — 单元/簇内分组排序
- StochasticSplats / Mobile-GS / Moment-based transmittance / Active-set method — 无序合成族

---

## 实现建议

- **实现难度**: **中**。核心是「一次性分箱 + 存储序 + 运行时方向点积」，不涉及新的物理模型，但需要配套的序感知微调与紧凑格式编码。
- **预期性能**: CPU 排序的 WebGL/移动端观察器上 **4.5× 帧率提升**；质量代价约 0.13 dB。适用于**静态场景、相机移动为主**的观察器（典型 Web 3DGS viewer、AR 预览）。
- **适用场景**:
  - Web / 移动端 3DGS 查看器（排序是主要瓶颈）
  - 场景静态、相机交互为主的应用
  - 需紧凑存储格式（17 B/splat）的资产分发
- **落地建议（给墨鱼丸）**:
  1. **先做无格式改动的原型**：仅实现「八叉树分箱 + 质心深度排序可见箱 + 箱内存储序」，在 OpenGL 上用 `glMultiDrawElementsIndirect` 验证帧率收益；这一步不需要改 3DGS 混合算子。
  2. **排序误差量化工具先行**：写一个离线脚本，比较两级序与逐 splat 序在训练视角**和偏离训练视角**上的差异分布，作为微调收益的先验判断。
  3. **序感知微调是质量保底**：微调时务必让**前向与反向使用同一顺序**（论文明确要求），否则梯度与渲染不一致，微调会失效。
  4. **可迁移的通用结论**：「用 1 次点积决定存储序的正/倒读」是把「任意顺序遍历 + 需要深度序合成」问题降为 O(组数) 的通用技巧，可迁移到体渲染、稀疏体素遍历等场景（与 [[2026-10-28_Wave-Tracing-Path-Integral-Wave-Optics]] 的遍历顺序问题同源）。
