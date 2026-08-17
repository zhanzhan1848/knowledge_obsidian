# From BERT to Frontier Agents: Eight Years of Language-Model Progress

## 元信息
| 属性 | 值 |
|------|-----|
| **标题** | From BERT to Frontier Agents: Eight Years of Language-Model Progress, the Collapse of the Capability-Cost Curve, and the Rise of Task-Targeted Models |
| **作者** | Pranav Kumar Kaliaperumal |
| **链接** | [arXiv](https://arxiv.org/abs/2608.13675) |
| **arXiv** | arXiv:2608.13675 |
| **类别** | cs.LG, cs.AI |

## 核心贡献
1. **系统性回顾**：2018年10月 至 2026年7月 约八年 AI 模型演进
2. **能力曲线**：追踪 LLM 解决真实编码问题的能力提升
3. **成本曲线**：分析推理成本下降趋势
4. **模式识别**：发现 Task-Targeted Models 的兴起

## 关键数据点

### 能力提升
> 自2024年底以来，解决真实编码问题的能力每年提升近 **6 倍**

### 成本下降
| 模型 | 能力 | 成本 |
|------|------|------|
| GPT 5.6 Luna (budget) | 匹配旗舰 | **$1-6 / 百万 tokens** |
| 旧版本旗舰 | 旧能力 | 更高价格 |

**结论**：能力-成本曲线崩塌（collapse），更便宜的模型现在匹配顶级能力

### 专业化分工 (2026年现状)
| 模型 | 专长领域 |
|------|---------|
| **Claude Opus 5** | 前端编码 |
| **Claude Fable 5** | 仓库级代码 |
| **GPT 5.6 Sol** | 终端任务 |

### 数学能力测试 (Qwen 2.5)
| 方法 | 成绩 |
|------|------|
| 基础方法 | 58/100 |
| 高级采样 | 79/100 |
| Confidence ranking (top-50 正确 47) | 94% precision@50 |

## 八年演进里程碑

### 2018-2019: BERT 时代
- 简单分类任务
- 小的微调模型

### 2020-2022: GPT-3 与缩放定律
- In-context learning
- 缩放成为主旋律

### 2023: Instruction Tuning + RLHF
- ChatGPT
- 模型开始遵循指令

### 2024: Agent 雏形
- 工具使用
- 多步骤推理

### 2025-2026: 专业化分工
- Task-Targeted Models 兴起
- 单一模型不再全能

## 核心洞察

### 1. 能力-成本曲线崩塌
> 传统观点：更强的模型需要更多计算，成本更高
> 现在：廉价模型可以达到顶级性能

**原因**：
- 训练效率提升
- 蒸馏技术成熟
- 推理优化（quantization、speculative decoding）

### 2. Task-Targeted Models 崛起
> 不再追求"通用超级模型"，而是针对特定任务优化的专业模型

**优势**：
- 更低成本
- 更高特定任务性能
- 更好的 latency/throughput

### 3. 编码能力飞速提升
- 每年 6 倍的提升速度
- 真实世界任务（如 resolve coding issues）不再是 LLM 的短板

## 趋势预测

### 未来方向
1. **更细粒度的专业化**：不仅仅是领域级别，而是任务甚至输入类型级别
2. **成本持续下降**：$1-6/M tokens 将成为常态
3. **混合 Agent 系统**：多个专业化模型协作

### 值得关注的挑战
- 如何选择正确的 specialized model
- 跨模型一致性问题
- 长尾任务的覆盖

## 建议
- **是否推荐阅读**: 是（行业洞察类）
- **适用场景**: 产品规划、技术选型、投资决策
- **特别适合**: 理解当前 LLM 市场格局和演进方向

---

*笔记整理: 2026-08-17*
