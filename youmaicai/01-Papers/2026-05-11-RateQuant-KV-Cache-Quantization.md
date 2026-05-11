---
type: paper
created: 2026-05-11
updated: 2026-05-11
tags: [KV-cache, quantization, mixed-precision, rate-distortion]
status: processed
domain: LLM Inference
agent: youmaicai
source: https://arxiv.org/abs/2605.06675
---

# RateQuant: Optimal Mixed-Precision KV Cache Quantization via Rate-Distortion Theory

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RateQuant: Optimal Mixed-Precision KV Cache Quantization via Rate-Distortion Theory |
| **作者** | Fei Zuo, Zikang Zhou, Hao Cong, Xiaoyan Xi, Ho Fai Leung |
| **发表** | arXiv 2026 (cs.LG) |
| **链接** | [原文](https://arxiv.org/abs/2605.06675) |
| **DOI** | 10.48550/arXiv.2605.06675 |
| **代码** | - |

---

## 核心贡献

> 提出 RateQuant，通过 rate-distortion 理论解决 KV cache 混合精度量化的失真模型不匹配问题。在 Qwen3-8B 上以 2.5 平均比特率将 KIVI 困惑度从 49.3 降至 14.9 (70% 减少)。_

1. **发现失真模型不匹配问题**: 不同量化器遵循不同的失真曲线 D(b)=α·β^(-b)，decay rate β 从 3.6 到 5.3 不等，混用会导致性能下降
2. **RateQuant 方法**: 从小规模校准集拟合每量化器失真模型，通过 reverse waterfilling 闭式求解比特分配
3. **效率**: 整个校准仅需 1.6 秒（单 GPU），推理时无额外开销

---

## 技术方案

### 问题背景

- KV cache 随序列长度线性增长，是服务 LLM 的主要内存瓶颈
- 现有量化器对所有注意力头分配相同比特宽度，忽略头重要性差异

### 失真模型不匹配

- 每量化器遵循 D(b) = α · β^(-b)
- β 从 3.6 到 5.3 变化
- 混用失真模型会反转分配顺序，性能差于均匀量化

### RateQuant 解法

1. **校准**: 从小规模校准集拟合每量化器失真模型
2. **求解**: 通过 reverse waterfilling 从 rate-distortion 理论闭式求解比特分配问题

---

## 实验结论

**Qwen3-8B @ 2.5 平均比特**:
- KIVI 困惑度: 49.3 → 14.9 (70% 减少)
- QuaRot PPL 提升: +6.6

**效率**:
- 校准时间: 1.6s (单 GPU)
- 推理开销: 0

---

## 局限性

- 主要在 Qwen3-8B 上验证，其他模型待测试
- 校准集的选择可能影响泛化性

---

## 实现建议

- **实现难度**: 中（需要实现 rate-distortion 优化）
- **预期性能**: 在混合精度 KV cache 量化任务上显著优于现有方法
- **适用场景**: LLM 服务部署、长序列推理、内存受限场景

---

## Tags

#KV-cache #quantization #mixed-precision #rate-distortion #LLM-inference