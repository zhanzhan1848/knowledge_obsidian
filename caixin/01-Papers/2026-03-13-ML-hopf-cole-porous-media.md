# A Machine Learning-Enhanced Hopf-Cole Formulation for Nonlinear Gas Flow in Porous Media

## 元数据
- **arXiv ID**: 2603.11250
- **提交日期**: 2026-03-11
- **作者**: Kalyana Babu Nakshatrala
- **URL**: https://arxiv.org/abs/2603.11250
- **PDF**: https://arxiv.org/pdf/2603.11250

## 核心创新
集成 Hopf-Cole 变换 + 混合形式 + 共享主干神经网络 + DeepLS 求解器的多孔介质气体输运框架。

## 关键技术点

### 物理模型
- **Klinkenberg 模型**: 气体滑移效应
- **压力相关渗透率**: 非线性特性
- **偏离达西流**: 经典行为偏差

### 数学变换
- **Hopf-Cole 变换**: 非线性 → 线性系统
- **混合形式**: 压力 + 速度场同时预测
- **等价于 Darcy 模型**: 简化数值模拟

### 机器学习
- **共享主干神经网络**: 同时预测多场
- **DeepLS 求解器**: 深度最小二乘法
- **收敛分析**: 理论 + 数值验证

## 主要优势
1. 鲁棒性: 宽压力范围
2. 精度: 流动动力学恢复
3. 效率: 计算高效
4. 反问题: 参数估计自然支持

## 应用场景
- 油藏性能预测
- 碳捕获与封存 (CCS)
- 燃料电池和电池

## 相关论文
- [[Hopf-Cole 变换]]
- [[Klinkenberg 效应]]
- [[DeepLS 方法]]
- [[多孔介质流动]]

## 标签
#machine-learning #porous-media #Hopf-Cole #Klinkenberg #neural-network #inverse-modeling
