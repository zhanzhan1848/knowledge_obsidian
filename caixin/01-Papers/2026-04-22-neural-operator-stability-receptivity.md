# A Neural Operator Framework for Data-Driven Discovery of Stability and Receptivity in Physical Systems

## 论文信息
- **arXiv ID**: [2604.19465](https://arxiv.org/abs/2604.19465)
- **作者**: Chengyun Wang (等)
- **日期**: 2026-04-21
- **类别**: physics.flu-dyn, cs.AI

## 核心创新点

### 方程无关方法论 (Equation-Free Methodology)
1. **无需已知控制方程**即可识别稳定性和 receptivity 特性
2. 仅从观测数据学习
3. 训练神经网络作为动力学模拟器

### 技术路线
- 使用**自动微分**从神经网络提取 Jacobian
- 直接从数据计算本征模和 resolvent 模
- 在强非线性状态下成功识别主导不稳定模式和输入-输出结构

## 方法论

### 流程
```
观测数据 → 训练神经网络动力学模拟器 → 自动微分提取 Jacobian → 本征模/Resolvent 模
```

### 优势
- 获得系统动力学的非线性表示
- 同时检索以前难以解析的复杂动力学模式

## 应用验证
1. **典型混沌模型**: 验证方法有效性
2. **高维流体流动**: 成功识别主导不稳定模式

## 与传统方法对比

| 方法 | 需求 | 局限性 |
|------|------|--------|
| 传统稳定性/Resolvent 分析 | 已知方程 + 线性化 | 非线性或建模差的系统受限 |
| 本方法 (Neural Operator) | 仅观测数据 | 无需方程和线性化 |

## 应用场景
- 气候科学
- 神经科学
- 流体工程

## 链接
- PDF: https://arxiv.org/pdf/2604.19465
- HTML: https://arxiv.org/html/2604.19465v1

## 标签
#machine-learning #neural-operator #stability-analysis #fluid-dynamics #data-driven #chaos #resolvent