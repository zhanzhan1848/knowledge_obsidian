# Agent-Radar: Attention Steering for Multi-Agent Communication

## 元信息
| 标题 | Enhancing Multi-Agent Communication through Attention Steering with Context Relevance |
| 作者 | (Authors from paper2605.30136) |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30136) |
| arXiv | arXiv:2605.30136 |

## 核心贡献
1. **问题**：LLM 多智能体系统在长对话中积累极长上下文，相关信息被无关内容稀释，性能下降
2. **提出 Agent-Radar**：无训练的上下文管理方法，通过时空衰减机制动态引导每个智能体的注意力
3. **核心机制**：
   - Temporal and spatial decay mechanism
   - 动态将注意力引导至相关上下文

## 实验结果
- 5 个不同基准测试，超越 SOTA 方法
- 高达7.64 个绝对点增益
- 在智能体数量和交互轮数增加时保持有效和鲁棒
- 消融实验证明核心组件至关重要且可泛化

## 标签
#multi-agent #attention-steering #context-management #LLM