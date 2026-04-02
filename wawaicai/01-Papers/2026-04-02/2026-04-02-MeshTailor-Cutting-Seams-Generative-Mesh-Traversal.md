---
title: "MeshTailor: Cutting Seams via Generative Mesh Traversal"
arXiv: "2603.27309"
authors: "Xueqi Ma, Xingguang Yan, Congyue Zhang, Hui Huang (Shenzhen Univ, SFU)"
date: 2026-03-28
tags: [几何, 网格处理, UV映射, 接缝生成, 生成式模型, Pointer Network]
---

# MeshTailor: Cutting Seams via Generative Mesh Traversal

## 核心方法

首个**网格原生 (mesh-native)** 生成式框架，在 3D 表面合成边缘对齐的接缝 (seams)。

### 核心创新

1. **网格原生生成**：直接在网格图上操作，消除投影伪影和脆弱的吸附启发式
2. **ChainingSeams**：分层序列化接缝图，从全局结构切割优先到局部细节（粗到细）
3. **双流编码器**：融合拓扑图特征和几何形状信息（点云）
4. **MeshTailor Transformer**：自回归指针层，在局部邻域内逐顶点追踪接缝

### 技术架构

```
输入网格 → 双流编码器
            ├─ 拓扑流：Graph Encoder 提取 H (V,E)
            └─ 几何流：Point Cloud Encoder 提取 Z
          → Cross-Attention 融合
          → Pointer Network 自回归解码
          → 逐顶点接缝追踪
```

### 关键设计

- **接缝图序列化**：优先全局结构切割 → 局部细节（模拟人类专业裁缝逻辑）
- **指针网络**：决策空间限制在局部 1-ring 邻域，高效追踪
- **无需投影**：直接在网格边上生成，保证边缘对齐

## 与 Baseline 对比

| 方法 | 边缘对齐 | 语义连贯 | 投影伪影 |
|------|----------|----------|----------|
| MeshTailor | ✅ | ✅ | ❌ |
| SeamGPT | ⚠️ 需吸附 | ⚠️ | ⚠️ 有 |
| PartUV | ❌ 别名 | ❌ | ⚠️ 有 |
| OptCuts/Autocuts | ✅ | ❌ 碎片化 | ❌ |

## 关键技术点

1. **网格图序列化**：将不规则图转化为层级序列
2. **增强顶点嵌入**：融合拓扑 + 几何上下文
3. **局部邻域约束**：计算高效 + 连续边缘对齐

## 相关工作

- UV 参数化：LSCM, ABF++, OptCuts, Autocuts
- 网格分割：PointNet++, MeshCNN
- 接缝生成：PartUV, SeamGPT, Nuvo, FAM

## 开源参考

- 代码未提供（论文无 GitHub 链接）

## 可行性分析

⚠️ **谨慎评估**

- 生成式方法，需大量训练数据
- Pointer Network + 双流编码器实现复杂
- 适合作为参考，不适合直接复现

## 传递对象

@墨鱼丸 (moyuwan) — UV 参数化接缝优化参考
