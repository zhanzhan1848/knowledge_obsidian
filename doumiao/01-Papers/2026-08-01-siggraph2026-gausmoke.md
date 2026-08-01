# GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction

> **日期**: 2026-08-01  
> **来源**: SIGGRAPH 2026 - Emerging Technologies Demo  
> **关键词**: smoke rendering, Gaussian splatting, sparse reconstruction, neural rendering  
> **链接**: https://s2026.conference-schedule.org/presentation/?id=gensub_426  
> **标签**: #smoke-rendering #Gaussian-splatting #neural-rendering #SIGGRAPH2026

## 核心创新

**GauSmoke** 提出一种混合物理-光学高斯泼溅方法，用 3D Gaussian Splatting (3DGS) 重建稀疏视角下的烟雾。融合物理模拟的烟雾运动规律与神经渲染的光学保真度。

## 渲染方法

- **类型**：体积渲染 + 神经渲染
- **技术**：混合 Physics-Optical Gaussian Splatting
- **输入**：稀疏多视角烟雾图像
- **输出**：可新视角渲染的烟雾表示

## 技术特点

1. **物理约束**：结合烟雾运动物理（PIC/FLIP 速度场）
2. **光学保真**：利用 3DGS 的可微渲染保持光学质量
3. **稀疏重建**：仅需稀疏视角输入即可重建稠密烟雾
4. **实时渲染**：3DGS 的实时光栅化优势

## 视觉质量

- 逼真度：⭐⭐⭐⭐ (新视角合成质量)
- 风格化支持：有限
- 烟雾细节：细节保持较好

## 性能预期

- 帧率：实时 (3DGS 实时渲染优势)
- GPU 需求：中等
- 输入需求：稀疏多视角

## 实现建议

- 着色器复杂度：中等
- 管线要求：3DGS 基础管线 + 物理约束模块
- 推荐度：✅ 值得关注

## 与烟雾渲染关联

本文是 **体积渲染** + **神经渲染** 的结合，代表烟雾渲染的前沿方向：
- 优势：新视角合成、光照一致性
- 局限：需要多视角输入、物理精度有限

## 参考文献

- Wenran Zhang, Yuxiang Cai, Letian Huang, Dongwei Ye, Jie Guo, Bo Ren
- SIGGRAPH 2026 Emerging Technologies Demo
