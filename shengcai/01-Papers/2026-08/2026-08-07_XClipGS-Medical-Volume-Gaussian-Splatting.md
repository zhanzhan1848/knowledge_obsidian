---
tags: [渲染, 医学渲染, 高斯溅射, 体积渲染]
date: [[2026-08-07]]
status: 待深入分析
---

# XClipGS: Exact Half-Space Clipping for Medical Volume Gaussian Splatting

## 元信息

| 属性 | 内容 |
|------|------|
| **标题** | XClipGS: Exact Half-Space Clipping for Medical Volume Gaussian Splatting |
| **作者** | Zhongpai Gao, Benjamin Planche, Meng Zheng, Anwesa Choudhuri, Chaoyi Zhou, Terrence Chen, Ziyan Wu |
| **链接** | [arXiv](https://arxiv.org/abs/2608.07760) |
| **项目页** | [gaozhongpai.github.io/XClipGS](https://gaozhongpai.github.io/XClipGS) |
| **日期** | 2026-08-07 |
| **arXiv ID** | 2608.07760v1 |

## 核心贡献

1. **精确半空间裁剪**: 裁剪平面暴露 anatomy 时，保留被裁剪的原语而非简单丢弃
2. **闭合形式算子**: 在EWA溅射的局部仿射模型下，精确计算半空间限制的高斯积分
3. **无学习参数**: 不依赖学习裁剪参数或辅助网络
4. **可微性**: 对原语和裁剪平面均可微

## 技术方案

### 问题背景

- 高斯溅射代理支持医学体积扫描的交互式渲染
- 裁剪平面暴露 anatomy 时，外部视图训练无法约束被裁剪的几何
- 传统溅射只能保留或丢弃整个原语

### 解决方案

**闭合形式每像素算子**:
```
∫(half-space restricted Gaussian) = footprint × conditional Gaussian CDF
```

- 条件高斯CDF的参数是像素坐标的仿射函数
- 不引入学习参数或辅助网络

### 监督策略

- **多距离参考视图**: 不同裁剪平面轴和偏移的视图
- **裁剪/未裁剪配对协议**: 使用CDE和Leak指标评估

## 性能指标

| 指标 | XClipGS | ClipGS |
|------|---------|--------|
| PSNR | 33.56 dB | 32.34 dB |
| 渲染速度 | >650 FPS | 278 FPS |
| SSIM (带裁剪) | 0.860 | 0.809 |

## 实验结论

- 在8个CT和MRI体积上验证
- 最高PSNR：33.56 dB vs 32.34 dB (ClipGS)
- 渲染速度：超过650 FPS

## 相关笔记

- [[2026-08-06_ESVR-Ellipsoid-Sparse-Volume-Rendering]] - 椭球体稀疏体积渲染

## 链接

- PDF: https://arxiv.org/pdf/2608.07760
- Project: https://gaozhongpai.github.io/XClipGS/
