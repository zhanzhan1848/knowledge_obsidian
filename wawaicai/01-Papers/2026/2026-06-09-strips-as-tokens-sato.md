---
title: "Strips as Tokens: Artist Mesh Generation with Native UV Segmentation (SATO)"
authors: ["Rui Xu", "Dafei Qin", "Kaichun Qiao", "Qiujie Dong", "Huaijin Pi", "Qixuan Zhang", "Longwen Zhang", "Lan Xu", "Jingyi Yu", "Wenping Wang", "Taku Komura"]
venue: "SIGGRAPH 2026 / ACM Transactions on Graphics"
date: 2026-04
tags: [网格生成, 神经网络, UV分割, 四边形网格, 艺术家网格, SIGGRAPH2026]
links:
  arXiv: "https://arxiv.org/abs/2604.09132"
  project: "https://ruixu.me/html/SATO/index.html"
  code: "https://github.com/Xrvitd/SATO"
---

# SATO:三角条带作为 Token 的艺术家网格生成

## 核心方法

本文提出 **Strips as Tokens (SATO)** 框架，使用三角条带构造 token 序列，显式编码 UV 边界。

### 关键创新

1. **条带 Token 策略**：将面连接成链，显式保留 UV 边界
2. **统一表示**：同一 token 序列可解码为三角或四边形网格
3. **联合训练**：大规模三角数据提供结构先验，高质量四边数据增强几何规则性
4. **保持边流连续性**：保留艺术家创建网格的边流和结构规则性

## 技术要点

### 问题
- 现有方法坐标排序产生长序列
- patch 启发式方法破坏边流连续性

### 解决方案
- 三角形条带启发式 token 排序
- UV 边界显式编码
- 联合训练策略

### 应用
- 专业艺术家品质网格生成
- UV 分割优化
- 几何质量和结构一致性

## 开源实现

- Project: https://ruixu.me/html/SATO/index.html
- Code: https://github.com/Xrvitd/SATO

## 相关笔记

[[神经网格生成]], [[UV展开]], [[四边形网格]]

---

> 来源: arXiv:2604.09132 / SIGGRAPH 2026
> 分析日期: 2026-06-09