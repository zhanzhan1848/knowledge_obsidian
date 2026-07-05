---
tags: [渲染, 神经渲染, 全局光照, Transformer]
date: 2026-07-05
status: 新论文
---

# RenderFormer++: Scalable Feed-Forward Neural Global Illumination

## 元信息

| 标题 | 值 |
|------|-----|
| 作者 | Youcheng Cai et al. |
| 链接 | [arXiv:2606.30380](https://arxiv.org/abs/2606.30380) |
| 会议 | cs.GR 2026 |

## 核心贡献

1. **Physics-Informed Transport Guidance (PITG)**: 将渲染方程归纳偏置嵌入注意力机制
2. **Hierarchical Object-Centric Tokenization (HOCT)**: 层级目标级token化替代三角形级token
3. **可扩展的前馈神经渲染**: 支持大规模场景的泛化推理

## 技术方案

### 问题
- RenderFormer等方法虽有跨场景泛化能力
- 但物理一致性不足
- 二次方注意力复杂度限制可扩展性

### 解决方案

#### PITG (Physics-Informed Transport Guidance)
- 嵌入渲染方程归纳偏置
- 强制传输一致性损失
- 实现物理一致的光传输建模

#### HOCT (Hierarchical Object-Centric Tokenization)
```python
# 三角形 → 对象级token聚合
triangle_features = extract_triangle_features(mesh)
object_tokens = cross_attention(learnable_queries, triangle_features)
# 大幅降低计算和内存成本
```

### 关键创新

| 创新点 | 效果 |
|--------|------|
| PITG | 物理一致性提升 |
| HOCT | 复杂度从O(n²)降至O(n) |
| 联合优化 | 跨场景泛化能力 |

## 实验结论

- 在复杂大规模场景上实现可扩展、稳定的前馈全局光照渲染
- 物理准确性和效率优于先前神经渲染方法
- 支持未见场景的泛化推理

## 标签

#神经渲染 #全局光照 #Transformer #可扩展性
