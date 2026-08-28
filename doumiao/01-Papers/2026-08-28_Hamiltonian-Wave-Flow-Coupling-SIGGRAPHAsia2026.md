# Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows

## 论文信息
- **arXiv ID**: [2608.25203](https://arxiv.org/abs/2608.25203)
- **PDF**: [2608.25203.pdf](https://arxiv.org/pdf/2608.25203)
- **发表**: SIGGRAPH Asia 2026 (To appear in ACM Transactions on Graphics)
- **作者**: Sinan Wang et al.
- **日期**: 2026-08-25

## 核心创新点

### 问题
大规模自由水面模拟长期以来面临 2D 波浪模型与 3D 流体求解器之间的动力学不匹配问题：
- 图形学中高效的 2D 波浪模型通常是线性的或非色散的
- 将它们与强非线性 3D 求解器耦合时，在 2D-3D 界面处产生明显反射和伪影

### 解决方案
引入基于**规范 Zakharov 公式**的非线性、色散 2D 波浪模型：
- **哈密顿结构**：水面高程和表面势能形成规范对 (η, ψ)，受波能控制
- **双向耦合**：实现 2D-3D 界面上信息的双向传递

### 技术细节
1. **2D 求解器优势**：
   - 比 SWE、BEM 和 Airy 基线减少 1.7-5× 平均波高误差
   - 比 BEM 快 10³× 以上
   - 更高的非线性精度和耦合保真度

2. **与 3D Navier-Stokes 求解器耦合**：
   - 抑制各种实验中的可见接缝伪影
   - 包括色散匹配和 Kelvin 尾迹测试
   - 比纯 GPU NB-FLIP 模拟快 4× 以上

## 渲染相关技术
- **水面渲染**: 自由水面模拟
- **波浪动画**: 非线性色散波浪
- **2D-3D 耦合**: 混合尺度流体渲染

## 性能指标
| 指标 | 改进 |
|------|------|
| 平均波高误差 | 减少 1.7-5× |
| 速度 (vs BEM) | 快 10³× |
| 与纯 3D 相比 | 快 4× |

## 公式概要
- 规范对：(η, ψ)
- 哈密顿结构确保双向耦合的一致性
- 基于 Zakharov 公式的非线性色散模型

## 应用场景
- 大规模海面渲染
- 船舶尾迹模拟 (Kelvin-wake)
- 实时海洋可视化
- 混合尺度流体-波浪交互

## 相关链接
- DOI: https://doi.org/10.1145/3842540
- arXiv: https://arxiv.org/abs/2608.25203

## 标签
#water-rendering #fluid-simulation #wave-simulation #ocean-rendering #siggraph-asia-2026 # Hamiltonian #2D-3D-coupling
