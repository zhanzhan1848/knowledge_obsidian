# AutoFyn: Non-Parametric Expert Iteration for Long-Horizon Agents

## 元信息
| 标题 | AutoFyn Technical Report: Non-Parametric Expert Iteration for Long-Horizon Agents |
| 作者 | Adib Hasan et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.05446) |
| arXiv | arXiv:2609.05446 |
| 代码 | N/A |
| 发表 | 2026-09-09 (announce), originally Jul 2026 |

## 核心贡献
1. 提出 **AutoFyn**：受 Expert Iteration 启发，但**冻结模型权重**、通过持久化状态（persistent state）而非梯度更新来适应模型的 agent 框架
2. 每轮从全新模型 session 开始，通过 orchestrator + verifier 循环探索，用客观奖励信号更新持久化状态
3. 在 3 领域验证：IMO数学（6题全解）、Spider 2.0 dbt（top-ranked）、网络安全（16个CVE漏洞发现）

## 核心创新点
AutoFyn 核心洞察：不需要更新模型权重，而是通过持久化记忆文件、报告、仓库状态来注入有用信息，让冻结的基础模型通过多轮"专家迭代"解决长时域任务，兼具简单性和强大效果。

## 模型架构 / 方法
- **AutoFyn 循环**：
  1. 每轮从**全新模型 session** 开始
  2. Orchestrator（编排器）探索、规划、用 specialized agents 构建多种方案
  3. Task-grounded verifier 验证工作并提供客观奖励信号
  4. 奖励信号蒸馏回**持久化状态**（persistent state），更新有效策略
- **持久化状态接口**：memory files, reports, repository state
- **3 验证领域**：Olympiad 数学 / 数据科学 / 网络安全

## 实验结果
- **IMO 2026**（6题）：所有有提升空间的模型在 AutoFyn 下得分均高于其提供商自身 coding agent
- **Spider 2.0 dbt**：构建了 top-ranked agent
- **网络安全**：发现 **16 个** maintainer-confirmed CVEs（Next.js, MetaMask, pnpm, Warp, LiteLLM, Langflow, Open WebUI）

## 局限性
- 技术报告形式，详细消融实验待补充
- 计算成本高（多轮探索）

## 关键词
#LLM-Agent #Expert-Iteration #长时域任务 #AutoFyn #网络安全 #数学推理 #Agent框架

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
