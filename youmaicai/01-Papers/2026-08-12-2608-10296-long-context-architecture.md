# Cracks in the Foundation: Seemingly Minor Architectural Choices Impact Long Context Extension

## 元信息
| 标题 | Cracks in the Foundation: Seemingly Minor Architectural Choices Impact Long Context Extension |
|------|------|
| 作者 | Amanda Bertsch 等 (AI2) |
| 链接 | [原文](https://arxiv.org/abs/2608.10296) |
| arXiv | arXiv:2608.10296 |
| 发表 | COLM 2026 |
| 标签 | Transformer, Long-Context, Architecture, Ablation |

## 核心贡献
1. **关键发现**: 四个"minor"架构决策（来自 Olmo、Llama、Qwen 家族）单独影响小，但组合三个及以上时导致长上下文性能下降高达 **47%**
2. **不可检测性**: 这些差异在短上下文 loss 或验证集上完全不可检测
3. **OlmPool 发布**: 170,000+ GPU hours 训练的 26 个可比较 7B 模型集（扩展前后检查点），含多种架构配置

## 四个关键架构决策
| 决策 | 选项示例 | 对长上下文的影响 |
|------|---------|----------------|
| **Normalization** | RMSNorm vs LayerNorm | 影响 attention 分布稳定性 |
| **GQA (Grouped Query Attention)** | 是/否 | 影响 KV 缓存效率和 attention 质量 |
| **Pretraining Context Length** | 2K vs 4K vs 8K | 直接决定初始上下文能力 |
| **Sliding Window Attention** | 是/否 + window size | 影响远程依赖建模 |

## 关键发现
1. **复合效应**: 三个以上决策组合时性能急剧下降
2. **短上下文无信号**: 标准验证 loss 无法预测长上下文扩展能力
3. **早期检测可行**: 在预训练早期应用上下文扩展即可检测架构差异
4. **Attention Sink 行为**: 不同架构的 attention sink 模式可归因于特定架构差异

## OlmPool 数据集
- **26 个可比较 7B 模型**，checkpoint 前后对比
- 控制变量：data, tokenizer, extension recipe
- 变量：normalization, GQA, pretraining context length, sliding window attention
- 多种架构超越 Llama 3 架构在长上下文扩展上的表现

## 建议
- **是否推荐使用**: 是（对长上下文架构设计有重要指导意义）
- **适用场景**: 长上下文模型训练、架构选择、上下文扩展研究
- **实践建议**: 
  - 避免组合多个负面架构决策
  - 在预训练早期用上下文扩展评估架构选择
  - 关注 attention sink 行为作为长上下文能力的指标
