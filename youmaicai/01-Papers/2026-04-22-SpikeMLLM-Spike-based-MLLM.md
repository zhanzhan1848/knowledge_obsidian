# SpikeMLLM: Spike-based Multimodal Large Language Models

## 元信息
| 标题 | SpikeMLLM: Spike-based Multimodal Large Language Models via Modality-Specific Temporal Scales and Temporal Compression |
|------|-----------------------------------------------------------------------------------------------------------------------|
| 作者 | Han Xu, Zhiyong Qin, Di Shang, Jiahong Zhang, Xuerui Qiu, Bo Lei, Tiejun Huang, Bo Xu, Guoqi Li |
| 链接 | [原文](https://arxiv.org/abs/2604.18610) |
| arXiv | arXiv:2604.18610 |
| 发表日期 | 2026-04-13 |
| 类别 | cs.NE, cs.AI |
| 备注 | 首个 spike-based MLLM 框架 |

## 核心贡献
1. **SpikeMLLM**: 首个 spike-based MLLM 框架，统一 ANN 量化方法到 spiking representation space
2. **Modality-Specific Temporal Scales (MSTS)**: 由 Modality Evolution Discrepancy (MED) 引导
3. **Temporally Compressed LIF (TC-LIF)**: timestep compression from T=L-1 to T=log2(L)-1

## 方法架构

### 问题
- MLLMs 计算开销和能耗大 → 资源受限环境部署困难
- SNNs (Spiking Neural Networks) 提供能效优势，但扩展到 MLLMs 面临挑战：
  1. 异构模态 uniform spike encoding 不够
  2. 高分辨率图像输入放大 timestep unfolding 开销

### SpikeMLLM 解决方案

#### 1. Modality-Specific Temporal Scales (MSTS)
- 不同模态用不同 temporal scales
- 由 Modality Evolution Discrepancy (MED) 指导

#### 2. Temporally Compressed LIF (TC-LIF)
- 将 timestep 从 T=L-1 压缩到 T=log2(L)-1
- 减少计算开销

#### 3. 硬件协同设计
- 专用 RTL accelerator for spike-driven datapath

### 实验结果
- **InternVL2-8B**: 0.72% gap vs FP16 baseline (timestep compression Tv/Tt=3/4)
- **Qwen2VL-72B**: 1.19% gap vs FP16 baseline
- **RTL Accelerator**: 9.06× higher throughput, 25.8× better power efficiency vs FP16 GPU

## 局限性
- 需要 neuromorphic hardware 支持
- 主要验证视觉-语言任务

## 建议
- **是否推荐使用**：是（能效敏感场景）
- **适用场景**: Edge deployment, neuromorphic hardware, energy-efficient MLLM

## 标签
#multimodal #SNN #spiking-neural-networks #energy-efficiency #hardware-co-design