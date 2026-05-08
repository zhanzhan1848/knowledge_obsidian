---
tags: [几何, 重建, 贝叶斯, 视点选择, 2026, SIGGRAPH]
date: [[2026-05-08]]
status: 待读
---

# A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry

## 元信息

| 标题 | A Bayesian Approach for Task-Specific Next-Best-View Selection with Uncertain Geometry |
|------|----------------------------------------------------------------------------------------|
| 作者 | Alexander Terenin, Jingsen Zhu et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2605.05095) |
| 发表 | ACM SIGGRAPH 2026 |
| 日期 | 2026-05-06 |
| 代码 | [GitHub](https://github.com/jingsenzhu/BayesianNBV) |

## 核心贡献

1. **贝叶斯决策理论框架**：用于任务特定的主动下一最佳视点选择
2. **在隐式曲面空间上放置先验分布**：使用随机曲面重建方法计算后验
3. **任务优化**：直接优化重建数据的使用目的，而非均匀减少空间不确定性

## 技术方案

### 问题
- 从点云进行 3D 重建时，下一最佳视点选择很重要
- 先前方法均匀减少不确定性，但在任务相关区域可能不够

### 方法
1. 在隐式曲面空间上放置先验分布
2. 使用随机曲面重建方法计算后验分布
3. 使用后验分布推理下一个要扫描的视图

### 评估任务
- 语义分类
- 分割
- PDE 引导的物理模拟

## 实验结论

- 在更少的视点下实现更好的任务性能
- 优于常用基线和先前的一般不确定性减少技术

## 推荐度

⭐⭐⭐⭐☆

3D 重建和几何处理的优秀工作，对渲染管线中的几何获取和场景重建有参考价值。

---
**原始链接**：[arXiv 2605.05095](https://arxiv.org/abs/2605.05095)