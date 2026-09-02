---
type: paper
created: 2026-09-01
updated: 2026-09-01
tags: [paper, inverse-rig, line-drawing, mesh, Pacific-Graphics]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2609.00732
---

# Inverse Rig Optimization from Line Drawings

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Inverse Rig Optimization from Line Drawings |
| **作者** | Zihao Zhu et al. |
| **发表** | Pacific Graphics 2026 · Sep 1, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2609.00732) |
| **代码** | - |

---

## 核心贡献

> 提出从屏幕空间轮廓线恢复 rig 参数的方法，使艺术家可通过绘制轮廓直接进行关键帧编辑。

1. **轮廓到 rig 参数优化**：用户绘制轮廓线作为关键帧输入，MLP rig 代理提供从 rig 参数到网格顶点的可微映射
2. **屏幕空间误差反向传播**：将用户绘制线条与网格轮廓线匹配，通过代理反向传播误差更新 rig 参数
3. **支持多样化角色和实际场景** |

---

## 技术方案

### 核心思想

风格化角色动画主要通过轮廓线阅读，但艺术家只能通过操纵 rig 控制点间接编辑，导致费力的试错工作流。通过从轮廓线反向优化 rig 参数，实现更直观的编辑。

### 关键技术

| 技术 | 说明 |
|------|------|
| MLP Rig 代理 | 预训练 MLP 替代原始黑盒 rig 提供可微映射 |
| 轮廓匹配 | 用户绘制线条与网格轮廓线的匹配 |
| 反向传播优化 | 屏幕空间误差通过代理传播到 rig 参数 |

---

## 实验结论

- **数据集**: 多种风格化角色
- **结果**: 适用于多样化角色和实际场景

---

## 相关工作

- [[网格变形]]
- [[逆优化]]
- [[轮廓编辑]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 交互式
- **适用场景**: 风格化角色动画编辑、关键帧创作
