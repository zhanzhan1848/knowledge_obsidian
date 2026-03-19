# Do Understanding and Generation Fight? DPO for Unified Multimodal Models

## 元信息
| 标题 | Do Understanding and Generation Fight? A Diagnostic Study of DPO for Unified Multimodal Models |
|------|------------------------------------------------------------------------------------------------|
| 作者 | Abinav Rao, Sujan Rachuri |
| 链接 | [arXiv:2603.17044](https://arxiv.org/abs/2603.17044) |
| arXiv | arXiv:2603.17044v1 |
| 领域 | cs.LG, cs.AI, cs.CV |
| 日期 | 2026-03-17 |
| 会议 | CVPR MMF5M Workshop 2026 |

---

## 核心贡献

### 1. 首个系统性研究
**问题**: 统一多模态模型共享语言模型骨干用于理解和生成图像。DPO 能否同时对齐这两种能力？

**答案**: ❌ **负面结论** - 生成质量在所有测试条件下都抵抗 DPO 对齐。

### 2. 实验规模
- **模型**: Janus-Pro (1B 和 7B 参数)
- **训练策略**: 7 种
- **后处理方法**: 2 种
- **偏好数据类型**: real-vs-generated, model-vs-model
- **数据量**: 150-288 pairs

### 3. 核心发现：梯度正交性
**Understanding 和 Generation 的梯度**:
- **余弦相似度**: ~0 (近正交)
- **幅度不平衡**: ~11-14x
- **原因**: VQ token 数量不对称
  - 生成: 576 tokens
  - 文本理解: ~30-100 tokens

---

## 实验结果

### 7B 模型
| 方法 | Generation CLIPScore 变化 |
|------|--------------------------|
| 所有方法 | \|Delta\| < 0.2, p > 0.5 |
| **结论** | 无方法改善生成质量 |

### 1B 模型
| 方法 | 效果 |
|------|------|
| 所有方法 | **降低**生成质量 |

### Understanding 性能
- 幅度平衡后，方向上正向 (+0.01-0.04 VQA)
- 单独不显著
- 生成差距仍然存在

---

## 机制分析

### 梯度分析
```
Understanding Gradient: G_u
Generation Gradient: G_g

cos(G_u, G_g) ≈ 0  (正交)
|G_g| / |G_u| ≈ 11-14x  (幅度不平衡)
```

### 干扰机制
**VQ Tokenization 不对称性** 是主导干扰机制:
- 生成需要 576 个 VQ tokens
- 理解仅需 ~30-100 text tokens
- 导致梯度幅度严重不平衡

### 结构瓶颈
- **离散 VQ tokenization** 是可能的瓶颈
- 证据: Generation DPO loss 收敛到 ln(2)

---

## 技术细节

### 实验设置
```
Janus-Pro (1B/7B)
    ├── 7 种训练策略
    ├── 2 种后处理方法
    └── 多种偏好数据类型
        ↓
评估
    ├── Understanding: VQA
    └── Generation: CLIPScore
```

### DPO Loss 行为
- Generation DPO loss → ln(2)
- 表明模型在生成任务上未能有效学习偏好

---

## 实践指导

### 对 VQ-based 统一模型开发者

1. **不要期望 DPO 同时优化两者**
   - DPO 主要改善理解
   - 生成需要其他对齐方法

2. **考虑替代 tokenization**
   - 离散 VQ 可能是瓶颈
   - 连续表示可能更灵活

3. **分离训练可能更好**
   - 理解和生成可能需要独立的对齐阶段

---

## 局限性

1. **单一架构**: 仅测试 Janus-Pro
2. **VQ 限制**: 结论可能不适用于非 VQ tokenization
3. **规模**: 1B-7B，更大模型行为未知

---

## 建议

- **是否推荐**: ✅ 推荐
- **适用场景**:
  - 统一多模态模型开发
  - DPO 应用研究
  - 多任务学习冲突分析
- **关键洞察**: 
  - 理解和生成任务在梯度空间正交
  - VQ tokenization 是结构瓶颈
  - 需要替代对齐方法

---

## 引用

```bibtex
@article{rao2026understanding,
  title={Do Understanding and Generation Fight? A Diagnostic Study of DPO for Unified Multimodal Models},
  author={Rao, Abinav and Rachuri, Sujan},
  journal={arXiv preprint arXiv:2603.17044},
  booktitle={CVPR MMF5M Workshop},
  year={2026}
}
```

---

*Created by youmaicai (🥬) - 2026-03-19*
