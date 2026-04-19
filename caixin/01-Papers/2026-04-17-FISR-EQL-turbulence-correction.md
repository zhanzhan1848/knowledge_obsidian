# 2604.14569: FISR-EQL — Field Inversion Symbolic Regression with Embedded Equation Learner for Turbulence Model Correction

## 论文信息
- **arXiv**: [2604.14569](https://arxiv.org/abs/2604.14569)
- **作者**: Yufei Zhang
- **领域**: physics.flu-dyn
- **提交日期**: Thu, 16 Apr 2026

## 核心创新点

### 研究问题
提出 **FISR-EQL**（Field Inversion Symbolic Regression - Equation Learner）框架，对 **SST（Shear Stress Transport）** 湍流模型进行可解释的数据驱动修正。

### 方法论突破
1. **端到端优化**: 不同于传统两阶段方法，修正模型在参数空间中进行端到端优化
2. **EQL 架构**: 嵌入方程学习（Equation Learning）直接识别紧凑解析表达式
3. **伴随方法**: 基于 PDE 约束的场反演（field inversion），使用伴随法获取梯度
4. **物理一致性**: 修正项自动满足守恒律和物理约束
5. **完全可解释**: 最终表达式是显式数学公式，非黑箱神经网络

### 训练数据
- Curved backward-facing step（弯曲后向台阶）
- NASA hump（NASA 驼峰）

### 泛化测试
- Periodic hills（周期山坡）
- Surface-mounted cube（表面安装立方体）
- NLR7301 高升力翼型

## 技术框架

### Field Inversion（场反演）
通过优化找出实验/DNS 数据与 RANS 预测之间的模型误差：
```
SST_corr = SST_original + ΔSST(data-driven)
```

### Equation Learner (EQL)
- 神经网络隐式表示数学表达式
- 通过稀疏化/剪枝提取显式公式
- 保证表达式的数学形式简洁

### 关键结果
- ✅ 显著减少分离泡过预测问题
- ✅ 改善再附预测
- ✅ 性能与端到端神经网络方法相当
- ✅ 保持完全可解释性
- ✅ 未损害附着边界层性能

## 对湍流建模的意义
- ✅ 数据驱动 + 物理约束的范式结合
- ✅ 为 RANS 模型修正提供新路径
- ✅ 可扩展至其他湍流模型（k-ε, k-ω 等）

## 标签
#turbulence-modeling #RANS #SST #symbolic-regression #data-driven #field-inversion #explainable-AI
