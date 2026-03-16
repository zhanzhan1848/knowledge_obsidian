---
tags: [几何, 曲面插值, RBF, Clough-Tocher, 数值方法]
arxiv_id: 2603.10590
date: 2026-03-12
status: new
---

# Exact Interpolation under Noise: A Reproducible Comparison of Clough-Tocher and Multiquadric RBF Surfaces

## 元信息
- **arXiv ID**: [2603.10590](https://arxiv.org/abs/2603.10590)
- **发布日期**: 2026-03-12
- **作者**: Mirkan Emir Sancak et al.
- **分类**: cs.GR (Graphics)
- **PDF**: [Link](https://arxiv.org/pdf/2603.10590)

## 核心问题
在有噪声的情况下，Clough-Tocher和Multiquadric RBF曲面插值方法的性能比较

## 核心方法
### 实验设计
- **统一评估**: 相同的合成函数族
- **训练/测试分离**: Slice-wise protocol
- **两种场景**:
  1. 无噪声观测
  2. 有噪声观测

### 评估指标
- RMSE (均方根误差)
- MAE (平均绝对误差)
- R² (决定系数)

### 可复现性
- ✅ 单一SciPy/NumPy脚本
- ✅ 固定随机种子
- ✅ 重复分割
- ✅ Bootstrap不确定性总结

## 算法复杂度
### Clough-Tocher
- **时间**: O(n log n) Delaunay三角化
- **空间**: O(n)
- **分段**: 每个三角形内三次多项式

### Multiquadric RBF
- **时间**: O(n³) 矩阵求逆
- **空间**: O(n²)
- **全局**: 所有数据点参与

## 实验结果
### 无噪声场景
- ✅ 两种方法都达到高精度
- ✅ 性能取决于输出特性
- ⚖️ 各有优势

### 有噪声场景
- ❌ 精确插值会过拟合噪声节点
- ❌ 两种方法的样本外性能都下降
- ✅ **Clough-Tocher相对更稳定**

## 创新点
1. **公平比较**: 统一评估框架
2. **可复现**: 完整的脚本和固定种子
3. **实用建议**: 环境工程中的应用指导
4. **Bootstrap**: 不确定性量化

## 应用启示
### 环境工程
- 噪声测量不应默认丢弃
- 可以通过结构化和插值恢复物理意义
- 热力学过程系统分析

## 局限性
- 仅测试了两种方法
- 合成函数可能不完全代表真实数据
- 未考虑其他RBF核函数

## 可行性评估
### 实现难度: **低**
- **算法复杂度**: 低（标准库支持）
- **数值稳定性**: 高（成熟方法）
- **依赖项**: SciPy, NumPy

### 推荐度: ✅ **推荐参考**
- 适用于曲面重建和插值
- 对噪声数据处理的实用指导
- 可集成到几何处理流程

## 开源参考
- **SciPy**: `scipy.interpolate.CloughTocher2DInterpolator`
- **SciPy**: `scipy.interpolate.Rbf`
- **CGAL**: Surface reconstruction
- **论文代码**: ✅ 完全可复现（单脚本）

## 相关工作
- Radial basis functions
- Spline interpolation
- Surface reconstruction
- Scattered data interpolation

## 应用场景
1. 地形重建
2. 科学数据可视化
3. 传感器数据插值
4. 环境建模

## 技术关键词
```
#surface-interpolation #RBF #Clough-Tocher
#noise-robustness #reproducible-research
#scipy #scattered-data #cubic-spline
```

## 笔记链接
- [[曲面插值]]
- [[RBF方法]]
- [[数值方法比较]]
- [[科学计算]]

## 实用建议
对于几何处理应用：
- ✅ **无噪声**: 根据输出特性选择
- ✅ **有噪声**: 优先考虑Clough-Tocher
- ✅ **计算资源有限**: Clough-Tocher更高效
- ⚠️ **需要全局平滑**: 考虑Multiquadric

---
*创建时间: 2026-03-16 14:08 UTC*
*创建者: 娃娃菜 (wawaicai)*
