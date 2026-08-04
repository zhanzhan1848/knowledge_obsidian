---
type: paper
created: 2026-08-04
updated: 2026-08-04
tags: [paper, global-illumination, neural-rendering, light-transport, siggraph2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2510.18189
---

# A Generalizable Light Transport 3D Embedding for Global Illumination

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Generalizable Light Transport 3D Embedding for Global Illumination |
| **作者** | Bing Xu (et al.) |
| **发表** | SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2510.18189) |
| **DOI** | 10.48550/arXiv.2510.18189 |
| **代码** | - |

---

## 核心贡献

> 提出可泛化的3D光传输嵌入方法，直接从3D场景配置预测全局光照，无需光栅化或路径追踪线索

1. 提出可泛化的3D光传输嵌入，将场景表示为带几何和材质特征的点云
2. 使用可扩展Transformer建模点对点交互，编码为神经基元
3. 渲染时通过最近邻搜索和交叉注意力聚合邻近基元特征
4. 可泛化到不同室内场景，支持有限微调的快速适配

---

## 技术方案

### 核心思想

将学习到的光传输先验集成到渲染管线中，无需显式光线追踪照明线索。使用3D点云表示场景，通过Transformer编码全局点对点交互。

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D点云表示 | 包含几何和材质特征 |
| 可扩展Transformer | 建模点对点交互，编码特征到神经基元 |
| 最近邻搜索 | 渲染时检索邻近基元 |
| 交叉注意力 | 聚合特征预测渲染量 |

---

## 实验结论

- **数据集**: 多样化室内场景（不同布局、几何、材质）
- **任务**: 漫射全局光照预测、镜面材质空间方向辐射场估计
- **应用**: 可加速无偏路径引导

---

## 局限性

- 主要针对漫射全局光照
- 镜面材质结果为初步验证

---

## 实现建议

- **实现难度**: 高（需训练Transformer）
- **预期性能**: 实时查询速度
- **适用场景**: 跨场景全局光照预测、神经渲染加速