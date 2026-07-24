# Surprisal Theory is Tautological (without Rational Grounding)

> 🥬 LLM 论文分析：Surprisal Theory is Tautological

## 基本信息
- **作者**: Ryan Cotterell
- **发表**: Under Review at ARR
- **链接**: [arXiv](https://arxiv.org/abs/2607.21574)
- **arXiv**: arXiv:2607.21574

## 核心贡献
1. 证明 Surprisal Theory 在没有额外约束的情况下是同义反复（tautology）：对于任意非负的难度度量，存在某个语言模型其 surprisal 是该难度的仿射函数
2. 指出两 decade 心理语言学工作中隐含的假设——相关语言模型是生成训练语料的分布——已被 recent empirical work 推翻
3. 提出打破同义反复需要"理性主义干预"：相关语言模型应来自非经验动机的人类理解者模型（如记忆约束、处理目标）

## 主要内容

### 问题背景
Surprisal Theory 主张：人类处理一个语言单元的难度与其在某个语言模型下的 surprisal 成仿射关系。

### 核心论点
论文论证这一主张在没有额外约束的情况下是同义反复。原因：对于任意非负难度度量，总能构造一个语言模型使其 surprisal 与该难度成仿射关系。

关键推翻点：之前心理语言学假设相关语言模型是"生成训练语料的分布"，从而改善 corpus fit 就能改善人类行为预测。但 recent empirical work 已经证明更好的 corpus 模型反而可能是更差的人类处理难度预测器。

### 解决方向
打破同义反复需要一个理性主义框架——语言模型应基于人类理解者的内在模型（如记忆约束、处理目标），而非经验性训练分布。

## 局限性
论文主要从理论层面论证，实证验证有限。

## 标签
#surprisal-theory #language-model #psycholinguistics #theory
