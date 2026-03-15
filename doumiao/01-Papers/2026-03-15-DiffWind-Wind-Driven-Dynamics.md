# DiffWind: Physics-Informed Differentiable Modeling of Wind-Driven Object Dynamics

## 📋 基本信息
- **arXiv**: [2603.09668](https://arxiv.org/abs/2603.09668)
- **会议**: ICLR 2026
- **提交日期**: 2026年3月10日
- **项目主页**: https://zju3dv.github.io/DiffWind/
- **领域**: 计算机视觉 (cs.CV) / 图形学 (cs.GR)

## 👥 作者
Yuanhang Lei, Boming Zhao, Zesong Yang, Xingxuan Li, Tao Cheng, Haocheng Peng, Ru Zhang, Yang Yang, Siyuan Huang, Yujun Shen, Ruizhen Hu, Hujun Bao, Zhaopeng Cui

## 📝 摘要
从视频观测中建模风驱动物体动力学是一个高度挑战性的问题，因为风是不可见的且具有时空变异性，物体也会发生复杂的变形。DiffWind是一个物理信息可微分框架，统一了风-物体交互建模、基于视频的重建和前向模拟。

## 🔑 核心技术

### 表示方法
- **风场**: 网格化物理场 (Grid-based physical field)
- **物体**: 基于3D Gaussian Splatting的粒子系统
- **交互建模**: Material Point Method (MPM)

### 物理约束
- **Lattice Boltzmann Method (LBM)**: 作为物理信息约束，确保符合流体动力学定律

### 优化框架
- 联合优化时空风力场和物体运动
- 可微分渲染和模拟
- 支持新风力条件下的前向模拟

## 💡 创新点

1. **统一框架**: 首次将风-物体交互建模、视频重建和前向模拟统一在一个可微分框架中

2. **物理约束**: 使用LBM作为物理先验，确保重建的动力学符合流体物理规律

3. **新应用**: 支持风力重定向(wind retargeting)等新应用

4. **数据集**: 引入WD-Objects数据集，包含合成和真实世界的风驱动场景

## 📊 渲染方法分类
- **类型**: 粒子系统 + 体积渲染
- **技术**: 3D Gaussian Splatting, Differentiable Rendering

## 🎯 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- **风格化支持**: 是（通过风力控制）
- **物理准确性**: 高（LBM约束）

## ⚡ 性能预期
- **重建精度**: 显著优于现有动态场景建模方法
- **模拟保真度**: 高
- **GPU需求**: 中-高（可微分渲染 + MPM模拟）

## 🔧 实现建议
- **着色器复杂度**: 高
- **管线要求**: 
  - 可微分渲染管线
  - MPM模拟系统
  - LBM流体求解器
- **推荐度**: ✅ 强烈推荐用于风-物体交互场景

## 🔗 相关工作
- 3D Gaussian Splatting
- Material Point Method (MPM)
- Lattice Boltzmann Method (LBM)
- Neural Radiance Fields (NeRF)
- Dynamic Scene Reconstruction

## 📚 引用
```bibtex
@inproceedings{lei2026diffwind,
  title={DiffWind: Physics-Informed Differentiable Modeling of Wind-Driven Object Dynamics},
  author={Lei, Yuanhang and Zhao, Boming and Yang, Zesong and others},
  booktitle={ICLR},
  year={2026}
}
```

---
*创建日期: 2026-03-15*
*来源: arXiv每日论文搜索*
*标签: #fluid-rendering #particle-system #differentiable-rendering #physics-informed #wind-simulation*
