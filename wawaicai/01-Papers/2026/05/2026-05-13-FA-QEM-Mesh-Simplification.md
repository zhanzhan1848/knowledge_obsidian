---
type: paper
created: 2026-05-13
updated: 2026-08-31
tags: [paper, mesh-simplification, quadric-error, feature-preservation, CVPR-workshop]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.14029
---

# Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets |
| **作者** | Kunal Bhosikar et al. |
| **发表** | CVPR 2026 Workshop on 3D Geometry Generation (Best Paper Award Runner-up) · May 13, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2605.14029) |
| **代码** | - |

---

## 核心贡献

> 提出 FA-QEM（Feature-Aware Quadric Error Metric），一种专为现代3D资产生设计的高效鲁棒网格简化流程。

1. **多分量Quadric误差度量**：联合编码几何偏差、边界曲率和法向量一致性，实现最优顶点放置
2. **尖特征保真**：即使在激进简化下也能保留锐利几何特征
3. **appearance transfer 前端**：几何简化改善下游外观迁移，作为纹理映射的优越前端
4. **鲁棒性**：在 Thingi10K 和真实世界数据集上保持鲁棒性

---

## 技术方案

### 核心思想

现代生成/重建管道产生的网格通常密集、噪声且非流形，传统 QEM 方法难以处理。FA-QEM 提出多分量误差度量，同时考虑几何精度和视觉特征。

### 关键技术

| 技术 | 说明 |
|------|------|
| 特征感知多分量QEM | 几何误差 + 边界曲率 + 法向量一致性 |
| 顶点最优放置 | 基于多分量误差的最小二乘优化 |
| 纹理保留简化 | 基于连续映射的纹理保真策略 |
| 非流形网格处理 | 对 real-world 数据的鲁棒性设计 |

### 公式

FA-QEM 误差度量：
```
E_FA(v) = E_geo(v) + λ_b · E_boundary(v) + λ_n · E_normal(v)
```

其中 E_geo 为标准 QEM 几何误差，E_boundary 编码边界曲率惩罚，E_normal 惩罚法向量不一致。

---

## 实验结论

- **数据集**: Thingi10K、真实世界纹理物体数据集
- **基线**: 标准 QEM、QuadricSimplification 等
- **结果**: 
  - 一致的更低几何误差
  - 更好的视觉保真度
  - 显著更快的运行时间
  - 跨各种挑战性输入保持鲁棒性

---

## 局限性

- 仍依赖边折叠操作，对于极端简化的网格质量有限制
- 超参数（λ_b, λ_n）需要针对不同类型网格调优
- 对于动态形变场景支持有限

---

## 相关工作

- [[网格简化]]
- [[Quadric误差度量]]
- [[边折叠]]
- [[尖特征保留]]

---

## 开源实现参考

- libigl: `quadric_error_metric_decimation()`
- CGAL: `Quadric_error_measure` 类
- 论文源码待发布

---

## 实现建议

- **实现难度**: 中（基于标准QEM扩展）
- **预期性能**: 高速率简化，优于传统 QEM
- **适用场景**: 3D 资产生成管线、模拟前处理、AR/VR 资产优化
