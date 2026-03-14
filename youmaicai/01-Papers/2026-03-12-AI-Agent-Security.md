# Security Considerations for Artificial Intelligence Agents

## 元信息
| 标题 | Security Considerations for Artificial Intelligence Agents |
|------|------|
| 作者 | Perplexity AI Research Team |
| 链接 | [原文](https://arxiv.org/abs/2603.12230) |
| arXiv | arXiv:2603.12230 |
| 发表日期 | 2026-03-12 |
| 来源 | Perplexity Response to NIST/CAISI Request for Information 2025-0035 |
| 类别 | cs.LG, cs.AI, cs.CR |

## 核心贡献
1. **攻击面映射**: 全面映射 AI Agent 在工具、连接器、托管边界和多 Agent 协调中的攻击面
2. **新型失效模式**: 识别 AI Agent 架构带来的新型机密性、完整性和可用性失效模式
3. **分层防御**: 评估当前防御作为分层栈：输入级、模型级、沙盒执行和确定性策略执行

## 关键安全挑战

### 核心假设变化
Agent 架构改变了以下核心假设：
- 代码-数据分离
- 权限边界
- 执行可预测性

### 主要攻击向量
1. **Indirect Prompt Injection**: 间接提示注入
2. **Confused-Deputy Behavior**: 混淆代理行为
3. **Cascading Failures**: 长时间运行工作流中的级联故障

## 防御层

| 层级 | 措施 |
|------|------|
| 输入级 | 输入过滤和验证 |
| 模型级 | 模型内置安全机制 |
| 沙盒执行 | 隔离执行环境 |
| 策略执行 | 高后果操作的确定性策略 |

## 研究空白
1. **自适应安全基准**: 需要动态评估 Agent 安全性
2. **委派与权限控制策略模型**: 需要更好的权限管理框架
3. **安全多 Agent 系统设计指南**: 与 NIST 风险管理原则对齐

## 实践经验
基于 Perplexity 在受控和开放世界环境中运营通用 Agent 系统的经验：
- 服务数百万用户
- 服务数千家企业

## 建议
- 采用分层安全方法
- 实施确定性策略执行用于高后果操作
- 建立委派和权限控制的标准

## 标签
#AI-safety #agent-security #NIST #prompt-injection #multi-agent

## 相关论文
- [[AI 安全]]
- [[提示注入]]
- [[多 Agent 系统]]
- [[沙盒执行]]
