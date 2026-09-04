---
type: paper
created: 2026-09-04
updated: 2026-09-04
tags: [turbulence, boundary-layer, compressible, skin-friction, DNS]
status: processed
domain: fluid
agent: caixin
source: https://arxiv.org/abs/2609.02650
---

# Mapping-based exact-integral formulation of skin-friction transformations for zero-pressure-gradient compressible turbulent boundary layers

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mapping-based exact-integral formulation of skin-friction transformations for zero-pressure-gradient compressible turbulent boundary layers |
| **作者** | Xuke Zhu et al. |
| **发表** | arXiv 2026 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2609.02650) |

---

## 核心贡献

> 从映射和精确积分形式重新推导零压力梯度可压缩湍流边界层的表面摩擦变换，将 van Driest 理论置于严格的映射基础上

1. 从平均速度和壁法向坐标的映射推导变换因子
2. 将 van Driest 理论重新表述为有限 Re 的精确积分形式
3. VIPL 变换在 0.30 ≤ M_∞ ≤ 13.64 和 −0.55 ≤ Θ ≤ 2.85 范围内误差 <11%，平均 3.07%

---

## 技术框架

### 定义优先方法

将映射的"不可压缩"状态定义为物理可压缩边界层的恒定属性对应物。变换因子由预设的平均速度和壁法向坐标映射推导。

### 精确积分形式

Van Driest 理论被重新表述为有限 Re 的精确积分形式，经典 vD I 和 II 变换是其高阶渐近简化。

### VIPL 变换

基于壁内峰值线（VIPL）的修正变换给出最佳整体性能。

---

## 关键发现

- 现有公式即使变换数据呈现改善的collapse，也未能一致地恢复参考不可压缩表面摩擦行为
- vD II 的历史成功归因于截断误差的偶然相消
- VIPL 变换在宽马赫数和温度范围（0.30 ≤ M_∞ ≤ 13.64）内误差 <11%

---

## 相关工作

[[Compressible turbulent boundary layer]], [[Skin friction]], [[Van Driest transformation]], [[DNS]]
