# Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats

## 论文信息

| 属性 | 值 |
|------|-----|
| 标题 | Scene-Level Heterogeneous Physics Simulation with 3D Gaussian Splats |
| 作者 | Xiaoyang Liu, Shangzhe Wu, Kai Han |
| 机构 | The University of Hong Kong, University of Cambridge |
| 会议 | CVPR 2026 Findings |
| arXiv | 2606.21753 |
| 日期 | 2026-06-24 采集 |
| 关键词 | 3DGS, physics simulation, heterogeneous multi-solver, fluid, SPH, MPM |

## 核心创新

### 技术方法
- **Representation Abstraction Framework**: 表示抽象框架
- **Unified Particle Set**: 统一粒子集合
- **Heterogeneous Multi-Solver**: 异构多求解器
- **Two-Way Coupling**: 双向耦合

### 关键技术细节
将不同资产（3DGS、虚拟网格、流体）转换为统一物理粒子集：
- **3DGS** → 软体（PBD deformable bodies）
- **虚拟网格** → PBD可变形体
- **外部流体** → SPH粒子

静态场景边界从场景捕捉中提取，用于碰撞检测。

异构求解器包括：MPM（物质点法）、SPH（光滑粒子流体动力学）、PBD（位置动力学）、刚体、关节体。

物理结果"反向翻译"驱动各资产视觉重建：
- 3DGS资产使用变形梯度F'更新协方差Σ'
- 网格资产使用粒子位置驱动重心蒙皮

## 渲染方法

- **类型**: 粒子 + 表面
- **技术**: SPH流体 + 3DGS渲染
- **渲染引擎**: Unreal Engine 5 (Lumen全局光照)

## 视觉质量

- **逼真度**: 极高（结合3DGS与物理模拟）
- **风格化支持**: 否

## 性能预期

- **帧率**: 实时（Unreal Engine 5）
- **GPU 需求**: 高
- **内存占用**: 高

## 实现建议

- **着色器复杂度**: 高
- **管线要求**: 异构物理引擎 + 现代游戏引擎
- **推荐度**: ✅ 推荐

## 演示场景

1. 3DGS软体熊在SPH流体飞溅下变形
2. 在复杂真实场景花园中滑动
3. 两向物理交互（3DGS ↔ 流体 ↔ 网格）

## URL

- Project Page: https://visual-ai.github.io/raf/
- arXiv: https://arxiv.org/abs/2606.21753

## 备注

**为何重要**: 这是第一篇实现场景级、异构、多求解器物理模拟与3D Gaussian Splatting结合的论文。解决了3DGS资产无法参与物理交互的问题，为未来电影级特效和游戏开发提供了新思路。

**与流体渲染的关系**: 论文中包含流体（SPH）与3DGS资产的复杂双向交互，对于理解未来流体渲染与新型场景表示的结合具有重要意义。
