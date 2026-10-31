---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, Gaussian-Splatting, fisheye, wide-fov, mesh-extraction, rasterization, real-time, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.37818
---

# GOFish: Full Field-of-View Gaussian Splatting and Mesh Extraction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GOFish: Full Field-of-View Gaussian Splatting and Mesh Extraction |
| **作者** | Allen Tu, Meher Gitika Karumuri, Shifan Zhu, Hailing Wang, Yen-Liang Lin, David Held, Matthias Zwicker, Tom Goldstein |
| **发表** | arXiv preprint (cs.GR / cs.CV / cs.RO), 2026-10-27 |
| **链接** | [原文](https://arxiv.org/abs/2610.37818) |
| **DOI** | - |
| **代码** | 项目页 https://3dgofish.github.io/ |

---

## 核心贡献

> GOFish — 首个直接在鱼眼图像上训练、可光栅化 >180° FoV、并从同一场景提取对齐网格的 3D Gaussian Splatting 表面重建方法，产出 LiDAR-free 的仿真就绪数字孪生。

1. **鱼眼直接训练** — 首个不依赖针孔训练图像假设的 3DGS 表面重建方法，直接在鱼眼图像上训练。
2. **超 180° FoV 光栅化** — 突破既有鱼眼 3DGS 方法 ≤180° 的限制。
3. **同场景网格提取** — Gaussian 场景与网格一一对齐，同时提供渲染与碰撞几何。
4. **两项标定技术** — Calibrated Mip Filtering 抑制像素模糊、Calibrated Densification 恢复全 FoV 表面，Wide-Angle Appearance Modeling 将镜头衰减排除在场景之外。

---

## 技术方案

### 核心思想

机器人、自动驾驶、消费级 360° 相机普遍使用鱼眼镜头。仿真就绪的数字孪生需要**全 FoV 的照片级渲染 + 对齐的碰撞网格**。

既有工作的三重错配：
- 鱼眼 3DGS 只光栅化到 180°，且不产出网格
- Gaussian 表面重建方法假设针孔训练图像
- 天空盒/背景球与重建几何无法无缝融合

GOFish 的解法：在训练时对投影模型做**标定**，使 Gaussian 的光栅化在鱼眼畸变下仍然正确；用**标定致密化**在全 FoV 恢复表面密度；再用 **Wide-Angle Appearance Modeling** 把镜头暗角/衰减建模为 appearance 而非烘进几何，从而提取的网格保持干净。

### 关键技术

| 技术 | 说明 |
|------|------|
| 鱼眼投影光栅化 | 直接在鱼眼图像上训练，不做针孔假设 |
| Calibrated Densification | 标定的致密化策略，全 FoV 恢复表面 |
| Calibrated Mip Filtering | 标定的 mip 滤波，抑制鱼眼像素模糊 |
| Wide-Angle Appearance Modeling | 广角外观建模，镜头衰减不进几何 |
| 同场景网格提取 | Gaussian 场景 + 对齐网格双输出 |
| 数字孪生输出 | LiDAR-free、仿真就绪 |

---

## 公式

```math
// 鱼眼投影（等距圆柱模型为例）
u = f_x \cdot \arctan\frac{d_x}{d_z}, \quad v = f_y \cdot \arctan\frac{d_y}{d_z}
// 标定致密化的视图贡献加权
w_i = \text{solidAngle}_i \cdot \text{visibility}_i, \quad \text{densify if } \sum_i w_i > \tau
```

---

## 代码片段

```cpp
// 概念伪代码：鱼眼光栅化 + 标定致密化
for (int iter = 0; iter < iters; ++iter) {
    render_gaussians_fisheye(cam, splats, image);   // 鱼眼投影 + mip 滤波
    accumulate_calibrated_contributions(views);     // 标定致密化统计
    if (should_densify()) split_and_clone(splats);  // 全 FoV 表面恢复
}
extract_aligned_mesh(splats, mesh);                  // 对齐碰撞几何
```

---

## 实验结论

- **数据集**: FIORD（200° FoV 基准）、FullCircle（205° FoV 基准）、ScanNet++（主测试集）
- **基线**: 既有鱼眼 3DGS 方法（≤180°）、Gaussian 表面重建方法（针孔假设）、fisheye rendering 基线
- **结果**:
  - FIORD（200°）PSNR 超越最佳既有方法 **+2.28 dB**
  - FullCircle（205°）PSNR 超越最佳既有方法 **+1.97 dB**
  - 在竞争方法自身 FoV 内仍优于其鱼眼渲染基线
  - FIORD 与 ScanNet++ 主测试集取得**最高 mesh F-score**
  - 输出：实时渲染 + 全 FoV 光线追踪 + 碰撞几何

---

## 局限性

- 摘要未给出具体的网格提取算法细节与实时帧率
- 超宽 FoV 下的外观建模对极端镜头畸变（>205°）的泛化未验证
- 依赖 3DGS 表示本身的几何弱点（薄壁/透明物）

---

## 与团队相关

- 与墨鱼丸 (moyuwan): "网格提取 + 场景渲染一致"这条工程链路值得复刻——对自动驾驶仿真/数字孪生管线直接可用
- 关联：[[2026-10-31_NeuOctree-Neural-Explicit-Shape-Representation]]、[[2026-10-19-X-Splat-Joint-RGB-Xray-3DGS]]

---

## 实现建议

- **实现难度**: 中高（鱼眼光栅化需改 CUDA rasterizer；标定项需重新推导）
- **预期性能**: 质量高（+2 dB 级别）；实时渲染是其明确目标
- **适用场景**: 自动驾驶仿真、机器人数字孪生、全景相机内容创作
- **优先级**: **高**（Tier A）
