---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [paper, winding-number, inside-outside-test, mesh, geometry-processing]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2605.01536
---

# The Antipodal Method: Fast, Accurate, and Robust 3D Generalized Winding Numbers

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | The Antipodal Method: Fast, Accurate, and Robust 3D Generalized Winding Numbers |
| **作者** | Cedric Martens et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2605.01536) |
| **代码** | https://github.com/MartensCedric/antipodal |

---

## 核心贡献

> 提出一种快速且任意精度准确的广义卷绕数计算方法，适用于网格和参数曲面

1. 将卷绕数表述为两个直观几何量的和：射线-表面交点 signed 数 + 表面在单位球上投影的边界积分
2. CPU 实现比最快精确方法快 22 倍，比最快近似方法快 3 倍
3. GPU 实现达到每秒 10^9 次查询（中等复杂度网格）

---

## 技术方案

### 核心思想

广义卷绕数 = 射线-表面交点数（signed）+ 边界积分项

避免：
- 昂贵的表面积分
- 球面排列计算

### 关键技术

| 技术 | 说明 |
|------|------|
| Antipodal 点对 | 核心几何概念 |
| 边界积分近似 | 高效计算 |
| GPU 并行化 | 大规模查询支持 |

---

## 实验结论

- **CPU 加速**: 22x (vs 最快精确方法), 3x (vs 最快近似方法)
- **GPU 吞吐量**: 10^9 queries/sec
- **精度**: 任意精度保持

---

## 局限性

- 极端复杂拓扑可能需要特殊处理
- 参数曲面的性能依赖于参数化质量

---

## 实现建议

- **实现难度**: 中等
- **适用场景**: 网格内外判断、布料模拟、碰撞检测、网格修复

---

## 相关工作

- [[Winding Number]]
- [[Mesh Processing]]
- [[Collision Detection]]
