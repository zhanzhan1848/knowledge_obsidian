# ARACH: Attention Reallocation via Adaptive Context Hub

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Summarize Before You Speak with ARACH: A Training-Free Inference-Time Plug-In for Enhancing LLMs via Global Attention Reallocation |
| 作者 | Jingtao Wang, Yucong Wang, Jun Ding, Rui Cai, Xun Wang |
| 链接 | [arXiv:2603.11067](https://arxiv.org/abs/2603.11067) |
| arXiv | arXiv:2603.11067 |
| 分类 | cs.CL, cs.AI |
| 日期 | 2026-03-10 |

## 核心贡献
1. **Training-Free 方法**：提出首个无需训练的推理时内部干预机制
2. **内部计算干预**：不同于 prompt-based 方法，直接干预模型内部计算
3. **Attention Sink 缓解**：分析表明 ARACH 缓解了 attention sink 现象

## 方法：ARACH
**A**ttention **R**eallocation via **A**daptive **C**ontext **H**ub

### 核心机制
- **Adaptive Context Hub**：聚合上下文信息的自适应中心
- **Attention Reallocation**：重新分配注意力权重
- **Plug-and-Play**：即插即用，无需修改模型权重

### 与现有方法对比
| 方法类型 | 干预位置 | 需要训练 |
|---------|---------|---------|
| Prompt-based | 输入/输出 | 否 |
| Fine-tuning | 权重 | 是 |
| **ARACH** | 内部计算 | **否** |

## 实验结果
- 多个语言建模任务上持续改进
- 推理开销适度
- 无参数更新

## 关键洞见
- 工程化模型内部计算是独特的推理时策略
- 不同于 prompt-based 测试时方法
- 不同于基于训练的后训练方法
- **"Summarize Before You Speak"**：在生成前聚合上下文

## Attention Sink 现象
- LLM 中某些 token 吸引过多注意力
- 影响模型性能
- ARACH 通过重新分配注意力缓解此问题

## 应用场景
- LLM 性能提升（无需重训练）
- 长上下文处理
- 注意力机制优化

## 标签
#LLM #attention-mechanism #training-free #inference-time #plug-in #attention-sink
