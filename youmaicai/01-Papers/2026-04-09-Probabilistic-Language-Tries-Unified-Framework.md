# Probabilistic Language Tries: A Unified Framework for Compression, Decision Policies, and Execution Reuse

## 元信息
| 标题 | Probabilistic Language Tries: A Unified Framework for Compression, Decision Policies, and Execution Reuse |
|------|------|
| 作者 | Gregory Magarshak |
| 链接 | [原文](https://arxiv.org/abs/2604.06228) |
| arXiv | arXiv:2604.06228v1 |
| 领域 | cs.LG, cs.AI, cs.CL, cs.DS, cs.IR, cs.IT |

## 核心贡献
1. 提出 **Probabilistic Language Tries (PLTs)**，利用任意序列生成模型的隐式前缀结构
2. PLT 将每个出边的条件概率分配给对应 token 或 action，同时服务三个功能：
   - (i) 最优无损压缩器（频率加权区间编码，算术编码的泛化）
   - (ii) 序列决策问题的策略表示（游戏、搜索、机器人控制）
   - (iii) 重复推理查询的 memoization 索引

## 核心技术结果：Prior-guided Caching Theorem
在平稳生成分布下，PLT 引导的缓存对于所有查询数量低于某阈值的情况，严格优于任何经验频率缓存。

**复杂度变换**：
```
O(n²) transformer attention → p_r * O(log N) + (1-p_r) * O(n²)
```
其中 p_r = prior-estimated reuse probability，N = artifact store size

## 混合压缩架构
将任意数据集分解为：
- PLT 覆盖的 majority
- Sparse residual store

连接了：
- 算术编码
- Kolmogorov-style 程序表示
- Rate-distortion 理论

## 应用场景
- Chess
- Web Search
- Robotics
- Organizational workflows
- **LLM inference**（重点应用）

## 核心洞察
- 压缩、决策、计算复用都源于序列空间上的单一概率测度
- PLT 将 LLM 推理的计算复杂度通过 memoization 降低

## 建议
- **是否推荐阅读**：是（理论价值高）
- **适用场景**：LLM 推理加速、前缀树数据结构应用、计算复用、压缩算法
