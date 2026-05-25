---
tags: [几何, 非流形几何, 切空间, 参数化]
created: 2026-05-25
---

# Tangent Blow-Ups for Processing Non-Manifold Geometry

## 核心方法

引入 **"tangent blow-up"** 表示，将几何数据提升到 (ambient space × Grassmannian) 乘积空间，恢复奇点处的结构。

## 关键概念

- 将切平面信息编码到几何表示中
- 迭代构造后，位置相同但切方向/曲率不同的高阶接触点被很好分离
- 配备乘积度量并直接定义离散微分算子（梯度、散度、拉普拉斯算子）

## 应用场景

1. **测地线计算** (Geodesic computation)
2. **分割** (Segmentation)
3. **表面参数化** (Surface parameterization)
4. **曲率估计** (Curvature estimation)

## 创新点

- 处理 sharp features（边缘、角点、自相交、分支连接）
- 这些奇点处标准方法无定义
- 代数几何启发的表示

## 算法复杂度

- 预处理：切空间 blow-up 构造
- 查询：子线性复杂度

## 开源参考

- 归属：MIT / Justin Solomon group

## 与墨鱼丸共享

**相关性**: 中高 - 扩展几何处理工具到非流形场景
**实现建议**: 可与 libigl 的 geodesic 函数结合使用