# Fine-tuning Multi-modal LLMs with ART: Art-based Reinforcement Training

## 基本信息
| 标题 | Fine-tuning Multi-modal LLMs with ART: Art-based Reinforcement Training |
|------|------|
| 作者 | Sergey Alyaev et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.11854) |
| arXiv | arXiv:2606.11854v1 |
| 领域 | cs.LG, cs.AI, cs.CL |
| 发表 | 2026-06-10 |

## 核心贡献

1. **问题**: LoRA 和 Soft Prompting 两种主流 PEFT 方法都需要修改预编译 LLM 的计算图，无法在 vLLM 等高吞吐引擎中使用
2. **方案**: 提出 ART (Art-based Reinforcement Training)，通过优化原始视觉输入而非添加权重或 token 来注入信息
3. **核心机制**: 将梯度反向传播到像素数组，支持任意微调目标，且不修改计算图
4. **效果**: 在 Qwen 架构上达到与 LoRA 相当的精度，兼容数学和结构化工具使用基准

## 方法详解

### 背景：两种主流 PEFT 方法对比
| 方法 | 原理 | 局限性 |
|------|------|--------|
| **LoRA** | 在 LLM 层之间引入额外权重 | 需要修改计算图 |
| **Soft Prompting** | 添加微调专用 token 到输入 | 无法在预编译图上工作 |
| **ART (本文)** | 优化原始视觉输入 | 保留预编译计算图 |

### ART 工作流程
```
Frozen MLLM + 原始像素输入
    ↓ (前向传播)
计算损失函数
    ↓ (反向传播)
梯度回传到像素数组
    ↓
像素优化 (stylized as computational artworks)
    ↓
支持任意微调目标
```

### 关键创新点
- **无需修改计算图**: 直接在预编译图上工作，兼容 vLLM
- **视觉反向传播**: 梯度回传到 plain pixel array
- **任务相关计算艺术品**: 优化后的视觉输入可风格化为任务相关视觉呈现
- **任意微调目标**: 支持 RL、DPO 等各种微调目标

## 实验结果

- 在 Qwen2-VL 不同规模架构上验证
- 数学基准测试: 与 LoRA 精度相当
- 结构化工具使用基准: 同样达到竞争精度

## 局限性
- 仅验证于视觉多模态场景
- 计算开销待进一步评估

## 建议
- **推荐场景**: 需要在生产环境（vLLM 等）部署微调 MLLM 的场景
- **适用领域**: 多模态 LLM 高效微调，特别是需要保持预编译模型性能的部署

---
来源: [arXiv:2606.11854](https://arxiv.org/abs/2606.11854)
