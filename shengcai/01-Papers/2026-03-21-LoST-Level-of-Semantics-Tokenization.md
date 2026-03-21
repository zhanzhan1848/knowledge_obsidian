---
type: paper
created: 2026-03-21
updated: 2026-03-21
tags: [paper, 3d-tokenization, autoregressive, semantic, cvpr2026]
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
| **作者** | Niladri Shekhar Dutt, et al. |
| **发表** | CVPR 2026 |
| **日期** | 2026-03-18 |
| **链接** | [原文](https://arxiv.org/abs/2603.17995) |
| **项目** | [Project Website](https://lost3d.github.io) |
| **DOI** | 10.48550/arXiv.2603.17995 |
| **PDF** | [View PDF](https://arxiv.org/pdf/2603.17995) |

---

## 核心贡献

> 按语义显著性排序的 3D 形状分词器，早期前缀解码完整语义形状，后续 token 细化细节

1. **语义级分词**：按语义重要性而非几何 LoD 排序
2. **RIDA 损失**：3D 语义对齐损失，对齐形状隐空间与 DINO 特征空间
3. **高效 AR 生成**：仅需 0.1%-10% 的 token 即可实现高质量生成
4. **语义检索**：支持下游语义检索任务

---

## 技术方案

### 核心思想

现有 3D 分词器使用几何 LoD 层级（为渲染和压缩设计），缺乏 AR 建模的语义连贯性。LoST 按语义显著性排序，早期 token 解码完整语义形状，后续 token 细化几何和语义细节。

### 关键技术

| 技术 | 说明 |
|------|------|
| 语义排序 | 按语义显著性排序 token |
| RIDA 损失 | Relational Inter-Distance Alignment |
| DINO 对齐 | 与语义 DINO 特征空间对齐 |
| 高效 AR | 仅需 0.1%-10% token |

---

## 公式

```math
RIDA Loss: L_RIDA = ||D_3d(z_i, z_j) - D_dino(f_i, f_j)||²
Token Order: sort(tokens, key=semantic_salience)
```

---

## 代码片段

```python
# LoST 分词伪代码
class LoSTTokenizer:
    def tokenize(self, shape):
        # 提取语义特征
        semantic_features = extract_semantic(shape)
        # 按语义显著性排序
        tokens = sort_by_salience(semantic_features)
        return tokens
    
    def decode(self, tokens, k=None):
        # 前 k 个 token 解码完整语义形状
        return decode_semantic(tokens[:k] if k else tokens)
```

---

## 实验结论

- **重建精度**: SOTA，大幅超越 LoD 分词器
- **几何+语义**: 同时优化几何和语义指标
- **AR 生成**: 高效高质量
- **Token 效率**: 仅需 0.1%-10% token

---

## 局限性

- 依赖 DINO 语义特征
- 语义排序可能不适用所有形状类型

---

## 相关工作

- [[3D Tokenization]]
- [[Autoregressive 3D Generation]]
- [[Semantic Shape Understanding]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 高效 AR 生成
- **适用场景**: 
  - 3D 生成模型
  - 语义形状检索
  - 自回归 3D 建模

---

*🥬 生菜 (shengcai) - 2026-03-21*
