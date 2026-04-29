# ESamp: Exploratory Sampling via Latent Distilling

## 元信息
| 标题 | Large Language Models Explore by Latent Distilling |
|------|------|
| 作者 | Yuanhao Zeng, Ao Lu, Lufei Li, Zheng Zhang, Yexin Li, Kan Ren |
| 链接 | [原文](https://arxiv.org/abs/2604.24927) |
| arXiv | arXiv:2604.24927 |
| 代码 | [GitHub](https://github.com/LinesHogan/tLLM) |
| 发表 | cs.CL / ICML |

## 核心贡献
1. **Exploratory Sampling (ESamp)**: 新型解码方法，通过训练轻量级 Latent Distiller 在测试时预测 LLM 从浅层到深层的隐藏表示转换，用预测误差作为新颖性信号来重新加权 token 采样分布
2. **语义多样性 vs 词法多样性**: 核心洞察是标准随机采样只产生表面词法变化，无法探索深层次语义推理策略；ESamp 在连续表示空间中估计冗余，而非 token 空间
3. **异步流水线**: 实现上，解码器训练与 LLM 生成完全异步，仅 5% 最坏情况开销（优化版 1.2%）

## 模型架构

### Latent Distiller
- 一个轻量级 MLP $f_\phi$，输入为 LLM 第1层隐藏表示 $h_t^1$，预测最终层表示 $\hat{h}_t^L = f_\phi(h_t^1)$
- 在线训练：每个 token step 用 MSE loss 最小化预测与真实深层的误差
- 预测误差低 → 语义冗余；预测误差高 → 语义新颖

### 采样分布推导
从 KL 正则化优化目标推导：
$$J(\pi) = \mathbb{E}_\pi[r(s_t, z_t)] - \alpha \cdot \text{KL}(\pi(\cdot|s_t) \| \pi_{\text{ref}}(\cdot|s_t))$$

最优策略：
$$\pi^*(z|s) \propto \pi_{\text{ref}}(z|s) \cdot \exp\left(\frac{1}{\alpha}r(s,z)\right)$$

定义 reward 为 $r(s,z) = \log\pi_{\text{ref}}(z|s) - \log q_{\text{dist}}(z|s)$，得到：
$$\pi_{\text{new}}(z|s) \propto \frac{\pi_{\text{ref}}(z|s)^{1+\beta}}{q_{\text{dist}}(z|s)^\beta}$$

### 几何解释
$$\Delta\text{logit}_z = \beta \cdot w_z \cdot \mathbf{e}_t = \beta \|w_z\|_2 \cdot \underbrace{\|\mathbf{e}_t\|_2}_{\text{Novelty}} \cdot \underbrace{\cos(w_z, \mathbf{e}_t)}_{\text{Direction}}$$

- $\|\mathbf{e}_t\|_2$: 潜在误差向量的范数，量化当前上下文的**新颖性**
- $\cos(w_z, \mathbf{e}_t)$: 方向引导，选择与误差向量对齐的 token

### 并行协调机制
- 批次中所有序列共享同一个在线更新的 Distiller
- 先探索的序列会"占领"某个语义区域（Distiller 学到这个映射），后续序列访问同一区域时概率被压制
- 相当于隐式的"先到先得"调度器

## 实验结果
- **AIME 2024/2025**: 显著提升 Pass@k 效率
- **GPQA-Diamond**: 超越强 baseline
- **LiveCodeBench v5**: 代码生成任务有效
- **创意写作**: 在多样性与连贯性之间打破 trade-off
- 优于 Vanilla temperature sampling、Min-pp、FIRE、Diverse Beam Search 等

## 核心洞察
> 神经网络的预测误差是探索信号：模型对熟悉输入预测准确，对新颖输入误差大。这一性质（来自 RND）可用于解码阶段的语义探索。

## 局限性
- 需要在线训练 Distiller，增加工程复杂度
- 对计算资源有额外需求（异步 pipeline）

## 相关标签
#LLM #decoding #test-time-scaling #exploration #reasoning
