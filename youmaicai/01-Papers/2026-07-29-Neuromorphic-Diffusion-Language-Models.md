# Neuromorphic Diffusion Language Models (N-MDLMs)

## 元信息
| 标题 | Neuromorphic Diffusion Language Models: Addressing Compute and Memory Bottlenecks via Sparsity and Block Denoising |
|------|-----|
| 作者 | Dengyu Wu, Clement Ruah, Jiechen Chen, Bipin Rajendran, Osvaldo Simeone |
| 链接 | [原文](https://arxiv.org/abs/2607.24841) |
| arXiv | arXiv:2607.24841 |
| 会议 | IEEE SiPS 2026 |

## 核心贡献
1. **N-MDLMs**：结合 block diffusion + spike-based neuromorphic computation 的 neuromorphic masked diffusion language models
2. 同时提升吞吐量和能效：
   - **Block diffusion**: 每次参数访问生成多个 token，提高 token 吞吐量
   - **Spike-induced sparsity**: 跳过非活跃通道，减少有效参数流量和计算
3. 提出 **token-level roofline-inspired model**：分析 sparsity 和 diffusion 的协同效应

## 核心问题
自回归 LLM（AR-LLMs）在推理时效率低下：
- 每个生成的 token 需要访问完整模型参数集
- 导致低 operational intensity 和高能耗

MDLMs 在 memory-bound 设置下部分解决了这个问题（每次参数访问可生成多个 token）

## 解决方案
**N-MDLMs = Block Diffusion + Neuromorphic Sparsity**

```
Block Diffusion → 多个 token / 参数访问（吞吐↑）
Spike Sparsity → 跳过非活跃通道（计算↓、参数流量↓）
```

## 理论分析
提出 token-level roofline model，捕捉：
- block-parallel generation 的影响
- spike sparsity 对解码效率的影响

## 实验结果
在翻译任务上的实验表明：
- N-MDLMs 在 compute-bound 平台上也能实现能效和吞吐的大幅提升
- 而 MDLMs 在 compute-bound 平台上无法超越 AR-LLMs

## 关键词
#diffusion-LM #neuromorphic-computing #inference-efficiency #sparsity #N-MDLM #energy-efficiency
