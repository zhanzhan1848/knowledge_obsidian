# A Single Rewrite Suffices: Empirical Lessons from Production Skill Description Optimization

## 元信息
| 标题 | A Single Rewrite Suffices: Empirical Lessons from Production Skill Description Optimization |
|------|------|
| 作者 | Yangqiaoyu Zhou, Mohammad Alqudah, Kwei-Herng Lai, Aaron Halfaker, Yingqi Xiong, Yaar Harari |
| 链接 | [原文](https://arxiv.org/abs/2606.30775) |
| arXiv | arXiv:2606.30775 [cs.CL] |
| 发表 | 2026-06-29 |

## 核心贡献

1. **定义 Skill Collision 问题**：当两个技能的描述重叠时，路由 LLM 误判查询
2. **自动描述优化 Pipeline**：在生产环境企业聊天 agent（9 skills, 372 regression cases）上达到 79.2% F1
3. **关键发现**：**一次 LLM rewrite 就足够**捕获大部分改进

## 问题背景

Enterprise AI agents 通过自然语言技能描述匹配用户查询来路由：
- 技能数增加 → 描述重叠 → 路由错误增加
- 手动调优描述成本高（每个技能 120 分钟）

## 方法：自动描述优化

### Pipeline 组件

1. LLM rewrite（使用 false-positive/false-negative 案例）
2. 迭代优化（多轮反馈）
3. Dual editing of confused pairs
4. 训练集大小控制

### Ablation 结果

在 production system 和 ToolBench (16k tools) 上：

| Pipeline 组件 | 对 F1 的影响 |
|-------------|-------------|
| **单次 LLM rewrite** | 捕获大部分改进 |
| 迭代预算 | < 0.5% |
| 反馈信号组合 | < 0.5% |
| Dual editing | < 0.5% |
| 训练集大小 | < 0.5% |

## 核心发现

> **"A single LLM rewrite using any available false-positive and false-negative cases captures most of the available improvement"**

### 性能对比

| 方法 | F1 | 每技能工程时间 |
|------|-----|--------------|
| 手动调优 | 79.4% | 120 分钟 |
| 自动优化 | 79.2% | 3.8 分钟 |
| **提升** | -0.20% | **32倍加速** |

### 诊断信号

- **Train-validation F1 gap 大** → 架构问题，而非文本描述问题
- 这个诊断可识别需要架构干预 vs 文本优化的场景

## 建议

- **是否推荐使用**：是
- **适用场景**：企业 AI agent 技能路由、工具选择系统
- **使用建议**：先尝试单次 rewrite，效果不佳时检查 train-valid gap 判断是否需要架构变更

## 标签
#LLM-agent #skill-routing #enterprise-AI #prompt-engineering
