---
tags: [几何, 光场显示, 高斯溅射, 渲染]
created: 2026-05-10
venue: arXiv
---

# CoherentRaster: Efficient 3D Gaussian Splatting for Light Field Displays

## 问题定义

光场显示(LFDs)需要渲染包含多视角观察的交织图像，多视角需求带来巨大计算开销。

## 核心方法

**CoherentRaster** - 基于 3DGS 的光场渲染框架，执行亚像素级光栅化。

### 两个关键技术

1. **Cross-view Coherent Attribute Reuse**: 消除相邻视角间的冗余计算
2. **View-coherent Remapping**: 恢复因交织亚像素布局降低的 warp 级内存效率

## 性能

- 消费级硬件上实现**实时、高质量**光场合成
- 解决现有加速方法的 GPU 效率问题或高计算量多平面中间表示问题

## 相关技术

- 3D Gaussian Splatting (3DGS)
- Light Field Displays
- 神经渲染 (NeRF)
- subpixel rendering

## 会议/引用

arXiv:2605.04509 | Authors: Gyujin Sim et al.