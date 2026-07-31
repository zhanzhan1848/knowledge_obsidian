# CoMem: Understanding Is Done Early - Long-Context Memory via Layer Division

## 元信息
| 标题 | Understanding Is Done Early: A Depth Division of Labor in Large Language Models and Its Use for Unbounded-Context Memory |
|------|------|
| 作者 | Liu Hanzuo 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.28263) |
| arXiv | arXiv:2607.28263 [cs.CL] |
| 发表 | 2026-07-30 |
| 代码 | 待发布 |

## 核心贡献
1. **发现 Transformer 深度分工规律**：下层和中层构建语义表示，上层逐渐专门化为预测任务
2. **提出 CoMem (Comprehension Memory)**：利用层间分工实现无限上下文记忆，存储成本与上下文长度解耦
3. **adapter-free 效率控制**：在 NVIDIA H20 128k 上下文下，显存从 89.36GB 降至 18.26GB，实现 7.83x prefill 加速

## 模型架构

### 核心发现：深度分工
- **下层/中层** → 构建语义表征
- **上层** → 专门化用于预测
- 写入时只通过中间层写入上下文块，检索固定数量的缓存残差状态

### CoMem 机制
```
写入阶段：通过中间层写入每个上下文块
读取阶段：检索缓存的残差状态，重计算基于查询条件化的上层
```

关键特性：
- 固定检索预算下，模型侧读取计算和记忆与存储上下文长度无关
- 使用 rank-32 self-distillation LoRA 在 Qwen3-8B 基础模型上继续训练
- 主干网络冻结，仅训练 LoRA adapter

## 实验结果

### RULER & LoCoMo
- CoMem: RULER 97.05, LoCoMo 38.27
- KV-Direct (full-context): LoCoMo 34.59
- **对话记忆优势**在 conversation-cluster 重采样后仍然保持

### 效率 (NVIDIA H20 @ 128k)
| 方法 | 显存 | Prefill 加速 |
|------|------|-------------|
| KV-Direct | 89.36 GB | 1x |
| CoMem | 18.26 GB | **7.83x** |

### 关键洞察
- 更深层缓存降低每查询重计算，但带来保真度损失
- Self-distillation 显著修复了保真度损失

## 局限性
- 评估基于统一 chat-template-free 协议
- 深度扫描实验显示层间权衡受超参数影响

## 相关工作
- 上下文压缩、KV-Direct、Longformer、RULER benchmark

## 标签
#long-context #memory #transformer #layer-division #Qwen #LoRA
