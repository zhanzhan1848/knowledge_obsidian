# Drop the Hierarchy: 多智能体 LLM 自组织协调架构

## 元信息
| 标题 | Drop the Hierarchy and Roles: How Self-Organizing LLM Agents Outperform Designed Structures |
|------|------|
| 作者 | Victoria Dochkina et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.28990) |
| arXiv | arXiv:2603.28990 [cs.AI] |
| 领域 | 多智能体系统 · LLM协调 · 自组织 |

## 核心贡献

### 最大规模实验
- **25,000+ 任务运行**，20,810 个独特配置
- **8 个 LLM**（Claude Sonnet 4.6, GPT-5.4, GPT-4o, GPT-4.1-mini, Gemini-3-flash, GigaChat 2 Max, DeepSeek v3.2, GLM-5）
- **4–256 agents**，8 种协调协议
- **4 种任务复杂度**（L1–L4，从单域到对抗性多利益方）

### 核心发现：Endogeneity Paradox（内生性悖论）
**Hybrid Sequential 协议**（固定顺序 + 自主角色选择）优于：
- 中心化协调：+14%（p<0.001）
- 完全自主协议：+44%（Cohen's d=1.86, p<0.0001）

## 四种协调协议
| 协议 | 类型 | 信息给Agent |
|------|------|-------------|
| **Coordinator** | 中心化（外生） | 分配好的角色和阶段 |
| **Sequential** | 混合型 | 前序完成结果（事实信息） |
| **Broadcast** | 信号基（内生） | 所有Agent的意图 |
| **Shared** | 完全自主（内生） | 历史模式 |

### Sequential 优势来源
每个 Agent 接收的是**已完成的事实结果**（predecessors 实际做了什么），而非意图（可能变化）、历史（可能过时）或单方计划（可能次优）。

## 涌现特性

### 1. 动态角色发明
- 从 8 个 agent 产生 **5,006 个唯一角色**
- RSI（Role Stability Index）→ 0：agent 每次任务重新发明专业化
- 在 N=64 时，91% 角色唯一，54% 仅使用一次

### 2. 自愿退出（Voluntary Self-Abstention）
- Claude 自愿退出率：8.6%
- Sequential 中 38/60 不参与 agent 是**自愿退出**（内生），而非被指令排除

### 3. 自发浅层层级
- 层级深度从 N=4 的 1.0 仅增长到 N=64 的 2.0
- 系统偏好扁平结构

## 能力阈值发现
**自我组织是强模型的权利**，弱模型仍需刚性结构：

| 模型 | 自愿退出率 | 自组织 vs 固定 |
|------|-----------|---------------|
| Claude Sonnet 4.6 | 8.6% | 自组织 +3.5% ✅ |
| GLM-5 | 0.8% | 固定结构 +2.8% ⚠️ |

弱模型需要三种能力：self-reflection（自我评估能力）、deep reasoning（多步推理）、instruction following（精确遵循协调协议）。

## 扩展性
- **N=64→256**：质量无显著下降（Kruskal-Wallis H=1.84, p=0.61）
- 成本仅增加 11.8%（8× agent 增长）
- N=256 时约 45% agent 自愿空闲（内生成本优化）

## 开源 vs 闭源
DeepSeek v3.2 达到 Claude 质量的 **95%**，成本低 **24×**。

## 标签
#多智能体系统 #LLM协调 #自组织 #EmergentBehavior #AI-Agent
