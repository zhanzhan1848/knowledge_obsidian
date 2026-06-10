# Sharp-interface Immersed Boundary Method for Moving Bodies

**arXiv**: [2606.09799](https://arxiv.org/abs/2606.09799)  
**日期**: 2026-06-09  
**分类**: 数值方法 / 浸入边界法  

## 核心贡献

提出一种新型 **sharp-interface immersed boundary method (IBM)**，用于模拟涉及运动、可变形、任意厚度物体的不可压缩流动。

## 创新点

1. **Fast tagging algorithm**: 快速标记算法
2. **Two-sided Eulerian forcing strategy**: 双侧欧拉强迫策略
3. **Consistent mass correction**: 一致质量修正，降低分数步分裂误差
4. **保持离散拉普拉斯算子结构**: 避免 cut-cell、multigrid、projection 类方法的开销

## 关键特性

- ✅ **二阶精度** no-slip 边界条件
- ✅ **自然处理运动边界**
- ✅ **小蒸腾误差 (transpiration errors)**
- ✅ 保持直接泊松求解器效率
- ✅ 兼容刚体/可变形/湍流/生物流动

## 验证案例
- 刚体运动
- 可变形体
- 湍流
- 生物启发流动 (biologically inspired flows)

## 数值方法分类
```
离散化: 有限差分 / 有限体积
求解器: 直接 Poisson 求解器
界面处理: Sharp-interface (vs diffuse-interface)
```

## 计算成本
- 无 multigrid 开销
- 无 cut-cell 复杂性
- 保持标准投影法效率

## 相关公式 (核心)
- 质量修正项: 减少分裂误差
- 双侧强迫: F = (F^+ + F^-)/2

## 可行性分析
✅ **推荐实现** — 方法创新性强，适合复杂几何运动问题