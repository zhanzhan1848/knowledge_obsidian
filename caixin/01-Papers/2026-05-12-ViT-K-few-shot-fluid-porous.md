# ViT-K: Few-Shot 学习流固耦合
**arXiv**: 2605.13912 | math.NA, physics.flu-dyn
**日期**: 2026-05-12
**关键词**: Vision Transformer, Koopman operator, Stokes/Darcy, 多物理场

## 研究问题
自由流与多孔介质的相互作用数值模拟对于理解流体过滤和生理传输至关重要，但因界面异质性解析和长期预测不稳定性的高计算成本而受阻。

## 核心创新

### ViT-K 框架
1. **Vision Transformers (ViT)**: 捕获异质界面特征
2. **Koopman operator**: 线性化时间动力学
3. **少样本学习**: 从稀疏数据学习

### 关键特性
- 将非线性动力学提升到全局线性可观测空间
- **预测误差线性增长（非指数）**
- 适合小样本 regime 的可靠长期外推

## 数值验证

### 基准系统
- 耦合 Stokes/Navier-Stokes-Darcy 流动
- 界面异质性

### 性能
- 高保真捕获复杂界面物理
- 对测量噪声的卓越鲁棒性（隐式谱滤波器）
- 推理速度显著优于传统求解器
- 保持物理一致性

## URL
https://arxiv.org/abs/2605.13912

---
*标签*: #Vision-Transformer #Koopman-operator #流固耦合 #少样本学习