# NeWTral: Automatic Safety Alignment Restoration through Neural Weight Translation

## 元信息
| 标题 | You Snooze, You Lose: Automatic Safety Alignment Restoration through Neural Weight Translation |
|------|------|
| 作者 | Vignesh Kumar Kembu, Antonino Nocera, Stjepan Picek, Saraga Sakthidharan (University of Pavia, Radboud University, University of Zagreb) |
| 链接 | [原文](https://arxiv.org/abs/2605.04992) |
| arXiv | arXiv:2605.04992 |
| 代码 | 待发布 |
| 会议/期刊 | 待投稿 |

## 核心贡献
1. 提出 NeWTral（Neural Weight Translation）框架：直接将不安全的 domain-specific adapters 映射到安全对齐流形，同时保留核心专业知识
2. 提出 MoE 路由策略：动态混合 Surgical Expert（保留专业知识）和 Aggressive Expert（注入拒绝启发式）
3. 发现 MLP blocks 是行为安全的主要驱动因素，而 attention blocks 必须保持不变以保留领域推理能力

## 核心问题
开源生态中，第三方 LoRA adapter 集成常导致基础模型安全对齐灾难性遗忘。传统微调恢复安全的方法会造成领域知识严重退化（utility-alignment tax）。

## 方法：NeWTral
- 预训练非线性翻译模块（无需目标域数据，无需梯度优化）
- 使用 MoE 路由策略：分析 unsafe adapter 权重统计特征，动态选择翻译专家
- Surgical Expert：保留深度和原始领域知识
- Aggressive Expert：注入拒绝启发式和伦理合规

## 实验结果
在 4 个架构家族（Llama-3.1, Mistral, Qwen-2.5, Gemma-2）、规模高达 72B 参数、8 个专业领域：
- Attack Success Rate (ASR): 从 unsafe experts 的 ~70% 降至 MoE variant 的 ~13%
- 知识保真度维持 ~90%

## 关键发现
- 安全对齐在网络深度上高度异质
- MLP blocks 是行为安全的主要驱动
- Attention blocks 必须保持不变以保留领域推理

## 建议
- 是否推荐使用：**是**（LoRA 安全对齐恢复的 SOTA 方法）
- 适用场景：开源 LoRA adapter 安全对齐、多语言模型安全