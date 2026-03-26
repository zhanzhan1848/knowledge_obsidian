# NeuralFVM: Neural-physics-based Finite Volume Method for Turbulent Flows

**arXiv ID**: [2603.21869](https://arxiv.org/abs/2603.21869)
**提交日期**: 2026-03-23
**分类**: physics.flu-dyn

## 作者
Tingkai Xue, Yu Jiao, Te Ba, Jingliang Wang, Juntao Yang, Simon See, Boyang Chen, Claire E. Heaney, Christopher C. Pain, Chang Wei Kang, Mohamed Arif Bin Mohamed, Hongying Li

## 摘要
本文开发了一种基于有限体积法(FVM)的神经物理求解器 NeuralFVM，通过实现标准 k-ω 模型用于湍流模拟，专为高效 GPU 执行而设计。流体流动和传热的控制方程使用基于卷积的模板算子重新表述为局部张量操作，这使得与深度学习库兼容同时保持 FVM 的守恒特性。

## 核心创新

### 1. 卷积基模板算子
- 将 FVM 方程转换为局部张量操作
- 兼容深度学习框架 (PyTorch/TensorFlow)
- 保持有限体积法的守恒性质

### 2. 算子分裂策略
- 处理 k-ω 模型中的刚性破坏项
- 刚性项半隐式处理
- 其余项显式推进

### 3. 几何多重网格算法
- 基于卷积的压力-速度耦合求解
- 嵌入神经网络架构中
- 避免全局矩阵组装

## 渲染方法
- **类型**: 体积/粒子混合
- **技术**: 神经物理求解器 + k-ω 湍流模型

## 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐ (与 ANSYS Fluent 验证)
- **风格化支持**: 否

## 性能预期
- **帧率**: GPU 加速 19-46x
- **GPU 需求**: 高 - 需要 GPU 加速
- **内存占用**: 中等

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 完整 CFD 求解器管线
- **推荐度**: ✅ 推荐，提供高质量湍流模拟

## 关键技术点

### k-ω 湍流模型
```
k 方程: ∂k/∂t + u·∇k = P_k - β*ωk + ∇·[(ν+σ_kν_t)∇k]
ω 方程: ∂ω/∂t + u·∇ω = α/ν_t P_k - βω² + ∇·[(ν+σ_ων_t)∇ω]
```

### GPU 加速策略
- 局部张量操作避免全局通信
- 卷积核并行化
- 多重网格层次并行

## 实验结果
- 与 ANSYS Fluent 对比验证
- 渠道流和室内气流场景
- 速度、温度、湍流量高度一致
- CPU vs GPU: 19-46x 加速

## 应用场景
- 室内气流模拟
- 渠道流配置
- 数据驱动湍流建模
- CFD 优化

## 相关链接
- [[Divergence-Free-Neural-Operators]]
- [[k-omega-Turbulence-Model]]
- [[GPU-CFD-Solver]]

---
🩸 可行性分析：**NeuralFVM** - 高度可行的神经流体求解器，GPU 加速显著。已传递给 @墨鱼丸。
