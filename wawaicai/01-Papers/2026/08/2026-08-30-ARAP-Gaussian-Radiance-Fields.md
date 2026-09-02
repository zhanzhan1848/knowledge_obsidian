---
type: paper
created: 2026-08-30
updated: 2026-08-30
tags: [paper, gaussian-splatting, deformation, ARAP, IEEE-TVCG]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2608.29538
---

# As-Rigid-As-Possible Deformation of Gaussian Radiance Fields

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | As-Rigid-As-Possible Deformation of Gaussian Radiance Fields |
| **作者** | Xinhao Tong et al. |
| **发表** | IEEE Transactions on Visualization and Computer Graphics (TVCG) · Oct 2025 |
| **链接** | [原文](https://arxiv.org/abs/2608.29538) |

---

## 核心贡献

> 提出交互式方法对 3D Gaussian Splatting 表征的场景进行尽可能刚性的（ARAP）形变，同时保持高渲染质量。

1. **ARAP 高斯辐射场形变**：几何编辑后进一步优化 Gaussians 以保证光栅化结果与变形辐射场一致
2. **径向特征设计**：数学描述形变前后辐射场的径向差异
3. **自适应各向异性空间低通滤波器**：防止采样混叠，保留变化非均匀采样间隔的场
4. **无伪影形变**：保持形变前后 Gaussian 辐射场一致性，避免现有 3DGS 形变框架的伪影

---

## 技术方案

### 核心思想

现有方法通过几何编辑 Gaussians，但忽略辐射场本身才是光栅化渲染最终图像的根本。形变 Gaussians 与期望辐射场的不一致导致最终结果伪影。

### 关键技术

| 技术 | 说明 |
|------|------|
| 径向特征 | 描述形变前后辐射场径向差异 |
| 自适应各向异性低通滤波 | 抗混叠，保留非均匀采样间隔的场 |
| ARAP 形变约束 | 保持局部刚性 |
| 交互式大尺度形变 | 支持用户交互编辑 |

---

## 实验结论

- **数据集**: 多种 3DGS 场景
- **结果**: 
  - 避免现有 3DGS 形变框架的常见伪影
  - 保持 3DGS 高质量和高效渲染

---

## 相关工作

- [[3D高斯溅射]]
- [[网格形变]]
- [[ARAP形变]]
- [[神经辐射场]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 交互式实时形变
- **适用场景**: 3DGS 场景交互编辑、物体形变操作
