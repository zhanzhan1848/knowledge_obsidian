---
title: "World from Motion: Generative Dynamic Gaussian Reconstruction from Monocular Video"
authors: ["Liyuan Zhu", "et al."]
date: 2026-07-01
tags: [几何, 3D重建, Gaussian Splatting, 动态场景, 单目视频]
cite: "arXiv:2607.01202"
Project: "https://research.nvidia.com/labs/amri/projects/world-from-motion/"
---

# World from Motion: Generative Dynamic Gaussian Reconstruction from Monocular Video

## 核心方法

从**单目视频**生成可自由渲染的动态 3D Gaussian 表示：

- **输入**：单目视频
- **输出**：动态 3DGS (3D Gaussian Splatting) 表示
- **技术路线**：
  1. 条件化视频模型于密集像素对齐渲染
  2. 编码外观、几何、3D 场景运动
  3. 校正渲染伪影并填补初始重建缺失区域
  4. 在测试时将生成内容蒸馏回一致的高质量动态 3DGS

## 技术创新

- 构建对齐的多视角视频对 + 动态 3DGS 数据集
- 模拟单目重建的特征伪影
- 新视角合成和底层 3D 运动同时提升
- 泛化到野外视频（大方位角变化 + 动态运动）

## 算法复杂度

- 时间复杂度：取决于视频长度
- 空间复杂度：O(n) for Gaussian primitives

## 开源实现

- 项目页面：https://research.nvidia.com/labs/amri/projects/world-from-motion/

## 相关笔记

[[3D重建]] [[Gaussian-Splatting]] [[神经隐式]]

## 可行性评估

✅ **推荐关注**

- NVIDIA 最新工作
- 动态场景重建效果好
- 属于几何重建 + 神经渲染交叉领域

---
*Created: 2026-07-02*
