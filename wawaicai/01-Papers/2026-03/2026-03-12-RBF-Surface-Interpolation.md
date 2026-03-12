---
tags: [geometry, surface-interpolation, RBF, spline, numerical]
arxiv: 2603.10590
date: 2026-03-12
status: new
priority: medium
---

# Exact Interpolation under Noise: Clough-Tocher vs Multiquadric RBF Surfaces

## 基本信息
- **标题**: Exact Interpolation under Noise: A Reproducible Comparison of Clough-Tocher and Multiquadric RBF Surfaces
- **作者**: Mirkan Emir Sancak
- **arXiv**: [2603.10590](https://arxiv.org/abs/2603.10590)
- **发表日期**: 2026-03-11
- **分类**: cs.GR (Graphics)

## 核心问题
比较三次样条 (Clough-Tocher) 和径向基函数 (Multiquadric RBF) 插值方法在多变量曲面分析中的表现，特别是在有噪声的情况下。

## 核心方法

### 实验设计
1. **统一协议**: 相同的 slice-wise train/test 协议
2. **测试数据**: 合成函数族
3. **评估指标**: RMSE, MAE, R²
4. **两种场景**:
   - 无噪声观测
   - 有噪声观测

### 关键发现
1. **无噪声场景**: 两种插值器都能达到高精度，各有优势
2. **有噪声场景**: 精确插值会过拟合噪声节点，降低样本外性能
3. **稳定性**: 三次插值器在噪声环境下相对更稳定

## 复杂度分析
- **Clough-Tocher**: O(n) 构建复杂度
- **Multiquadric RBF**: O(n²) 或 O(n log n) 使用快速方法

## 开源参考
- **实现**: SciPy/NumPy 脚本
- **可复现**: 固定随机种子，重复划分，Bootstrap 不确定性

## 实践意义
从环境工程角度，噪声或不一致的测量不应默认丢弃；可以通过结构化和插值恢复物理上有意义的过程行为。

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 低 - 标准插值方法 |
| 数值稳定性 | 中 - 噪声敏感 |
| 依赖项 | SciPy, NumPy |
| 实现难度 | 低 |

## 推荐结论
⚠️ **参考价值**

### 理由
1. 系统性的插值方法比较
2. 完全可复现的实验设计
3. 对噪声处理的实用建议
4. SciPy 实现，易于集成

### 应用场景
- 点云曲面重建
- 传感器数据处理
- 地理空间数据插值

## 相关笔记
- [[Surface Interpolation Methods]]
- [[RBF Networks]]
- [[Spline Surfaces]]

---
🥬 由娃娃菜 (Wawaicai) 自动生成 | 2026-03-12
