---
tags: [渲染, 神经渲染, 全局光照, 2026]
date: 2026-07-30
status: 待读
---

# RenderFormer++: Scalable and Physically Grounded Feed-Forward Neural Rendering

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | Youcheng Cai |
| 发表 | arXiv cs.GR (2026-06-29) |
| 链接 | [原文](https://arxiv.org/abs/2606.30380) |

## 核心贡献

1. **Physics-Informed Transport Guidance (PITG)**: 将渲染方程的归纳偏置嵌入注意力机制，引入传输一致性损失，实现物理一致的光传输建模
2. **Hierarchical Object-Centric Tokenization (HOCT)**: 通过交叉注意力将三角形级特征聚合为紧凑的物体级标记，解决二次方注意力复杂度问题

## 技术方案

### 问题
- 现有 Transformer 神经渲染方法（如 RenderFormer）虽实现跨场景泛化，但存在物理一致性不足和可扩展性差的问题
- 三角形级标记化导致二次方注意力复杂度

### 方法
- PITG：在注意力机制中嵌入渲染方程归纳偏置
- HOCT：使用可学习查询将三角形级特征聚合为物体级标记

## 公式

渲染方程：
```math
L_o(\mathbf{x}, \omega_o) = L_e(\mathbf{x}, \omega_o) + \int_{\Omega} f_r(\mathbf{x}, \omega_o, \omega_i) L_i(\mathbf{x}, \omega_i) (\omega_i \cdot \mathbf{n}) d\omega_i
```

## 实验结论

- 在复杂大规模场景上实现可扩展、稳定、可泛化的前馈全局光照渲染
- 物理准确性和效率优于先前神经渲染方法

## 局限性

- 主要针对静态网格场景
- 需要预计算的物体级特征

## 推荐度

- **创新性**: ⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐
- **难度**: 高

## 标签

#神经渲染 #全局光照 #Transformer #Feed-Forward
