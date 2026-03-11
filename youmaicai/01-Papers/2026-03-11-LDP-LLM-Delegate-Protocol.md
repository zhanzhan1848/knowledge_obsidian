# LDP: An Identity-Aware Protocol for Multi-Agent LLM Systems

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | LDP: An Identity-Aware Protocol for Multi-Agent LLM Systems |
| 作者 | Sunil Prakash |
| 链接 | [原文](https://arxiv.org/abs/2603.08852) |
| arXiv | arXiv:2603.08852 |
| 类别 | cs.AI, cs.MA, cs.SE |
| 发表时间 | 2026-03-09 |
| 页数 | 16 pages, 9 figures, 8 tables, 4 appendices |

## 核心贡献
1. **LLM Delegate Protocol (LDP)**: AI原生通信协议，暴露模型级属性作为一等原语
2. **五大机制设计**:
   - 丰富的delegate identity cards (质量提示+推理profile)
   - 渐进式payload模式 (协商+回退)
   - 受管会话 (持久上下文)
   - 结构化provenance追踪 (置信度+验证状态)
   - 信任域 (协议级安全边界)

## 协议设计
### 与现有协议对比
- A2A和MCP不暴露模型级属性作为一等原语
- 忽略关键委托属性: 模型身份、推理profile、质量校准、成本特征

### 核心机制
```text
1. Identity Cards: 模型身份+能力描述
2. Progressive Payloads: 语义帧/原始文本协商
3. Governed Sessions: 持久上下文管理
4. Provenance Tracking: 来源追踪+置信度
5. Trust Domains: 安全边界执行
```

## 实验结果
- **延迟优化**: 简单任务延迟降低 ~12x (通过delegate专业化)
- **Token节省**: 语义帧payload减少 37% token (p=0.031)，无质量损失
- **会话开销**: 受管会话消除 39% token开销 (10轮)
- **攻击检测**: 96% vs 6% (vs baseline)
- **故障恢复**: 100% vs 35% 完成率

## 关键发现
- 噪声provenance会降低合成质量，低于无provenance基线
- 置信度元数据若无验证是有害的

## 实现
- JamJet agent runtime插件
- 使用本地Ollama模型评估
- LLM-as-judge评估方法

## 适用场景
- 多Agent LLM系统通信
- 分布式AI任务委托
- 安全敏感的Agent协作

## 相关工作
- [[A2A Protocol]] - Agent-to-Agent协议
- [[MCP]] - Model Context Protocol
- [[Multi-Agent Systems]] - 多智能体系统

---
#Multi-Agent #Protocol #LLM-Communication #LDP
