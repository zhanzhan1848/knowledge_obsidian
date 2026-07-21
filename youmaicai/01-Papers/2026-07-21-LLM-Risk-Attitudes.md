# Some Large Language Models Exhibit Consistent Risk Attitudes

## 元信息
| 标题 | Some Large Language Models Exhibit Consistent Risk Attitudes |
|------|------|
| 作者 | Bowen Sun, Rui Min, Yuxi Wang, Brian Odegaard, Qi Wang, Jing Du |
| 链接 | [原文](https://arxiv.org/abs/2607.16197) |
| arXiv | arXiv:2607.16197v1 |
| 领域 | cs.AI |
| 发表日期 | 2026-04-24 |

## 核心贡献
1. 首次系统研究 LLM 在不确定性下的风险态度
2. 提出跨域框架，将上下文风险信念与分类决策解耦
3. 揭示风险态度是 LLM 行为的稳定且先前未表征的维度

## 问题背景
随着 AI 系统部署在开放式高风险场景中，一个关键维度仍未被测量：感知风险如何转化为行动。

## 方法
### 跨域框架
将上下文风险信念与分类决策解耦

### 任务域
- 空间导航 (Spatial navigation)
- 临床分诊 (Clinical triage)
- 金融配置 (Financial allocation)

### 参与者
- 6 个代表性 LLM
- 100 个人类参与者

### 分析
使用回归模型提取每个智能体的信念到决策映射，量化风险敏感性和风险态度偏差

## 主要发现

### 发现1: 强任务内一致性
- 大多数测试 LLM 表现出稳健的任务内一致性
- 表明从上下文信念到风险决策的稳定映射

### 发现2: 跨域 rank-order 稳定性
- 保持跨任务的相对风险姿态

### 发现3: 受限风险态度分布
- 相对于更广泛的人类基线，收敛到受限的风险态度分布

## 结论
- 风险态度是 LLM 行为的稳定且先前未表征的维度
- 为评估和对齐开放式决策中的 AI 系统奠定基础
- 激发对这些固有行为倾向起源的进一步研究

## 建议
- **是否推荐使用**：是
- **适用场景**：AI 对齐、决策系统、LLM 行为建模

---
*关键词*: LLM Behavior, Risk Attitude, Decision Making, Alignment, AI Safety
