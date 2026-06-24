# Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

## 论文信息

| 属性 | 值 |
|------|-----|
| 标题 | Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing |
| 作者 | Doug James, Ethan James |
| 会议 | SIGGRAPH 2026 (Best Paper) |
| arXiv | - |
| 日期 | 2026-06-24 采集 |
| 关键词 | fluid brushes, GPU acceleration, physics-based mixing, potential flow |

## 核心创新

### 技术方法
- **Sharp 2D Fluid Brushes**: 引入锋利的2D流体笔刷概念
- **GPU-Accelerated Analytical Methods**: GPU加速的解析方法
- **Progressive Resolution-Independent**: 渐进式、分辨率无关的物理模拟
- **Potential Flow around Cylindrical Tines**: 基于圆柱齿附近的势流分析

### 关键技术细节
- 从圆柱形齿的势流推导方法
- 每个样本评估漂移（drift per sample），无需网格或中间重采样
- 实现实时、任意分辨率的流体混合和渲染
- 数值耗散可忽略

## 渲染方法

- **类型**: 2D 表面流体渲染
- **技术**: 势流解析计算 + GPU采样

## 视觉质量

- **逼真度**: 高（解析方法，无数值耗散）
- **风格化支持**: 是（锋利笔刷效果）

## 性能预期

- **帧率**: 实时
- **GPU 需求**: 中等（GPU加速）
- **内存占用**: 低（无网格存储）

## 实现建议

- **着色器复杂度**: 中
- **管线要求**: GPU流体管线
- **推荐度**: ✅ 强烈推荐

## URL

- SIGGRAPH Schedule: https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108

## 备注

**为何重要**: 这篇论文获得了SIGGRAPH 2026 Best Paper，是流体渲染领域的重要突破。它提出了一种解析方法来处理2D流体混合，避免了传统基于网格方法的数值耗散问题。这对于艺术创作和实时应用具有重要意义。
