# High-Order Simulation of Particle-Laden Flows in Moving Domains

## 论文信息
- **arXiv**: [2606.17969](https://arxiv.org/html/2606.17969)
- **领域**: physics.flu-dyn
- **日期**: 2026-06
- **来源**: University of Stuttgart, Institute of Aerodynamics and Gas Dynamics

## 摘要 (Abstract)
可压缩粒子负载流在运动几何中的高保真模拟涉及与湍流结构的复杂非线性多尺度相互作用。

**本文框架**:
- **连续相**: 高阶间断 Galerkin 谱元法 (DG-SEM)
- **离散相**: 拉格朗日点粒子追踪方案
- **网格运动策略**:
  - ALE (Arbitrary Lagrangian-Eulerian) 方法：处理一般网格变形
  - 滑动网格方法：刚性旋转/平移运动

**核心创新**:
1. 利用径向基函数 (RBF) 变形将 ALE 公式紧密耦合到时间演化步骤
2. 确保网格运动算法与离散相的高阶时间准确耦合
3. 严格跨非一致网格界面的粒子追踪精度

## 数值方法
- **离散化**: 间断 Galerkin 谱元法 (DG-SEM)
- **网格运动**: ALE + RBF 插值 / 滑动网格
- **粒子追踪**: Euler-Lagrange 点粒子方法
- **湍流建模**: 大涡模拟 (LES)
- **几何守恒律**: GCL 保证

## 关键词
- 间断 Galerkin
- 粒子负载流
- ALE 方法
- 滑动网格
- RBF 变形
- Lagrangian particle tracking

## URL
https://arxiv.org/html/2606.17969
