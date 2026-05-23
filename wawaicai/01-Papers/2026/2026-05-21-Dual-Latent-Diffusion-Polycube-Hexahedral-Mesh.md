---
title: "A Dual-latent Diffusion Model for Polycube-Based Hexahedral Mesh Generation"
authors: ""
date: 2026-05-21
tags: [几何, 网格生成, 六面体网格, Polycube, Diffusion Model]
source: arXiv cs.GR
url: https://arxiv.org/abs/2605.20274
---

## 核心方法

本文提出一种基于条件扩散模型的多面体（Polycube）生成框架。给定输入几何（点云），直接输出对应的 Polycube 点云，无需显式曲面分割或预定义 Polycube 模板。

核心创新：**双潜在条件扩散架构**，将计算密集的自注意力操作限制在固定容量低维潜在空间中，解耦了计算复杂度与输入/输出分辨率，避免了点云固有的二次计算成本。

## 关键算法细节

- **输入**：点云表示的几何
- **输出**：Polycube 点云（可直接用于生成六面体网格）
- **架构**：条件扩散模型 + 双潜在空间（dual-latent space）
- **优势**：端到端、无需表面分割、无需预定义模板

## 复杂度分析
- 时间复杂度：潜在空间固定，计算量与输入分辨率解耦
- 空间复杂度：低维潜在表示

## 开源实现
- 待查

## 相关笔记
[[几何-网格生成]]