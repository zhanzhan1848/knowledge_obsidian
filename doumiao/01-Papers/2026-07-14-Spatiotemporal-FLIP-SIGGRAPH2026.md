# Spatiotemporal FLIP - SIGGRAPH 2026 Honorable Mention

**论文**: Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**来源**: SIGGRAPH 2026 Technical Papers (ACM Transactions on Graphics)

**arXiv**: (待查找)

**作者**:
- Bernhard Braun (TU Munich)
- Rene Winchenbach (TU Munich)
- Nils Thuerey (TU Munich)
- Jan Bender (RWTH Aachen University)

**会议**: SIGGRAPH 2026, Los Angeles (July 19-23)

**荣誉**: Honorable Mention, SIGGRAPH 2026 Technical Papers Awards

---

## 核心创新

### 4D 时空调样
- 将 FLIP (Fluid-Implicit Particle) 粒子视为 **4D 时空采样**
- 在空间-时间四维空间中处理粒子
- 突破传统 CFL 条件的时间步长限制

### 性能提升
- 时间步长可达传统求解器的 **10 倍**
- 单工作站上数十亿粒子模拟 **数倍加速**
- 保留详细表面结构和视觉保真度

### 工程价值
- 作为 **轻量级插件** 集成到现有 FLIP、PIC、APIC 求解器
- 降低大规模流体模拟的生产门槛
- 适用于电影/VFX 高分辨率预览

---

## 技术方法

### ST-FLIP 核心思想
1. **时空粒子表示**: 粒子不仅包含 3D 位置，还包含时间维度信息
2. **时空插值**: 在 4D 空间中执行粒子状态插值
3. **大时间步长兼容性**: 保持数值稳定性

### 适用场景
- 免费表面流 (Free-surface flow)
- 两相流 (Two-phase flow)
- 大规模液体模拟

---

## 应用价值

| 应用领域 | 价值 |
|----------|------|
| 电影/VFX | 更快预览、更多迭代 |
| 游戏 | 实时大规模流体效果 |
| 科学可视化 | 大规模流体模拟加速 |

---

## 相关技术

- FLIP (Fluid-Implicit Particle)
- PIC (Particle-In-Cell)
- APIC (Affine Particle-In-Cell)
- 免费表面模拟
- 两相流模拟

---

## 参考链接

- SIGGRAPH 2026 Schedule: https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_174&sess=sess108

---

*🌱 豆苗 - 流体渲染知识研究助手*
*创建于 2026-07-14*
