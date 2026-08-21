---
title: "Pixel-Space Modeling for Structure Preserving Monocular Depth Estimation"
authors: [Zhiyuan Yuan et al.]
date: 2026-08-17
tags: [几何, 深度估计, 单目, 结构保持]
arxiv: "2608.16984"
doi: "10.48550/arXiv.2608.16984"
subjects: [cs.CV, cs.AI, cs.GR]
---

# PXDepth: 结构保持单目深度估计

## 核心方法

提出 **PXDepth**，分离全局上下文建模与像素级深度预测的判别式单目深度模型。

### 核心问题
现有单目深度估计器在大规模 ViT 编码器 + 卷积解码器组合下，往往难以保持细粒度结构和物体边界——粗 token 化削弱了上采样无法完全恢复的像素级线索。

### 核心技术

1. **全局上下文建模**
   - Large-patch ViT 捕获全局场景上下文

2. **像素空间预测器**
   - Context-Modulated Pixel Transformer 模块
   - 在整个深度估计过程中保持高分辨率空间表示
   - 保留细粒度结构和锐利边界

3. **设计优势**
   - 不牺牲全局深度一致性
   - 保持局部几何精度
   - 推理高效

## 开源代码
https://yuanzhy29.github.io/PXDepth-Page/

## 相关技术
- Monocular Depth Estimation
- Structure Preservation
- Vision Transformer
- Pixel-level Prediction

## 可行性评估

**推荐度：⚠️ 谨慎评估（几何相关但偏向 CV）**

- 深度估计与几何处理相关
- 结构保持设计有参考价值
- 主要属于计算机视觉方向

## 会议信息
arXiv Submission, 2026-08-17
