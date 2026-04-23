---
type: paper
created: 2026-04-23
updated: 2026-04-23
tags: [geometry, UV-parametrization, gaussian-splatting, optimal-transport]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.19127
---

# Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem |
| **作者** | Byunghyun Kim et al. |
| **发表** | Eurographics 2026 Short Papers |
| **链接** | [原文](https://arxiv.org/abs/2604.19127) |
| **DOI** | 10.48550/arXiv.2604.19127 |

---

## 核心贡献

> 将 UV 映射重新解释为容量分配问题，用最优传输（Optimal Transport）思路改进 UVGS

1. 将 UV 映射重新解释为 **容量分配问题**（capacity allocation under fixed UV budget）
2. 提出 **OT-UVGS**：基于一维最优传输的 UV 映射，O(N log N) 复杂度
3. 在 184 个场景和 Mip-NeRF 数据集上持续提升 PSNR/SSIM/LPIPS

---

## 技术方案

### 核心思想

现有 UVGS 使用确定性球面投影将 3D 高斯映射到 UV 位置，忽略全局分布导致：
- 许多 UV 槽为空
- 密集区域频繁碰撞

论文将 UV 映射重新解释为容量分配问题，提出最优传输启发的映射。

### 关键技术

| 技术 | 说明 |
|------|------|
| Optimal Transport | 核心数学工具，用于全局耦合分配 |
| UV Tensor | UV 参数化的 3D 高斯表示 |
| Rank-based Sorting | 实现 O(N log N) 复杂度的排序算法 |

### 公式

复杂度: O(N log N) for N Gaussians

---

## 实验结论

- **数据集**: 184 object-centric scenes + Mip-NeRF dataset
- **结果**: 在相同 UV 分辨率和 per-slot 容量(K=1)下，PSNR/SSIM/LPIPS 持续提升
- **UV 利用率**: 更高非空槽率、更少碰撞、更高 Gaussian 保留率

---

## 相关工作

- [[UV Parametrization]]
- [[Gaussian Splatting]]
- [[Optimal Transport]]

---

## 实现建议

- **实现难度**: 低（可作为 UVGS 的 drop-in replacement）
- **预期性能**: UV 利用率显著提升，图像质量改善
- **适用场景**: 3DGS 压缩存储、UV 纹理映射、GPU 高效渲染

---

## 开源参考

- libigl: UV mapping 相关函数
- 论文 PDF: https://arxiv.org/pdf/2604.19127