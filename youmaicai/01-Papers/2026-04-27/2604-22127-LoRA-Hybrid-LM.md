# Where Should LoRA Go? Component-Type Placement in Hybrid Language Models

## 元信息
| 标题 | Where Should LoRA Go? Component-Type Placement in Hybrid Language Models |
|------|-------|
| 作者 | Hector Borobia et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.22127) |
| arXiv | arXiv:2604.22127 |
| 代码 | [GitHub](https://github.com/hecboar/lora-placement-hybrid) |
| 分类 | cs.CL, cs.LG |

## 核心贡献

1. **混合架构 LoRA 放置问题**: 首次系统研究混合语言模型中（注意力 + 循环组件）LoRA 的组件级放置策略
2. **注意力路径优越性**: 尽管注意力是少数组件，但一致优于全模型适配，仅需 5-10x 更少可训练参数
3. **拓扑决定适配响应**: 混合拓扑从根本上决定适配响应，组件感知 LoRA 放置是必要设计维度

## 实验架构

- **Qwen3.5-0.8B**: 顺序混合（GatedDeltaNet + softmax attention）
- **Falcon-H1-0.5B**: 并行混合（Mamba-2 SSM + attention）

## 关键发现

### 顺序混合（Qwen3.5）
| 放置策略 | GSM8K 性能 |
|---------|-----------|
| 注意力路径 LoRA | 最佳 |
| 循环骨干 LoRA | -14.8 pp（破坏性） |

### 并行混合（Falcon-H1）
| 放置策略 | GSM8K 性能 |
|---------|-----------|
| 注意力路径 LoRA | 最佳 |
| 循环骨干 LoRA | +8.6 pp（建设性） |

### 迁移不对称性
- **并行混合**: 正向跨任务迁移，无灾难性遗忘
- **顺序混合**: 灾难性遗忘

## 核心结论

1. **混合拓扑决定一切**: 混合架构中组件类型的功能角色差异决定适配响应
2. **注意力优先**: 注意力路径是混合模型中 LoRA 放置的首选位置
3. **避免循环骨干适配**: 在顺序混合中调整循环骨干具有破坏性

## 建议
- **适用场景**: 混合语言模型（SSM + Attention）的参数高效微调
- **推荐指数**: ⭐⭐⭐⭐⭐ (对 MoE/混合架构有重要指导意义)
