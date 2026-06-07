# LagrangianSplats: Divergence-Free Fluid Reconstruction

## 论文信息
- **arXiv ID**: 2605.09299
- **发表时间**: 2026-05-10
- **URL**: https://arxiv.org/abs/2605.09299

## 核心贡献

### 研究问题
从稀疏2D视频观测重建3D流体速度场是一个高度不适定的逆问题。

### 技术挑战
1. **传输一致性**: 与观测运动一致
2. **物理有效性**: 满足流体物理定律
3. **现有方法局限**: 通常通过软惩罚实现，导致精度妥协和收敛问题

### 解决方案
LagrangianSplats框架：
1. **连续无散度核表示 (Divergence-Free Kernel)**
2. **Lagrangian 3D Gaussian Splatting表示**
3. **滑动窗口方案 (Sliding Window)**

### 核心创新
- **内蕴保证流不可压缩性** (Incompressibility)
- **远程传输一致性** (Long-range Transport Coherence)
- **高效梯度传播**: 有意义的时域视野同时保持可训练成本

## 渲染方法
- **类型**: 粒子 / 体积
- **技术**:
  - Divergence-Free Kernel
  - 3D Gaussian Splatting
  - Lagrangian粒子传输

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 否

## 性能预期
- **帧率**: 实时
- **GPU需求**: 高
- **内存占用**: 中等

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 3DGS + 流体模拟
- **推荐度**: ✅✅✅

## 应用场景
- 高质量重模拟
- 流体分析
- 流体动力学可视化
- 流体渲染重建