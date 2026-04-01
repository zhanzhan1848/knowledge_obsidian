# Self-Scaling Tensor Basis Neural Network for Reynolds Stress Modeling of Wall-Bounded Turbulence
**arXiv:** [2603.29659](https://arxiv.org/abs/2603.29659) | **分类:** physics.flu-dyn
**作者:** Zelong Yuan et al.
**日期:** 2026-03-31 | **版本:** v1 | **篇幅:** 35 pages, 15 figures, 6 tables

---

## 研究背景与问题
- **问题:** 张量基神经网络 (TBNN) 在壁面湍流中跨雷诺数和几何的鲁棒性不足
- **根因:** 缺乏固有缩放机制
- **目标:** 提出自缩放 TBNN (STBNN)，无需经验系数或壁面距离输入

## 核心方法

### STBNN 架构
- 基于经典 TBNN 框架
- **关键创新:** 不变速度梯度归一化
  - 由速度梯度张量的第一、第二不变量导出
  - 提供固有且几何无关的尺度
  - 平衡应变与旋转效应

### 物理约束
- **框架不变性:** 保持伽利略不变性和旋转不变性
- **物理可解释性:** 雷诺应力各向异性的物理解释

### 训练与验证数据
- **DNS 数据** — 典型壁面湍流
  - 平面槽道 (plane channel)
  - 周期山状流 (periodic hill)
- **a priori 测试:** 模型与 DNS 直接对比
- **a posteriori 测试:** RANS 仿真闭环预测

## 主要结果

### A Priori 测试
- 雷诺应力各向异性重现精度: **相关系数 > 99%**，相对误差 **< 10%**
- 近壁标度律 (near-wall scaling) 准确捕获
- 对数层行为正确再现

### A Posteriori RANS 测试
- 平均速度剖面与 DNS 高度一致
- 分离与再附预测优于:
  - 线性涡粘模型
  - 二次涡粘模型
  - 基线 TBNN

### 泛化能力
- **低雷诺数训练 → 高雷诺数泛化** ✅
- **跨几何泛化** ✅

## 创新点总结
1. **自缩放机制** — 不依赖经验系数或壁面距离
2. **不变量归一化** — 几何无关的固有尺度
3. **强泛化性** — 跨 Re 数和几何的鲁棒表现

## 技术标签
#Turbulence #RANS #TensorBasisNN #WallBoundedTurbulence #DNS #ReynoldsStress #DataDriven #MachineLearning #CFD #ArX:2603.29659

## 原文链接
- Abstract: https://arxiv.org/abs/2603.29659
- PDF: https://arxiv.org/pdf/2603.29659
