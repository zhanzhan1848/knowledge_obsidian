# BenchGuard: Automated Auditing of LLM Agent Benchmarks

## 元信息
| 标题 | BenchGuard: Who Guards the Benchmarks? Automated Auditing of LLM Agent Benchmarks |
|------|------|
| 作者 | Xinming Tu, Tianze Wang, Yingzhou Lu, Kexin Huang, Yuanhao Qu, Sara Mostafavi |
| 链接 | [原文](https://arxiv.org/abs/2604.24955) |
| arXiv | arXiv:2604.24955 |
| 发表 | cs.CL |

## 核心贡献
1. **BenchGuard**: 首个自动化审计面向任务执行的 LLM Agent Benchmark 的框架
2. **利用 Frontier LLMs 作为系统性审计者**: 不是评估被测模型，而是审计评估基础设施本身
3. **发现 12 个 author-confirmed 问题** 在 ScienceAgentBench 中，包括导致任务无法解决的致命错误
4. **低成本**: 50 个复杂生物信息学任务的完整审计成本低于 15 美元

## 核心问题
Agent benchmark 越来越复杂，许多表面上的 agent 失败实际上是 benchmark 本身的问题：
- 规范破损 (broken specifications)
- 隐含假设 (implicit assumptions)
- 严格评估脚本惩罚有效替代方案

## 方法框架

### BenchGuard 审计协议
1. **结构化 LLM 协议**: 跨验证所有 benchmark artifacts
2. **可选结合 Agent 解决方案或执行轨迹**: 作为额外诊断证据
3. **多轮验证**: 交叉验证确保问题真实存在

### 审计范围
- 任务规范 (Task specifications)
- 输入数据 (Input data)
- 预期答案/解决方案 (Expected answers/solutions)
- 评估脚本 (Evaluation scripts)
- 依赖和环境配置 (Dependencies and environment)

## 实验结果
- **ScienceAgentBench**: 发现 12 个 author-confirmed 问题（包含致命错误）
- **BIXBench Verified-50**: 精确匹配 83.3% 的专家识别问题
- 发现了此前人工审查完全未发现的问题
- **成本**: 50 任务审计 < $15

## 核心洞察
> AI 辅助 benchmark 开发：前沿模型不仅作为评估对象，也作为验证评估基础设施本身的积极参与者。

## 对 LLM Agent 研究的启示
- 评估结果需要带着批判眼光看——可能是 benchmark 问题而非模型问题
- 自动化审计是 benchmark 开发的标准实践
- 跨验证和多轮审查的价值

## 相关标签
#LLM-agent #benchmark #evaluation #auditing #reliability
