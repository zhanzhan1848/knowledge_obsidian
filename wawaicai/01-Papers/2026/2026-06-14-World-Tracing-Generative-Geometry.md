---
tags: [几何, 几何生成, 深度学习, 图像到3D, 神经渲染]
---

# World Tracing: Generative Pixel-Aligned Geometry Beyond the Visible

## 核心方法

提出 **World Tracing**，一种生成式像素对齐几何表示，预测与观测像素对齐的 3D 点，同时完成可见表面之外的几何。

### 表示方式
每个输入像素预测有序的 3D 点堆栈：
- 第一层：可见表面
- 后续层：遮挡表面的前向到后向交点

### 模型: WT-DiT
- **World-Tracing Diffusion Transformer**
- 多几何层作为独立去噪 token，通过因式分解和全局注意力耦合
- 训练：像素空间 flow matching + 混合噪声调度

### 关键创新
1. 像素对齐生成 vs 深度估计器（只到可见表面）vs 图像转3D（错位）
2. 有序几何层堆栈表示遮挡结构
3. 保留 2D-3D 对应性，支持文本驱动 3D 场景编辑

## 核心应用
- 可见表面重建
- 完整几何生成
- 几何条件新视角视频合成
- 与纹理网格生成器的免训练集成

## 开源实现
- 项目页面: https://haoz19.github.io/world-tracing-page/

## 相关笔记
[[2026-03-25-Accurate-Point-Measurement-3DGS]]
[[2026-03-19_Points-to-3D_Structure_Aware_3D_Generation]]

## 可行性评估
⚠️ **谨慎评估** - 深度学习依赖，需要 GPU 资源

## 来源
- arXiv: [2606.13652](https://arxiv.org/abs/2606.13652)
- 分类: cs.CV, cs.GR
- 日期: 2026-06-11