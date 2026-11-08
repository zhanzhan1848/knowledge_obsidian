---
type: paper
created: 2026-11-08
updated: 2026-11-08
tags: [paper, multiphase-flow, capillary-imbibition, pore-scale, dns, fib-sem, interface-capturing, air-entrapment]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2611.01901
---

# Pore-scale mechanisms of capillary imbibition in cement-based materials revealed by direct numerical simulations in a realistic FIB-SEM microstructure

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Pore-scale mechanisms of capillary imbibition in cement-based materials revealed by direct numerical simulations in a realistic FIB-SEM microstructure |
| **作者** | Luka Malenica, Zhidong Zhang, Ueli Angst |
| **发表** | arXiv preprint 2026-11-01 (physics.flu-dyn) |
| **链接** | [原文](https://arxiv.org/abs/2611.01901) |
| **DOI** | 10.48550/arXiv.2611.01901 |
| **代码** | 未提供 |

---

## 核心贡献

> 用 **FIB-SEM 重建的真实水泥基微观结构**做**孔隙级图像法直接数值模拟（DNS）**，首次直接看到毛细管内自发浸润过程中**气-水界面的瞬态动力学**——这是实验在纳米-微米尺度无法观测的。

1. **真实几何而非理想孔隙** —— 直接数值模拟基于 **FIB-SEM 重建的真实水泥基骨料微观结构**，而非合成的球形/圆柱孔隙模型。
2. **气-水界面动态** —— 解析**纳米到微米空间尺度、纳秒到微秒时间尺度**的界面重构与气体置换。
3. **关键机制发现** —— 局部动力学由**演化的界面曲率与毛细压力场**决定，**而非仅由特征孔隙尺寸决定**；在**完全润湿条件下，毛细孔内仍会发生显著气体封闭**。

---

## 技术方案

### 核心思想

水泥基材料中的水分迁移是**强不规则孔隙网络中的瞬态多相流**。演化的气-水界面强烈影响液体侵入与气体置换。在毛细尺度上这些过程**无法直接实验观测**，因此数值模拟是目前唯一可行的窗口。

采用**孔隙分辨（pore-resolved）**的图像法 DNS：几何直接来自 FIB-SEM 扫描的三维重建，界面用前沿跟踪/水平集类方法捕捉。

### 关键技术

| 技术 | 说明 |
|------|------|
| **图像法 DNS** | 几何来自真实 FIB-SEM 三维重建，非合成模型 |
| **孔隙分辨多相流** | 直接解析孔隙内的气-水界面 |
| **界面捕获** | 纳米-微米尺度、纳秒-微秒时间尺度的界面重构 |
| **毛细压力场** | 局部动力学的主导控制量 |
| **润湿前沿追踪** | 高度异质的湿润前沿传播 |
| **二维受控分析** | 与三维模拟对比，量化尺度依赖性 |
| **钢-混凝土界面湿度解析** | 面向腐蚀相关的孔隙尺度分析 |

---

## 公式

```math
\textbf{毛细压力（Young-Laplace，局部曲率驱动）：}\quad
p_c = \gamma\!\left(\frac{1}{R_1}+\frac{1}{R_2}\right)
\quad\Rightarrow\quad
\text{封闭气团毛细压力取决于界面几何，而非气团体积}

\textbf{多相流体力学尺度平衡：}\quad
\text{Ca} = \frac{\mu U}{\gamma}
,\quad
\text{Bo} = \frac{\Delta\rho\, g\, L^2}{\gamma}
\ \text{— 毛细/黏性/惯性/重力平衡随尺度强变}

\textbf{完全润湿仍封闭气体：}\quad
\theta_{\text{contact}} = 0
\ \nRightarrow\
\text{无气体封闭}
\quad(\text{纯几何阻塞效应})
```

---

## 实验结论

- **几何**: FIB-SEM 重建的**真实水泥基骨料微观结构**
- **尺度**: 纳米–微米空间，纳秒–微秒时间
- **结果**:
  - **高度异质的湿润前沿传播**、**持续的界面重构**、**渐进的气体封闭**
  - 局部动力学取决于**演化界面曲率与毛细压力场**，**而非仅特征孔隙尺寸**
  - **即便在毛细孔内、即便完全润湿条件**，显著气体封闭仍会发展，**逐步降低饱和速率**
  - 封闭气团的毛细压力**强烈依赖局部界面几何，而非气团体积**
  - 二维受控分析显示**毛细/黏性/惯性/重力效应的平衡强烈依赖尺度**
  - 三维 vs 二维对比凸显**面外界面曲率**与**孔隙网络连通性**的重要性
  - 框架能解析钢-混凝土界面湿度条件 → **面向腐蚀分析的潜力**

---

## 局限性

- **极窄的应用场景**：水泥基材料腐蚀，与图形学流体渲染无直接关系
- **计算代价极高**：孔隙分辨 DNS + 纳米尺度 + 纳秒时间步
- **单一材料体系**：结论对其他多孔介质的可迁移性未验证
- **无渲染/可视化贡献**

---

## 与流体渲染的关联

- **界面捕获技术的参考价值**：纳米尺度气-水界面追踪（前沿跟踪/水平集）在**渲染中对应**更宏观的**水-空气界面捕捉**——自由表面流体渲染的核心难点。二者共享 VOF / level-set / 前沿跟踪的技术族
- **曲率驱动毛细压力的建模**：对渲染中**表面张力主导的液体形态**（水滴、露珠、水膜）有物理建模参考
- **"完全润湿仍有气体封闭"的发现**提醒：渲染中**简化假设（如忽略封闭气泡）**在真实物理下可能失真
- 更实际的价值：这是**多相流界面物理**的高保真参考，可作为渲染效果"物理正确性"的对照基准

---

## 实现建议

- **实现难度**: 极高（孔隙分辨 DNS + 图像几何处理）
- **预期性能**: 极慢，不适合实时；仅作物理参考
- **适用场景**: 物理参考研究；**渲染侧建议只借鉴界面捕获思路**

---

## 相关工作

- [[2026-11-08-EnKF-Rayleigh-Benard-Temperature-Only-Reconstruction]]
- [[2026-11-08-HGKS-Compact-ALE-Gas-Kinetic-Unstructured-Mesh]]

## 关键词

`multiphase flow` `capillary imbibition` `pore-scale` `direct numerical simulation` `FIB-SEM` `interface dynamics` `air entrapment` `capillary pressure` `wetting front`
