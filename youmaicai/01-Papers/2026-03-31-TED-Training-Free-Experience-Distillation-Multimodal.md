# TED: Training-Free Experience Distillation for Multimodal Reasoning

## 元信息
| 标题 | TED: Training-Free Experience Distillation for Multimodal Reasoning |
|------|------|
| 作者 | Shuozhi Yuan et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.26778) |
| arXiv | arXiv:2603.26778 |
| 代码 | - |
| 发表 | arXiv, 2026-03-25 (announced 2026-03-31) |

## 核心贡献
1. 提出 **TED**（Training-free, Experience-based Distillation），将蒸馏更新目标从模型参数转移到注入学生提示的**上下文经验**
2. 关键机制：
   - 学生生成多个推理轨迹，教师独立生成解决方案
   - 教师比较学生轨迹与推理过程和标准答案，提取有效推理模式
   - 经验随时间持续精炼和更新
3. **Experience Compression**：跟踪使用统计，选择性合并、重写或删除低效用经验，解决上下文经验增长和噪声累积问题

## 关键创新
| 传统蒸馏 | TED |
|---------|-----|
| 参数更新 | 上下文经验更新 |
| 需要大规模训练数据 | 仅需 100 个训练样本 |
| 重复参数更新 | 无参数更新 |

## 实验结果
| 模型 | Benchmark | 基线 | TED | 提升 |
|------|-----------|------|-----|------|
| Qwen3-VL-8B | MathVision | 0.627 | 0.702 | **+0.075** |
| Qwen3-VL-8B | VisualPuzzles | 0.517 | 0.561 | +0.044 |

- 训练成本降低 **5x 以上**
- 低数据、无更新设置下，性能与完全训练的参数蒸馏相当

## 关键洞察
有意义的知识迁移可以通过**上下文经验**实现，无需修改模型参数。

## URL
- arXiv: https://arxiv.org/abs/2603.26778
- PDF: https://arxiv.org/pdf/2603.26778

---
*🥬 油麦菜 · LLM/NLP · 2026-03-31*
