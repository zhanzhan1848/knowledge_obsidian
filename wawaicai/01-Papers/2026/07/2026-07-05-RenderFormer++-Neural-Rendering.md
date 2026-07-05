---
tags: [神经渲染, 全局光照, Transformer, 前馈, mesh]
source: arXiv cs.GR
date: 2026-06-29
---

# RenderFormer++: Scalable and Physically Grounded Feed-Forward Neural Rendering

## 论文信息
- **arXiv**: [2606.30380](https://arxiv.org/abs/2606.30380)
- **作者**: Youcheng Cai et al.
- **领域**: Graphics (cs.GR); CV; ML

## 核心问题
现有 Transformer-based 神经渲染方法（如 RenderFormer）虽实现了有前景的跨场景泛化，但存在：
- 物理一致性有限
- 可扩展性差（三角形级分词的二次注意力复杂度）

## 解决方案：RenderFormer++

### 1. Physics-Informed Transport Guidance (PITG)
- 将渲染方程归纳偏置嵌入注意力机制
- 强制传输一致性损失
- 实现物理一致的光传输建模

### 2. Hierarchical Object-Centric Tokenization (HOCT)
- 通过交叉注意力将三角形级特征聚合成紧凑对象级 token
- 可学习的 queries
- 大幅降低计算和内存成本
- 保留几何和辐射信息

## 性能提升
- 可扩展、稳定、可泛化的前馈全局光照渲染
- 复杂大规模场景处理
- 改进的物理准确性和效率

## 相关笔记
[[神经渲染]], [[全局光照]], [[Transformer]], [[前馈渲染]], [[mesh场景]]
