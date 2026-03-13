# Algorithmic Capture of Infinite Transformers

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Algorithmic Capture, Computational Complexity, and Inductive Bias of Infinite Transformers |
| 作者 | Orit Davidovich, Zohar Ringel |
| 链接 | [arXiv:2603.11161](https://arxiv.org/abs/2603.11161) |
| arXiv | arXiv:2603.11161 |
| 分类 | cs.LG, cond-mat.dis-nn, stat.ML |
| 日期 | 2026-03-11 |

## 核心贡献
1. **Algorithmic Capture 形式化定义**：区分真正的算法学习与统计插值
2. **计算复杂度上界**：推导无限宽度 Transformer 可学习函数的推理时计算复杂度上界
3. **Inductive Bias 发现**：证明 Transformer 偏向低复杂度算法

## 核心概念：Algorithmic Capture

### 定义
> Algorithmic Capture (即 "grokking" 算法) = 神经网络泛化到任意问题规模 (T) 的能力，具有可控误差和最小样本适应

### 区分
| 类型 | 特征 |
|------|------|
| 真正的算法学习 | 泛化到任意规模，可控误差 |
| 统计插值 | 仅在训练分布内有效 |

## 理论分析

### 分析框架
- **Infinite-Width Transformers**
- **Lazy Regime**：懒惰训练
- **Rich Regime**：丰富训练

### 主要结果

#### 1. 计算复杂度上界
- 推导推理时计算复杂度的上界
- 限制 Transformer 可学习的函数类别

#### 2. Inductive Bias
> **Despite their universal expressivity, transformers possess an inductive bias towards low-complexity algorithms within the EPTHS class.**

#### 3. EPTHS 类
**E**fficient **P**olynomial **T**ime **H**euristic **S**cheme
- Transformer 可学习的算法类别
- 低复杂度算法

## 关键发现

### 能力边界
| 可学习 | 难学习 |
|--------|--------|
| Search | 高复杂度算法 |
| Copy | 超多项式时间算法 |
| Sort | |

### 普遍表达性 vs Inductive Bias
- Transformer 理论上可表达任意函数
- 但 inductive bias 限制实际学习能力
- 偏向简单、高效的算法

## 理论意义

### 对 "Grokking" 的理解
- Grokking ≠ 魔法
- 是算法学习的体现
- 受限于计算复杂度

### 对模型设计的启示
- Transformer 不适合高复杂度算法
- 需要其他架构或外部工具
- 理解能力边界有助于任务分配

## 应用场景
- 理论理解 Transformer 能力
- 算法学习任务设计
- 架构选择指导

## 标签
#theory #transformers #algorithmic-learning #grokking #complexity #inductive-bias
