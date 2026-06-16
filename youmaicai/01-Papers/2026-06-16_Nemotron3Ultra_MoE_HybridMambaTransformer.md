# Nemotron 3 Ultra: Open, Efficient MoE Hybrid Mamba-Transformer for Agentic Reasoning

## 元信息
| 标题 | Nemotron 3 Ultra: Open, Efficient Mixture-of-Experts Hybrid Mamba-Transformer Model for Agentic Reasoning |
|------|-----|
| 作者 | NVIDIA (et al., 471+ authors) |
| 链接 | [原文](https://arxiv.org/abs/2606.15007) |
| arXiv | arXiv:2606.15007 |
| 领域 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. 提出 **Nemotron 3 Ultra**：550B 总参数 / 55B 活跃参数的 MoE Hybrid Mamba-Attention 模型
2. 实现 **~6倍** 推理吞吐量提升（相比 SOTA 公开 LLM），同时保持相当精度
3. 支持 **1M token** 超长上下文，专为长程自主 Agent 任务设计
4. 完全开源：Base / Post-Trained / 量化 checkpoint + 训练数据 + 配方

## 模型架构
### Hybrid Mamba-Attention + LatentMoE
- **总层数**: 108
- **Model Dimension**: 8192
- **Q-Heads**: 64, **KV-Heads**: 2
- **Mamba State Dimension**: 128, **Mamba Groups**: 8, **Mamba Heads**: 256
- **总 Experts 数**: 512, **Top-k**: 22 激活专家
- **MoE Latent Size**: 2048
- **MTP layers**: 2 (共享参数用于推测解码)

### 核心技术栈
| 技术 | 作用 |
|------|------|
| **LatentMoE** | 比标准 Granular MoE 更好的每参数精度 |
| **Multi Token Prediction (MTP)** | 推测解码加速推理 |
| **NVFP4 Pre-training** | 4-bit 浮点训练，降低计算成本 |
| **Multi-environment RLVR** | 多环境强化学习验证 |
| **MOPD** | Multi-teacher On-Policy Distillation，多教师蒸馏 |
| **Reasoning Budget Control** | 推理时精度-计算权衡控制 |

## 训练流程
### Pre-training
- **数据**: 20T tokens
  - Phase 1 (15T): 多样性和广域覆盖
  - Phase 2 (5T): 高质量数据精调精度
- **关键数据创新**:
  - `Nemotron-Pretraining-Multiple-Choice` + `Nemotron-Pretraining-Generative`: 任务种子合成 QA 数据
  - `Nemotron-Pretraining-Fact-Seeking`: 从 Finewiki 生成事实检索问题（SimpleQA: 40.24→50.16）
  - `Nemotron-Pretraining-Legal`: 法律领域数据（LegalBench: 64.6→74.7）

### Post-training
1. **SFT**: 精心策划的数据混合物建立基础能力
2. **RLVR**: 跨推理/Agent/代码/安全/可用性/聊天环境的统一强化学习
3. **MOPD**: 10+ 领域专门教师模型蒸馏到 Ultra

## 实验结果
### 推理吞吐量（8K 输入 / 64K 输出）
| 模型 | 相对吞吐量 |
|------|------|
| vs GLM-5.1-754B-A40B | **5.9x** |
| vs Kimi-K2.6-1T-A32B | **4.8x** |
| vs Qwen-3.5-397B-17B | **1.6x** |

### 基准精度
- Base model 精度显著超越 DeepSeek v3.2, Mistral Large 3, Kimi-K2, GLM-4.5
- Post-trained Ultra 在 Agent 基准上达到 SOTA

## 关键发现
- **NVFP4 训练稳定性**: 最大规模 NVFP4 训练演示，相对 BF16 训练损失差距 < 0.4%
- **MTP 加速**: 两个 MTP head 共享参数实现鲁棒自回归起草
- **1M token 上下文**: 长程自主 Agent 任务的理想选择

## 开源资源
- 模型: HuggingFace (NVIDIA/Nemotron-3-Ultra-*)
- 代码: https://github.com/NVIDIA-NeMo/Nemotron
- 数据集:
  - `Nemotron-Pretraining-Legal-v1`
  - `Nemotron-Pretraining-Specialized-v1.2`
  - `Nemotron-Posttraining-v3`

## 关键词
`Mixture-of-Experts` `MoE` `Mamba` `Transformer` `Hybrid Architecture` `NVFP4` `Multi-Token Prediction` `Agentic Reasoning` `Open Source`
