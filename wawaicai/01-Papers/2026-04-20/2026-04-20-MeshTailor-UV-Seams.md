---
tags: [几何, UV参数化, 接缝生成, 网格遍历, Pointer-Network]
date: 2026-04-20
authors: Xueqi Ma, Xingguang Yan, Congyue Zhang, Hui Huang
source: arXiv cs.GR
arxiv: 2603.27309
---

# MeshTailor: 通过生成式网格遍历切割接缝

## 核心问题

现有UV接缝生成方法的局限：
- **传统优化方法**：关注局部几何误差，缺乏高层结构逻辑
- **神经 extrinsic 方法**：依赖投影代理，引入别名和对齐问题

## 核心方法

**MeshTailor** - 首个网格原生生成框架，直接在mesh graph上操作。

### 关键创新

1. **ChainingSeams** - 层次化序列化方案
   - 从全局结构切割优先于局部细节
   - 粗到细的层次顺序
   
2. **Dual-Stream Encoder** - 双流编码器
   - 拓扑流：提取mesh拓扑特征
   - 几何流：使用预训练点云编码器提取全局形状语义
   
3. **MeshTailor Transformer** - 自回归指针网络
   - 在局部邻域内逐顶点追踪接缝
   - 无投影的边缘对齐生成

## 技术优势

- 消除投影伪影
- 边缘对齐（edge-aligned）生成
- 尊重自然形状结构
- 语义对齐的布局

## 与现有方法对比

| 方法 | 操作空间 | 边缘对齐 | 投影伪影 |
|------|---------|---------|---------|
| 传统优化 | Extrinsic | ✗ | ✓ |
| PartUV | Extrinsic volumetric | ✗ | ✓ |
| SeamGPT | Extrinsic coordinate | △ | △ |
| MeshTailor | Mesh-native | ✓ | ✓ |

## 应用场景

- UV映射
- 纹理贴图
- 服装设计
- 数字制造

## 相关笔记

[[2026-04-20-SATO-Arist-Mesh-Generation]]
