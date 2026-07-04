---
title: A Generalizable Light Transport 3D Embedding for Global Illumination
authors: Bing Xu et al.
date: 2026-06-12
source: arXiv cs.GR (SIGGRAPH 2026)
url: https://arxiv.org/abs/2510.18189
pdf: https://arxiv.org/pdf/2510.18189
tags: [rendering, global-illumination, neural, transformer, SIGGRAPH-2026]
status: unread
---

# A Generalizable Light Transport 3D Embedding for Global Illumination

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Generalizable Light Transport 3D Embedding for Global Illumination |
| 作者 | Bing Xu et al. |
| 来源 | arXiv cs.GR (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2510.18189) |
| PDF | [下载](https://arxiv.org/pdf/2510.18189) |

## 核心贡献
1. **可扩展3D嵌入**: 基于点云和线性复杂度Transformer的全局光照预测，支持数百万三角面的大规模场景
2. **分辨率无关解码**: 通过3D监督的局部解码机制，确保视图一致性和分辨率无关性
3. **~14k室内场景数据集**: 提供多样化布局、几何和纹理的复杂室内场景基准
4. **架构通用性**: 可迁移的编码器，支持扩展到光泽材料的空-方向辐射场预测

## 技术方案

### 核心思想
提出一种通用化光传输3D嵌入方法，直接从3D场景配置预测全局光照，无需光栅化或路径追踪照明线索。

### 三大可扩展性设计
1. **点基原语**: 将光照分辨率与原始场景拓扑解耦
2. **线性复杂度Transformer**: 替换二次全局注意力，高效编码长程光传输
3. **独立局部解码**: 每个查询独立处理，固定KNN邻居，无场景大小依赖

### 光传输与注意力的类比
```
光传输 (Neumann级数展开) ←→  Transformer中的堆叠自注意力
光线递归传播 ←→  特征通过连续Transformer层传递
```

### 场景离散化
- **Scene Points**: 从几何采样 ~20k 点，每个点包含 (位置p, 法线n, 反射率c, 自发光e)
- **Query Points**: 光线交点，用于着色
- **Light Sources**: 作为点云统一表示，支持面光源、点光源等

### Nearest Neighbor Embedding (NNE)
```math
\{\widetilde{X}_l\}^m = FPS(\{X_i\}^M)
X_i = F((p_i, n_i, c_i, e_i))
```

### 编码器架构
使用 PointTransformerV3 作为编码器骨干，通过序列化patch注意力扩展到大规模点云。

## 实验结论

- 在复杂室内场景（数百万三角面）上实现首次通用化GI学习
- 训练于~14k场景，泛化到未见过的场景
- 可扩展到2688×1152分辨率
- 光泽材料初步结果显示可用于加速无偏路径引导

## 局限性

- 目前主要验证于漫反射GI
- 光泽材料为初步结果
- 需要预计算点云特征

## 可行性分析

- **实现难度**: 高（需要Transformer和点云处理经验）
- **性能预期**: 推理速度快，支持实时应用
- **适用场景**: 室内场景全局光照、路径追踪加速、神经渲染

## 相关工作

- [[Neural Global Illumination]]
- [[Point Transformer]]
- [[Light Transport Prediction]]
- [[RenderFormer]]

## 笔记

**创新性**: ⭐⭐⭐⭐⭐ - 突破性解决3D神经GI的可扩展性问题

**实用性**: ⭐⭐⭐⭐ - 提供开源数据集和代码

**技术亮点**: 
- 光传输算子与注意力的数学类比
- 线性复杂度设计
- 3D监督保证视图一致性

**传递给 @墨鱼丸**: 
- 论文: arXiv:2510.18189
- 关键: PointTransformerV3编码器 + 局部KNN解码
- 数据集: ~14k室内场景（可联系作者获取）
