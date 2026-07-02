# Using AI Agents to Automate Black-Box Audits of Personalization Algorithms at Scale

## 元信息
| 标题 | Using AI Agents to Automate Black-Box Audits of Personalization Algorithms at Scale |
|------|------|
| 作者 | Alessandro Morosini, Sarah H. Cen, Andrew Ilyas, Hedi Driss, Aleksander Mrodrigue, Chara Podimata |
| 链接 | [原文](https://arxiv.org/abs/2606.30801) |
| arXiv | arXiv:2606.30801 [cs.CL] |
| 发表 | 2026-06-29 |

## 核心贡献

1. **GenAI 代理作为行为引擎**：用于黑盒个性化算法审计的合成账户行为生成
2. **反事实审计能力**：固定 persona 行为，实验操纵平台可见信号（年龄、性别、地区）
3. **大规模部署**：1,120 个代理，14 个 persona，3 个反事实条件，200,000+ 内容曝光

## 核心问题

个性化算法审计的挑战：
- **Real user studies**：成本高、难控制
- **Sock-puppet audits**：依赖脚本行为，真实性有限
- **两者都难以分离用户属性和用户行为**

## 方法

### GenAI Agent 框架

每个代理：
1. **固定 persona**：基于人口统计学和政治调查数据
2. **Reasoning-based 交互**：对内容进行推理并选择行动
3. **Counterfactual auditing**：操纵平台可见信号进行反事实分析

### 实验设计

- **平台**：X (Twitter)
- **时机**：2024 美国大选后
- **规模**：1,120 agents, 14 personas, 3 counterfactual conditions

## 关键发现

1. X 的算法 feed 放大了 toxic、polarizing、political 和右倾内容
2. 放大程度随用户 ideology 显著变化
3. **Demographic signals 对内容分发的影响是 persona-dependent**：
   - Pooled effects 大多为空
   - Subgroup-level effects 在方向和幅度上都有差异

## 建议

- **是否推荐使用**：是
- **适用场景**：算法审计、平台责任研究、推荐系统分析
- **使用建议**：可扩展到其他平台和场景

## 标签
#AI-agent #algorithmic-audit #personalization #social-media #counterfactual
