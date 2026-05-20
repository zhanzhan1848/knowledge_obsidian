# Theory-optimal Quantization Based on Flatness

## 元信息
| 标题 | Theory-optimal Quantization Based on Flatness |
|------|-----|
| 作者 | Xiusheng Huang, Zhe Li, Xuanwu Yin, Lu Wang, Yequan Wang, Dong Li, Emad Barsoum, Kang Liu (中科院, BAAI, AMD) |
| 链接 | [原文](https://arxiv.org/abs/2605.18800) |
| arXiv | arXiv:2605.18800 |
| 发表 | 2026-05-11 |
| 代码 | - |

## 核心贡献

1. **建立数学关系**: 首次建模量化误差与 outliers 之间的数学关系，发现 outliers 以二次方级别影响量化误差

2. **提出 Flatness 指标**: 量化矩阵中 outliers 的分布，基于信息熵思想，定义 $F = \sum_{i=1}^{m}\sum_{j=1}^{n}\left(\frac{W_{ij}^2}{\alpha_i \beta_j}\ln\frac{W_{ij}^2}{\alpha_i \beta_j}\right)$

3. **BDQ 方法**: Bidirectional Diagonal Quantization，通过双向对角矩阵变换分散 outliers，在 LLaMA-3-8B 的 W4A4 量化下实现 <1% 精度损失

## 模型架构

### 问题建模

**量化过程**:
$$Q(w) = \text{round}\left(\frac{w}{\triangle}\right) + z, \quad \triangle = \frac{\max(|w|)}{2^b-1}$$

**单个 Outlier 的量化误差**:
当 $|w_{outlier}| \gg c$ 时，$|\epsilon_i| \leq \frac{|w_{outlier}|x}{2^b-1}$，量化误差与 outliers 成正比

**整个矩阵的量化误差**:
$$E[\epsilon^2] \approx p \cdot w_{outlier}^2 x$$
总量化误差与 outliers 呈**平方关系**

### Flatness 指标

借鉴信息熵思想，定义矩阵的 Flatness:
$$F = \sum_{i,j} \frac{W_{ij}^2}{\alpha_i \beta_j} \ln\left(\frac{W_{ij}^2}{\alpha_i \beta_j}\right)$$

约束条件:
$$\sum_{i,j} \frac{W_{ij}^2}{\alpha_i \beta_j} = 1$$
$$\sum_{i,j} \alpha_i W_{ij}^2 \beta_j = C, \quad (C > 0)$$

通过拉格朗日乘数法求解，得到最优解形式: $V = d_1 W d_2$，即双向对角矩阵变换是 Flatness 的最优解

### BDQ 方法

$$y = Q(\Lambda_1 x \Lambda_2 R) \cdot Q(R^T \Lambda_2^{-1} W \Lambda_1^{-1})$$

其中:
- $\Lambda_1, \Lambda_2$ 是两个可学习的对角矩阵 (行方向和列方向缩放)
- $R$ 是 Hadamard 正交矩阵
- $Q(\cdot)$ 是量化函数

### Recursive Cross-Entropy (RCE) Loss

解决小样本校准集 (128 samples) 导致的过拟合问题:
$$\mathcal{L}_{RCE} = -\sum_{i=0}^{n}(q_i \log p_i - p_i \log(\delta p_i + (1-\delta) q_i))$$

同时拟合标签分布 $q$ 和模型预测分布 $p$，防止过拟合

## 实验结果

### W4A4KV4 设置

| 模型 | 方法 | WikiText2 PPL | ARC-C | Avg |
|------|------|-------------|-------|-----|
| LLaMA3-8B | FP16 | 6.14 | 53.50 | 73.23 |
| LLaMA3-8B | QuaRot | 8.16 | 45.73 | 65.79 |
| LLaMA3-8B | SpinQuant | 7.39 | 47.27 | 68.70 |
| LLaMA3-8B | FlatQuant | 6.90 | 50.51 | 71.33 |
| LLaMA3-8B | **Ours (BDQ)** | **6.84** | **51.03** | **71.46** |

### W2A4KV16 设置 (更具挑战性)

| 模型 | 方法 | Avg |
|------|------|-----|
| DeepSeek-R1-Distill-LLaMA-70B | FP16 | 84.23 |
| DeepSeek-R1-Distill-LLaMA-70B | QuaRot | 63.12 |
| DeepSeek-R1-Distill-LLaMA-70B | SpinQuant | 66.51 |
| DeepSeek-R1-Distill-LLaMA-70B | FlatQuant | 68.69 |
| DeepSeek-R1-Distill-LLaMA-70B | **Ours (BDQ)** | **70.81** |

相比 SOTA，BDQ 在 W2A4KV16 上将 DeepSeek-R1-Distill-LLaMA-70B 的性能差距缩小 **39.1%**

### 消融实验

Only-BDQ 使用交叉熵 vs Ours (BDQ + RCE):
| 配置 | LLaMA2-7B Avg |
|------|-------------|
| Only-BDQ | 67.42 |
| **Ours** | **67.84** |

RCE Loss 带来 +0.42% 的提升

## 关键公式

### Flatness 定义
$$F = \sum_{i=1}^{m}\sum_{j=1}^{n}\left(\frac{W_{ij}^2}{\alpha_i \beta_j}\ln\frac{W_{ij}^2}{\alpha_i \beta_j}\right)$$

### 最优解形式
$$V = d_1 W d_2$$
其中 $d_1 = \text{diag}(\sqrt{\alpha_i})$, $d_2 = \text{diag}(\sqrt{\beta_j})$

### BDQ 变换
$$y = Q(\Lambda_1 x \Lambda_2 R) \cdot Q(R^T \Lambda_2^{-1} W \Lambda_1^{-1})$$

## 局限性

1. 未在更大规模语言模型上进行实验
2. 缺乏在不同类型 GPU 上的广泛验证

## 建议

- **是否推荐使用**: 是
- **适用场景**: LLM PTQ 量化，特别是 W4A4 和更低比特设置
- **优势**: 理论上最优的 Flatness 解决方案，对 outliers 分散效果好

---

标签: #Quantization #LLM #Post-Training-Quantization #Flatness #Compression