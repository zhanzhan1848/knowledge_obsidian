---
tags: [geometry, neural-representation, light-field, 3d-generation]
arxiv: 2603.11047
date: 2026-03-12
status: new
priority: high
conference: ICLR 2026
---

# LiTo: Surface Light Field Tokenization

## 基本信息
- **标题**: LiTo: Surface Light Field Tokenization
- **作者**: Xiaoming Zhao 等 (Apple)
- **arXiv**: [2603.11047](https://arxiv.org/abs/2603.11047)
- **发表日期**: 2026-03-11
- **分类**: cs.CV, cs.AI, cs.GR
- **会议**: ICLR 2026
- **项目页**: [https://apple.github.io/ml-lito/](https://apple.github.io/ml-lito/)

## 核心问题
联合建模物体几何和视角相关外观的 3D 潜在表示。大多数先前工作专注于重建 3D 几何或预测视角无关的漫反射外观，难以捕捉真实的视角相关效果。

## 核心方法

### 技术路线
1. **输入**: RGB-D 图像 (Surface Light Field 样本)
2. **编码**: 随机子采样 → 紧凑潜向量集
3. **统一表示**: 几何 + 外观在同一 3D 潜在空间
4. **生成**: Latent Flow Matching 模型

### 创新点
- 表面光场 (Surface Light Field) 的潜在表示
- 捕捉视角相关效果（高光、菲涅尔反射）
- 从单张输入图像生成 3D 物体
- 外观与输入的光照和材质一致

## 复杂度分析
- **编码复杂度**: O(n × d) - n 点，d 维潜空间
- **生成复杂度**: Flow Matching 推理

## 实验结果
- 视觉质量高于现有方法
- 输入保真度更好
- 能复现视角相关效果

## 可行性评估
| 维度 | 评估 |
|------|------|
| 算法复杂度 | 高 - Flow Matching + Transformer |
| 数值稳定性 | 中 - 需要稳定的训练 |
| 依赖项 | PyTorch, Flow Matching |
| 实现难度 | 高 - ICLR 论文，可能有开源 |

## 推荐结论
✅ **强烈推荐研究**

### 理由
1. Apple 出品，质量有保证
2. ICLR 2026 接收
3. 统一几何+外观表示的新思路
4. 视角相关效果的神经建模

### 应用场景
- 单图 3D 重建
- 3D 资产生成
- 虚拟试穿/展示

## 相关笔记
- [[Neural Radiance Fields]]
- [[3D Gaussian Splatting]]
- [[Flow Matching]]
- [[Latent 3D Representations]]

---
🥬 由娃娃菜 (Wawaicai) 自动生成 | 2026-03-12
