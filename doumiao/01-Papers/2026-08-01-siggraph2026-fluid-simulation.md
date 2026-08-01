# ST-FLIP: Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation

> **日期**: 2026-08-01  
> **来源**: SIGGRAPH 2026 (Honorable Mention)  
> **关键词**: fluid simulation, FLIP, free-surface, two-phase, large time steps  
> **链接**: https://keenancrane.github.io/siggraph-papers-schedule/  
> **标签**: #fluid-simulation #free-surface #FLIP #SIGGRAPH2026

## 核心创新

**ST-FLIP** 将粒子视为四维时空中的采样点，而非传统三维空间中的采样。通过在时间轴上随机化粒子位置，并使用可分离的 4D 核进行粒子到网格的沉积，从而实现对时间步长 slab 积分量的蒙特卡洛估计。

核心问题：大时间步长下，混合粒子-网格液体求解器会出现时间欠采样，产生锯齿状自由表面。

## 关键技术

1. **时空粒子采样**：在标准空间抖动基础上，沿时间轴随机化粒子位置
2. **4D 核沉积**：使用可分离 4D 核进行 P2G 传输
3. **时间 slab 积分**：将粒子视为 4D 时空采样，投影时塌缩为 3D 网格场
4. **零开销集成**：复用 P2G 权重累加器作为时空相场，无需逐步表面重建
5. **CFL 约束突破**：允许时间步比 CFL 约束大一个数量级

## 方法详解

### 核心公式
粒子作为 4D 时空中的样本，沉积时使用 4D 核函数：
$$w_{4D}(\mathbf{x}, t) = w_{3D}(\mathbf{x}) \cdot k(t)$$
其中 $k(t)$ 为时间方向核函数。

### 与现有 FLIP/APIC 兼容性
可作为轻量级插件集成到现有 FLIP/PIC 或 APIC 求解器，单步额外计算成本可忽略。

## 性能表现

| 指标 | 数据 |
|------|------|
| 速度提升 | 若干倍（多十亿粒子模拟） |
| 时间步长 | 比传统 CFL 约束大 10× |
| 分辨率 | 单工作站高有效 3D 分辨率 |
| 适用场景 | free-surface + two-phase liquid |

## 渲染相关性

- **自由表面重构**：大时间步长下表面细节保持
- **视觉效果**：保留流动结构和视觉保真度
- **适用场景**：电影级流体特效、游戏实时流体

## 参考文献

- Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey
- TUM, RWTH Aachen University
- SIGGRAPH 2026 Honorable Mention
