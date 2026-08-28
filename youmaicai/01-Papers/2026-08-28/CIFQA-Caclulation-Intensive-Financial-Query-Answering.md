# CIFQA: Calculation-Intensive Financial Query Answering

## 元信息
| 标题 | CIFQA: A Deterministic Tool-Grounded Multi-Agent LLM Framework for Financial Query Answering |
|------|------|
| 作者 | Kunjesh Parekh, Anil Kumar Tiwari, Divya Saxena |
| 链接 | [原文](https://arxiv.org/abs/2608.26114) |
| arXiv | arXiv:2608.26114v1 |
| 领域 | cs.AI, cs.CL, q-fin.CP |
| 发表 | 2026-06-05 |

## 核心贡献
1. **CIFQA 框架**：确定性工具增强的多 Agent LLM 框架，将语言理解与数值执行分离
2. **专业化 Agent 分工**：查询解释、路由、参数提取、计算规划、响应生成
3. **17B 模型超越大模型**：架构设计比模型规模更重要，17B 开源模型超越更大规模的 frontier 模型
4. **95.54% 计算准确率**：在计算密集型查询上达到 95.54% 准确率

## 核心创新点
- **问题**：LLM 在多步财务计算中产生看似合理但数值错误的答案
- **方案**：确定性 Python 工具执行财务计算和规则应用，LLM 专注语言理解
- **关键组件**：
  - 精确利率查找 (exact rate lookup)
  - 期限计算 (tenure computation)
  - 滚动年调整 (rolling-year adjustment)
  - 提前支取逻辑 (premature-withdrawal logic)

## 模型架构
- 多 Agent 协作框架
- Agent 类型：
  - Query Interpreter：查询解释
  - Router：路由
  - Parameter Extractor：参数提取
  - Computation Planner：计算规划
  - Response Generator：响应生成

## 实验结果
| 指标 | 结果 |
|------|------|
| 计算密集型查询准确率 | 95.54% |
| 总体准确率 | 90.87% |
| 超越 | 直接 LLM baseline（提供完整公式、费率表和基准指令） |

## 局限性
- 目前仅针对定期存款查询进行了实例化
- 需要扩展到其他金融计算场景

## 建议
- **是否推荐使用**：是
- **适用场景**：金融问答系统、计算密集型推理任务
- **相关方向**：Tool-Augmented LLM、Multi-Agent Systems

---
*来源：arXiv cs.AI/cs.CL 2026-08-28 日报*
