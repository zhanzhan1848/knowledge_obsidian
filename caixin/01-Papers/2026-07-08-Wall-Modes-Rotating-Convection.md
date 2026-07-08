---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [fluid-dynamics, rotating-convection, turbulent-convection, wall-modes, DNS, experiment]
status: processed
domain: computational-fluid-fluid
agent: caixin
source: https://arxiv.org/abs/2607.06350
---

# Suppressing Wall Modes in Confined Rotating Turbulent Convection

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Suppressing Wall Modes in Confined Rotating Turbulent Convection |
| **作者** | Lázaro Martínez-Ortiz, Maarten Minartz, Youri H. Lemm, Xander M. de Wit, Herman J. H. Clercx, Rudie P. J. Kunnen |
| **发表** | arXiv 2607.06350v1, 2026-07-07 |
| **链接** | [原文](https://arxiv.org/abs/2607.06350) |
| **DOI** | - |

---

## 核心贡献

> 通过环形侧壁障碍物控制/抑制旋转湍流对流中的壁面模态，使能访问无壁效应影响的体动力学

1. **壁面模态抑制**：障碍物抑制侧壁附近的垂直速度极大值，破坏特征波动模式
2. **热输运修正**：障碍物减少壁面模态引起的热输运增强，使其趋向周期域特征值
3. **抑制效率**：由障碍物宽度与壁面模态尺度之比控制
4. **边界区流(BZF)抑制**：抑制侧壁附近正方位速度区域

---

## 技术方案

### 核心思想

在受限旋转湍流对流中，最大垂直速度以波状结构（壁面模态）形式存在于侧壁附近。这些结构在深湍流区持续存在，偏差热输运并通过径向射流干扰体流组织。

### 关键技术

| 技术 | 说明 |
|------|------|
| Ring-shaped sidewall barriers | 环形侧壁障碍物 |
| Direct Numerical Simulation (DNS) | 直接数值模拟 |
| Experiments | 实验验证 |
| Baroclinic flow | 障碍物面附近诱导异位流 |

### 物理机制

- 障碍物宽度/壁面模态尺度比决定抑制效率
- 双障碍物配置增强抑制效果
- 高导热率或更平滑几何形状减弱异位流效应

---

## 数值方法

- **DNS**: 圆柱腔内旋转湍流对流
- **网格**: 足够细网格保证 DNS 精度
- **边界条件**: 恒壁温、旋转

---

## 实验结论

- 障碍物有效抑制壁面模态签名
- 热输运趋向周期域值
- 局部诱导异位流效应

---

## 局限性

- 限于圆柱几何
- 障碍物设计需优化
- 对极端旋转数工况验证有限

---

## 相关工作

- [[Rotating convection]]
- [[Turbulent convection]]
- [[Wall modes]]
- [[Baroclinic instability]]

---

## 实现建议

- **实现难度**: ⭐⭐⭐ 中等
- **适用场景**: 地球流体动力学、天体物理对流、核工程
