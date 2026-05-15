---
title: "FaceParts: Segmentation and Editing of Gaussian Splatting"
authors: ["Tymoteusz Zapała et al."]
date: 2026-03-25
venue: "arXiv (cs.GR)"
tags: [几何, Gaussian Splatting, 人脸编辑, 无监督分割]
paper_url: "https://arxiv.org/abs/2605.13853"
---

## 核心方法

提出 **FaceParts**，用于**无监督分割和编辑 Gaussian Splatting 化身**的框架。

### 核心创新
1. **特征解耦 (Feature Disentanglement)**
2. **基于密度的聚类 (Density-based Clustering)**
3. **FLAME-anchored Part Transfer**: 将分割部分从一个化身迁移到另一个

### 关键能力
- 直接在 Gaussian 域操作（无需 2D 或 mesh 辅助）
- 无监督分解为语义连贯的面部部件
- 精确编辑和跨化身部件交换

### 部件隔离
胡子、眉毛、眼睛、胡子等特征在 11 个主体的 NeRSemble 数据集上稳健隔离

### 量化结果
| 指标 | 值 |
|------|-----|
| ID (Identity Consistency) | 0.943 |
| AED (Avg Expression Distance) | 0.021 |
| APD (Avg Pose Distance) | 0.004 |

---

## 算法复杂度
- 时间复杂度：O(n) 聚类 + 特征解耦
- 空间复杂度：O(n) Gaussian 参数

---

## 开源实现
- 暂无开源代码

---

## 相关笔记
[[Gaussian Splatting]]
[[Face Editing]]
[[Unsupervised Segmentation]]
[[FLAME]]

---

## 可行性分析

**推荐度**: ⭐⭐⭐⭐ (4/5)

### 优势
- 无需监督信号，自动发现语义部件
- 直接在 Gaussian 域操作，保持 3D 一致性
- 跨化身迁移能力实用
- 高 identity 一致性 (0.943)

### 挑战
- 主要针对面部，可能不泛化到其他对象
- 需要预训练的 FLAME 模型
- 密集型 Gaussian 场景可能性能下降

### 适用场景
- 数字人面部编辑
- 虚拟形象定制
- 电影/游戏面部动画