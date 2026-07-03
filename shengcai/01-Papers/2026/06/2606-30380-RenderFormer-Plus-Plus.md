---
title: "Scalable and Physically Grounded Feed-Forward Neural Rendering"
authors: ["Youcheng Cai", "et al."]
date: 2026-06-29
venue: "arXiv"
status: important
tags: [渲染, 神经渲染, 全局光照, Transformer, Feed-forward]
links:
  arXiv: "https://arxiv.org/abs/2606.30380"
  PDF: "https://arxiv.org/pdf/2606.30380"
---

## 核心贡献

1. **RenderFormer++** - 可扩展、物理基础的前馈神经渲染框架
2. **Physics-Informed Transport Guidance (PITG)**
   - 将渲染方程归纳偏置嵌入注意力机制
   - 强制传输一致性损失
3. **Hierarchical Object-Centric Tokenization (HOCT)**
   - 将三角形级特征聚合为紧凑对象级token
   - 通过交叉注意力与可学习查询实现
   - 大幅降低计算和内存成本

## 技术方案

### 问题
- RenderFormer等Transformer神经渲染方法
- 跨场景泛化有前景
- 但传输一致性有限
- 三角形级token化导致二次注意力复杂度，扩展性差

### PITG
- 嵌入渲染方程归纳偏置
- 强制传输一致性损失
- 启用物理一致的光传输建模

### HOCT
- 三角形级特征 → 对象级token
- 交叉注意力机制
- 保留几何和辐射信息的同时大幅降低成本

## 实验结论

- 在复杂大规模场景上实现可扩展、稳定、可泛化的前馈全局光照渲染
- 比先前神经渲染方法有改进的物理精度和效率

## 标签

#神经渲染 #全局光照 #Transformer #Feed-forward #PBR
