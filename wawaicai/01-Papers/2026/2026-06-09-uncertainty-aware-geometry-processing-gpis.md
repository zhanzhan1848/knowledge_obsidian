---
title: "Uncertainty-Aware Geometry Processing on Gaussian Process Implicit Surfaces"
authors: ["Baptiste Genest", "David Coeurjolly"]
venue: "SIGGRAPH 2026 / ACM Transactions on Graphics"
date: 2026-05
tags: [几何处理, 不确定性, 隐式曲面, 概率建模, SIGGRAPH2026]
links:
  arXiv: ""
  paper: "https://s2026.conference-schedule.org/presentation/?id=papers_140&sess=sess149"
  project: ""
  code: ""
---

# 不确定性感知几何处理：高斯过程隐式曲面

## 核心方法

本文提出在**高斯过程隐式曲面 (GPIS)** 上进行几何处理的框架，引入不确定性感知版本的梯度、散度和拉普拉斯算子。

### 关键创新

1. **GPIS 表示**：利用高斯分布简化概率曲面的研究和可用性
2. **Kac-Rice 公式**：将表面计算嵌入体积域，无需采样整个曲面
3. **不确定性算子**： Dirichlet 能量为基础推导拉普拉斯算子，进而推广到散度和梯度

## 算法复杂度

- 时间复杂度：待分析
- 空间复杂度：待分析

## 技术要点

### 动机
- 传统几何处理流程首先去除噪声
- 本文方法保留噪声和不确定性作为有价值的信息

### 应用场景
- 噪声或部分观测的几何处理
- 机器人感知中的形状表示
- 计算机视觉和渲染中的概率建模

## 开源实现

- libigl: 待确认相关函数
- CGAL: 待确认

## 相关笔记

[[网格处理]], [[隐式曲面]], [[概率几何处理]]

---

> 来源: SIGGRAPH 2026 Technical Paper
> 分析日期: 2026-06-09