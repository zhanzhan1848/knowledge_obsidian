# When Agent Governance Helps: GAMPO Framework for Governed Autotelic Multi-Agent Organizations

## 元信息
| 标题 | When Agent Governance Helps |
| 作者 | Michael Ray Johnson, Linda Naimi |
| 链接 | [原文](https://arxiv.org/abs/2609.05531) |
| arXiv | arXiv:2609.05531 |
| 代码 | N/A |
| 发表 | 2026-09-09 |

## 核心贡献
1. 提出 **GAMPO**（Governed Autotelic Multi-Agent Product Organization）框架：从 321 篇文献的定性综合中提炼，整合 agency、agile、platform、governance 理论给出可执行规范
2. 在 CHI-Bench（长时域医疗基准）上跨开源和前沿模型探测 GAMPO 的 prompt-layer 实例化
3. 核心发现：**治理效益受模型 spare capacity 制约**，且 case-grounded specification 优于 uniform procedure

## 核心创新点
GAMPO 填补了自生成目标 AI agent 组织的设计规范空白。关键洞察：治理效益不是普适的——开源容量受限模型无收益（但一句"verify your writes"就能翻倍成功率），前沿模型中 case-grounded 定义（基于案例自身政策和公开标准）将 prior-authorization 提升至 84%（best-of-5 self-consistency）。

## 模型架构 / 方法
- **GAMPO 框架来源**：321 篇文档定性综合（agency + agile + platform + governance 理论）
- **prompt-layer 实例化**：在 CHI-Bench（医疗长时域基准）上测试
- **关键结果 1**（容量门控）：
  - 容量受限开源模型：完整 GAMPO 程序无可靠收益
  - "verify your writes"一句话 → pass@1 从 2/20 增至 **4/20**
  - 前沿模型：同一 scaffold 将 prior-authorization 从 24% 提升至 **40%**
- **关键结果 2**（规范形式）：
  - 通用 procedure → case-grounded definition-of-done（per-task，blind to hidden key）
  - prior-authorization → **84%**（Bo5 self-consistency, 68% single-attempt）
  - utilization-management → **44%**
  - care-management → 受主观内容质量墙限制

## 实验结果
- 前沿模型 prior-authorization: 24% → **84%**（best-of-5）
- 同一模型 net zero（recommendation-override 倾向导致）
- 治理效益 = f(模型 spare capacity)，是模型特定和领域特定的

## 局限性
- 部分实例化，per-cell 样本小（n=5-25），单次试验

## 关键词
#Agent治理 #GAMPO #多Agent #LLM-Agent #医疗AI #CHI-Bench #Agent评估

---

*由 youmaicai cron 任务自动生成于 2026-09-09*
