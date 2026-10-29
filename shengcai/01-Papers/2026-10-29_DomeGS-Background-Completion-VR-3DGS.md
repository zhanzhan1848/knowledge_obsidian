---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, 渲染, Gaussian-Splatting, VR, 背景补全, 天空盒, 用户研究, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37172
---

# DomeGS: Perceptually Consistent Background Completion for Unbounded 3D Gaussian Splatting in Virtual Reality

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | DomeGS: Perceptually Consistent Background Completion for Unbounded 3D Gaussian Splatting in Virtual Reality |
| **作者** | Anastasiya Pechko, Agata Szymańska, Piotr Borycki, Joanna Szelewska, Sławomir Tadeja, Przemysław Spurek（Jagiellonian University / Ideas Research Institute / University of Cambridge） |
| **发表** | arXiv 2026-10-27（cs.GR，primary），9 pages, 10 figures |
| **链接** | [原文](https://arxiv.org/abs/2610.37172) |
| **DOI** | [10.48550/arXiv.2610.37172](https://doi.org/10.48550/arXiv.2610.37172) |
| **代码** | [Anastasiya999/DomeGS](https://github.com/Anastasiya999/DomeGS) |

---

## 核心贡献

> 把 "skydome"（天穹）从**贴在引擎里的背景壳**变成**重建出的 3D 高斯场景的一部分**——先从近场场景提取部分全景并用 360° 专用生成模型补全远景，再用该全景**监督**在有限半径远端球面上播种并精炼新高斯，最后与原场景联合微调，从而得到**几何连续、对运动一致**的无界环境。

1. **统一式无界 3DGS 扩展管线**：目标不是"后处理一张 2D 背景"，而是在 3DGS 表示内部完成远场补全，保留深度线索与真实感，服务于沉浸式 VR。
2. **360° 生成式 outpainting 融入高斯基底**：从近场场景提取**部分全景** → 用 360°-aware 生成模型补全缺失的远景区域 → 用补全图**监督第二阶段优化**，在有限半径远端球上播种并精炼新 Gaussians → 实现**光度对齐**且不破坏原重建主场景。
3. **VR 用户研究验证**：N=36 人的被试内实验显示，相比经典无限 skybox 基线，**空间临场感（presence, p=0.042）与真实感（realism, p=0.042）显著提升**，且行为与舒适度可比。

---

## 技术方案

### 核心思想

**问题根源**：3DGS 在**无界室外场景**上远场几何不可靠——采集数据在天空、远立面、地平线处稀疏或完全缺失，缺乏多视差与几何地标，3DGS 优化无法正确三角化远场深度 → 锯齿边界、悬浮伪影、缝隙。

**经典解法的问题**：把全景图贴到无限远 skybox（cubemap）上，**背景与重建几何之间存在色彩/光照不匹配**，近场高斯与远场背板之间出现可见接缝，运动时缺乏视差。

**DomeGS 的做法**：把天穹做成**有有限空间半径的真实几何**（skydome 而非 skybox），并让它与前景高斯**在同一个 3DGS 资产中联合优化** → 整个环境对用户移动**整体响应**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **部分全景提取** | 从近场 3DGS 场景渲染/采样出覆盖部分天球的全景（panorama），保留真实近场内容 |
| **360° 生成式补全** | 用 **360°-specialized 扩散模型**生成缺失的远景天空/地平线区域 |
| **高斯基底二次优化（second stage）** | 用补全后的全景**监督**在**有限半径远端球面**上播种并精炼新的 Gaussians → 得到有真实空间尺度的 skydome |
| **原+新增视图联合微调** | 用原始训练视图 **+ 新增的天球视图**共同微调整个场景 → 光度对齐，前景不被退化 |
| **有限半径 vs 无限远** | skybox = 无限远无视差；skydome = 有限球面 → 用户平移时产生**运动视差**，这是 VR 中深度/自运动/场景尺度的重要线索 |
| **与 Unity 等引擎的集成** | 论文以 Unity 为例说明 3DGS 场景的背景集成流程 |

---

## 公式

> 论文以定性方法与用户研究为主，核心可形式化为「联合优化目标」：

```math
// 联合微调：在原场景损失 + 新增天球视图损失上优化同一组高斯参数
\mathcal{L}=\mathcal{L}_{\text{original-views}}(G)+\lambda_{\text{sky}}\,
             \mathcal{L}_{\text{dome-views}}(G),
\qquad G=\{\text{前景 Gaussians}\}\cup\{\text{天球 Gaussians}\}
```

---

## 代码片段

```python
# 概念伪码：DomeGS 三阶段管线
def domegs(gs_scene, panorama_inpaint_model):
    # Stage 1: 从近场 3DGS 场景提取部分全景
    partial_pano = extract_panorama(gs_scene)          # 覆盖部分天球

    # Stage 2: 360° 生成式 outpainting 补全远景
    full_pano = panorama_inpaint_model.inpaint(partial_pano)   # 360°-specialized diffusion

    # Stage 3: 在有限半径远端球面上播种并精炼新高斯（监督 = full_pano）
    dome_gaussians = seed_and_refine_on_sphere(
        sphere_radius=R_far,                       # 有限半径 → 运动视差
        supervision=full_pano,
        camera_trajectory=render_orbit(full_pano),
    )

    # Stage 4: 与原场景联合微调（不破坏前景）
    G = merge_and_finetune(gs_scene.gaussians, dome_gaussians,
                           views=gs_scene.training_views + dome_views)
    return G
```

---

## 实验结论

- **评测方式**: **N=36 用户的被试内（within-subjects）用户研究**，对比 DomeGS 与经典无限 skybox 基线。
- **结果**:
  - **空间临场感（sense of presence）显著提升**：p = **0.042**
  - **真实感（realism）显著提升**：p = **0.042**
  - 背景一致性在**运动中**（under motion）得到改善——即整体对用户移动一致响应
  - 行为表现（behavioral measures）与舒适度（comfort）与 skybox 基线**相当**（无退化）
- **定性结果**:
  - 原始 3DGS（无补全）：缺失天空区域 + 边界悬浮物（boundary floaters）
  - 朴素 cubemap skybox 集成：填补了背景但出现**可见接缝与光照不匹配**
  - DomeGS：**无缝背景集成，无可见伪影**，且保持几何连续性

---

## 局限性

1. **依赖 360° 生成模型**：远景内容的真实性由扩散模型决定，可能产生幻觉细节；论文未量化其真实性/一致性。
2. **天球半径需人工选择**：`R_far` 的选取影响视差强度与重建质量，未给出自动选择方法。
3. **远景仍无真实几何约束**：天球是"有深度的球壳"，不是真实远景几何；对需要真实视差/遮挡的场景仍是近似。
4. **用户研究规模有限**：N=36，虽 p=0.042 显著但样本量不大；且主客观指标仅 2 项。
5. **仅针对 3DGS**：对 NeRF / 其他表示的适用性未验证。
6. **依赖已有近场 3DGS 重建质量**：若近场本身有缺陷，DomeGS 不修复。

---

## 相关工作

- 3D Gaussian Splatting (Kerbl 2023)
- Skybox vs Skydome（VR 引擎惯例；Unity 6.1 skybox 文档）
- 360° 生成模型：diffusion panoramic image generation、layered 3D 环境表示
- 生成式环境补全方法（[7],[8]）+ 模块化集成框架（[40]）
- DomeGS 自身的对比基线：ComGS 之外的 3DGS 场景编辑/补全工作

---

## 实现建议

- **实现难度**: **中**。需要：360° 全景提取与生成式补全、在球面上播种并优化 Gaussians、把天球渲染视图并入训练集联合微调、球面到全景的投影一致性处理。
- **预期性能**: 用户研究证明主观临场感/真实感显著提升；计算开销主要在二次优化阶段（一次额外的 3DGS 微调）。
- **适用场景**:
  - **VR 无界室外场景**（当前 3DGS 最痛的远场缺失问题）
  - 游戏引擎中的 3DGS 资产背景补全
  - 任何需要"重建几何 + 生成远景"无缝融合的开放场景
- **落地建议（给墨鱼丸）**:
  1. **核心可复用点**：把"后处理背景壳"改为"**参与联合优化的第二阶段几何**"——这个思路不限于天球，也可以用于"补全房间的另一侧"等场景。
  2. 落地时**天球半径是一个重要超参**：太近 → 视差不自然/穿帮；太远 → 等同 skybox 无视差。建议做半径扫描并用主观评价选点。
  3. **保住前景不被退化**是难点：联合微调容易被天球视图主导，导致前景变糊。建议加**前景损失加权**或分阶段冻结。
  4. 若追求**真实视差**，需进一步引入真实远景 LiDAR/深度约束，而非纯生成式补全——这是明显的改进方向。
