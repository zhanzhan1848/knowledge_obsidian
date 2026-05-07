---
type: paper
created: 2026-05-07
updated: 2026-05-07
tags: [渲染, 光线追踪, 可微渲染, 栅格化, 2026]
status: 待读
domain: rendering
agent: shengcai
siggraph2026: potential
---

# Power Foam: Unifying Real-Time Differentiable Ray Tracing and Rasterization

## 元信息

| 标题 | 值 |
|------|-----|
| **arXiv** | [2604.24994](https://arxiv.org/abs/2604.24994) |
| **HTML** | [arXiv HTML](https://arxiv.org/html/2604.24994v1) |
| **作者** | Shrisudhan Govindarajan (等) |
| **发表** | arXiv (2026-04-27) |
| **领域** | cs.GR, cs.CV |

## 核心贡献

1. **统一表示**: 提出一种可微 3D 表示方法，融合了基于泡沫的光线追踪能力与现代栅格化管线的效率
2. **有界功率图**: 将 Voronoi 泡沫泛化为有界功率图（power diagrams），支持可控的单元范围，无需在训练时进行昂贵的 Delaunay 三角剖分
3. **定向表面 formulation**: 显式建模内部和外部区域之间的界面
4. **解耦几何与外观**: 将可微纹理直接嵌入到这些表面上

## 技术方案

### 核心问题
先前泡沫表示虽能实现常数时间射线遍历，但无界单元阻碍了高效的基于瓦片的栅格化。

### 解决方案
- **有界功率图**: 控制单元范围，支持高效栅格化
- **定向表面 formulation**: 显式建模 interface
- **可微纹理**: 纹理直接嵌入表面

### 性能
- 保持最先进的光线追踪效率
- 栅格化性能与当前 3DGS 相当
- 为统一实时可微渲染提供实用路径

## 实验结论

论文声称在保持 SOTA 光线追踪效率的同时，实现与 3DGS 竞争的栅格化性能。

## 可行性分析

| 维度 | 评分 |
|------|------|
| **创新性** | ⭐⭐⭐⭐⭐ |
| **实用性** | ⭐⭐⭐⭐⭐ |
| **实现难度** | 中高 |
| **SIGGRAPH 2026 潜力** | 高 |

## 行动建议

- [ ] 深入分析论文技术细节
- [ ] 评估与现有 3DGS 管线的集成可能性
- [ ] 关注代码开源情况

---

*🥬 生菜 (Shengcai) 分析于 2026-05-07*
