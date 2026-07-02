# GRPO, Dr. GRPO, and DAPO Are Three Operations on One Number: The Group-Standard-Deviation Identity

## 元信息
| 标题 | GRPO, Dr. GRPO, and DAPO Are Three Operations on One Number: The Group-Standard-Deviation Identity |
|------|------|
| 作者 | Yong Yi Bay, Kathleen A. Yearick |
| 链接 | [原文](https://arxiv.org/abs/2607.00152) |
| arXiv | arXiv:2607.00152 [cs.LG] |
| 代码 | [GitHub](https://github.com/bay-yearick-lab/grpo-standard-deviation-identity) |
| 发表 | 2026-06-30 |

## 核心贡献

1. **Group-Standard-Deviation Identity**：证明 GRPO、Dr. GRPO 和 DAPO 本质上都是对同一参数（采样答案标准差）的不同操作，而非三种独立方法
2. **统一理论框架**：对于对/错奖励信号，答案分歧度（标准差）精确等于训练更新的大小——group-standard-deviation identity
3. **实践洞察**：分裂的组（部分对部分错）教得最多，一致同意的组（全部对或全部错）教得最少甚至不教

## 核心方法

### 背景：三种流行的 LLM 推理训练方法

| 方法 | 核心操作 | 原始动机 |
|------|---------|---------|
| **GRPO** | 答案标准差作为归一化分母 | 减少优势估计方差 |
| **Dr. GRPO** | 去掉标准差归一化 | 简化计算 |
| **DAPO** | 丢弃标准差为0的组（一致同意组） | 避免无意义更新 |

### 关键发现：Group-Standard-Deviation Identity

对于二值奖励（正确/错误），每个问题的 group standard deviation 精确等于该问题对训练损失的贡献：

```
当答案分裂（50%对/50%错）→ 标准差最大 → 梯度最大
当答案一致（全对或全错）→ 标准差=0 → 梯度为0，组沉默
```

### 数学表述

设一个问题有 G 个采样答案，二值奖励 $r_i \in \{0, 1\}$，组标准差为：

$$\sigma_g = \sqrt{\frac{1}{G}\sum_{i=1}^{G}(r_i - \bar{r})^2}$$

关键恒等式：对于 REINFORCE 风格的策略梯度，优势函数 $A_i = r_i - b$ 的方差与 $\sigma_g$ 成正比。

## 实验结果

- **Big-Math 数据集**：验证理论直觉
- **对照训练实验**：确认 group-standard-deviation identity
- 主要发现：
  - Raw global metrics 混淆了准确率和校准的比较
  - Ranking reversal 频繁发生：用原始指标偏好的模型在控制准确率后不再占优

## 核心洞察

> **三种方法都是同一个拨号的不同档位**。这个拨号不是装饰性的：对于对/错奖励，分歧度精确决定了训练更新的位置和强度。

- **哪个问题值得最多权重**：标准差大的问题（中等难度、分歧大）
- **每个问题需要多少次尝试**：取决于该问题的分歧度

## 局限性

- 仅适用于二值奖励场景；连续奖励的扩展尚未证明
- 实践中最优的拨号设置（是否除以标准差、是否丢弃沉默组）仍需实验确定

## 建议

- **是否推荐使用**：是
- **适用场景**：需要训练 LLM 推理能力（数学、代码）的场景
- **使用建议**：理解这个 identity 后可以更灵活地组合三种方法的特点

## 标签
#RLHF #GRPO #DAPO #LLM-training #reasoning #policy-gradient
