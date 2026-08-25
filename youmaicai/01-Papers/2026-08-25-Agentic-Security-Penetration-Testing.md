# Agentic Security: A Systematization of Tools, Failure Modes, and Design Laws for LLM-Driven Penetration Testing

## 元信息
| 标题 | Agentic Security: A Systematization of Tools, Failure Modes, and Design Laws for LLM-Driven Penetration Testing |
|------|------|
| 作者 | Mehedi Hasan Nipu |
| 链接 | [原文](https://arxiv.org/abs/2608.21423) |
| arXiv | arXiv:2608.21423v1 |
| 领域 | cs.CL, cs.AI, cs.CR, cs.MA |

## 核心贡献
1. **Integration Friction Index**: 四维指标分离一次性工程成本与组织、法律、维护成本
2. **Long-Lived Session 问题**: 长生命周期会话随阶段数丢失驻留证据；短命子代理按原始证据与摘要压缩比扩展可用范围
3. **Two-Stage Verdict Cascade**: 倍增 scorer 似然比，但 scorer 误差相关时收益有限
4. **Planner-vs-Worker 路由**: 建模为背包问题，导出重尾工具的闭式执行上限 η* = αv/c
5. **Scope/Budget 强制**: 论证不能委托给 system prompts——prompts 不约束实际执行
6. **Inspectra**: 实现平台，标记 shipped/partial/planned

## 关键设计定律
- 长会话证据衰减：按阶段数丢失
- 子代理压缩比决定可用范围
- 工具误差相关时 verdict cascade 无效

## 局限性
- 聚焦渗透测试场景，泛化性待验证
- 系统化框架而非具体算法

## 标签
#Agentic-AI #Security #LLM-Agent #Red-Teaming #Systematization
