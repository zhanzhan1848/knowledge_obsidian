---
tags: [几何, 高斯泼溅, 三维重建, 动态场景]
created: 2026-06-20
source: arXiv cs.GR
---

# Renderable Partial Representations for Dynamic Gaussian Splatting under Incomplete Delivery

## 核心方法

研究**不完整传输状态下直接可渲染**的动态高斯表示，其降质在图像空间优化。将高斯基元组织为独立可寻址的时空簇（cluster），每个簇包含 base level 和三个 refinement 层。通过训练 **partial dependency graphs**，在单次 GPU batch 中渲染多个反事实状态，最小化期望失真、尾失真、时间不一致性、码率和前缀回归。

## 关键创新点

1. **不完整状态直接可渲染** — 交互式渲染中的部分表示，无需等待完整文件
2. **MTU-bounded entropy-coded chunks + deadline-aware scheduling** — 具体传输实现
3. **counterfactual utility layer** — 衡量每个完成组在有效接收者上下文中的边际渲染贡献
4. **render-utility ordering** — 替代名义 refinement 顺序，可提升 PSNR

## 实验结果
- HyperNeRF broom2：render-utility ordering 移除了名义层顺序产生的两个 PSNR 回归
- HyperNeRF chicken clusters：disjoint training cameras 上 utilities 提升 3.03 dB

## 论文信息
- arXiv: [2606.17212](https://arxiv.org/abs/2606.17212)
- 19 pages, 8 figures, 3 tables

## 相关笔记
[[高斯泼溅]]
[[神经辐射场]]
[[三维重建]]