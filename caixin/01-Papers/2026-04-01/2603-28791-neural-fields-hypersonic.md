# Learning 3D Hypersonic Flow with Physics-Enhanced Neural Fields
**arXiv:** [2603.28791](https://arxiv.org/abs/2603.28791) | **分类:** physics.flu-dyn
**作者:** Haitz Sáez de Ocáriz Borde, Pietro Innocenzi, Flavio Savarino, Andrei Cristian Popescu, Pantelis Papageorgiou
**日期:** 2026-03-21 | **版本:** v1

---

## 研究背景与目标
- **问题:** 高超音速飞行器（如猎户座返回舱）再入过程中的三维气动热力学模拟
- **挑战:** 传统 CFD 所需的大规模计算网格使全任务性能预测和控制不切实际
- **目标:** 构建连续计算高效的气动热力学代理模型，支持快速探索攻角变化下的飞行状态

## 核心方法

### 模型架构
- **Physics-Enhanced 3D Neural Fields**
  - 输入: 空间坐标 + 攻角 (angle of attack)
  - 输出: 压力、温度、三维速度分量
- **Fourier Positional Feature Mappings**
  - 捕获高超音速流中典型的尖锐不连续（如激波）
- **物理约束增强**
  - 无滑移边界条件 (no-slip)
  - 等温壁面条件 (isothermal wall)

### 与传统方法对比
- 对比图神经网络 (GNN) 等替代代理模型
- 在捕获高速流场中的陡峭梯度方面表现更优

## 关键创新点

1. **连续代理模型** — 避免传统 CFD 网格离散化，支持任意角度/位置的连续查询
2. **Fourier 特征映射** — 有效处理激波等间断
3. **物理约束** — 无滑移+等温壁条件增强预测的物理一致性
4. **计算高效** — 支持实时/快速飞行状态探索

## 数值细节
- **求解域:** 3D 绕 Orion 再入舱外流场
- **物理模型:** 高超音速可压缩流 Navier-Stokes
- **训练数据:** 高保真 CFD 模拟结果

## 适用场景
- 高超音速再入轨迹优化
- 飞行器气动设计快速评估
- 全任务实时性能预测

## 技术标签
#CFD #NeuralSurrogate #HypersonicFlow #PhysicsInformedNN #FourierFeatures #ArX:2603.28791

## 原文链接
- Abstract: https://arxiv.org/abs/2603.28791
- PDF: https://arxiv.org/pdf/2603.28791
