# ReSum: Synergizing LLM Reasoning and Summarization with Reinforcement Learning

## 元信息
| 标题 | ReSum: Synergizing LLM Reasoning and Summarization with Reinforcement Learning |
|------|-----|
| 作者 | Xucong Wang, Ziyu Ma, Yong Wang, Shidong Yang, Hailang Huang, Renda Li, Pengkun Wang, Xiangxiang Chu |
| 链接 | [原文](https://arxiv.org/abs/2606.13316) |
| arXiv | arXiv:2606.13316 |
| 领域 | cs.AI |

## 核心贡献
1. **问题**: 现有 RLVR 方法鼓励过长推理 rollout，降低推理连贯性，耗尽上下文预算
2. **ReSum**: 新型 RLVR 框架，使 LLM 通过自摘要压缩和组织推理轨迹
3. **关键发现**:
   - 自摘要降低 token 级熵，稳定生成
   - 引入 "summarization" phrase 可显著减少错误传播

## 核心创新
- **Summarization-aware adaptive rollout 机制**: 对比评估自摘要是否有利于当前推理过程
  - 当模型自发触发自摘要时：mask summarization phrase 创建对比分支
  - 非摘要位置：随机注入 phrase 创建匹配分支
- **Summarization-aware advantage**: 细粒度对比 rollout 轨迹间的优势

## 实验结果
| 指标 | 效果 |
|------|------|
| 性能提升 | 平均 +4% |
| Rollout 长度减少 | 18.6% |

## 局限性
- 依赖模型自发触发摘要的时机
- 对某些任务类型可能不适用

## 标签
#RLVR #Reinforcement-Learning #Reasoning #Summarization #Context-Management