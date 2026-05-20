# D-PACE: Dynamic Position-Aware Cross-Entropy for Parallel Speculative Drafting

## 元信息
| 标题 | D-PACE: Dynamic Position-Aware Cross-Entropy for Parallel Speculative Drafting |
|------|-----|
| 作者 | Tianyu Wu, Yu Yao, Zhenting Qi, Han Zheng, Zhuohan Wang, Haoran Ma, Lawrence Liao, Himabindu Lakkaraju, Ju Li, Yilun Du (Harvard, MIT) |
| 链接 | [原文](https://arxiv.org/abs/2605.18810) |
| arXiv | arXiv:2605.18810 |
| 发表 | 2026-05-12 |
| 代码 | [GitHub](https://github.com/Lucas-TY/D-PACE) |

## 核心贡献

1. **问题**: 现有并行草稿解码方法（如 DFlash）使用固定位置衰减权重，不适应训练过程中限制接受的位置变化

2. **D-PACE 损失**: 从 expected accepted draft length 的可微代理导出每位置训练权重，将训练信号动态转移到当前限制接受的位置

3. **无架构变更**: 仅改变训练损失函数，不修改草稿模型架构或推理流程，训练开销仅 2.3%

## 模型架构

### 投机解码背景

设 $p_\theta$ 为大目标模型，$q_\psi$ 为小草稿模型。草稿生成 B 个候选 token $z_1, \ldots, z_B$，目标模型并行验证所有 token。

**接受的草稿长度**:
$$X = \max\{k \in \{0, \ldots, B\}: z_i \text{ accepted for all } i \leq k\}$$

### DFlash 基线损失

$$\mathcal{L}_{DFlash} = \sum_{j=1}^{B} \exp\!\Bigl(-\frac{j-1}{\gamma}\Bigr)\,(-\log q_j)$$

使用固定指数位置衰减，不适应具体示例

### D-PACE 推导

**Step 1: Accepted-Length 代理**

利用链式概率:
$$\mathbb{E}[X] = \sum_{k=1}^{B} \prod_{i=1}^{k} a_i$$

其中 $a_i$ 是位置 $i$ 的接受率。使用草稿置信度 $q_i$ 作为 $a_i$ 的平滑代理，得到:
$$\mathbb{E}[X] \approx \tilde{S}(\psi) := \sum_{k=1}^{B} \prod_{i=1}^{k} q_i$$

**Step 2: 逐位置权重**

对 $\tilde{S}$ 关于 $q_j$ 求导:
$$\nabla_\psi \tilde{S} = \sum_{j=1}^{B} w_j \nabla_\psi \log q_j, \quad w_j := \Bigl(\prod_{i \leq j} q_i\Bigr) f_j$$

其中 $f_j = 1 + \sum_{m=j+1}^{B} \prod_{i=j+1}^{m} q_i$ 是继续值

**Step 3: 非对称权重平滑**

防止累积乘积 $\prod_{i \leq j} q_i$ 消失:
$$\tilde{q}_i := (1-\alpha) q_i + \alpha$$

平滑仅在权重计算中应用，交叉熵项保持不变:
$$\mathcal{L}_{D-PACE}(\psi) = \sum_{j=1}^{B} \bar{w}_j \, (-\log q_j)$$

其中 $\bar{w}_j = \sum_{m=j}^{B} \prod_{i \leq m} \tilde{q}_i$

## 实验结果

### 主要结果 (Qwen3-4B, 3L)

| Benchmark | DFlash SR | D-PACE SR | DFlash τ | D-PACE τ | 相对提升 |
|-----------|----------|-----------|---------|---------|---------|
| MATH-500 | 3.69 | 4.08 | 3.63 | 4.01 | +10.5% τ |
| GSM8K | 2.99 | 3.22 | 2.81 | 3.09 | +10.0% τ |
| HumanEval | 2.75 | 2.90 | 2.61 | 2.76 | +5.7% τ |
| MBPP | 3.14 | 3.36 | 2.96 | 3.25 | +9.8% τ |
| MT-Bench | 3.08 | 3.24 | 2.98 | 3.23 | +8.4% τ |
| Alpaca | 2.89 | 3.05 | 2.75 | 3.01 | +9.5% τ |

### 跨模型泛化

| 目标模型 | 配置 | DFlash τ | D-PACE τ | 提升 |
|---------|------|---------|---------|-----|
| Llama-3.1-8B-Instruct | 3L, B=10 | 2.64 | 2.97 | +12.5% |
| Qwen3-8B | 3L, B=16 | 2.73 | 3.08 | +12.8% |

### 消融实验

| 方法 | MATH-500 τ |
|------|----------|
| DFlash (固定衰减) | 3.63 |
| Continuation-only | 3.39 |
| Cumulative-only | 3.91 |
| **D-PACE (完整)** | **4.01** |

累积置信度贡献主要信号，继续值提供补充改进

## 关键公式

### D-PACE 损失
$$\mathcal{L}_{D-PACE}(\psi) = \sum_{j=1}^{B} \bar{w}_j \, (-\log q_j)$$

### 每位置权重
$$\bar{w}_j = \sum_{m=j}^{B} \prod_{i \leq m} \tilde{q}_i$$

### 平滑置信度
$$\tilde{q}_i = (1-\alpha) q_i + \alpha$$

## 建议

- **是否推荐使用**: 是
- **适用场景**: 并行块草稿解码 (DFlash 等)，用于加速 LLM 推理
- **超参数**: α=0.5 默认，在 [0.3, 0.7] 范围内稳定

---

标签: #Speculative-Decoding #LLM-Inference #Parallel-Drafting #Optimization