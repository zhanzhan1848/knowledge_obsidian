---
type: paper
created: 2026-04-23
updated: 2026-04-23
tags: [geometry, convex-hull, simplification, optimization]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2604.14468
---

# Progressive Convex Hull Simplification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Progressive Convex Hull Simplification |
| **作者** | Alec Jacobson et al. |
| **发表** | arXiv cs.GR (Apr 2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.14468) |
| **DOI** | 10.48550/arXiv.2604.14468 |

---

## 核心贡献

> 将凸包简化为指定数量的半空间，保持体积/表面积误差最小

1. 在对偶表示（dual representation）中工作
2. 提出高效 O(n log n) 贪婪优化算法
3. 与现有方法对比：效率、紧密性、安全性更优

---

## 技术方案

### 核心思想

凸包在碰撞检测、光线求交、距离计算等任务中作为紧致包围代理，但多面体凸包复杂度随输入线性增长。论文提出将凸包保守简化为指定半空间数，同时最小化添加的体积或表面积。

### 关键技术

| 技术 | 说明 |
|------|------|
| Dual Representation | 对偶表示，工作于半空间而非顶点 |
| Greedy Optimization | O(n log n) 贪婪优化 |
| Conservative Simplification | 保守简化，保证包围性质 |

---

## 算法复杂度

- 时间: O(n log n)，n 为输入半空间数
- 空间: O(n)

---

## 实验结论

- 在各种输入形状和下游应用领域验证成功
- 效率、紧密性、安全性优于现有方法

---

## 相关工作

- [[Convex Hull]]
- [[Mesh Simplification]]
- [[Bounding Volume Hierarchy]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: O(n log n) 简化
- **适用场景**: 碰撞检测、GPU 包围体、实时渲染

---

## 开源参考

- libigl: 可能有 convex hull 相关
- Alec Jacobson 团队通常有开源代码
- 论文 PDF: https://arxiv.org/pdf/2604.14468