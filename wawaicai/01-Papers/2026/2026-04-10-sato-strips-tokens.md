---
tags: [几何, 网格生成, UV分割, 自回归, 参数化]
date: 2026-04-10
authors: Rui Xu, Dafei Qin, et al.
venue: arXiv cs.CV/cs.CG/cs.GR
---

# Strips as Tokens: Artist Mesh Generation with Native UV Segmentation

## 核心方法

**SATO (Strips as Tokens)** 网格生成框架，通过 Triangle Strip 驱动的 Token 排序策略。

### 核心思想
- 现有方法坐标排序生成冗长序列，Patch 策略破坏边流和结构规律性
- SATO 将网格表示为连接的三角形条带（triangle strip）链
- 显式编码 UV 边界，自然保留艺术家创建的边流和语义布局

### 技术创新
1. **Triangle Strip Token 排序**：连接的面链编码 UV 边界
2. **统一表示**：同一 token 序列可解码为三角或四边网格
3. **联合训练**：大规模三角数据提供结构先验，高质量四边数据增强几何规律性

### 方法优势
- 保持连续边流 (edge flow)
- 保持结构规律性 (structural regularity)
- 语义布局 (semantic layout)
- UV 分割 (UV segmentation)

## 算法特点

- **统一表示**：三角/四边网格
- **自回归 Transformer**：学习 strip token 序列
- **后处理**：使用 Blender 标准展开算法计算 UV 坐标

## 开源实现

- 待查

## 可行性评估

- ✅ 解决网格生成中的 token 排序问题
- ✅ 同时生成几何和 UV 分割
- ✅ 联合训练策略有效
- ⚠️ 主要针对艺术级网格生成，非通用几何处理

## 相关技术

[[网格生成]] [[UV参数化]] [[自回归模型]] [[网格细分]]

## 参考链接

- Paper: https://arxiv.org/abs/2604.09132
- HTML: https://arxiv.org/html/2604.09132v1