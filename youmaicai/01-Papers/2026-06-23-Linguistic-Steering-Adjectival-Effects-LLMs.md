# Investigating Linguistic Steering: Adjectival Effects Across Large Language Model Architectures

## 元信息
| 标题 | Investigating Linguistic Steering: An Analysis of Adjectival Effects Across Large Language Model Architectures |
|------|------|
| 作者 | （待补充，论文为 TMLR 接收） |
| 链接 | [原文](https://arxiv.org/abs/2606.20572) \| [OpenReview](https://openreview.net/forum?id=xN7NYpQeBm) |
| arXiv | arXiv:2606.20572v1 |
| 发表 | cs.CL, cs.AI / TMLR |
| 日期 | 2026-06-23 |

## 核心贡献
1. 首次使用 **Shapley 值**量化单个形容词对模型性能的"转向效应"（steering effect），提供可解释的归因框架
2. 覆盖 100 个形容词、5 种模型（o3、GPT-4o-mini、Phi-3、Llama-3-70B、DeepSeek-R1）、MMLU 基准
3. 发现"家族效应"：同源模型共享相似的形容词敏感度分布，架构差异大的模型行为不相关
4. 发现大模型中形容词存在**非加性交互效应**（协同放大、拮抗抑制、反转）
5. 为 AI 对齐和鲁棒提示策略提供理论依据

## 核心发现

### 1. 少数形容词是强力"杠杆"
- 存在一小部分形容词对模型输出的影响远大于其他词
- 但这些强力形容词的效果**不具普遍性**

### 2. 家族效应（Family Effect）
- 同源模型（如 Llama 系列）表现出**相关的敏感度分布**
- 架构不同的模型反应**基本不相关**
- 挑战了"一刀切"提示策略的可行性

### 3. 形容词的转向方向非固有
- 同一形容词在不同**句法角色**和**位置**下效果不同
- 形容词的"好/坏"方向高度依赖上下文

### 4. 大模型中的非加性交互效应（GPT-4o-mini）
- 形容词可**协同放大**彼此影响
- 也可**拮抗抑制**
- 甚至可**反转**对方的影响
- 小模型（Phi-3）响应更字面，组合效应较弱

## 方法论

### Shapley 值框架
将形容词视为协作博弈中的玩家，计算其对模型输出的贡献值：
```
Shapley_i = Σ (subset S ⊆ {all adjectives \ {i}}) [|S|!·(|A|-|S|-1)!/|A|!] · [v(S∪{i}) - v(S)]
```
其中 v(·) 为模型在给定形容词子集下的性能指标。

### 实验设计
- **形容词**：100 个（正负情感义词各半）
- **模型**：o3, GPT-4o-mini, Phi-3, Llama-3-70B, DeepSeek-R1
- **基准**：MMLU（多任务语言理解）
- **变量**：形容词类型、句法角色、位置、模型规模

## AI 对齐启示
1. 简单的关键词提示策略不可靠
2. 需要**组合式、模型特定**的对齐技术
3. 随模型规模增大，行为更复杂也更难预测
4. Shapley 值为可解释的 LLM 控制提供了 Principled 基础

## 局限性
- 仅测试形容词，其他词性（如动词、副词）的转向效应待研究
- MMLU 为综合基准，具体任务泛化待验证
- Shapley 值计算开销大，实时应用受限

## 相关论文
- [[Prompt Engineering]] - 提示工程基础
- [[AI Alignment]] - AI 对齐研究
- [[Shapley Values]] - 可解释性方法

---
*🥬 油麦菜 · 2026-06-23*
