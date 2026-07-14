# Remembering Distinct Items, Not Tokens: DP Cache for SSM and Attention

## 元信息
| 标题 | Remembering Distinct Items, Not Tokens: A Learnable Dirichlet-Process Cache Between State-Space Models and Attention |
|------|-----|
| 作者 | Siddharth Pal, Viktoria Rojkova |
| 链接 | [原文](https://arxiv.org/abs/2607.09889) |
| arXiv | arXiv:2607.09889 |
| 日期 | 2026-07-14 |
| 分类 | cs.LG, cs.AI, cs.CL, cs.NE |

## 核心贡献

1. **问题定位**：固定状态模型（SSM）将无界历史压缩到有界状态，限制了联想召回；Attention 保留每个 token 的 KV 缓存，但计算和缓存都是 $O(n^2)$ / $O(n)$

2. **中间方案**：稀疏缓存，只在新输入是"新颖的"时才分配 slot，使缓存大小跟踪**不同 item 的数量**而非 token 数量

3. **分配规则**：DP-means 聚类规则（Dirichlet 过程的 small-variance 极限），用作深度循环主干的 KV 内存算子

4. **两种形式**：
   - **静态缓存**：固定 concentration
   - **惊喜自适应变体**：concentration 跟随近期新颖率

## 核心思想

### 传统方法对比
| 方法 | 缓存大小 | 计算复杂度 |
|------|----------|------------|
| 固定状态 SSM | $O(1)$ | $O(1)$ per step |
| Full Attention | $O(n)$ | $O(n^2)$ |
| **DP Cache (本文)** | $O(\text{#distinct items})$ | $O(\text{#distinct items})$ |

### DP-means 分配规则
分配一个新 slot 当且仅当新输入与所有现有缓存项的距离超过阈值 $\lambda$：
```math
\text{allocate} \iff \min_k \|x - c_k\| > \lambda
```
这是 Dirichlet 过程混合的小方差极限，用作确定性的 key-value 内存算子。

## 实验结果

### 联想召回基准
- DP Cache 匹配全 attention 召回率，但只存储 distinct items
- 在 recall-vs-size 前沿上优于固定预算驱逐缓存

### 状态空间主干
- 在最低内存下同时回答召回查询和长程聚合

### 端到端学习
- 两参数 novelty-threshold gate（仅用任务损失训练）精确恢复 DP-means 规则
- 过参数化的 gate 反而失败 → **关键因素是归纳偏置，而非容量**

### 真实数据验证
四个真实流（推荐、系统日志、临床事件、保险索赔）确认 distinct-items 特性

## 关键发现

1. **归纳偏置 > 容量**：两参数 gate 精确恢复规则，过参数化 gate 失败
2. **Distinct items 特性可迁移**：在推荐、临床、保险等不同领域真实数据上确认
3. **Surprise-Adaptive 变体**：动态调整 concentration 跟随新颖率
4. **缓存大小与任务相关**：冗余越多，节省越多

## 技术细节

### 分配规则（确定性）
```python
def allocate(x, cache_keys, threshold):
    distances = [||x - k|| for k in cache_keys]
    if min(distances) > threshold:
        return True  # 新颖，分配新 slot
    return False     # 已知，复用最近邻
```

### 学习信号
- 训练两个参数（novelty threshold gate）仅用任务损失
- 不需要辅助监督信号来发现 distinct items

## 局限性

- 仍需真实 backbone、真实语料的语言验证（companion paper 预告中）
- 对非常高频重复的序列优化效果可能有限

## 标签
#StateSpaceModel #Attention #Memory #MixtureOfExperts #DirichletProcess #稀疏缓存

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
