# COTCAgent: Probabilistic Chain-of-Thought Completion for Clinical Consultation

> 🥬 LLM 论文分析：医疗临床决策中的 CoT 推理框架

## 基本信息
- **作者**: (Baichuan-M2 基模型团队)
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15016) | [PDF](https://arxiv.org/pdf/2605.15016)
- **arXiv**: arXiv:2605.15016 [cs.CL]
- **代码**: https://github.com/FrankDengAI/COTCAgent

## 核心贡献

### 核心创新点
提出 **COTCAgent (Probabilistic Chain-of-Thought Completion Agent)**，一个用于纵向电子健康记录 (EHR) 的层级推理框架，解决医疗临床决策中的推理缺陷。

### 问题背景

**当前 LLMs 在纵向 EHR 推理中的关键缺陷**：

1. **缺乏细粒度统计推理**：当定量证据以文本形式暗示时，常产生幻觉性临床趋势和指标，扭曲诊断推理
2. **非均匀时间序列 + 稀缺标注**：阻碍模型捕获长程时间依赖，限制可靠临床推理

### COTCAgent 三核心模块

1. **Temporal-Statistics Adapter (TSA)**
   - 将分析计划转换为可执行代码，输出标准化趋势

2. **Chain-of-Thought Completion (COTC) Layer**
   - 利用 symptom-trend-disease 知识库 + 加权评分评估疾病风险
   - bounded completion module 获取结构化证据

3. **Iterative Scoring Constraints**
   - 通过标准化查询和迭代评分约束确保严谨推理

### 设计原则
将统计计算、特征匹配和语言生成解耦，消除对复杂多模态输入的依赖，实现更低计算开销的纵向记录分析。

### 实验结果

| 模型/基准 | COTCAgent (Baichuan-M2) |
|-----------|------------------------|
| Self-built dataset Top-1 | **90.47%** |
| HealthBench | **70.41%** |

**显著优于** 现有医疗 Agent 和主流 LLM。

## 局限性
- 仅验证了 Baichuan-M2 一个基模型
- 依赖 symptom-trend-disease 知识库的质量

## 建议
- **是否推荐使用**: 是（医疗 AI 系统）
- **适用场景**: 临床决策支持、医疗诊断辅助、EHR 时间序列分析

## 标签
#LLM #medical-AI #chain-of-thought #EHR #reasoning