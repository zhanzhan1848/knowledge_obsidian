# Language Models Need Sleep: Learning to Self-Modify and Consolidate Memories

## 元信息
| 标题 | Language Models Need Sleep: Learning to Self-Modify and Consolidate Memories |
|------|-----|
| 作者 | Ali Behrouz, Farnoosh Hashemi, Vahab Mirrokni |
| 链接 | [原文](https://arxiv.org/abs/2606.03979) |
| arXiv | arXiv:2606.03979 |
| 发表 | 2026-06-02 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. **核心思想**：借鉴人类睡眠学习机制，为 LLMs 引入"Sleep"范式，实现持续学习和记忆巩固。
2. **Sleep 两阶段框架**：
   - **Memory Consolidation（记忆整合）**：上行蒸馏过程（Knowledge Seeding），将小型自我的记忆蒸馏到更大的网络，提供更多容量的同时保留知识
   - **Dreaming（做梦）**：自改进阶段，使用 RL 生成综合数据的课程来排练新知识并细化已有能力，无需人类监督

## 方法细节

### Memory Consolidation - Knowledge Seeding
- **广义蒸馏过程**：结合 on-policy 蒸馏与基于 RL 的模仿学习
- 将小型模型的记忆整合到大型网络
- 证明蒸馏可以保存知识同时扩展容量

### Dreaming - 自改进
- 使用 RL 生成综合数据的课程
- 排练新知识 + 细化已有能力
- 无需人工监督

### 实验任务
- Long-horizon 持续学习
- 知识整合
- Few-shot 泛化

## 核心创新点
- 首次将人类睡眠机制引入 LLMs 的持续学习框架
- 解决 LLMs 缺乏持续学习能力和将时序上下文知识转移到长期参数的有效方法
- Knowledge Seeding + Dreaming 的两阶段设计为终身学习提供新思路

## 标签
#LLM #continual-learning #distillation #RL #memory-consolidation