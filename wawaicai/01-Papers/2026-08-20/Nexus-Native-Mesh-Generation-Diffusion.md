---
title: "Nexus: Native Mesh Generation with Diffusion"
authors: ["Hanxiao Wang", "Ying-Tian Liu", "Yuan-Chen Guo", "Qi-Yuan Feng", "Zi-Xin Zou", "Ding Liang", "Biao Zhang", "Yan-Pei Cao"]
date: 2026-07
tags: [几何, 网格生成, Diffusion, 原生网格, 生成模型, SIGGRAPH2026]
conference: "SIGGRAPH 2026"
cite: "SIGGRAPH 2026 #808"
---

# Nexus: Native Mesh Generation with Diffusion

## 核心方法

本文提出**原生网格生成方法**，使用扩散模型直接生成网格而非从隐式表示提取。

### 核心创新点

1. **原生生成**: 直接生成网格顶点/面，而非中间表示
2. **扩散模型**: 利用扩散概率模型建模网格分布
3. **拓扑控制**: 支持生成指定拓扑的网格
4. **多尺度**: 支持不同分辨率网格生成

### 与传统方法对比

| 方法 | 优点 | 缺点 |
|------|------|------|
| SDF提取 | 平滑表面 | 需要后处理 |
| 点云生成 | 快速 | 无拓扑 |
| 本文方法 | 原生网格+拓扑 | 生成质量 |

## 开源实现

- libigl: 网格数据结构
- 扩散模型: DDPM, EDM

## 几何相关性

✅ **高相关**: 网格生成前沿
- 网格生成
- 拓扑控制
- 生成模型

## 可行性分析

| 维度 | 评分 |
|------|------|
| 算法复杂度 | ⭐⭐⭐ 高 |
| 数值稳定性 | ⭐⭐ 一般 |
| 实现难度 | ⭐⭐⭐ 高 |
| 创新性 | ⭐⭐⭐ 高 |

## 推荐结论

✅ **推荐关注**

原生网格生成是3D AIGC的重要方向，值得持续关注。

## 相关笔记
[[2026-08-20-MeshFlow-Mesh-Generation-Flow-Matching]]
[[2026-08-20-DAILY-SUMMARY]]

---
*来源: SIGGRAPH 2026 Technical Papers*
