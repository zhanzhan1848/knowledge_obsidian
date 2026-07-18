# 🥬 LLM 论文分析：Partition, Prompt, Aggregate - Statistical Self-Consistency in Language Models

## 基本信息
- **标题**: Partition, Prompt, Aggregate: Statistical Self-Consistency in Language Models
- **作者**: Patrik Wolf et al.
- **发表**: arXiv, 2026-07-16
- **链接**: [原文](https://arxiv.org/abs/2607.15277)
- **arXiv**: arXiv:2607.15277
- **代码**: 待查
- **领域**: cs.CL (LLM 推理/评估)

## 核心贡献
1. 提出**统计自一致性 (Statistical Self-Consistency)** 作为评估 LLM 的新维度——不依赖参考答案即可衡量模型质量
2. 发现前沿模型普遍违反基本的概率恒等式（如全概率定理），存在**宏 fallacy（macro fallacy）**：从细粒度子群体重建的估计往往比直接群体级估计更符合人类参考数据
3. 模型拥有相关子群体知识，但无法可靠地将这些知识传播到聚合估计中

## 方法论

### 评估框架
使用**二叉树**作为评估 scaffold：
1. 将人口递归划分为越来越细粒度的子群体
2. 用自然语言子群体描述作为上下文提示 LLM
3. 将子群体估计聚合回人口级估计
4. 比较不同粒度划分的估计一致性

### 核心发现：宏 fallacy
- persona prompting 下，从细粒度子群体响应重建的估计通常比直接人口级估计更好地与人类参考数据对齐
- 该效应在树结构和估计任务的变化中持续存在
- 可以通过隐式提示部分恢复

### 数学表述
全概率定理：先验加权的条件分布应聚合为任何有效划分下的人口级边际：

```
P(X) = Σ P(X|subgroup_i) × P(subgroup_i)
```

LLM 应满足此恒等式，但实验表明普遍违反。

## 实验结果
- 在多个问题域和前沿模型上发现自一致性属性的**广泛违反**
- persona prompting 揭示了宏 fallacy 模式
- 细粒度聚合可以提高估计质量这一发现为改进 LLM 推理提供了新方向

## 核心创新点
- 统计自一致性是一个**未饱和的、无需参考的 LLM 评估标准**
- 模型并非缺乏知识，而是缺乏**可靠的知识聚合传播机制**

## 局限性
- 评估框架本身依赖有效的划分设计
- 宏 fallacy 的完整理论机制尚不明确

## 建议
- **是否推荐使用**: 是（评估维度的创新）
- **适用场景**: LLM 评估、推理可靠性研究

---
*📅 录入日期: 2026-07-18 | 来源: arXiv cs.CL*
