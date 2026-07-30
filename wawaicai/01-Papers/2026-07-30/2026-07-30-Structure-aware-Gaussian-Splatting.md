---
tags: [几何, 3DGS, 关节物体, 重建]
date: 2026-07-30
venue: ECCV 2026 (arXiv preprint)
---

# StructureGS: Structure-aware Gaussian Splatting for Articulated Object Reconstruction

## 论文信息

- **arXiv ID**: [2607.26889](https://arxiv.org/abs/2607.26889)
- **作者**: Gahye Lee
- **日期**: 2026-07-29
- **类别**: cs.GR, cs.CV, cs.RO
- **会议**: ECCV 2026

## 核心方法

StructureGS 将结构感知指导集成到 3D Gaussian Splatting 中，解决关节物体（多个可动部分）重建的难题。

### 问题挑战

1. **几何、外观、运动纠缠**: 三者在优化过程中相互依赖
2. **光测监督不足**: 传统方法难以 disentangle 三个分量
3. **部件边界模糊**: 导致部分分解质量差

### 解决方案

利用**有向包围盒 (OBB)** 强制两个关键结构属性：

#### 1. 空间一致性 (Spatial Coherence)
- 约束每个部件的几何在指定区域内紧凑
- 部件几何保持在 OBB 内部

#### 2. 结构连通性 (Structural Connectivity)
- 强制相邻部件之间的物理合理接触关系
- 防止部件分离或悬浮

### 结构感知损失

```
L_total = L_photo + λ_coherence L_coherence + λ_connectivity L_connectivity
```

- **L_photo**: 光度损失
- **L_coherence**: 空间一致性损失
- **L_connectivity**: 结构连通性损失

## 技术贡献

1. **OBB-guided 优化**: 使用有向包围盒引导 3DGS 优化
2. **双损失正则化**: 空间 + 连通性约束
3. **端到端训练**: 无需额外部件分割网络

## 实验结果

在关节物体重建任务上达到 SOTA：
- ✅ 清晰部件边界
- ✅ 高质量几何
- ✅ 合理的部件运动

## 算法复杂度

- **时间复杂度**: O(n) 每帧，n 为 Gaussian 数量
- **额外开销**: OBB 检测 + 损失计算

## 可行性评估

| 维度 | 评分 | 说明 |
|------|------|------|
| 算法复杂度 | ⭐⭐⭐ | 基于 3DGS 扩展 |
| 数值稳定性 | ⭐⭐⭐⭐ | 损失函数引导 |
| 实现难度 | ⭐⭐⭐ | 需 3DGS 基础 |
| 应用价值 | ⭐⭐⭐⭐ | 机器人/VR 应用 |

### 推荐度: ✅ 推荐关注

## 开源参考

### 3DGS 相关库
- [Inria 3D Gaussian Splatting](https://gitlab.inria.fr/structoff/3dgs/)
- [Nerfstudio](https://docs.nerf.studio/)
- [gsplat](https://github.com/nerfstudio-project/gsplat)

## 备注

> StructureGS 为关节物体 3D 重建提供了有效的结构约束方法，对于需要理解物体部件结构的场景（如机器人抓取）有重要价值。

---
*娃娃菜笔记 | 2026-07-30*
