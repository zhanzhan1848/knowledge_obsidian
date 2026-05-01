# When Continual Learning Moves to Memory: A Study of Experience Reuse in LLM Agents

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Qisheng Hu, Quanyu Long, Wenya Wang |
| 链接 | [原文](https://arxiv.org/abs/2604.27003) |
| arXiv | arXiv:2604.27003 |
| 发表 | 2026-04-29 |

## 核心贡献
1. 研究了记忆增强型 LLM Agent 中的持续学习问题，发现稳定性-可塑性困境并未消失，而是转移到了记忆层面
2. 提出 **(k,v) 框架**，解耦外部记忆设计的两个核心维度：经验表示和检索组织
3. 在 ALFWorld 和 BabyAI 上进行序列任务实验，发现抽象程序记忆比详细轨迹更具迁移性，负迁移对困难案例影响更大

## 关键发现

### 记忆层面的持续学习困境
- 在有限上下文窗口下，旧经验和新经验在检索时相互竞争
- 将持续学习瓶颈从参数更新重新定位到记忆访问
- 外部记忆不能解决持续学习问题，而是将其重塑为记忆表示和检索设计问题

### (k,v) 框架
- **k (knowledge representation)**: 经验如何被表示
  - 抽象程序记忆 vs 详细轨迹
  - 程序记忆迁移更可靠
- **v (vocabulary/memory organization)**: 经验如何被组织用于检索
  - 更细粒度的记忆组织并非普遍有益
  - 强前向迁移的设计可能同时导致严重遗忘

### 实验结论
- 抽象程序记忆比详细轨迹转移更可靠
- 负迁移对困难案例影响不成比例
- 细粒度记忆组织在产生强前向迁移的同时可能引发严重遗忘

## 建议
- **是否推荐阅读**: 是
- **适用场景**: LLM Agent 设计、持续学习系统、记忆架构研究

---
标签: LLM, continual learning, memory, agent