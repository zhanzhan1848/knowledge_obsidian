# 🥬 Token Budget Saturation & Early Detection of Reasoning Non-Convergence in CoT Models

## 元信息

| 标题 | Token Budget Saturation & Early Detection of Non-Convergence in Chain-of-Thought Reasoning |
|------|------|
| **arXiv** | [2607.21433](https://arxiv.org/abs/2607.21433) |
| **类别** | cs.CL |
| **关键词** | chain-of-thought, reasoning, budget forcing, early exit, convergence detection, mechanistic interpretability |

## 核心贡献

1. **Budget Saturation**：简单数学任务（GSM8K、MATH-500），256 tokens CoT 思考就足够；更多 tokens 不提升准确率
2. **Bimodal Convergence Failure**：AIME 任务上，DeepSeek-R1-Distill-Qwen-7B 存在双峰 failure 模式：
   - **收敛样本**：96.5% 正确率
   - **非收敛样本**：11.5% 正确率（消耗全部 10,000 token budget）
3. **Early Detection**：线性探测（logistic regression on hidden states at **Layer 20, token 150**）AUC=0.608，在 token 50 处即可检测
4. **B* 定义**：达到 uncapped 准确率 95% 的最小 sufficient budget

## 关键发现

### 简单任务 → 预算饱和

| 任务 | B* (Minimum Sufficient Budget) | 备注 |
|------|-------------------------------|------|
| GSM8K | **256 tokens** | 256~4096+ 准确率无差异 |
| MATH-500 | **256 tokens** | 256~4096+ 准确率无差异 |
| AIME | **∞** (无 finite B*) | bimodal 模式导致无法饱和 |

### 困难任务 → Bimodal Failure

AIME uncapped 结果（n=200）：
- 收敛率：62.0%
- 收敛准确率：96.5%
- 非收敛率：38.0%
- 非收敛准确率：11.5%
- 问题顺序与收敛率相关性 r=0.431（r²≈0.186）

### Early Detection 探测结果

| 检测位置 | Activation Probe AUC | Behavioral Baseline AUC | ΔAUC |
|---------|---------------------|------------------------|------|
| Token 50 | **0.615 ± 0.066** | 0.541 ± 0.044 | +0.074 |
| Token 100 | **0.600** | **0.541** | +0.059 |
| Token 150 | 0.608 ± 0.080 | ~0.55 | +0.058 |

**Layer 20** 携带最强信号（AUC 0.608 ± 0.080）。

### Behavioral Features（未优于激活探测）

- Logit entropy 统计量（mean, max, std, slope）
- N-gram repetition rates（bigram, trigram）
- Raw token count

## 关键洞察

### Bimodal 是蒸馏特有的

Pipis et al. (2025) 表明：蒸馏学生模型比教师模型更容易循环。Budget forcing 来自 Muennighoff et al. (2025) 的 s1 框架。

### 收敛 ≠ 问题难度

- Point-biserial correlation r=0.431（p<0.0001）
- 但问题顺序仅解释 18.6% 收敛方差
- Hard tercile 中：收敛样本 100% 正确，非收敛样本 0% 正确

### 激活信号早于行为信号

- Token 50 时：激活探测 AUC=0.615，行为基线 AUC=0.541
- 激活信号在 token 50 已达峰值，行为信号全程接近随机
- 理论上可在 50 tokens 处提前退出，节省 4,000~9,000 tokens

## 局限性

1. **单模型**：仅 DeepSeek-R1-Distill-Qwen-7B
2. **Greedy decoding**：模型建议温度 ~0.6（未测试）
3. **历史数据污染**：AIME 1983-2024 可能有部分 memorized（AIME 2025 无污染验证）
4. **n=200 统计力有限**：bootstrap cell n=4~18

## 建议

- **是否推荐使用**：**是**（推理优化、CoT 可靠性研究）
- **适用场景**：CoT 推理加速、early exit 机制设计、reasoning failure 分析
- **后续方向**：非线性探测、多层组合、时间积分滑动窗口

## 链接

- **arXiv**: https://arxiv.org/abs/2607.21433

---

*🥬 油麦菜知识库 | 生成时间: 2026-07-25*
