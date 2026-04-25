---
type: paper
created: 2026-04-25
updated: 2026-04-25
tags: [paper, Gaussian-splatting, sketch-driven, face-editing, real-time-rendering]
status: processed
domain: 3D Gaussian rendering
agent: shengcai
source: https://arxiv.org/abs/2604.19202
---

# SketchFaceGS: Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SketchFaceGS: Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting |
| **作者** | Jiahao Kang et al. |
| **发表** | CVPR 2026 (Highlight) |
| **链接** | [原文](https://arxiv.org/abs/2604.19202) |
| **DOI** | 10.48550/arXiv.2604.19202 |
| **代码** | [GitHub: gogoneural/SketchFaceGS_jittor](https://github.com/gogoneural/SketchFaceGS_jittor) |

---

## 核心贡献

> 首个基于 2D 草图实时生成和编辑 3D Gaussian 人头模型的框架，单次前向传播即可生成高质量可编辑 3D 人头

1. **Feed-forward coarse-to-fine 架构**：Transformer-based UV feature prediction module 先从草图重建粗粒度几何一致 UV feature map，再通过 3D UV feature enhancement module 补充高频细节
2. **UV Mask Fusion + Layer-by-layer Feature Fusion**：实现精确、实时的自由视角编辑修改
3. **实时性**：单次前向传播即可完成，无需微调或迭代优化

---

## 技术方案

### 核心思想

2D 草图虽然稀疏、深度模糊、缺乏高频外观线索，但作为交互模态非常直观快速。核心思路：
- **粗粒度 UV 特征预测**：Transformer 模块从 2D 草图推断 3D Gaussian 头部的 UV 特征图
- **高频特征增强**：3D UV feature enhancement module 补充光真实感细节
- **编辑机制**：UV Mask Fusion 技术在 UV 空间进行掩码融合，支持层次化特征融合策略

### 架构流程

```
2D Sketch → Transformer UV Feature Prediction → Coarse UV Feature Map
                                                    ↓
3D UV Feature Enhancement ← High-frequency Photorealistic Details
                                                    ↓
                    High-Fidelity 3D Gaussian Head
```

---

## 实验结论

- **生成质量**: 超越现有方法（generation fidelity and editing flexibility）
- **实时性**: 单次前向传播完成，无需迭代
- **编辑灵活性**: 支持自由视角修改

---

## 局限性

- 草图质量对生成效果有一定依赖
- 当前仅限于人头建模

---

## 实现建议

- **实现难度**: 中高（需要 Transformer + 3D Gaussian 基础）
- **预期性能**: 实时推理，适合交互式应用
- **适用场景**: 游戏/影视角色建模、实时交互编辑、AR/VR 头像生成

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[Real-Time Rendering with Gaussians]]
