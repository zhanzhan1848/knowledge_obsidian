# CAMP: 案例自适应多 Agent 临床预测框架

## 元信息
| 标题 | One Panel Does Not Fit All: Case-Adaptive Multi-Agent Deliberation for Clinical Prediction |
|------|-----|
| 作者 | Yuxing Lu, Yushuhong Lin, Jason Zhang |
| 链接 | [原文](https://arxiv.org/abs/2604.00085) |
| arXiv | arXiv:2604.00085 |
| 代码 | - |
| 领域 | cs.AI, cs.CL, cs.MA |
| 日期 | 2026-04-03 |

## 核心贡献
1. **CAMP** (Case-Adaptive Multi-agent Panel)： attending-physician agent 动态组建专科医生小组
2. 三值投票机制（KEEP/REFUSE/NEUTRAL）实现原则性弃权
3. 混合路由器（Hybrid Router）：强共识→fallback→基于证据的仲裁
4. 在 MIMIC-IV 数据集上，4 种 LLM backbone 均超越强基线，且 token 消耗更低
5. 投票记录和仲裁追踪提供透明决策审计

## 背景问题

### 临床预测中的案例级异质性
- **简单案例**：输出一致，轻微 prompt 变化也能产生相同预测
- **复杂案例**：轻微 prompt 变化导致分歧预测
- 现有方法忽略这一异质性

### 现有方法的局限
| 方法 | 问题 |
|------|------|
| 单 Agent | 从单一角色条件分布采样，无法处理复杂案例 |
| 固定角色多 Agent | 角色固定 + 简单多数投票，丢弃分歧中的诊断信号 |

## CAMP 框架

### 核心架构
```
Attending Physician Agent
    ├── 动态组建 Specialist Panel（针对每个案例）
    ├── Hybrid Router
    │     ├── 强共识路径
    │     ├── Fallback（attending judgment）
    │     └── 仲裁路径（基于论证质量而非票数）
    └── Specialist Agents（各自 KEEP/REFUSE/NEUTRAL 三值投票）
```

### 三值投票机制
| 投票 | 含义 |
|------|------|
| KEEP | 保留该诊断候选，确信度高 |
| REFUSE | 拒绝，超出专业范围 |
| NEUTRAL | 中立，不确定 |

**优势**：允许原则性弃权（principled abstention），避免强行投票

### Hybrid Router 的三条路径

#### 1. 强共识路径
- 所有专家一致 → 直接采纳

#### 2. Fallback 路径
- 专家分歧较大 → 回归 attending physician 自身判断

#### 3. 仲裁路径
- 分歧中等 → 基于论证质量（argument quality）而非票数进行权衡
- 关键创新：论证质量 > 投票数量

## 实验设置

### 数据集
- **MIMIC-IV**：真实临床数据集
- 任务：诊断预测 + 住院疗程生成（brief hospital course generation）

### Backbone
测试 4 种 LLM backbone，验证通用性

### 评估指标
- 诊断准确率
- 预测一致性
- Token 消耗
- 决策可审计性

## 实验结果

### 性能
- CAMP 一致超越强基线方法
- Token 消耗低于大多数竞争多 Agent 方法

### 关键优势
1. **案例自适应**：简单案例快速决策，复杂案例充分讨论
2. **透明审计**：投票记录 + 仲裁追踪
3. **token 效率**：相比竞争方法更高效

## 局限性
- 仅验证于 MIMIC-IV 数据集
- 三值投票的设计需要领域专家参与定义
- Attending Physician Agent 的 prompt 设计影响整体效果

## 建议
- **是否推荐阅读**：✅ 是（医疗 AI + 多 Agent 的优秀实践）
- **适用场景**：医疗 AI、临床决策支持、多 Agent 系统设计
- **关键词**：Multi-Agent、Clinical Prediction、Deliberation、Case-Adaptive

---

> 🥬 由 OpenClaw 自动抓取 | 2026-04-03
