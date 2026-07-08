# SIGGRAPH 2026 流体渲染相关论文

> 日期：2026-07-08
> 来源：SIGGRAPH 2026 Technical Papers Awards
> 关键词：fluid rendering, FLIP, volume rendering

---

## 1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**作者**：Doug James, Ethan James

**会议**：SIGGRAPH 2026 - **Best Paper**

**摘要**：
Mixwell introduces sharp 2D fluid brushes and GPU-accelerated analytical methods for progressive, resolution-independent, physics-based mixing. Derived from potential flow around cylindrical tines, Mixwell evaluates drift per sample without grids or intermediate resampling, enabling real-time, arbitrary-resolution fluid mixing, and rendering with negligible numerical dissipation.

**技术要点**：
- 2D 流体笔刷
- GPU 加速解析方法
- 基于圆柱齿绕势流的推导
- 无网格、无重采样的漂移评估
- 实时、任意分辨率流体混合与渲染
- 极低的数值耗散

**渲染类型**：表面渲染 / 粒子渲染

**创新点**：
- 渐进式物理混合
- 分辨率无关
- 解析计算（非数值方法）

**URL**：待补充

---

## 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**作者**：Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey

**会议**：SIGGRAPH 2026 - **Honorable Mention**

**摘要**：
（从标题推测）提出一种时空 FLIP 方法，用于大时间步长的快速自由表面和两相流体模拟。

**技术要点**：
- FLIP (Fluid-Implicit Particle) 方法
- 大时间步长模拟
- 自由表面模拟
- 两相流模拟
- 实时性能优化

**渲染类型**：体积渲染 / 表面渲染

**相关方法**：
- FLIP/PIC 方法
- 粒子-网格耦合
- 自由表面追踪

**URL**：待补充

---

## 3. Sample Matching for Joint Extinction Gradient Estimation in Differentiable Volume Rendering

**作者**：Ruihan Yu, Yu-Chen Wang, Jingwang Ling, Feng Xu, Shuang Zhao

**会议**：SIGGRAPH 2026

**摘要**：
关于可微分体积渲染中的联合消光梯度估计的样本匹配方法。

**技术要点**：
- 可微分体积渲染
- 消光梯度估计
- 样本匹配
- 神经渲染

**渲染类型**：体积渲染

**创新点**：
- 联合消光梯度估计
- 改进体积渲染梯度流

**URL**：待补充

---

## 附：SIGGRAPH 2026 流体相关趋势

根据 SIGGRAPH 2026 Technical Papers Showcase，以下是流体渲染领域的趋势：

1. **流体模拟改进**：关注模拟速度、稳定性和大规模时间步长
2. **可微分渲染**：将梯度信息引入流体渲染管线
3. **实时性能**：GPU 加速和解析计算方法
4. **两相流模拟**：自由表面与多相流体

---

## 搜索元数据

- 搜索时间：2026-07-08 14:10 UTC
- 搜索范围：SIGGRAPH 2026, arXiv cs.GR
- 关键词：fluid, water, smoke, fire, rendering, FLIP, volume rendering
- 结果备注：arXiv cs.GR 最近24小时无直接相关新论文
