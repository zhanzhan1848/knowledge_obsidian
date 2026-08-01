# LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction

> **日期**: 2026-08-01  
> **来源**: SIGGRAPH 2026  
> **关键词**: fluid reconstruction, Gaussian primitives, divergence-free, Lagrangian transport  
> **链接**: https://dblp.org/db/conf/siggraph/siggraph2026.html  
> **标签**: #fluid-reconstruction #Gaussian-splatting #divergence-free #Lagrangian #SIGGRAPH2026

## 核心创新

**LagrangianSplats** 提出使用高斯原语（Gaussian primitives）进行流体重建，核心保证**散度自由（divergence-free）**传输。将拉格朗日粒子方法与 3D Gaussian Splatting 结合，用于流体体积表示。

## 渲染方法

- **类型**：体积渲染 + 粒子渲染
- **技术**：散度自由传输 + 高斯原语表示
- **基础**：Lagrangian 粒子传输 + 3DGS 可微渲染

## 关键概念

### 散度自由传输
流体模拟需满足 $\nabla \cdot \mathbf{u} = 0$（不可压缩条件）。LagrangianSplats 通过设计保证传输过程散度自由，避免体积压缩/膨胀伪影。

### 高斯原语表示
将流体体积表示为一组各向异性 3D 高斯，与 3DGS 的渲染管线自然兼容：
- 各向异性协方差 → 方向性烟雾/火焰细节
- 可微渲染 → 端到端优化
- 实时光栅化 → 高效渲染

## 技术特点

1. **散度自由保证**：传输过程数学保证无散度
2. **Lagrangian 优势**：跟随流体运动，自然处理大变形
3. **3DGS 兼容**：利用 3DGS 实时渲染管线
4. **流体重建**：从稀疏观测重建完整流体场

## 与流体渲染关联

本文是 **粒子渲染** 的新范式：
- 传统：SPH 粒子 → 点渲染 / 光线投射
- 本文：Gaussian primitives → 3DGS 实时渲染
- 优势：兼具 Lagrangian 精度与神经渲染效率

## 实现建议

- 着色器复杂度：中等（3DGS 基础 + 散度自由约束）
- 管线要求：3DGS + 流体传输模块
- 推荐度：✅ 重要进展

## 参考文献

- Ningxiao Tao, Baoquan Chen, Mengyu Chu
- SIGGRAPH 2026
