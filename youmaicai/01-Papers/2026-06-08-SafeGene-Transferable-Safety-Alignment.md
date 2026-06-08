# SafeGene: Reusable Adapters for Transferable Safety Alignment

## 元信息
| 标题 | SafeGene: Reusable Adapters for Transferable Safety Alignment |
|------|------|
| 作者 | Yanghan Wang, Zhiqiang Kou, Fu Feng, Jing Wang, Xin Geng |
| 链接 | [原文](https://arxiv.org/abs/2606.06519) |
| arXiv | arXiv:2606.06519 |
| 领域 | cs.AI, cs.LG |
| 发表 | 2026-06-02 |

## 核心贡献

1. **问题定义**：开源 LLM 被下游微调后，安全对齐会被削弱，即使训练数据本身无害。这是一个循环问题——模型不断被新任务数据更新，安全恢复需要重复进行。

2. **核心方法**：提出 **SafeGene**，一种跨任务复用的安全适配器模块。将安全能力视为独立于任务特定更新的可复用适配表示，而非逐模型修复。

3. **技术实现**：
   - 从 aligned-degraded 模型差异中提取安全向量
   - 通过数据感知的层选择（data-aware layer selection）精炼为任务可迁移的安全向量
   - 通过 few-shot 层-wise 系数重校准（layer-wise coefficient recalibration）在下游任务模型中表达

## 关键发现

- SafeGene 增强的模型在降低有害响应率的同时保持下游性能
- 在 safety-utility 权衡上优于代表性安全适应方法

## 核心创新点

将安全能力解耦为独立可复用的适配器表示，而非针对每个模型单独修复。这使得安全模块可以在同一架构家族内跨任务复用。

## 实验设置

- 测试：多个模型家族、多任务、多安全评判器
- 评估指标：有害响应率、下游任务性能

## 建议
- **是否推荐使用**：是
- **适用场景**：开源 LLM 的安全对齐保护，特别是需要持续微调的部署场景

---
*🥬 油麦菜 — LLM/NLP 知识管理*