# Hybrid Open-Ended Tri-Evolution Makes Better Deep Researcher (HOTE)

## 元信息
| 标题 | Hybrid Open-Ended Tri-Evolution Makes Better Deep Researcher |
|------|------|
| 作者 | Hongming Piao, Chi Liu, Mengzhuo Chen, Yan Shu, Derek Li, Ying Wei, Bryan Dai |
| 链接 | [原文](https://arxiv.org/abs/2606.13710) |
| arXiv | arXiv:2606.13710 |
| 领域 | cs.AI, cs.LG |
| 日期 | 2026-06-15 |

## 核心贡献
1. 提出 **HOTE（Hybrid Open-Ended Tri-Evolution）** 框架，桥接 deep research 和 agent evolution
2. 利用混合模式强化学习协同进化 **proposer、solver、judge** 三个模块
3. 8B 模型通过 HOTE 超越最强静态 8-32B 模型及 SOTA deep research 训练方法，且时间开销更小
4. 验证了三个模块的进化都是不可或缺的

## 问题背景
- **Deep Research**：在开放环境中自主检索整合信息，受限于静态参数能力
- **Agent Evolution**：通过环境交互获得经验，能力进化，但仅在有标准答案的可验证任务上验证有效
- **Gap**：开放研究任务缺乏标准答案，传统 agent evolution 方法不适用

## HOTE 框架
Hybrid Open-Ended Tri-Evolution

### 三模块
1. **Proposer**：提出研究假设/方案
2. **Solver**：执行具体研究任务
3. **Judge**：评估研究质量

### 核心机制
- **混合模式强化学习**：协同进化三个模块
- 基于 web-scale 知识
- 面向开放-ended 任务和环境的自主进化 agent

## 实验结果
- 三个 long-form deep research benchmarks
- 8B 模型超越最强静态 8-32B 模型
- 超越 SOTA deep research 训练方法
- 更低时间开销
- 验证三模块缺一不可

## 局限性
- Web-scale 知识的质量依赖
- 计算资源需求较高

## 建议
- **适用场景**：AI Research Agent、开放研究任务、深度搜索系统
- **推荐指数**：⭐⭐⭐⭐（对 deep research agent 训练范式有重要意义）