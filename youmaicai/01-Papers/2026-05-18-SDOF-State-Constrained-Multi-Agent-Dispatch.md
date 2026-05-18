# SDOF: Taming the Alignment Tax in Multi-Agent Orchestration with State-Constrained Dispatch

## 元信息
| 标题 | SDOF: Taming the Alignment Tax in Multi-Agent Orchestration with State-Constrained Dispatch |
|------|------|
| 作者 | Zhantao Wang |
| 链接 | [原文](https://arxiv.org/abs/2605.15204) |
| arXiv | arXiv:2605.15204 |
| 发表 | cs.AI |

## 核心贡献
1. **问题识别**：多智能体编排框架（LangChain、LangGraph、CrewAI）通过图结构路由任务，但无法强制执行真实业务流程的阶段约束。
2. **SDOF 框架**：将多智能体执行建模为约束状态机，通过两层防御机制解决对齐税问题。
3. **GSPO 对齐的 7B Intent Router**：在 FSM 约束的对抗路由基准上， joint accuracy 达 80.9%，超越零样本 GPT-4o 的 48.9%。

## 模型架构

### 核心组件
SDOF 包含三个组件：

1. **Online-RLHF Specialized Intent Router**
   - 训练方法：Generative Reward Modeling (GRPO)
   - 功能：专门化意图路由

2. **StateAwareDispatcher**
   - GoalStage finite-automaton checks（有限自动机检查）
   - precondition/postcondition SkillRegistry validation（技能注册验证）
   - 目标：可审计的执行控制

### 两层防御机制
- 第一层：在线 RLHF 专用意图路由器
- 第二层：状态感知调度器

## 实验结果

###  Recruitment System (Beisen iTalent, 6000+ enterprises)
- 185 expert-curated scenarios → 1671 live API calls
- **Intent Router joint accuracy**: 80.9% vs GPT-4o 48.9%
- **End-to-end task completion**: 86.5% (CI: 80.8-90.7)
- **Injection 非法 HR subset**: blocks all 22 operations
- **Message-level blocking audit**: precision 100%, recall 88%, kappa=0.94

### SGD-derived Dialogues (960 dialogues, 8 service domains)
- FSM mapping surfaces 201 stage-order conflicts
- 41 arise in normal split

## 关键发现
- 多智能体系统中的阶段约束强制执行至关重要
- 有限状态机（FSM）可有效建模业务工作流约束
- 对抗路由测试揭示了现有框架的安全漏洞

## 局限性
arXiv 版本报告当前已验证范围；后续将发布更多训练比较和工作流评估。

## 标签
#multi-agent #RLHF #orchestration #alignment #state-machine #LangChain