# The Closure Challenge: A Benchmark Task for Machine Learning in Turbulence Modelling
**arXiv:** [2603.28884](https://arxiv.org/abs/2603.28884) | **分类:** physics.flu-dyn, physics.comp-ph, physics.data-an
**作者:** Ryley McConkey, Tyler Buchanan, Tess Smidt, Abigail Bodner, Richard Dwight, Paola Cinnella
**日期:** 2026-03-30 | **版本:** v1
**代码:** https://github.com/rmcconke/closure-challenge-benchmark

---

## 研究背景与动机
- **问题:** 开放源码数据集存在，但缺乏标准基准测试指标和测试数据集
- **目标:** 建立机器学习湍流闭合模型的行业标准基准

## 数据集与测试用例

### 训练数据
- 多种高保真数据（LES/DNS）
- **标准化格式:** 包含平均速度梯度 (mean velocity gradients)
- 开放获取

### 测试算例（评估泛化能力）
1. **Periodic Hills** — 几何+雷诺数泛化
2. **Square Duct** — 几何泛化
3. **NASA Wall-Mounted Hump** — 实际工程几何

### 核心评估维度
- **雷诺数泛化** (Reynolds number generalization)
- **几何泛化** (geometry generalization)

## 早期提交结果
- 三个早期提交结果已公布
- 挑战持续进行，旨在不断推动 ML 湍流建模创新

## 意义
- 若成为标准基准，将极大推动 ML 湍流闭合模型的可复现性与公平对比
- 为新 ML 框架提供统一评估标准

## 技术标签
#Turbulence #RANS #MachineLearning #Benchmark #OpenSource #TurbulenceModeling #CFD #ArX:2603.28884

## 原文链接
- Abstract: https://arxiv.org/abs/2603.28884
- PDF: https://arxiv.org/pdf/2603.28884
- GitHub: https://github.com/rmcconke/closure-challenge-benchmark
