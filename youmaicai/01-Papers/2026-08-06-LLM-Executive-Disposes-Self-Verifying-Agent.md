# The LLM Proposes, the Executive Disposes

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04066](https://arxiv.org/abs/2608.04066) |
| **类别** | cs.AI |
| **作者** | Mohsen Arjmandi |
| **发表** | 2026-08-04 |
| **页数** | 7 pages |

## 核心贡献
1. 提出 **结构化验证框架**：将 LLM 限制为仅提交 typed proposals，所有 belief 由确定性 Executive 持有
2. **承诺机制 (Commitment Mechanism)**：在行动前预先注册预测，由代码对照观察结果验证
3. **Shadow Reference** 机制：在 ablation 中也定义 drift 指标
4. **承诺漂移 vs 绑定漂移分解**：首次将 long-horizon agent 的两类漂移分离量化

## 模型架构
- Deterministic Executive 持有所有 belief
- LLM 只能提交 typed proposals（不得直接行动）
- Claim admission 需要 prediction pre-registered before acting + code verification
- Shadow reference 编译 ablation cell 中 full system 会提交的计划

## 关键发现
| 实验条件 | Goal-abandonment | Binding Error |
|----------|-----------------|--------------|
| 有 commitment mechanism | 0.00 | 0.00 |
| 无 commitment mechanism | 1.00 | 0.00 |

- Commitment mechanism 消融使 goal-abandonment 从 0 跳至 1，但 binding error 不变
- Binding channel 的失败被代码层结构性吸收
- 在 ARC-AGI-3 上任务效果完全无效（52 gated runs 零 level completions）
- 4 of 8 architecture runs 被 invalidation 机制识别出真实缺陷

## 意义
- 提供了 **long-horizon agent 验证方法论** 的基础框架
- 揭示了 commitment mechanism 对 agent goal maintenance 的关键性
- 预注册验证思路可迁移至其他 agent 开发场景

## 局限性
- 当前任务（ARC-AGI-3）对所有配置均无效
- 框架本身较为复杂，实际部署成本高

## URL
- 论文: https://arxiv.org/abs/2608.04066
- PDF: https://arxiv.org/pdf/2608.04066

---
*🥬 油麦菜 — 2026-08-06*
