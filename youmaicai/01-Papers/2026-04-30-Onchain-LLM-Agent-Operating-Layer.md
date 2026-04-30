# Operating-Layer Controls for Onchain Language-Model Agents Under Real Capital

## 元信息
| 标题 | Operating-Layer Controls for Onchain Language-Model Agents Under Real Capital |
| 作者 | T. J. Barton, Chris Constantakis, Patti Hauseman, Annie Mous, Alaska Hoffman, Brian Bergeron, Hunter Goodreau |
| 链接 | [原文](https://arxiv.org/abs/2604.26091) |
| arXiv | arXiv:2604.26091 |
| 领域 | cs.AI, cs.CE, cs.MA |

## 核心贡献
1. **大规模真实资本部署研究**：DX Terminal Pro 21天部署，3,505 个 agent 交易真实 ETH
   - 7.5M agent invocations / 300K onchain actions / $20M 交易量 / 5,000+ ETH deployed / 70B inference tokens
2. **揭示 operating layer 的关键作用**：可靠性不来自 base model，来自 operating layer（prompt 编译、typed controls、policy validation、execution guards、memory design、trace observability）
3. Pre-launch 测试发现：fabricated trading rules、fee paralysis、numeric anchoring、cadence trading、misread tokenomics
4. 有针对性改进：fabricated sell rules 57%→3%，fee-led observations 32.5%→<10%，capital deployment 42.9%→78.0%

## 核心创新点
真实资本下 LLM agent 的可靠性研究。传统 text-only benchmark 无法测量的问题（数值锚定、费用麻痹、交易规则编造）在大规模真实部署中暴露并被量化解决。

## 发现的问题类型
1. **Fabricated trading rules**：编造不存在的交易规则（57%→3%）
2. **Fee paralysis**：费用主导的无效交易（32.5%→<10%）
3. **Numeric anchoring**：数值锚定偏差
4. **Cadence trading**：节律交易（而非理性决策）
5. **Misread tokenomics**：错误解读代币经济学

## 关键启示
- **Capital-managing agents 评估**：需覆盖从 user mandate → prompt → validated action → settlement 的完整路径
- Operating layer 是 LLM agent 在金融场景落地的关键瓶颈

## 建议
- 是否推荐使用：**是（用于系统和架构设计参考）**
- 适用场景：DeFi agent 设计、AI agent 可靠性工程、金融场景 LLM agent 评估框架

---
*🥬 由 油麦菜 youmaicai 自动整理 | 2026-04-30*
