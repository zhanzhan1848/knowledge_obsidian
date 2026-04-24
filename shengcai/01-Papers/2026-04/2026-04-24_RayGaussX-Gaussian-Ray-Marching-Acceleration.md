---
tags: [渲染, 神经渲染, 高斯泼溅, 光线行进, 视角合成, 2025]
date: [[2026-04-24]]
status: 待读
---

# RayGaussX: Accelerating Gaussian-Based Ray Marching for Real-Time and High-Quality Novel View Synthesis

## 基本信息
| 标题 | RayGaussX: Accelerating Gaussian-Based Ray Marching for Real-Time and High-Quality Novel View Synthesis |
|------|-------|
| 作者 | Hugo Blanc, Jean-Emmanuel Deschaud, Alexis Paljic (Mines Paris, PSL University) |
| 发表 | arXiv 2509.07782 |
| 链接 | [arXiv](https://arxiv.org/abs/2509.07782) |

## 核心贡献
1. **空空间跳过与自适应采样** - 加速体积光线行进方程计算
2. **光线相干性增强** - 通过基元和光线重排序提升 GPU 并行效率
3. **尺度正则化函数** - 减少误报相交
4. **新型致密化准则** - 改善远距离区域的密度分布，提升大场景图形质量

## 技术方案

### 背景
- RayGauss 通过体积光线投射渲染不规则分布的椭圆基函数，实现 state-of-the-art 图形质量
- 但计算成本高，训练和推理时间长，阻碍实时应用

### RayGaussX 改进
1. **空空间跳过** - 跳过无内容区域
2. **自适应采样** - 根据内容动态调整采样
3. **基元和光线重排序** - 提升 GPU 并行性和内存访问效率
4. **尺度正则化** - 减少误报相交
5. **远距离致密化** - 改善大场景密度分布

### 性能提升
- 训练速度: 5×-12× 加快
- 渲染速度 (FPS): 50×-80× 提升
- 视觉质量: PSNR 提升 up to +0.56 dB

## 实验结论
- 在真实场景数据集上验证
- 对比 RayGauss, Zip-NeRF, 3D-GS
- 改善了训练和推理效率

## 关键词
#神经渲染 #高斯泼溅 #体积光线投射 #新型视角合成 #GPU优化

## 相关链接
- GitHub: https://github.com/hugobl1/raygaussx
