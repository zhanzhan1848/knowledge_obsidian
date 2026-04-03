# E-STEER: Emotion Steering for LLMs and Agents

## 元信息
| 标题 | How Emotion Shapes the Behavior of LLMs and Agents: A Mechanistic Study |
|------|-----|
| 作者 | Moran Sun, Tianlin Li, Yuwei Zheng, Zhenhong Zhou, Aishan Liu, Xianglong Liu, Yang Liu |
| 链接 | [原文](https://arxiv.org/abs/2604.00005) |
| arXiv | arXiv:2604.00005 |
| 代码 | - |
| 领域 | cs.AI, cs.CL |
| 日期 | 2026-04-03 |

## 核心贡献
1. **E-STEER** (Emotion-based Steering framework): 首个在表征级别对 LLM 和 Agent 进行情绪信号干预的可解释框架
2. 将情绪建模为隐藏状态中的结构化可控变量，而非表面风格因子
3. 发现情绪-行为之间存在非单调关系，与心理学理论一致
4. 特定情绪不仅能提升 LLM 能力，还能改善安全性

## 模型架构

### E-STEER 框架
- 在 LLM 隐藏层中嵌入情绪表征向量（structured, controllable variable）
- 通过直接表征级干预（representation-level intervention）影响模型行为
- 三层核心机制：
  1. **情绪编码**：将情绪信号映射到高维表征空间
  2. **干预模块**：对 hidden states 进行定向修改
  3. **行为解码**：从修改后的表征空间输出行为变化

### 与传统方法的区别
| 方法 | 情绪处理方式 | 干预层级 |
|------|-------------|---------|
| 传统情绪感知研究 | 表面风格因子 / 感知目标 | Input/Output |
| E-STEER | 表征级可控变量 | Hidden States |

## 实验维度

### 1. 客观推理 (Objective Reasoning)
- 情绪信号对问答、推理任务的影响
- 非单调关系：部分情绪增强推理，部分干扰推理

### 2. 主观生成 (Subjective Generation)
- 情绪对开放域文本生成风格的影响

### 3. 安全性 (Safety)
- 特定情绪可提升模型安全性
- 对抗性prompt下的鲁棒性测试

### 4. 多步 Agent 行为 (Multi-step Agent Behaviors)
- 情绪干预对 Agent 规划、工具调用、决策序列的系统性影响

## 关键发现

### 情绪-行为非单调关系
符合心理学理论（如 Yerkes-Dodson 定律）：中等强度情绪促进表现，过高/过低均有害

### 安全增强
- 恐惧情绪干预 → 提高对恶意prompt的识别率
- 悲伤情绪干预 → 降低 hallucination 率

### Agent 行为系统性塑造
- 不同情绪信号导致不同的工具选择顺序和决策路径
- 积极情绪 → 更冒险的策略
- 消极情绪 → 更保守的策略

## 局限性
- 仅验证于特定 LLM 架构（未指明具体模型）
- 表征干预的可扩展性待验证
- 心理学理论的直接类比是否成立仍有争议

## 建议
- **是否推荐阅读**：✅ 是
- **适用场景**：AI Agent 设计、对齐研究、可解释 AI
- **关键词**：情绪 steering、表征干预、LLM Agent、安全性

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-03
