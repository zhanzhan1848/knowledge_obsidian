# Separable Neural Architectures as a Primitive for Unified Predictive and Generative Intelligence

## 元信息
| 标题 | Separable Neural Architectures as a Primitive for Unified Predictive and Generative Intelligence |
|------|------|
| 作者 | Reza T. Batley, Apurba Sarker, Rajib Mostakim, Andrew Klichine, Sourav Saha |
| 链接 | [原文](https://arxiv.org/abs/2603.12244) |
| arXiv | arXiv:2603.12244 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.LG, cs.AI |

## 核心贡献
1. **SNA 形式化**: 提出 Separable Neural Architecture，统一加性、二次和张量分解神经网络模型
2. **坐标感知公式**: 揭示混沌时空动力学与语言自回归之间的结构类比
3. **跨领域验证**: 在四个不同领域展示 SNA 的组合多功能性

## 方法架构

### 核心概念
- **可分性 (Separability)**: 不必是系统本身的属性，而是系统表达的坐标或表示中涌现的属性
- **结构归纳偏置**: 通过约束交互阶数和张量秩，将高维映射分解为低元组件

### SNA 类型
1. **Additive Models**: 加性模型
2. **Quadratic Models**: 二次模型
3. **Tensor-Decomposed Models**: 张量分解模型

### 关键洞察
```
混沌时空动力学 ⟷ 语言自回归
      ↓                ↓
  连续物理状态    离散序列
      ↓                ↓
  平滑可分嵌入 ←───────┘
```

## 应用领域

| 领域 | 任务 | 结果 |
|------|------|------|
| 强化学习 | 自主导航点导航 | ✓ |
| 材料科学 | 多功能微结构逆向生成 | ✓ |
| 流体力学 | 湍流分布建模 | ✓ |
| NLP | 神经语言建模 | ✓ |

## 理论贡献
- 缓解确定性算子的非物理漂移特性
- 同时适用于离散序列
- 统一确定性和分布式表示

## 创新点
- 提出领域无关的原语用于预测和生成智能
- 建立物理系统与语言模型之间的结构联系
- 展示可分性作为通用归纳偏置的潜力

## 应用场景
- 语言建模
- 物理系统建模
- 生成模型
- 强化学习

## 标签
#neural-architecture #separability #language-modeling #generative-model #physics-informed

## 相关论文
- [[张量分解]]
- [[语言建模]]
- [[生成模型]]
- [[物理信息神经网络]]
