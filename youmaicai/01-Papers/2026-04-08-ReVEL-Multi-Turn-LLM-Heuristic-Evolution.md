# ReVEL: Multi-Turn Reflective LLM-Guided Heuristic Evolution

## 元信息

| 标题 | ReVEL: Multi-Turn Reflective LLM-Guided Heuristic Evolution via Structured Performance Feedback |
|------|------|
| 作者 | Cuong Van Duc, Minh Nguyen Dinh Tuan, Tam Vu Duc, Tung Vu Duy, Son Nguyen Van, Hanh Nguyen Thi, Binh Huynh Thi Thanh |
| 链接 | [原文](https://arxiv.org/abs/2604.04940) |
| arXiv | arXiv:2604.04940 |
| 领域 | cs.AI |
| 发表 | 2026-04-08 |

## 核心贡献

1. **ReVEL 框架**：将 LLM 作为交互式多轮推理器嵌入进化算法（EA），解决 NP-hard 组合优化问题的启发式设计
2. **性能画像分组（Performance-Profile Grouping）**：将候选启发式聚类为行为一致组，向 LLM 提供紧凑、信息丰富的反馈
3. **多轮反馈驱动反思**：LLM 分析组级行为，生成针对性启发式改进
4. **EA 元控制器**：自适应平衡探索与利用，选择性整合 LLM 生成的改进

## 问题背景

- NP-hard 组合优化问题的启发式设计：专业性强、耗时
- 现有 LLM 应用主要依赖 one-shot 代码合成 → 启发式脆弱，未充分利用迭代推理能力

## 核心机制

### 1. Performance-Profile Grouping
- 聚类候选启发式为行为一致组
- 提供紧凑、信息丰富的反馈给 LLM
- 避免过载的原始性能数据

### 2. Multi-Turn Feedback-Driven Reflection
```
LLM 分析组级行为 → 生成启发式改进 → EA 验证 → 整合或拒绝
```
- 多轮交互式推理
- 针对性细化而非随机变异

### 3. EA Meta-Controller
- 自适应平衡探索（exploration）与利用（exploitation）
- 选择性整合 LLM 生成的启发式改进

## 实验结果

- 标准组合优化基准测试
- 启发式更 robust、更多样
- 相比强基线有统计显著提升

## 关键洞察

> 迭代推理 + 结构化反馈 = 更强的自动启发式设计能力。LLM 的多轮推理能力（而非 one-shot 生成）是关键。

## 局限性

- 依赖 LLM 的代码生成和推理能力
- EA 参数（种群大小、变异率等）需调优
- 在不同类型优化问题上的泛化性待验证

## 关键词

#LLM #evolutionary-algorithm #heuristic #combinatorial-optimization #multi-turn-reasoning #NP-hard

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
