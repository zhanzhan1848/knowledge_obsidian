---
type: paper
created: 2026-03-19
updated: 2026-03-19
tags: [paper, 3D-generation, tokenization, autoregressive, CVPR2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.17995
---

# LoST: Level of Semantics Tokenization for 3D Shapes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | LoST: Level of Semantics Tokenization for 3D Shapes |
| **作者** | Niladri Shekhar Dutt, Zifan Shi, Paul Guerrero, Chun-Hao Paul Huang, Duygu Ceylan, Niloy J. Mitra, Xuelin Chen |
| **发表** | CVPR 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.17995) |
| **DOI** | 10.48550/arXiv.2603.17995 |
| **代码** | https://lost3d.github.io |

---

## 核心贡献

> 按语义显著性排序的 3D 形状 Tokenization，仅需之前 AR 模型 0.1%-10% 的 token

1. **语义级别 Tokenization**：按语义重要性排序 token
2. **RIDA 损失**：关系性距离对齐，对齐 3D 形状与 DINO 特征空间
3. **高效 AR 生成**：支持高质量自回归 3D 生成

---

## 技术方案

### 核心思想

传统 LoD 层次结构用于渲染和压缩，缺乏 AR 建模的语义一致性。LoST 按语义显著性排序 token，早期前缀解码为完整、合理的形状，后续 token 细化实例特定的几何和语义细节。

### 关键技术

| 技术 | 说明 |
|------|------|
| 语义排序 | 按语义重要性排序 token |
| RIDA 损失 | 3D 语义对齐损失 |
| 早期解码 | 前缀 token 生成完整形状 |

### 与 LoD 对比

| 方法 | Token 效率 | 语义一致性 |
|------|------------|------------|
| LoD | 低 | 缺乏 |
| LoST | 高 (0.1%-10%) | 强 |

---

## 公式

RIDA 损失：
```math
\mathcal{L}_{RIDA} = \|D_{3D} - D_{DINO}\|_2
```

其中 $D_{3D}$ 为 3D 形状潜在空间的关系结构，$D_{DINO}$ 为 DINO 特征空间的关系结构。

---

## 实验结论

- **重建质量**：SOTA 几何和语义重建指标
- **Token 效率**：仅需 0.1%-10% 的 token
- **下游任务**：支持语义检索

---

## 局限性

- 依赖 DINO 特征空间
- 语义定义的模糊性

---

## 相关工作

- [[3D生成]]
- [[自回归模型]]
- [[形状Tokenization]]

---

## 实现建议

- **实现难度**：中高（需要 RIDA 损失和语义排序）
- **预期性能**：高效 3D 生成，支持语义控制
- **适用场景**：3D 内容创作、形状生成、语义检索
