---
title: A Generalizable Light Transport 3D Embedding for Global Illumination
authors: Liwen Wu, Haolin Lu, Bing Xu, Miloš Hašan, Ravi Ramamoorthi
date: 2026-07-19
source: SIGGRAPH 2026 Conference Papers
url: https://arxiv.org/html/2510.18189v2
pdf: https://arxiv.org/pdf/2510.18189v2
tags: [rendering, global-illumination, neural-rendering, light-transport, transformer, SIGGRAPH2026, 2026]
status: unread
---

# A Generalizable Light Transport 3D Embedding for Global Illumination

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Generalizable Light Transport 3D Embedding for Global Illumination |
| 作者 | Liwen Wu, Haolin Lu, Bing Xu, Miloš Hašan, Ravi Ramamoorthi |
| 来源 | SIGGRAPH Conference Papers '26 (July 19-23, 2026, Los Angeles) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/html/2510.18189v2) |
| PDF | [下载](https://arxiv.org/pdf/2510.18189v2) |
| DOI | 10.1145/3799902.3811095 |

## 核心贡献
1. **可扩展的 3D 嵌入**: 使用点云和线性复杂度 Transformer 克服二次内存瓶颈
2. **分辨率无关解码**: 局部解码机制确保视图一致性和大规模场景的泛化能力
3. **大规模数据集**: 发布 ~14k 复杂室内场景数据集用于学习光传输
4. **架构多用途性**: 可迁移编码器支持专用任务（如 glossy 材质的空间-方向辐射场预测）

## 技术方案

### 问题背景
- **Global Illumination (GI)**: 对真实性至关重要，但计算成本高
- **现有方法局限**:
  - Per-scene neural methods 缺乏泛化能力
  - Screen-space approaches 存在视图不一致问题
  - 3D 神经渲染方法面临严重可扩展性障碍

### 核心方法
1. **Point-based Representation**
   - 点云表示解耦了照明分辨率与原始场景拓扑
   - 将光源和几何统一为单一表示

2. **Linear-Complexity Transformer**
   - 编码长程光传输
   - 替代二次复杂度的全局注意力

3. **Local Query Mechanism**
   - 固定局部邻域（k-NN）检索特征
   - 独立处理每个渲染查询
   - 确保常数每像素复杂度

4. **3D Supervision**
   - 世界空间直接监督
   - 保证视图一致性和对相机轨迹偏移的鲁棒性

### 关键公式
```
Light Transport Operator ≈ Attention Mechanism
Neumann Series (light transport) ↔ Stacked Self-Attention (transformers)
```

### 性能指标
- 可扩展至数百万三角形的环境
- 首次在复杂高保真室内场景上实现可泛化的 GI 学习
- 视图一致性和分辨率无关

## 实验结论
- 在复杂室内场景上验证方法
- 支持可迁移编码器用于下游渲染任务
- 优于之前的 object-centric 方法

## 局限性
- 主要验证室内场景
- Glossy 材质为初步结果

## 可行性分析
- **实现难度**: 高（Transformer 架构、点云处理）
- **性能预期**: 优秀 - 可扩展至大规模场景
- **适用场景**: 实时全局光照、游戏、虚拟现实

## 相关工作
- [[Neural Radiance Caching]]
- [[Precomputed Radiance Transfer]]
- [[RenderFormer]]
- [[Point Transformer]]

## 笔记
SIGGRAPH 2026 论文。关键创新在于将光传输算子类比于注意力机制，使用线性复杂度 Transformer 实现可扩展的全局光照预测。点云表示和局部查询机制是实现大规模场景处理的关键。
