# Routing Is Least Learnable Where It Is Most Valuable

## 元信息
| 标题 | Routing Is Least Learnable Where It Is Most Valuable: Bounds on Representation Routing for Web Agents |
|------|-------|
| 作者 | (Multiple authors) |
| 链接 | [原文](https://arxiv.org/abs/2608.06171) |
| arXiv | arXiv:2608.06171 |
| 领域 | cs.CL |
| 发表 | REALM Workshop, EMNLP 2026 |

## 核心贡献
1. 系统评估 Web Agent 的六种观察模式（text/pixel/both）在 8 个 site-model 组合上的表现
2. 测试五种路由策略（包括 oracle）：均无法稳定超越固定单一模式
3. 核心阻塞发现：**路由监督在 agent 成功率下产生**——agent 越弱，可用于路由的标签越少，而恰恰是最需要路由的地方

## 方法
- 在 VisualWebArena 和 WebArena 上评估
- 测试的路由策略：per-task 模式选择、置信度 cascade、零成本规则、pooled cost tiers
- 测量 rerun 噪声（同一模式重跑改变 12-14% 结果）

## 关键发现
- Oracle 路由收益被 rerun 噪声夸大：重跑同模式的收益 ≈ 添加新模式收益
- 唯一有效策略：仅将「所有模式都无法解决」的任务路由到便宜模式，节省 9.5-30.6% 成本且不降成功率
- 标签供应与路由机会正相关（0.95），更强 agent 可扭转局面

## 关键洞察
路由的本质障碍是「弱 agent 标签少但最需要路由」，解决路径是提升 agent 本身能力
