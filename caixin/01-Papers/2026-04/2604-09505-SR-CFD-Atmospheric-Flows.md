# Enhancing the Accuracy of Under-Resolved Numerical Simulations of Atmospheric Flows with Super Resolution

**arXiv:** [2604.09505](https://arxiv.org/abs/2604.09505)
**Subject:** physics.flu-dyn
**Date:** 2026-04-10
**Author:** Armin Sheidani

---

## 核心创新点

- **研究目标：** 利用超分辨率（SR）深度学习技术提升欠分辨率CFD模拟的空间分辨率，同时控制计算成本
- **训练数据来源：** 弱可压Euler方程的大气流动模拟
- **对比方法：**
  1. 基线CNN
  2. 注意力增强CNN（attention-enhanced CNN）
  3. 多尺度CNN（捕捉不同空间尺度的流动结构）
  4. 扩散-based SR模型

## 关键发现

- 基线CNN能准确重建简单流动特征
- 复杂流动需要多尺度架构
- **多尺度CNN提供最佳的精度、鲁棒性和计算效率平衡**，甚至优于扩散模型
- 分析了训练数据集规模对模型敏感性的影响

## 数值方法

- **控制方程：** 弱可压Euler方程
- **应用场景：** 中尺度大气流动
- **Benchmark：** 上升热气泡 (rising thermal bubble)、密度流 (density current)

## 评估指标

- 定性比较流动结构重建精度
- 敏感性分析（训练数据量 vs 精度）

## 关键公式/概念

- 超分辨率重建：$I_{HR} = SR(I_{LR})$
- 多尺度特征提取：捕捉从大尺度涡旋到小尺度湍流的能量级联

## 技术要点

- 多尺度CNN设计核心：并行多分辨率特征提取 + 特征融合
- 扩散模型缺点：计算成本高，多尺度流动表现不如多尺度CNN

## 🔗 URL
- PDF: https://arxiv.org/pdf/2604.09505
- HTML: https://arxiv.org/html/2604.09505v1

## 标签
#CFD #deep-learning #super-resolution #atmospheric-flows #Euler-equations #CNN #diffusion-model
