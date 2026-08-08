# MACRO: Markov Chain Routing of Transformer Layers

## 元信息
| 标题 | Markov Chain Routing of Transformer Layers |
|------|-------|
| 作者 | Paweł Batorski et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.05872) |
| arXiv | arXiv:2608.05872 |
| 代码 | [GitHub](https://github.com/Batorskq/MACRO) |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. 提出 **MACRO**：将 Transformer 层路由建模为上下文相关的马尔可夫策略
2. 支持 skip、repeat、残差 hidden-state addition 操作
3. 在不修改底层参数的情况下学习任务相关路由

## 方法
- 马尔可夫路由分布基于：层索引、计算预算阶段、方向位移、算子上下文
- 通过 top-k Viterbi 算法解码，隔离高概率候选程序
- 在训练数据上通过反馈更新路由分布

## 实验结果
- 平均准确率提升 +5.0% over 无路由基线，小模型增益最大
- 超越 Dr. LLM（最佳动态路由方法）+7.2%
- 路由搜索时间减少 9.4x（14.8h → 1.6h）

## 关键洞察
动态层路由的价值在于小模型；强 agent 的路由机会与成功率正相关（0.95 相关性）
