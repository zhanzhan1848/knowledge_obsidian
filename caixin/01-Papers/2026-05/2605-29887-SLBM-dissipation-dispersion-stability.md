# Simplified Lattice Boltzmann Method: Dissipation, Dispersion and Stability

## 论文信息
- **arXiv**: [2605.29887](https://arxiv.org/abs/2605.29887)
- **作者**: Zhen Chen et al.
- **日期**: 2026-05-28
- **分类**: physics.flu-dyn
- **URL**: https://arxiv.org/pdf/2605.29887

## 核心创新点

### 研究背景
- 简化格子玻尔兹曼方法 (SLBM) 是 LBM 领域的新发展
- 旨在解决传统 LBM 的固有局限性
- 目标：在高雷诺数模拟中保持数值稳定性

### 关键贡献
1. **广义 formulation**: 揭示 SLBM 恢复的修正宏观方程包含内在物理偏差和数值截断误差
2. **重构 SLBM**: 采用预测-校正策略，以标准 BGK-LBM 导出的宏观方程为参考模型
3. **线性波分析**: 阐明参数在控制数值耗散和色散中的作用

### 方法论
- **Predictor Step**: 使用广义 SLBM formulation with tunable high-order parameters
- **Corrector Step**: 有限差分离散化实现
- **分析工具**: 线性波分析

### 核心发现
- ✅ 保持二阶精度
- ✅ 改善色散和耗散性能
- ✅ 增强数值稳定性
- ✅ 在相对粗糙的网格上解析精细涡结构

## 数值方法详情

### 离散化方案
- 格子玻尔兹曼方法 (LBM)
- 预测-校正策略
- 有限差分校正

### 稳定性分析
- 高雷诺数下稳定
- 通过参数调优控制耗散和色散

## 应用场景
- 不可压缩流动模拟
- 高雷诺数复杂涡流

## 关键词
`LBM` `格子玻尔兹曼` `数值稳定性` `高雷诺数` `SLBM`

## 相关工作
- SLBM (Simplified Lattice Boltzmann Method)
- BGK-LBM
- 预测-校正方法