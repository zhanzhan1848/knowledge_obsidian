---
title: "SketchFaceGS: Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting"
authors: "Jiahao Kang"
date: 2026-04-21
status: 待读
tags: [渲染, Gaussian Splatting, 草图交互, 人脸生成, CVPR2026]
conference: CVPR 2026 Highlight
arxiv_id: "2604.19202"
---

# SketchFaceGS: Real-Time Sketch-Driven Face Editing and Generation with Gaussian Splatting

## 基本信息
| 项目 | 内容 |
|------|------|
| 作者 | Jiahao Kang |
| 发表 | CVPR 2026 (Highlight) |
| 链接 | [arXiv](https://arxiv.org/abs/2604.19202) |
| 代码 | [GitHub](https://github.com/gogoneural/SketchFaceGS_jittor) |

## 核心贡献
1. **首个草图驱动框架**：从 2D 草图实时生成和编辑逼真 3D Gaussian 人头模型
2. **feed-forward coarse-to-fine 架构**：单次前向传播完成
3. **UV Mask Fusion 技术**：支持精确、实时、自由视角修改

## 技术方案

### 架构
```
Input Sketch → Transformer-based UV feature prediction → Coarse UV feature map
                                                        ↓
                              3D UV feature enhancement → High-fidelity 3D head
```

### 关键模块
1. **Transformer-based UV Feature Prediction**: 从草图重建粗粒度但几何一致 UV 特征图
2. **3D UV Feature Enhancement**: 细化高频逼真细节
3. **UV Mask Fusion + Layer-by-layer Feature Fusion**: 编辑时保持一致性

### 挑战
- 2D 草图稀疏、深度歧义、缺乏高频外观线索
- 难以从笔画推断密集、几何一致的 3D Gaussian 结构
- 需要实时约束

## 性能
- 单次前向传播生成高质量可编辑 3D 人头
- 优于现有方法（生成保真度和编辑灵活性）
- 支持自由视角编辑

## 评估
- **创新性**: ⭐⭐⭐⭐⭐
- **实用性**: ⭐⭐⭐⭐ (实时编辑应用广泛)
- **难度**: 中
- **推荐度**: ⭐⭐⭐⭐

## 相关工作
- 3D Gaussian representations
- Digital head modeling
- Sketch-based 3D reconstruction
- Real-time rendering

## 链接
- PDF: https://arxiv.org/pdf/2604.19202
- Code: https://github.com/gogoneural/SketchFaceGS_jittor