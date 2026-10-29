---
type: report
created: 2026-10-29
updated: 2026-10-29
tags: [报告, 每日搜索, 渲染, 2026-10]
status: processed
agent: shengcai
---

# 🥬 每日渲染领域论文搜索报告 — 2026-10-29

**执行时间**：2026-10-29 14:02–14:12 UTC
**搜索窗口**：2026-10-26 ~ 2026-10-29（arXiv cs.GR recent listing 全量解析 + 8 组关键词 API 检索 + 标题检索）
**数据源**：arXiv cs.GR recent listing（26 条全覆盖）/ arXiv API（cs.GR + cs.CV + cs.AR + cs.RO + eess.SP 多组查询）/ ACM DL 与 SIGGRAPH（见第四节）

---

## 一、检索方法与覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR recent listing | ✅ | **完整解析 26 条**（10/22–10/28 五个工作日批次）；Wed 28 Oct 批次 10 条、Tue 27 Oct 7 条、Mon 26 Oct 2 条 |
| arXiv API 关键词检索 | ✅ | ray tracing / path tracing / global illumination / ray marching / PBR / rasterization / BVH / physically based rendering / light transport / shadow mapping / BRDF / shading / splatting / view synthesis / relighting / volume rendering（16 组） |
| arXiv 标题检索 | ✅ | rendering / render / illumination / shading / relighting |
| ACM Digital Library | ⚠️ | 见第四节（子代理检索中） |
| SIGGRAPH / SIGGRAPH Asia | ⚠️ | 见第四节（子代理检索中） |

**去重**：与已有笔记比对，`GaussianSpline`（10-26 首发）、`CVTSplat`、`Explicit Frictional Contact`、`RacerGS`、`Single Camera Simulation Try-on` 均已收录，**不重复建档**。

---

## 二、收录论文（6 篇，按渲染相关性排序）

| # | 论文 | 来源 | 日期 | 匹配关键词 | 推荐度 |
|---|------|------|------|-----------|--------|
| 1 | [GraftRay: Physically Based Mesh Insertion into Gaussian Splatting Scenes via Path Tracing](https://arxiv.org/abs/2610.37036) | arXiv (cs.CV/cs.GR) · TUM | 10-27 | **path tracing, ray tracing, global illumination, PBR, area light, MIS, OptiX** | ⭐⭐⭐⭐⭐ |
| 2 | [Honeycomb-Surfels: Compact Hexagonal Primitives](https://arxiv.org/abs/2610.37668) | arXiv (cs.CV/cs.GR/cs.AI/cs.LG) · JHU | 10-27 | **rasterization, surfel, Gaussian Splatting, 效率** | ⭐⭐⭐⭐⭐ |
| 3 | [CTBakeGS: Training-free Baking of CT Volume Renderings into 3DGS](https://arxiv.org/abs/2610.37406) | arXiv (cs.CV/cs.GR) · 群马大学/苏黎世 | 10-27 | **volume rendering, rasterization, Gaussian Splatting, 光栅化下限** | ⭐⭐⭐⭐ |
| 4 | [From Walks to Skeletons: Reusable Transport Architecture for Interactive Monte Carlo PDE Solvers](https://arxiv.org/abs/2610.36931) | arXiv (cs.GR/math.NA) · 哈工大（深圳） | 10-27 | **蒙特卡洛, 重要性采样, 光传输, WoS** | ⭐⭐⭐⭐ |
| 5 | [DomeGS: Perceptually Consistent Background Completion for Unbounded 3DGS in VR](https://arxiv.org/abs/2610.37172) | arXiv (cs.GR) · Jagiellonian | 10-27 | **Gaussian Splatting, skybox/skydome, VR 渲染** | ⭐⭐⭐⭐ |
| 6 | [Texture Consolidation of Generated Multi-View Renderings](https://arxiv.org/abs/2610.36098) | arXiv (cs.GR) · **CGF journal** · JHU + Adobe | 10-26 | **纹理映射, 光学流, 梯度域融合, 生成渲染** | ⭐⭐⭐⭐ |
| 附 | [Total Deformation-based MPM for Perfectly Elastic Solids](https://arxiv.org/abs/2610.36945) | arXiv (cs.GR) · RWTH Aachen | 10-27 | 物理仿真（邻接域） | ⭐⭐⭐（仿真侧） |

**笔记已写入** `~/knowledge-vault/shengcai/01-Papers/`（7 个新文件）。

---

## 三、今日技术趋势观察

### 1. 🥇 头号发现：GraftRay —— 「高斯场景可以真的做路径追踪」

这是本周最值得关注的一篇。它把 3DGS 从"只能光栅化的显示格式"变成了"**可以做光传输计算的介质**"：

```math
// 随机透明性 → 首接受概率恰等于 alpha 合成权重（这是全文最优雅的技巧）
w_i=\Pr(K=i)=\alpha_i\prod_{j\in\mathcal{F}_i}(1-\alpha_j)
```

硬件光追遍历顺序任意，而 alpha 合成需深度序 —— 作者用"按概率 α 接受交点"化解，**无需每射线排序缓冲区**，单次硬件遍历即得单样本估计。这个结论**可直接迁移**到任何"硬件遍历 + alpha 合成"的渲染器。

第二个亮点是**光的线性性**被用作算法设计工具：

```math
\mathbf{I}(\mathbf{L})=\sum_{j=1}^{J}L_j\mathbf{B}_j
```

由于光传输对发光体辐射是线性的，可以预计算**单位辐射基图**，把"从 LDR 照片反解室内灯光"变成**带截断观测的非负最小二乘**（饱和像素用单边铰链 `[τ − g(BᵀL)]₊²` 只给下界）——这样才能区分"真发光体"与"高反射率表面"。

**消融数据很硬**：点光源/环境贴图替代矩形面光源 → ΔPSNR 掉 **8–9 dB**、shadow IoU 掉 1/3。这说明**近场面光源的空间位置是物理正确性的关键**，不是锦上添花。

### 2. 「图元效率」成为独立赛道：Honeycomb-Surfels + CTBakeGS 同日出现

两篇论文从**完全不同的角度**攻击同一个问题：3DGS 的成本。

| | Honeycomb-Surfels | CTBakeGS |
|---|---|---|
| 攻击点 | 图元**表达效率** | 图元**获取成本** |
| 手段 | 六边形支撑 + 一阶颜色场（20 参数 vs 2DGS 的 58） | 训练无关烘焙（无需渲染视图/训练/GPU） |
| 收益 | +4.5–7.4 dB、VRAM 少至多 7×、FPS 快至多 2.31× | 转换 4–60 s、68 FPS @ 800×800、PSNR 30–33 dB |
| 类比 | 换更好的"笔" | 不写也能出"画" |

**Honeycomb-Surfels 的核心洞察**：自然场景**局部平面 + 平滑外观** → 单个图元就应该能表达一大块区域，而不是靠大量重叠图元逼近。六边形在同等周长下覆盖面积最大（蜂窝定理），叠加一阶颜色场后**参数减半而质量反升**。

CTBakeGS 的**不透明度映射公式**是可独立复用的资产：

```math
\tau_{\mathrm{splat}}=\tau_{\mathrm{cell}}\frac{h^{2}}{2\pi s^{2}},\quad s=0.55h
\;\Longrightarrow\;
\alpha_{\mathrm{splat}}=1-\exp(-0.526\,\tau_{\mathrm{cell}})
```

以及**微弱 splat 随机保留**（解决薄半透明层在 1/255 光栅化下限处整体消失的经典问题，用期望光学厚度守恒 + 哈希保证确定性）——这两个技巧对任何"体渲染 → splat"场景通用。

### 3. 「物理不变量进数据结构」范式延续

| 论文 | 不变量 | 编码方式 |
|---|---|---|
| GraftRay | 光传输对光源辐射线性 | 单位辐射基图 + NNLS |
| Honeycomb-Surfels | 局部平面 + 平滑外观 | 六边形支撑 + 一阶颜色场 |
| WoS Skeletons | 布朗运动 Markov 性 | 可复用传输 DAG + Poisson 核重加权 |

三篇论文**都不靠加算力**，而是**找到问题中真实存在的结构并把它编码进数据结构**。这是当前渲染/图形研究最一致的走向。

### 4. WoS Skeletons：蒙特卡洛求解器的"持久化"转向

与 [[2026-10-26_Ray-by-Ray-GPU-Ray-Tracing-Resource-Management]] 遥相呼应——**都是"把一次性计算变成可复用资产"**。

WoS Skeletons 的两个可直接迁移到渲染的技术点：
- **有界权重挂接判据** `ℓ = K_B(p,z)/r_s(z)` —— 渲染中的辐射缓存命中判定面临完全相同的"偏差 vs 方差"权衡；
- **Doob h-变换条件重采样** `f(s|q) ∝ K_B(s,q)` —— 这是"条件于某出口"的通用配方，渲染中对应**路径拼接（path splicing）**，可用于加速辐射传输。

### 5. 「生成内容与几何融合」成为独立问题

DomeGS（把天穹做进 3DGS 表示内）+ Texture Consolidation（把生成渲染合并成一致纹理）指向同一件事：**生成式模型的输出与几何表示的整合，已经需要专门的算法支撑，而不是靠后处理拼接**。

Texture Consolidation 的洞察很锋利：**对生成式渲染，"视图越多越好"变成了净负**——因为每个新视图都独立引入不一致。这与传统 RGB-D 融合的直觉完全相反。

---

## 四、ACM DL / SIGGRAPH 检索

见下方附录（子代理检索结果）。

---

## 五、行动建议

### 传递给 @墨鱼丸 的技术方案

**优先级 P0 —— GraftRay 的随机透明性**
- 结论：`Pr(首个被接受原语) = alpha 合成权重`
- 价值：**免去每射线交点排序缓冲区**，对任何硬件光追 + alpha 合成管线都是直接加速
- 难度：中（OptiX any-hit program，~20 行）

**优先级 P1 —— GraftRay 的单位辐射基图 + 截断 NNLS**
- 线性域下直接 NNLS（只有相机响应引入非线性）
- 配合 LM 求解，J < 20 个未知量
- 难度：中

**优先级 P1 —— 差分合成（differential compositing）**
- `I_out = M·k·I_with + (1−M)·I_3dgs ⊙ clip(I_with/I_without, 0, 3)`
- **性价比最高**：即使光追部分不完美，比值仍能修正阴影与间接光，同时保留原 3DGS 的视角相关细节
- 难度：低

**优先级 P2 —— Honeycomb-Surfels 的图元设计**
- 在现有 3DGS/2DGS 体系中试「**图元内表达梯度**」（一阶颜色场）
- 假设：参数减半而质量上升 → 说明"靠更多图元逼近"不如"让图元能表达"
- 难度：中（移植光栅器权重函数）

**优先级 P2 —— CTBakeGS 的不透明度映射**
- 公式可直接复用；配合随机保留微弱 splat 解决薄层消失问题
- 难度：低

### 传递给 @鲜毛肚 / @鸭血 的旁支

- WoS Skeletons 的 **Doob h-变换条件重采样**（`f(s|q) ∝ K_B(s,q)`）适用于任何"条件于某出口重采样"的场景
- Total Deformation MPM 属仿真侧，已单独建档

### 传递给 @吊龙 / @五花肉 的集成建议

- DomeGS 的**天球半径是重要超参**（太近穿帮、太远等同 skybox 无视差），建议做半径扫描
- Texture Consolidation 的**子三角形级求值**（求积式有限元积分）是任何"纹理空间算法"的通用基础设施

---

## 六、待读队列（低优先级 / 跨域）

- `Total Deformation MPM`（RWTH）— 仿真侧，已建档待评估
- `StereoSplat`（10-26 提交，10-28 挂 cs.GR）— 双目度量尺度 NVS
- `Blendshape Generation for Disconnected Parts`（WACV 2027）— 动漫角色多部件 blendshape
- `LingGS` — Gaussian SLAM，几何预测与相机跟踪解耦

---

*报告生成：shengcai（渲染专家） · 数据截止 2026-10-29 14:12 UTC*
