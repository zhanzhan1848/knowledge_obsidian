---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, 高斯泼溅, 激光雷达, SLAM, 场景重建, 混合模型, WACV-2027, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.10699
arxiv_id: 2611.10699
---

# PLS-GS: Probabilistic Lidar Scaffolds for Compact, Surface-Aligned Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PLS-GS: Probabilistic Lidar Scaffolds for Compact, Surface-Aligned Gaussian Splatting |
| **作者** | Krishnan Harikumar, Alejandro Fontan, Thierry Peynot, Emili Hernández, Niko Sünderhauf（德国慕尼黑工业大学 TUM / Oxford 等） |
| **发表** | **Accepted to WACV 2027**（含正文与补充材料） |
| **链接** | [原文](https://arxiv.org/abs/2611.10699) / [HTML 全文](https://arxiv.org/html/2611.10699v1) |
| **代码** | https://github.com/k-harikumar/PLS-GS |
| **DOI** | —（WACV 2027，DOI 待 CVF 上载） |

---

## 核心贡献

> **用「概率化 LiDAR 脚手架」替代 Scaffold-GS 的离散网格锚点**：拟合一个**在空间与颜色维度上联合建模的层次高斯混合模型 (HGMM)**，每个锚点在其**局部曲面坐标系**中解码神经高斯，并用 **Mahalanobis 支撑损失**约束其不偏离实测表面——在**显著更少的基元数**下把基元放得**更贴近 LiDAR 实测**。

1. **HGMM 概率脚手架**：在 6 维（$\bm{x}\in\mathbb{R}^3$ + $\bm{c}\in\mathbb{R}^3$）上逐层用 EM 划分 $K=8$ 个子节点，递归细化；叶节点即脚手架。**自适应分辨率**（按点数阈值保留组件）取代固定网格。
2. **几何与颜色联合建模是必需的**：仅拟合空间坐标无法区分**空间相邻但外观不同的表面**（如路面上的道路标线 vs 沥青）；颜色维度能把组件定位到连贯的物理表面上，同时提供颜色初始化。
3. **表面对齐渲染**：与 Scaffold-GS 不同，神经高斯的偏移**挂在锚点的特征向量坐标系（表面框架）上**而非世界轴 → 两大轴自动贴合局部切平面。
4. **Mahalanobis 支撑损失**：惩罚沿**低方差方向（法向）**的位移、放开**高方差方向（切向）** → 把神经高斯约束在表面的薄邻域内，同时允许其沿表面铺开。
5. **概率化生长阶段**：在高光度残差区域拟合局部 HGMM 生成新锚点，**在构造上有界**（每次事件拟合固定最大深度的混合），避免 Scaffold-GS 式按梯度比例克隆/分裂的无界增长。
6. **结果**：在 5 个大型户外场景中，基元**明显更贴近 LiDAR 实测**，且**基元数大幅减少** → 模型更紧凑、渲染更快。

---

## 技术方案

### 核心思想

**背景**：3DGS 通常仅从图像优化，但机器人/建图应用同时提供**高清 LiDAR**（rich visual appearance + accurate geometric structure）。已有的 scaffold 类方法（Scaffold-GS）把锚点放在**离散网格**上、**朝向任意世界坐标系**解码神经高斯——几何不受实测约束。

**PLS-GS**：每个锚点解码在**其所属混合分量的曲面框架内**（位置与朝向跟随局部几何），并通过 Mahalanobis 支撑损失把基元**约束在实测表面附近**。

### 关键技术

| 技术 | 说明 |
|------|------|
| HGMM 层次拟合 | 从单一根节点开始，每层用 EM 把点划分成 $K=8$ 个子节点；逐层细分形成树；组件内点数超过阈值才保留 → **分辨率随场景局部密度自适应** |
| 六维标准化 | 拟合前把 6 维（位置+颜色）标准化到零均值单位方差，使几何与颜色**可比地参与** |
| 锚点初始化 | 位置固定为叶分量空间均值 $\bm{x}_v=\bm{\mu}_j$；协方差做特征分解 $\bm{\Sigma}_j=\bm{U}_j\mathrm{diag}(\bm{\lambda}_j)\bm{U}_j^\top$，$\bm{U}_j$ 列按特征值降序 → **前两列张成局部切平面，第三列对齐法向**；$\sqrt{\bm{\lambda}_j}$ 初始化各向异性尺度 |
| 训练期固定 | 初始锚点的**位置与表面框架全程固定**，只优化每锚点特征、偏移、尺度、颜色与共享 MLP 解码器 → 保住几何保真度 |
| 曲面框架偏移 | $\bm{\mu}_{v,i}=\bm{x}_v+\bm{U}_v(\bm{o}_{v,i}\odot\bm{s}_v)$，偏移**挂在特征向量框架**而非世界轴 |
| 颜色初始化 | 分量颜色均值 $\bar{\bm{c}}_j$ 作为 **logit 空间的加性基底**，使初始化时每个锚点的渲染颜色**等于其混合分量的颜色** |
| 支撑损失 | $\mathcal{L}_{support}=\frac{1}{M}\sum_{v,i}\sum_{d=1}^{3}\frac{\tilde\delta_{v,i,d}^{2}}{\lambda_{v,d}+\epsilon}$；因为惩罚与特征值成反比 → **沿切向便宜、沿法向昂贵** |
| 概率化生长 | 累积每个神经高斯的**视图空间位置梯度平均幅值**；超阈值者标记为持续光度残差区域 → 池化其世界空间位置与颜色 → 拟合**局部 6 维 HGMM** → 叶分量实例化为新锚点（表面框架与尺度来自协方差），并与既有脚手架**去重**（避免重复覆盖已覆盖区域） |
| 生长自限性 | 每次事件拟合**固定最大深度**的混合 → **无论残差多大，新增锚点数都有上界**；且区域一旦被拟合，平均梯度即下降 → 触发条件自我限制 |
| 生长 vs 测量锚点 | 新锚点标记为 grown，若无贡献可被移除；**测量几何锚点全程保留** → 保住几何保真度 |
| LiDAR 覆盖补洞 | 传感器覆盖外的区域用**稀疏 SfM 点**填充以便渲染；这些点走同样的构建流程，但**不计入几何贡献** |

---

## 公式

```math
// 协方差分解 → 表面框架（式 9）
\boldsymbol{\Sigma}_{j}=\mathbf{U}_{j}\,\mathrm{diag}(\boldsymbol{\lambda}_{j})\,\mathbf{U}_{j}^{\top}
// U_j 的列按特征值降序：前两列张成局部切平面，第三列对齐表面法向

// 表面框架内的神经高斯中心（式 10）
\boldsymbol{\mu}_{v,i}=\mathbf{x}_{v}+\mathbf{U}_{v}\,(\mathbf{o}_{v,i}\odot\mathbf{s}_{v})

// Mahalanobis 支撑损失（式 11）
\mathcal{L}_{\text{support}}=\frac{1}{M}\sum_{v,i}\sum_{d=1}^{3}\frac{\tilde{\delta}_{v,i,d}^{\,2}}{\lambda_{v,d}+\epsilon}
// δ_{v,i}=μ_{v,i}-x_v（锚点位移），δ̃_{v,i}=U_v^T δ_{v,i}（局部框架表示）

// 总目标（式 12）
\mathcal{L}=\mathcal{L}_{\text{photo}}+\lambda_{\text{s}}\,\mathcal{L}_{\text{support}}
```

---

## 代码片段

```python
# HGMM 脚手架构建（论文 4.1）
def build_scaffold(points_xyz, points_rgb, K=8, min_pts=...):
    # 1) 六维标准化（几何与颜色可比地参与）
    pts = standardize(concat(points_xyz, points_rgb))   # (P, 6)
    # 2) 逐层 EM 划分：每个节点划分成 K=8 个子节点
    tree = em_split(pts, K=K)
    # 3) 组件内点数超阈值才保留 → 分辨率自适应于局部场景密度
    leaves = [c for c in tree if c.count > min_pts]
    anchors = []
    for j in leaves:
        mu_j     = j.spatial_mean          # (3,)
        Sigma_j  = j.spatial_cov           # (3,3)
        lam_j, U_j = eigh(Sigma_j)         # 特征值降序
        U_j = U_j[:, ::-1]                 # 前两列 = 切平面，第三列 = 法向
        anchors.append(Anchor(
            pos=mu_j,                    # 位置固定
            frame=U_j,                   # 表面框架固定
            scale=sqrt(lam_j),           # 各向异性尺度初值
            color_mean=j.color_mean))    # logit 空间加性基底

# 表面框架偏移解码（论文 4.2）
def decode_gaussian(anchor, feat, view_dir):
    o, s = mlp_offsets(feat, view_dir), mlp_scales(feat)
    center = anchor.pos + anchor.frame @ (o * s)     # 挂在曲面框架，不是世界轴
    # opacity / covariance / color 同 Scaffold-GS

# 支撑损失（论文 4.3）
def support_loss(anchors, gaussians):
    loss = 0.0
    for v, (anchor, gas) in enumerate(zip(anchors, gaussians)):
        for g in gas:
            delta = g.center - anchor.pos
            delta_local = anchor.frame.T @ delta         # 局部框架表示
            for d in range(3):
                loss += delta_local[d]**2 / (anchor.lam[d] + eps)
    return loss / M
    # 关键：惩罚与协方差特征值成反比 → 切向便宜、法向昂贵

# 概率化生长（论文 4.4）
# 每 growth interval：
# 1) 累积每个神经高斯的视图空间位置梯度平均幅值
# 2) 超阈值者 → 池化其世界空间位置与颜色
# 3) 拟合局部 6 维 HGMM（固定最大深度 → 新增锚点数有上界）
# 4) 叶分量实例化为新锚点（表面框架与尺度来自协方差），与既有脚手架去重
```

---

## 实验结论

- **数据集**：**GauU-Scene V2**——大型户外基准，提供稠密**测量级 LiDAR** + 带位姿 RGB 图像。据作者所知，这是**唯一**在该规模下 LiDAR 已配准到图像恢复出的 COLMAP 坐标系的公开基准，因此实测 LiDAR 点可直接用于初始化 3DGS。
- **5 个场景**（LiDAR 点数 / 相机数 / 面积）：

| 场景 | LiDAR 点 | 相机数 | 面积 |
|---|---|---|---|
| Campus | 80 M | 670 | 0.8–1.56 km² 区间 |
| Village | 27 M | 424 | 同上 |
| College | 59 M | 1215 | 同上 |
| Modern Building | 94 M | 713 | 同上 |
| Russian Building | 28 M | 563 | 同上 |

  图像降采样到长边 800 像素，每 8 张留 1 张作测试视图。

- **基线**：**Scaffold-GS**（分别用 SfM 点与 LiDAR 点初始化）。作者说明：以 LiDAR 监督 3DGS 的方法是最接近的替代比较，但**截至撰写时无公开实现**（因此该对比用于隔离「把离散网格脚手架换成概率化表面对齐脚手架」这一替换的效果）。
- **结果**：
  - 跨 5 个大型户外场景，PLS-GS 把基元放置得**明显更贴近 LiDAR 实测**，同时**使用显著更少的基元** → 模型更紧凑、渲染更快。
  - **等容量实验（matched-capacity）**：在相同基元预算下，PLS-GS 仍把基元放得比 LiDAR 初始化基线更近，**渲染质量相当** → 说明优势来自几何对齐机制本身，而非单纯的容量优势。
  - 组件消融（6.3 节）与跨阈值对齐分析（6.4 节）进一步拆解各模块贡献。

---

## 局限性

- **依赖精确配准的 LiDAR**：只有当 LiDAR 与图像 COLMAP 坐标系已配准时，实测点才能直接初始化 3DGS——这在多数真实数据集中并非现成。
- **LiDAR 覆盖外区域**用稀疏 SfM 点填充，这些点**不计入几何贡献**，该区域的表面对齐保证相应减弱。
- **训练期锚点位置与表面框架固定**，几何完全由初始 HGMM 决定 → **初始化质量决定上限**，后续优化无法纠正错的锚点布局。
- 需要「有 LiDAR + 有图像」的**多模态采集设定**，纯单目场景不适用。
- 与 LiDAR 监督类方法的对比因**缺乏公开实现**而缺失，实际优劣仍有待第三方验证。

---

## 相关工作

- [[2026-11-10_PLS-GS-Probabilistic-Lidar-Scaffolds]]
- 高斯泼溅：[[3D Gaussian Splatting]] [[Scaffold-GS]] [[神经高斯]]
- 机器人感知：[[LiDAR]] [[SLAM]] [[多模态融合]]
- 概率建模：[[高斯混合模型]] [[EM 算法]] [[Mahalanobis 距离]]
- 关键引文：Scaffold-GS（Tang et al. 2024）、LiDAR 监督 GS（[6,19]）、GauU-Scene V2（[18]）、OmniRe 等

---

## 实现建议

- **实现难度**：**中高**（HGMM 层次 EM 拟合 + 曲面框架偏移解码 + 支撑损失 + 生长调度；但**无需改渲染管线**，可复用 Scaffold-GS 的解码器）
- **预期性能**：更少的基元 + 更快渲染；等容量下几何对齐更优、渲染质量相当
- **适用场景**：
  - ✅ **同时拥有 LiDAR 与图像**的机器人/建图系统（自动驾驶、测绘、数字孪生）
  - ✅ 需要**几何精度**（而非仅视觉逼真）的场景：仿真、机器人抓取、测量
  - ✅ 大规模场景（基元数压缩 → 内存与带宽）
  - ❌ 纯单目或纯 LiDAR（无图像则无法优化外观）
- **落地建议**：
  1. **先确认 LiDAR 与图像的配准质量**——这是整个方法的输入前提，配准误差会直接变成锚点位置误差
  2. HGMM 拟合时**六维标准化不要省**，否则颜色维度会被位置尺度主导
  3. **协方差特征分解后务必按特征值降序排**（前两列=切平面，第三列=法向），否则表面对齐的方向完全错乱
  4. 支撑损失中 $\lambda_{v,d}$ 用**协方差特征值**（不是标准差），这正是「切向宽松、法向严格」的关键
  5. **测量几何锚点全程保留、只允许 grown 锚点被移除**——这个不对称设计是几何保真度的来源
  6. 生长阶段**保留固定最大深度的混合拟合**，这是「构造上有界」的关键，不要改成按残差比例克隆
- **优先级**：**中**——方法扎实且有开源代码，但适用前提（LiDAR+图像且已配准）较窄
