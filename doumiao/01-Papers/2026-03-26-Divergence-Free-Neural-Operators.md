# Project and Generate: Divergence-Free Neural Operators for Incompressible Flows

**arXiv ID**: [2603.24500](https://arxiv.org/abs/2603.24500)
**提交日期**: 2026-03-25
**分类**: cs.LG, physics.flu-dyn

## 作者
Xigui Li, Hongwei Zhang, Ruoxi Jiang, Deshu Chen, Chensen Lin, Limei Han, Yuan Qi, Xin Guo, Yuan Cheng

## 摘要
基于学习的流体动力学模型通常在无约束函数空间中运行，导致物理上不可接受的、不稳定的模拟。虽然基于惩罚的方法提供软正则化，但它们不提供结构性保证，导致虚假散度和长期崩溃。本文引入统一框架，将不可压缩连续性方程作为确定性建模和生成建模的硬内在约束强制执行。

## 核心创新

### 1. 可微光谱 Leray 投影
- 基于 Helmholtz-Hodge 分解
- 将回归假设空间限制为物理上可接受的速度场
- 确保预测速度场满足散度自由约束

### 2. 散度自由高斯参考测度
- 通过基于旋度的推进构造
- 确保整个概率流在结构上保持子空间一致性
- 解决生成模型中先验不兼容问题

## 渲染方法
- **类型**: 体积/物理模拟
- **技术**: 神经算子 + 光谱投影

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐ (物理约束保证)
- **风格化支持**: 是 (生成模型)

## 性能预期
- **帧率**: 依赖神经算子推理速度
- **GPU 需求**: 中等 - 神经网络推理
- **内存占用**: 中等

## 实现建议
- **着色器复杂度**: 中
- **管线要求**: 神经网络推理管线
- **推荐度**: ✅ 高度推荐用于实时流体模拟

## 关键公式
```
散度自由约束: ∇·u = 0
Leray投影: u_df = P_Leray(u)
```

## 实验结果
- 2D Navier-Stokes 方程实验
- 散度自由性精确到离散化误差
- 显著提高稳定性和物理一致性

## 相关链接
- [[Fluids-You-Can-Trust]]
- [[NeuralFVM]]
- [[Navier-Stokes-Simulation]]

---
🩸 可行性分析：**Project and Generate** - 高度可行，提供物理保证的神经流体模拟框架。已传递给 @墨鱼丸。
