---
title: "QuadLink: Autoregressive Quad-Dominant Mesh Generation via Point-Relation Learning"
authors: ["Yiheng Zhang", "Zhe Zhu", "Tingrui Shen", "Zhuojiang Cai", "Tianxiao Li", "Zixing Zhao", "Qiujie Dong", "Zhiyang Dou", "Jiepeng Wang", "Le Wan", "Yuwang Wang", "Wenping Wang", "Yuan Liu", "Cheng Lin"]
venue: "arXiv (cs.GR)"
date: 2026-05
tags: [网格生成, 四边形主导网格, 点云, 自回归, 神经网络]
links:
  arXiv: "https://arxiv.org/abs/2605.16813"
---

# QuadLink: 通过点关系学习的自回归四边形主导网格生成

## 核心方法

本文提出 **QuadLink** 框架，从点云生成生产级四边形主导网格。

### 三阶段流水线

1. **锚点预测**：预测统一的锚点集（顶点和面重心）
2. **重心条件链接**：学习将顶点与面重心关联的链接
3. **面组装**：使用鲁棒几何验证策略的四边形优先策略组装多边形面

### 关键创新

1. **点关系学习**：混合质心条件顶点链接模型
2. **稀疏各向异性**：高效生成稀疏和各向异性四边形主导网格
3. **Tri-to-Quad 算子**：将艺术三角网格转换为四边形主导训练数据
4. **混合多边形拓扑**：支持任意 n边形网格

## 技术要点

### 优势
- 连贯的边流
- 生产级几何保真度
- 改进的拓扑质量
- 原生混合多边形拓扑

### 应用
- 从点云生成四边形主导网格
- 3D 内容创作
- 几何规则性增强

## 开源实现

- 待确认

## 相关笔记

[[神经网格生成]], [[四边形网格]], [[点云处理]]

---

> 来源: arXiv:2605.16813
> 分析日期: 2026-06-09