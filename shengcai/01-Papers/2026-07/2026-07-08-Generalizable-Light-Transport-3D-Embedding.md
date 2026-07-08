---
type: paper
created: 2026-07-08
updated: 2026-07-08
tags: [rendering, global-illumination, neural-rendering, transformer, path-guiding]
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
| **作者** | Bing Xu et al. |
| **发表** | SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2510.18189) |
| **DOI** | https://doi.org/10.1145/3799902.3811095 |

---

## 核心贡献

> 提出可泛化的 3D 光传输嵌入，直接从 3D 场景配置预测全局光照，无需光栅化或路径追踪线索

1. 提出可跨场景泛化的 3D 光传输嵌入
2. 将场景表示为带几何和材质特征的点云
3. 可扩展 transformer 建模点对点交互
4. 可用于加速无偏路径引导

---

## 技术方案

### 核心思想

现有神经全局光照方法主要依赖逐场景优化，跨场景泛化工作在 2D 屏幕空间，面临视角不一致和空间理解有限的问题。

本文方法：
- 从 3D 场景配置直接预测 GI，不使用光栅化或路径追踪
- 点云表示场景，带几何和材质特征
- Transformer 编码特征为神经基元
- 渲染时通过最近邻搜索和交叉注意力预测光照

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Light Transport Embedding | 3D 光传输嵌入 |
| Point Cloud Representation | 点云表示 |
| Transformer | 可扩展 transformer 模型 |
| Cross-Attention | 交叉注意力聚合 |
| Path Guiding | 路径引导加速 |

---

## 实验结论

- 在多样化室内场景展示漫反射 GI 预测
- 可快速适应新渲染任务
- 初步结果显示可加速无偏路径引导

---

## 局限性

- 主要针对漫反射材质
- 光泽材质结果为初步结果
- 依赖点云质量

---

## 实现建议

- **实现难度**: 高（需深度学习 + 渲染背景）
- **预期性能**: 推理快，但训练需要大量数据
- **适用场景**: 实时 GI 预览、交互式渲染
- **优先度**: 高（SIGGRAPH 2026，实用性较强）
