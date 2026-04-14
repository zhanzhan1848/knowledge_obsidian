# Adaptive GPU Kinetic Solver for Fluid-Granular Flows

## 论文信息
- **arXiv ID**: 2603.14982v1
- **作者**: Xingqiao Li et al.
- **发表日期**: 2026-03-16
- **分类**: cs.GR
- **PDF**: https://arxiv.org/pdf/2603.14982v1
- **HTML**: https://arxiv.org/html/2603.14982v1

## 研究领域
- [[流体模拟]]
- [[粒状物流]]
- [[LBM]]
- [[MPM]]
- [[GPU 并行]]

## 核心创新点

### 问题
流体-粒状物流模拟对于理解自然灾害、工业过程和计算机图形学中的视觉真实现象至关重要。由于连续流体和离散粒状介质之间的强非线性耦合，在大规模情况下实现物理保真度和计算效率都很困难。

### 方法：统一框架
1. **LBM + MPM 耦合**: 格子玻尔兹曼方法（LBM）用于流体，物质点方法（MPM）用于粒状材料（沙、雪）
2. **自适应块多级 HOME-LBM 求解器**: 基于固体几何结构实现高效内存使用和多 lattice 分辨率计算性能
3. **一致缩放定律**: 跨精炼界面精确传递宏观量的矩一致缩放定律
4. **GPU 动态多级块维护**: GPU 算法根据粒子运动动态维护多级块
5. **精确双向耦合**: 通过强制所有 MPM 粒子位于最细流体节点内实现

### 应用场景
- 雪崩 (snow avalanches)
- 沙尘暴 (sandstorms)
- 沙迁移 (sand migration)

## 渲染方法
- **类型**: 流体模拟
- **技术**: Lattice Boltzmann Method (LBM) + Material Point Method (MPM)

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 是

## 性能预期
- **帧率**: 待定
- **GPU 需求**: 高
- **内存占用**: 高效（自适应块结构）

## 实现建议
- **着色器复杂度**: 高（GPU 并行）
- **管线要求**: GPU 计算管线
- **推荐度**: ✅ 大规模流体-粒状物流的有力方案

## 关键技术
- 格子玻尔兹曼方法 (Lattice Boltzmann Method)
- 物质点方法 (Material Point Method)
- 自适应块结构 (Adaptive Block Structure)
- HOME-LBM (Higher Order Moment Exchange)

## 相关工作
- MantaFlow
- Fluid-granular simulation
- LBM for fluids
- MPM for granular materials

## 待深入
- [ ] 获取具体性能数据
- [ ] 了解与 MantaFlow 等现有框架的对比
