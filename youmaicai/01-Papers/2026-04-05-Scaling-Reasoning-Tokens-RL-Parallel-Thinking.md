# Scaling Reasoning Tokens via RL and Parallel Thinking

## 元信息
| 标题 | Scaling Reasoning Tokens via RL and Parallel Thinking: Evidence From Competitive Programming |
|------|------|
| 作者 | Xia Xiao et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.01302) |
| arXiv | arXiv:2604.01302 [cs.CL] |
| 发表 | 2026-04-01 |

## 核心贡献

1. **训练时RL与测试时并行思维的协同扩展**：两种互补方法联合使用
2. **对数线性关系发现**：验证准确率与生成推理token数量之间存在近似对数线性关系
3. **轨迹偏移技术**：验证RL warmup提升起点，randomized clipping使曲线更陡峭
4. **多轮并行思维管道**：在推理、验证、细化之间分配token预算

## 关键发现

### Log-Linear Scaling Law
```
验证准确率 ≈ α · log(avg_reasoning_tokens) + β
```

### 轨迹偏移方法
- **Verification RL Warmup**：提升曲线起点
- **Randomized Clipping**：在观测区间内产生更陡峭的趋势

## 方法细节

### 多轮并行思维管道
```
输入 → [Round 1: 生成 → 验证 → 细化] → [Round 2: ...] → ... → [Round 16: ...] → 输出
                              ↕ token budget分布在多个线程和轮次
```

- **16线程 × 16轮次/线程**
- 每个问题平均760万token
- **Pass@1 匹配 RL 模型的 Oracle Pass@16**

### 核心公式
- 从 Seed-OSS-36B 出发
- 完整系统在 AetherCode 456个困难竞赛编程问题上超越 GPT-5-high

## 核心创新

1. **端到端训练匹配测试时结构**：训练目标与测试时管道结构一致
2. **有效利用巨大token预算**：760万token/problem的预算通过并行分布实现高效利用
3. **Oracle级别性能**：用 Pass@1 成本达到 Pass@16 的 oracle 性能

## 局限性

- 计算成本极高（每个问题760万token）
- 主要针对竞赛编程，对其他推理任务泛化性待验证

## 标签
#LLM #推理 #强化学习 #RLHF #思维链 #并行推理 #竞赛编程 #token scaling

## 相关概念
- Chain-of-Thought (CoT)
- Pass@k Sampling
- Reinforcement Learning from Human Feedback (RLHF)
- Verification in RL
