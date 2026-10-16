---
type: paper
created: 2026-10-16
updated: 2026-10-16
tags: [paper, relighting, garment, sketch-based, PBR, shading, 3D-generation]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.21865
venue: arXiv preprint (cs.GR)
year: 2026
---

# From Sketch to Scene: Relightable Garment Reconstruction from Marked Sketches

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | From Sketch to Scene: Relightable Garment Reconstruction from Marked Sketches |
| **作者** | Ahmet Neçirvan Doğan, Eren Acar Başaran, Metin Sezgin, Zahra Montazeri |
| **发表** | arXiv preprint (cs.GR), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.21865) |

---

## 核心贡献

> 通过**带标注的草图**（★亮部标记 + ☾阴影标记）→ 在 3D 重建时**分离光照意图与几何形变**：阴影不画成纹理颜色，而用 displacement 把形面拉成在指定方向光下成阴影。

1. **二元标记界面**：让设计师用最少的标注（亮 + 阴）直接表示光照意图
2. **可重光照输出**：生成 explicit directional light + displacement surface，纹理不受光照影响
3. **形变而非涂色**：阴影通过 surface geometry 实现（与 PBR 合规）
4. **art-student elicitation study**：标记设计基于用户研究（★ 和 ☾ 是被试最多采用的符号）

---

## 技术方案

```
Input: rough garment sketch + ★ 标记 + ☾ 标记 + text prompt
   ↓
[1] 从 marked sketch 预测 directional light 方向
   ↓
[2] 用 displacement field 把形面弯曲，使得 ☾ 区域在该光下自然成阴影
   ↓
[3] 文本引导生成纹理（不画阴影到颜色里）
   ↓
Output: textured 3D mesh + explicit directional light
        → 可重光照、可编辑
```

### 关键技术

| 技术 | 说明 |
|------|------|
| Marked-sketch input | ★/☾ 二元语义标注 |
| Geometric vs painted shading | 阴影靠形面位移，不靠 pixel 颜色 |
| User elicitation study | 验证符号选择的自然性 |

---

## 实现建议

- **实现难度**: 中等（深度学习端到端）
- **应用场景**: 服装设计 → 真实渲染预览
- **对 PBR 友好性**: 很高（explicit light + 真实几何 shadow）
- **局限**: 当前仅衣物 + 单方向光，复杂场景光尚不支持

---

## 备注

- 渲染相关性中等（不在核心 ray tracer 路径上，但与 PBR 重光照管线相连）
- 列入 2026-10-16 报告作为「relighting / sketch-based PBR」邻域条目
