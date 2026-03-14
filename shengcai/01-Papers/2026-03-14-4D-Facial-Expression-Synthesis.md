---
type: paper
created: 2026-03-14
updated: 2026-03-14
tags: [paper, facial-animation, 4D, GAN, cs.GR]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.10326
---

# Frequency-controlled Flexible 4D Facial Expression Synthesizing (FC-4DFS)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Frequency-controlled Flexible 4D Facial Expression Synthesizing |
| **作者** | Xin Lu 等 |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.10326) |
| **DOI** | 10.48550/arXiv.2603.10326 |
| **代码** | GitHub（待发布） |

---

## 核心贡献

> 频率控制的 4D 面部表情合成，支持灵活长度和时序连贯性

1. **频率控制 LSTM** - 逐帧生成任意长度的表情序列
2. **时序一致性损失** - 增强时序运动感知，提高位移精度
3. **多层次身份感知位移网络** - 基于交叉注意力机制

---

## 技术方案

### 核心思想

从中性 landmark 输入，通过频率控制 LSTM 生成指定长度的 4D 面部表情序列，并使用交叉注意力机制重建高保真表情。

### 关键技术

| 技术 | 说明 |
|------|------|
| 频率控制 LSTM | 控制生成频率，灵活长度 |
| 时序一致性损失 | Temporal coherence loss |
| 交叉注意力 | Cross-attention 机制 |
| 多层次身份感知 | Multi-level identity-aware network |

---

## 公式

```math
# 时序一致性损失（概念）
L_temporal = Σ ||ΔD_t - ΔD_{t-1}||²

# 位移预测
ΔD = Decoder(Landmark_t, Identity_features)
```

---

## 实验结论

- **数据集**: CoMA, Florence4D
- **结果**: SOTA 级别的灵活长度生成
- **优势**: 平滑的帧间运动，身份保持

---

## 局限性

- 依赖 landmark 检测质量
- 极端表情可能需要更多训练数据

---

## 相关工作

- [[4D Facial Animation]]
- [[Landmark-based Animation]]
- [[Temporal Coherence]]

---

## 实现建议

- **实现难度**: 中 - 需要 LSTM 和 Transformer 架构
- **预期性能**: SOTA 级别
- **适用场景**: 数字人、虚拟角色、表情驱动
