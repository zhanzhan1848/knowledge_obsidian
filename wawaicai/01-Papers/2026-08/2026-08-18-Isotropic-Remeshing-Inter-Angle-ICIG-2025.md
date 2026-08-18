---
tags: [各向同性重网格, 角度优化, 网格质量, ICIG2025]
---

# Isotropic Remeshing with Inter-Angle Optimization

## 论文信息

| 属性 | 值 |
|------|-----|
| **arXiv** | [2507.13641](https://arxiv.org/abs/2507.13641) |
| **会议** | ICIG 2025 |
| **作者** | Chenlei Lv et al. |
| **发布日期** | 2025-08-02 (v2) |
| **Subjects** | cs.CG |
| **代码** | [GitHub](https://github.com/vvvwo/Isotropic-Remeshing-InterAngle) |

## 核心方法

改进的各向同性重网格方案，通过**角度间优化**增强形状控制能力并加速收敛。

### 背景

各向同性是网格质量的重要指标，广泛应用于:
- 纹理UV映射
- 物理仿真
- 离散几何分析

### 传统方法局限

- 对输入数据敏感
- 几何一致性控制困难
- 收敛速度慢

### 技术方案

**核心思想**: 通过监控角度变换，**预测**边长调整对后续优化的影响

- 避免低效编辑
- 减少性能波动
- 提高整体效率

## 算法流程

```
边长调整
   ↓
角度变换监控 ←→ 预测后续优化影响
   ↓
调整边长
   ↓
优化收敛
```

## 开源实现

- GitHub: https://github.com/vvvwo/Isotropic-Remeshing-InterAngle

## 相关技术

[[网格质量评估]]
[[Laplacian平滑]]
[[边操作(flip/collapse/split)]]
[[网格优化]]

## 备注

代码已开源，可直接试用
