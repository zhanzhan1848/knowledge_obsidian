# SIGGRAPH 2026 流体渲染相关论文

> 收集日期: 2026-07-05
> 来源: [SIGGRAPH 2026 Technical Papers](https://s2026.siggraph.org/siggraph-2026-technical-papers-showcase-the-research-making-visual-computing-faster-more-reliable-and-accessible/)

---

## 📄 论文列表

### 1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

| 属性 | 内容 |
|------|------|
| **奖项** | Best Paper |
| **作者** | Doug James, Ethan James |
| **会议** | SIGGRAPH 2026 |
| **Session** | [Papers Fast Forward](https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108) |

#### 核心创新
- 提出**锐利的2D流体笔刷**概念
- GPU加速的解析方法实现渐进式、分辨率无关的物理流体混合
- 基于圆柱齿间的势流(potential flow)推导
- 每个样本评估漂移无需网格或中间重采样
- 支持**实时、任意分辨率**的流体混合和渲染
- 数值耗散可忽略

#### 技术方法
- **势流分析**: 从圆柱齿间的势流推导
- **GPU加速**: 解析方法，无网格依赖
- **分辨率独立**: 无网格限制，支持任意分辨率

#### 关键词
`fluid mixing` `real-time rendering` `potential flow` `GPU acceleration` `2D fluid`

#### URL
- Paper: 待补充 (ACM TOG / SIGGRAPH 2026)
- Schedule: https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108

---

### 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

| 属性 | 内容 |
|------|------|
| **奖项** | Honorable Mention |
| **作者** | Bernhard Braun, Rene Winchenbach, Nils Thuerey (TU Munich), Jan Bender (RWTH Aachen) |
| **会议** | SIGGRAPH 2026 |
| **Session** | Fluid simulation |

#### 核心创新
- **时空FLIP** (ST-FLIP) 方法
- 将粒子视为四维时空中的样本
- 支持比传统求解器大**一个数量级**的时间步长
- 多十亿粒子模拟在单工作站上实现数倍加速
- 保留详细表面结构和视觉保真度
- 作为FLIP、PIC、APIC求解器的轻量级插件

#### 技术方法
- **4D时空粒子**: 将粒子样本扩展到时空域
- **大时间步长**: 支持非常大时间步的模拟
- **兼容性**: 可直接插入现有FLIP/PIC/APIC求解器

#### 性能提升
- 时间步长提升 **~10x**
- 多十亿粒子模拟 → 数倍加速
- 单工作站即可运行大规模模拟

#### 关键词
`FLIP` `fluid simulation` `free-surface` `two-phase` `large time steps` `particle-based`

#### URL
- Schedule: https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_174&sess=sess108

---

## 📊 趋势分析

SIGGRAPH 2026 流体仿真方向的趋势：

1. **实时性增强**: Mixwell 实现实时流体混合渲染
2. **大规模模拟**: ST-FLIP 支持十亿级粒子
3. **性能优化**: 通过大时间步长和GPU加速提升效率
4. **生产友好**: 作为插件集成到现有流程

---

## 🔗 相关资源

- [SIGGRAPH 2026 Technical Papers Schedule](https://s2026.conference-schedule.org/?filter1=sstype132)
- [ACM SIGGRAPH Blog - Best Papers](https://blog.siggraph.org/2026/05/siggraph-2026-technical-papers-awards-best-papers-honorable-mentions-and-test-of-time.html/)

---

*笔记由 豆苗 (Doumiao) 自动生成*
