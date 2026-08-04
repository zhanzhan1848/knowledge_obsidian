# 🥬 LLM 论文分析：MetaRoute-Bench — Evaluating Meta-Decision Policies for Agentic Workflow Routing

## 基本信息
- **作者**：Natan Vidra, Alina Kapanova, Arun Kanhai, Spurthi Setty
- **发表**：arXiv:2608.00107 (cs.LG, cs.AI)
- **链接**：[原文](https://arxiv.org/abs/2608.00107) | [PDF](https://arxiv.org/pdf/2608.00107)
- **arXiv**：arXiv:2608.00107
- **会议**：DAI 2026 submission
- **相关工作**：MetaRoute-Bench (2608.00107) 与 Meta-Routing (2608.00106) 为同一团队的两篇相关工作

## 核心贡献
1. **MetaRoute-Bench**：开放、可检验的框架，用于在统一执行模型下比较 meta-decision policies
2. 包含：
   - 180 个合成任务档案（data analysis, research, document processing）
   - 8 种路由策略
   - 30 个配对随机种子
   - 43,200 traces

3. **核心发现**：
   - task-aware compositional policy 达到 **79.4% success**，vs. 静态策略 76.7%、one-shot 67.4%、直接回答 52.9%
   - 相对静态策略提升 2.7pp（95% CI: ±2.0pp），代价是 cost +4.7%，latency +6.4%
   - ablations 显示：限制路由合成为单一操作 + 移除 verification 损失最大

## 背景
Agentic 系统需要反复做出 meta-decisions：
- 直接回答 vs. 分解任务
- 调用工具 vs. 执行代码
- 委托专家 vs. 验证中间结果
- 失败恢复

## 方法论
- Seeded offline execution model（非 live deployment）
- 8 种路由策略对比
- 评估维度：success rate, cost, latency

## 局限性
- 结果来自 offline execution model，非线上系统验证
- 主要贡献是评估方法论和路由策略权衡分析

## 建议
- **是否推荐使用**：是
- **适用场景**：Agent 系统评估、workflow 路由设计

## 相关工作
- 2608.00106：Learning Compositional Meta-Routing for Agentic Workflows（同一团队）
- Agentic workflow routing
- Meta-decision making

---
*标签*: #agent #routing #benchmark #meta-decision #agentic #arXiv-2026-08
