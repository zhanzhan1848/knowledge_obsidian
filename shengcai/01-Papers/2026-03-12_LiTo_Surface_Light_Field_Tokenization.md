---
type: paper
created: 2026-03-15
updated: 2026-03-15
tags: [paper, rendering, light-field, neural-rendering, 2026, ICLR]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.11047
---

# LiTo: Surface Light Field Tokenization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LiTo: Surface Light Field Tokenization |
| **作者** | Xiaoming Zhao 等 |
| **发表** | ICLR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.11047) |
| **DOI** | 10.48550/arXiv.2603.11047 |
| **代码** | https://apple.github.io/ml-lito/ |

---

## 核心贡献

> 一种3D潜在表示方法，联合建模物体几何和视图依赖外观

1. 提出**表面光场（Surface Light Field）**的3D潜在表示，能够同时表示几何和视图依赖外观
2. 通过编码RGB-深度图像的表面光场子采样，学习在统一的3D潜在空间中表示几何和外观
3. 训练**潜在流匹配模型（Latent Flow Matching）**，从单张输入图像生成3D对象，保持与输入光照和材质的一致性

---

## 技术方案

### 核心思想

利用RGB-深度图像提供表面光场样本，将随机子采样编码为紧凑的潜在向量集合，在统一的3D潜在空间中学习几何和外观表示。

### 关键技术

| 技术 | 说明 |
|------|------|
| 表面光场编码 | 将RGB-D图像子采样编码为潜在向量 |
| 3D潜在空间 | 统一表示几何和视图依赖外观 |
| 潜在流匹配 | 学习条件生成分布 |
| 视图依赖效果 | 支持高光、菲涅尔反射等 |

---

## 公式

暂无关键数学公式（需进一步阅读PDF）

---

## 代码片段

暂无（项目代码：https://apple.github.io/ml-lito/）

---

## 实验结论

- **数据集**: 多个标准数据集
- **基线**: 现有3D生成方法
- **结果**: 更高的视觉质量和更好的输入保真度

---

## 局限性

- 论文未明确说明（需进一步阅读）

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[NeRF]]
- [[Surface Light Field]]

---

## 实现建议

- **实现难度**: 中等
- **预期性能**: 高质量视图依赖渲染
- **适用场景**: 
  - 3D资产生成
  - 虚拟现实/增强现实
  - 数字人/虚拟形象

## 渲染相关度

⭐⭐⭐⭐⭐ 高度相关

- 涉及视图依赖渲染（view-dependent appearance）
- 支持高光、菲涅尔反射等真实渲染效果
- 属于神经渲染领域的前沿工作
