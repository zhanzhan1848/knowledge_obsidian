# TTPO: Test-Time Policy Optimization for Mathematical Reasoning

## 元信息
| 标题 | ... |
|------|------|
| 作者 | Aozhe Wang, Zhengxi Lu, Jianze Wang (Zhejiang Univ., Alibaba Group) |
| 链接 | [原文](https://arxiv.org/abs/2608.27448) |
| arXiv | arXiv:2608.27448 [cs.CL] |
| 代码 | [GitHub](https://github.com/ZJU-REAL/TTPO) |
| 发表于 | 2026-08-27 (v1) |

## 核心贡献

1. **非对称目标设计**：对与伪标签一致的 rollout 用 OPSD 蒸馏，不一致的用 Grouped RL 惩罚
2. **Token 级选择**：蒸馏时降权已收敛位置，RL 只惩罚导致错误的置信 token
3. **无标签自进化**：无需任何 ground-truth 标签，在测试时训练（TTT），匹配有标签 OPSD 的性能
4. **核心洞察**：伪标签在竞争级问题上 85% 是错的，但 ~79% 的不一致 rollout 本身也是错的——惩罚分歧本身就是对的

## 模型架构

### 问题设定
- 有 N 个无标签测试时问题 {x_i}
- 每个问题采样 K 条轨迹 {y_1, ..., y_K} ~ π_θ(·|x)
- 提取最终答案 a_k = Extract(y_k)

### 多数投票伪标签
1. 按数学等价性聚类答案，选最大簇为伪标签 â，计数 c = |{k: a_k ≡ â}|
2. 分区为正样本 P = {k: a_k ≡ â}（一致）和负样本 N = {k: a_k ≢ â}（不一致）

### Answer-Conditioned Teacher（OPSD）
```math
q_t^{(â)} = π_θ(· | [x; â]_teacher, y_{<t})  # teacher（无梯度）
p_t        = π_θ(· | x_student, y_{<t})         # student（有梯度）
```

### TTPO 非对称目标

**正向 KL（蒸馏）用于正样本 P：**
蒸馏时降权已收敛位置

**GRPO（惩罚）用于负样本 N：**
Token masking 只惩罚导致错误的置信 token

### 关键公式
- 不对称性：当伪标签错误时，一致 rollout 的 teacher 被污染（所有 token 都错），但不一致 rollout 的惩罚只依赖"与多数不一致"这一事实——无论伪标签内容如何都正确
- 这与 noisy label 中的 negative learning 类似：说"不是什么"比说"是什么"更鲁棒

## 实验结果

### 基准（竞争级）
AIME 2026, HMMT 2026, BRUMO 2025, MATH, GSM8K

### 主要结果
- **Qwen3-1.7B**: TTT 设定下从 38.0% → 45.2%（+7.2%）
- 禁用 thinking mode 后：+25.2% 到 +36.4%
- 无标签 TTT 性能匹配有标签 OPSD
- 跨任务泛化：在任意一个基准上训练可提升其他两个

### 消融实验
- Token-level selection 在两个分支均有效
- 非对称设计优于对称 FKL on all / GRPO on all

## 局限性
- 主要在数学推理任务验证
- TTT 设定下模型需要有一定的基础能力

## 建议
- **是否推荐使用**：是
- **适用场景**：测试时自适应、无标签自进化、数学/推理任务
- **与 CritICL 对比**：CritICL 是推理时用小模型失败模式引导；TTPO 是推理时无标签自进化。两者互补
