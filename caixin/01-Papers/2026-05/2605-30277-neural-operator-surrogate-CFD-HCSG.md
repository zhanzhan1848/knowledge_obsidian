# Neural Operator Surrogate for CFD: HCSG in SMR

## 论文信息
- **arXiv**: [2605.30277](https://arxiv.org/abs/2605.30277)
- **作者**: (CFD + ML team)
- **日期**: 2026-05-29
- **分类**: physics.flu-dyn (cross-list: cs.LG)
- **URL**: https://arxiv.org/pdf/2605.30277

## 核心创新点

### 研究背景
- 实时热工水力模拟对小模块化反应堆 (SMR) 数字孪生 (DT) 至关重要
- CFD 计算成本高，难以直接用于 DT

### 研究目标
为 SMR 专用几何的 CFD 级瞬态分析开发神经算子代理模型

### 应用场景
- System-integrated Modular Advanced Reactor (SMART)
- Helical Coil Steam Generator (HCSG)

### 方法框架：ROM + Neural Operators

#### 1. MLP-based Autoencoder (AE)
- 用途：非结构化网格数据
- 特点：处理不规则网格

#### 2. Convolutional Autoencoder (CAE)
- 用途：结构化网格数据
- 特点：利用空间相关性

#### 3. Latent DeepONet (L-DeepONet)
- 编码器 + Deep Operator Network
- 结合 AE/CAE 与 DeepONet

#### 4. Fourier Neural Operator (FNO)
- 额外用于比较
- 频域操作

### 多尺度技术
- 减轻频谱偏差
- 改善卡门涡街预测

### 关键结果

#### Multi-scale L-DeepONet
- ✅ 捕获速度场的瞬时周期性涡动力学
- ✅ 捕获压力场的周期性涡动力学

#### FNO 及多尺度变体
- 预测时间平均平均流动
- 提供可靠的压降估计

## 物理场景
- HCSG 内的卡门涡街
- 螺旋管蒸汽发生器
- 反应堆热工水力

## 数值方法
- **Reduced Order Model (ROM)**
- **Neural Operators**: DeepONet, FNO
- **Autoencoders**: MLP, CNN
- **LES** (大涡模拟) 用于验证

## 关键词
`CFD代理模型` `神经算子` `DeepONet` `FNO` `数字孪生` `SMR` `降阶模型` `神经网络`

## 应用场景
- 小模块化反应堆 (SMR)
- 数字孪生 (Digital Twin)
- 实时热工水力仿真

## 相关工作
- Neural Operators
- DeepONet
- Fourier Neural Operator
- Reduced Order Modeling
- CFD Surrogate Models