# Do Language Models Need Sleep? Offline Recurrence for Improved Online Inference

## 元信息
| 标题 | Do Language Models Need Sleep? Offline Recurrence for Improved Online Inference |
|------|------|
| 作者 | Sangyun Lee |
| 链接 | [原文](https://arxiv.org/abs/2605.26099) |
| arXiv | arXiv:2605.26099 |
| 发表 | 2026-05-25 (v1), 2026-05-27 (v2) |
| 领域 | cs.CL, cs.AI |

## 核心贡献

1. **Sleep-like Consolidation Mechanism**: 提出类睡眠机制，模型周期性将近期上下文转换为持久快速权重（fast weights），然后清除 KV cache
2. **State-Space Model (SSM) Blocks**: 在睡眠期间，模型对累积上下文执行 N 次离线循环传递，通过学习到的局部规则更新 SSM 块的快速权重
3. **计算转移**: 将额外计算转移到睡眠阶段，同时保持推理时预测的延迟

## 模型架构

### 睡眠-清醒机制
- **清醒阶段 (Wake)**: 标准 transformer 推理，积累上下文到缓存
- **睡眠阶段 (Sleep)**: 执行 N 次离线循环传递，将上下文信息整合到 SSM 快速权重中
- **唤醒时**: 清除 KV cache，使用快速权重进行推理

### 关键技术
- Fast Weight：状态空间模型中的持久化权重
- Offline Recurrent Pass：离线循环传递，用于记忆巩固
- Key-Value Cache Clearance：释放显存，为下一阶段做准备

## 实验结果

### 测试任务
1. **合成任务**: Cellular Automata, Multi-hop Graph Retrieval
2. **现实任务**: Math Reasoning

### 发现
- 增加睡眠时长 N 提升性能
- 最大收益出现在需要更深推理的样本上
- 普通 transformer 和 SSM-attention 混合模型在某些任务上失败，LM-Sleep 成功

## 局限性

- 需要预定义的睡眠周期
- 对实时性要求高的场景可能不适用
- SSM 块的实现复杂度增加

## 关键词
#LLM #Attention #Long-Context #Memory #SSM #Inference-Optimization

## 相关工作
- 相关: State Space Models, Fast Weight Memory, Long-horizon Tasks