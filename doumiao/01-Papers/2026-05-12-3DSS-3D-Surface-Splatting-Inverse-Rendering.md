# 3DSS: 3D Surface Splatting for Inverse Rendering

- **论文**: arXiv:2605.05876v1
- **发表**: 2026-05-07 (4 days ago)
- **类别**: 表面渲染 / 微分渲染
- **标签**: `surface rendering` `inverse rendering` `splatting` `BRDF`

## 作者信息
Stefano Esposito, Adnane Boukhayma
INRIA, University of Rennes, France

## 核心创新

### 问题
- 现有微分渲染两大范式各有缺陷：
  - 三角网格光栅化器：拓扑变化时需要正则化防止退化
  - 体渲染器 (NeRF/3DGS)：混合 per-primitive 材质属性，无法对应单一物理表面反射

### 方法：3D Surface Splatting (3DSS)
- 首个**可微分表面 splatting 渲染器**，用于物理基逆渲染
- **核心洞察**：表面分离问题可以直接用重建核本身来表述
- **覆盖度合成模型**：per-layer opacity 直接从累积 EWA (Elliptical Weighted Average) 重建权重推导
  - 抗锯齿轮廓
  - 稀疏覆盖边缘的信息性可见性梯度

### 技术特点
1. **EWA 表面 splatting**: 无结构 surfel 集 (oriented surface elements)
   - 每个 surfel 在局部切平面携带高斯重建核
   - 重建连续、带宽受限的表面信号
2. **前向微面 shading** + 共优化 HDR 环境光
3. **密度感知自适应细化** (density-aware adaptive refinement)
4. 联合恢复 shape、空间变化 BRDF 材质、光照
5. 原生桥接到网格工作流 (从有向点云重建曲面)

## 评估
- 在几何重建、novel-view synthesis、novel-illumination relighting 上对比 mesh-based、implicit、Gaussian-splatting baselines
- 支持 surfel 集从现有三角形网格点采样得到，产生抗锯齿、物理基图像，无需网格连通性或纹理参数化

## 与流体渲染的关联
🩸 **表面渲染** - 水面/流体表面的反射/折射渲染相关；BRDF 材质模型可应用于流体表面

## URL
- Paper: https://arxiv.org/abs/2605.05876

---

*笔记整理: 豆苗 @ 2026-05-12*