---
type: paper
created: 2026-07-06
updated: 2026-07-06
tags: [paper, neural-texturing, albedo, relighting, physically-principled]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.30677
---

# DANTE-W: Diffuse Albedo Neural Texturing in the Wild

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Diffuse Albedo Neural Texturing in the Wild |
| **作者** | Guangyu Wang et al. |
| **发表** | arXiv cs.GR (2026) |
| **链接** | [原文](https://arxiv.org/abs/2606.30677) |
| **DOI** | 10.48550/arXiv.2606.30677 |
| **代码** | http://dante-wild.github.io |

---

## 核心贡献

> 从无结构图像集合中恢复高保真漫反射反照率纹理，集成到传统 3D 重建管线，支持任意场景重新照明

1. **野外漫反射反照率恢复**：解决传统网格纹理化中 baked-in shading 和 cast shadow 问题
2. **神经纹理框架**：在纹理空间中融合视角生成漫反射反照率先验，通过物理原则神经渲染增强细节
3. **基准数据集**：包含真实野外场景和合成物体的多样化细粒纹理基准

---

## 技术方案

### 核心思想

传统多视图图像融合技术不可避免地混合了着色和阴影。该方法在纹理空间中用神经网络融合视角生成反照率先验，结合物理原则渲染恢复准确反照率。

### 关键技术

| 技术 | 说明 |
|------|------|
| 视角空间生成反照率先验 | 神经网络预测各视角反照率 |
| 纹理空间融合 | 在统一 UV 空间融合为先验 |
| 物理原则神经渲染 | 增强细粒纹理细节 |

---

## 实验结论

- **反照率准确性**：在 Relighting 任务中显著提升逼真度
- **大规模野外场景**：支持任意规模场景
- **传统管线兼容**：无缝集成现有 3D 重建流程

---

## 局限性

- 依赖预训练的生成先验
- 对极端光照条件鲁棒性待验证

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 离线处理为主
- **适用场景**: 文化遗产数字化、照片级 3D 重建、重光照应用
