---
type: paper
created: 2026-09-03
updated: 2026-09-03
tags: [paper, 3DGS, deformation, radiance-fields, rasterization, ARAP]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2608.29538
---

# As-Rigid-As-Possible Deformation of Gaussian Radiance Fields

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | As-Rigid-As-Possible Deformation of Gaussian Radiance Fields |
| **作者** | (Authors from paper) |
| **发表** | arXiv 2026 (cs.GR) |
| **链接** | [原文](https://arxiv.org/abs/2608.29538) |
| **DOI** | 10.48550/arXiv.2608.29538 |

---

## 核心贡献

> 提出 3DGS  radiance fields 的**尽可能刚体 (ARAP) 变形方法**，在几何编辑后进一步优化 Gaussians 以保证光栅化结果与变形后的 radiance field 一致。

1. 提出交互式 **ARAP 变形方法**用于 Gaussian radiance fields，在几何编辑后额外优化 Gaussians 以保证 rasterization 结果与变形 radiance field 一致
2. 设计**径向特征 (radial features)**，数学描述变形前后 radiance field 的径向差异，在 radiance field 上密集采样
3. 提出**自适应各向异性空间低通滤波器**，防止采样时的混叠问题，保留变化非均匀采样间隔的场
4. 避免现有方法中几何变形的 Gaussians 与期望 radiance field 之间的不一致导致的伪影

---

## 技术方案

### 核心思想

3D Gaussian Splatting (3DGS) 将 radiance fields 建模为稀疏分布的 3D Gaussians，实现了高分辨率和实时帧率的新视角合成。然而，对 3D Gaussians 表示的物体进行变形仍然具有挑战性。现有方法通过对 Gaussians 进行几何编辑来变形 3DGS 物体，但忽略了最终图像是由 radiance field 光栅化渲染的这一事实。变形的 3D Gaussians 与期望 radiance field 之间的不一致不可避免地导致最终结果中的伪影。

核心解决方案：在 Gaussians 上执行几何编辑后，进一步优化 Gaussians 以保证其光栅化产生与变形 radiance field 相似的结果。

### 关键技术

| 技术 | 说明 |
|------|------|
| 径向特征 | 数学描述变形前后 radiance field 的径向差异，密集采样于 radiance field |
| 自适应各向异性空间低通滤波器 | 防止非均匀采样间隔下的混叠，保留场特性 |
| 几何编辑 + radiance 一致性优化 | 双阶段保证几何和外观一致性 |
| 交互式 ARAP 变形 | 用户可交互进行大规模 radiance field ARAP 变形 |

---

## 实验结论

- **结果**: 由于维护了变形前后 Gaussian radiance field 的一致性，避免了现有方法中的常见伪影
- **适用性**: 多种角色和实际场景验证

---

## 局限性

- 计算成本较高（双阶段优化）
- 对极端变形效果可能需要更多迭代

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Gaussian Radiance Fields]]
- [[ARAP Deformation]]
- [[Neural Rendering Deformation]]

---

## 实现建议

- **实现难度**: 中高（需要 3DGS 基础、radiance field 优化经验）
- **预期性能**: 交互式应用可行，大规模变形需要优化
- **适用场景**: 角色动画编辑、动态物体变形、交互式 3D 编辑器
