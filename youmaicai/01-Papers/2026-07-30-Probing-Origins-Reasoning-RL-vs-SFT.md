# Probing the Origins of Reasoning Performance: Representational Quality for Mathematical Problem-Solving in RL vs. SFT Fine-Tuned Models

## 元信息
| 标题 | Probing the Origins of Reasoning Performance: Representational Quality for Mathematical Problem-Solving in RL vs. SFT Fine-Tuned Models |
| 作者 | Antyabha Rahman, Akshaj Gurugubelli, Omar Ankit, Kevin Zhu, Aishwarya Balwani |
| 链接 | [原文](https://arxiv.org/abs/2607.26119) |
| arXiv | arXiv:2607.26119 |
| 代码 | https://oankit.github.io/-rl-sft-reasoning/ |
| 会议 | Second Workshop on XAI4Science, AAAI 2026 |
| 领域 | cs.AI, cs.CL |

## 核心贡献

1. **RL 模型具有更强的表示清晰度**：通过线性探针分析，RL 训练的模型（DeepSeek-Math-7B-RL、Olmo-3-Think）在预测答案正确性上准确率更高（83-98%），比指令微调模型（75-90%）高出约 8 个百分点，且方差更小。

2. **RL 重塑计算架构**：RL 模型呈现层级化推理架构——深层越来越关键（r=0.47, p<0.01）；SFT 模型则均匀分布（r=-0.11），表明监督微调鼓励平衡的层利用率和冗余。

3. **表示清晰度即推理机制**：RL 模型从第一层就表现出高探针准确率（~70% vs SFT ~65%），且在中间层保持 ~94-95% 的准确率，而 SFT 模型逐渐从 ~65% 上升到 ~80-90%。

4. **Token 分配变异性**：不同 RL 模型的 token 分配表现出不同的稳定性，暗示 token 分配取决于整体训练 pipeline 而非简单的 RL vs SFT 二分。

## 模型架构

### 探针方法
在每个 transformer 层 ℓ 的隐藏状态上训练逻辑回归探针：
```
f_ℓ(h_ℓ) = σ(w_ℓ^⊤ h_ℓ + b_ℓ)
```
使用 5-fold 交叉验证选择正则化强度 C ∈ {0.001, 0.01, 0.1, 1.0, 10.0}。

### 激活提取位置
在 `\boxed{` 分隔符**之前**的 token 处提取隐藏状态（模型完成推理但尚未输出答案的时刻）。

### 平均消融实验
用参考数据集（GSM8K 训练集）的均值激活替换每层激活，测量准确率下降：
```
AD_ℓ = Acc_base - Acc_ℓ^abl
```

## 实验结果

### 探针准确率
| 模型 | 类型 | 最高探针准确率 | 涌现层 ℓ_emerge |
|------|------|---------------|----------------|
| DeepSeek-Math-7B-RL | RL | ~98% | 0 |
| Olmo-3-Think | RL | ~94% | 22 |
| DeepSeek-Math-Instruct | SFT | ~90% | 6 |
| Olmo-3-Instruct | SFT | ~84% | 11 |

### 层重要性相关性
| 模型 | Pearson r | p-value |
|------|-----------|---------|
| DeepSeek-Math-7B-RL | +0.47 | <0.01 |
| DeepSeek-Math-7B-Instruct | -0.11 | 0.55 |

### 关键发现
- **共同基础层（0-10）**：两种模型在早期层表现相似（AD ≈ -0.15 to 0.00），共享基础算术和推理机制
- **深层分歧**：第 15 层之后，两种模型轨迹显著分歧，RL 模型在 9-18 层和 22-26 层表现出更高的重要性

## 局限性
- 探针方法要求模型产生相对均衡的正确/错误答案分布（~50:50）
- 当正确率偏离 50:50 太多时，探针可能学习预测多数类而非真正的表示差异
- 分析主要在数学推理任务上，泛化性有待验证

## 建议
- **推荐使用**：是
- **适用场景**：理解 RL 训练的推理模型为何优于 SFT 模型；模型可解释性研究；推理能力评估

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-30*
