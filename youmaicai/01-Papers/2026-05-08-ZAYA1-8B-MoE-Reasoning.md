# ZAYA1-8B Technical Report

## 元信息
| 标题 | ZAYA1-8B Technical Report |
|------|------|
| 作者 | Robert Washbourne, Rishi Iyer, Tomas Figliolia 等 18 人 |
| 链接 | [原文](https://arxiv.org/abs/2605.05365) |
| arXiv | arXiv:2605.05365 |
| 领域 | MoE, Reasoning, Test-Time Compute |

## 核心贡献

1. **ZAYA1-8B**: 700M 激活 / 8B 总参数的 MoE 推理模型，基于 Zyphra MoE++ 架构
2. **Answer-Preserving Trimming**: 从预训练阶段即引入推理数据
3. **Four-Stage RL Cascade**:
   - Stage 1: 数学/谜题推理热身
   - Stage 2: 400-task RLVE-Gym 课程
   - Stage 3: 数学/代码 RL（test-time compute traces + 合成代码环境）
   - Stage 4: 行为 RL（对话/指令遵循）
4. **Markovian RSA**: 递归聚合并行推理轨迹，每轮仅传递 4K-token 有界推理尾

## 性能

| Benchmark | ZAYA1-8B + Markovian RSA | 对比 |
|-----------|--------------------------|------|
| AIME'25 | 91.9% | 逼近 Gemini-2.5 Pro, DeepSeek-V3.2 |
| HMMT'25 | 89.6% | 同上 |
| 竞争模型对比 | 匹配/超越 DeepSeek-R1-0528 | <1B 激活参数 |

## 关键公式/方法

**Markovian RSA**: 
- 递归聚合并行推理 traces
- 每轮仅传递 bounded-length reasoning tail（约 4K tokens）
- TTC (test-time compute) 评估方法

## 局限

- 全 AMD 计算平台，硬件依赖性
- 仅 8B 规模，推理能力上限受参数约束

## 关键词
`Mixture-of-Experts` `RL Cascade` `Test-Time Compute` `Reasoning Model` `Markovian RSA`

## 日期
2026-05-08