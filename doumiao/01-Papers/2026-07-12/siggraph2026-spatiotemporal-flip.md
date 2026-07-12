# Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation

## 论文信息
| 项目 | 内容 |
|------|------|
| 标题 | Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps |
| 作者 | Bernhard Braun, Rene Winchenbach (TU Munich), Jan Bender (RWTH Aachen), Nils Thuerey (TU Munich) |
| 会议 | SIGGRAPH 2026 - **Honorable Mention** |
| 期刊 | ACM Transactions on Graphics (TOG) |
| DOI | 10.1145/3811284 |
| 日期 | 2026年7月3日发表 |

## 核心问题
现有 FLIP (Fluid-Implicit Particle) 模拟方法的时间步长受 CFL 条件限制，对于大规模高分辨率流体模拟计算成本高。

## 核心创新点

### 时空扩展
- 将粒子视为**四维时空中的样本**
- 对广泛使用的 FLIP 模拟方法进行**时空扩展**
- 允许时间步长比常规求解器**大一个数量级**
- 在单工作站上运行多十亿粒子模拟时实现**数倍加速**

### 保持视觉质量
- 保持详细的表面结构
- 保持视觉保真度
- 保留 APIC 等高级粒子方法的能力

### 设计理念
- 作为**轻量级插件**设计
- 兼容现有 FLIP、PIC 和 APIC 求解器
- 降低生产环境中大规模流体模拟的门槛

## 技术细节

### 性能数据
| 指标 | 改进 |
|------|------|
| 时间步长 | 增大 10 倍 |
| 加速比 | 数倍 |
| 规模 | 单工作站支持数十亿粒子 |

### 应用场景
- 电影/VFX 团队
- 更快的预演预览
- 更多创意迭代
- 更舒适的生产计划

## 可行性分析

### 渲染方法
- **类型**: 表面渲染（自由表面）+ 体积渲染（两相流）
- **技术**: SPH -> FLIP 扩展

### 性能预期
- **帧率**: 显著提升（取决于模拟规模）
- **GPU/CPU需求**: 单工作站即可处理大规模模拟
- **内存占用**: 优化

### 实现难度
- **复杂度**: 作为插件集成到现有求解器
- **推荐度**: ✅✅ **极具前景的生产工具**

## 关键词
- Spatiotemporal FLIP
- Fluid simulation
- Large time steps
- Free-surface
- Two-phase simulation
- PIC/FLIP/APIC
- Particle methods

---
*收录日期: 2026-07-12*
*来源: SIGGRAPH 2026 Technical Papers*
