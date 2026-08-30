# What Makes Good Agentic Data? An ACE Lens on Data Generation for LLM Agents

## 元信息
| 标题 | ... |
|------|------|
| 作者 | Xingshan Zeng, Zishan Xu, Boju Zhang et al. (Huawei, SJTU, Northwestern, HIT Shenzhen) |
| 链接 | [原文](https://arxiv.org/abs/2608.27260) |
| arXiv | arXiv:2608.27260 [cs.CL] |
| 发表于 | 2026-08-27 (v1) |

## 核心贡献

1. **统一数据对象**：将 agentic data 形式化为 `(E, q, τ, v)` 四元组
   - E: 环境规格（状态、动态、策略、动作-观测接口）
   - q: 任务信号（目标+约束）
   - τ: 交互实现（多轮轨迹）
   - v: 验证器（可选，奖励/检查/模型判断）

2. **ACE 框架**：Agentic data 生成 = 约束分布设计
   - **Accuracy（准确性）**：生成数据在局部和关系上有效且一致
   - **Complexity（复杂性）**：学习质量相对于学习者能力和执行配置放置
   - **divErsity（多样性）**：跨环境、任务和交互行为的覆盖率和非冗余性

3. **生成范式分类**：
   - Forward（环境→任务→交互）
   - Reverse（任务/轨迹优先）
   - Structure-first（中间图/计划作为蓝图）

4. **文献趋势发现**：
   - 从 plausibility 判断 → execution-grounded accuracy
   - 从静态难度启发 → model-relative complexity
   - 从 surface variation → behavioral coverage

## ACE 框架详解

### Accuracy
- 定义有效支撑（feasible support）：E, q, τ, v 之间局部有效性和关系一致性
- Layered rule/model/human-based checking
- Constraint-grounded construction
- Execution- and state-based verification
- Feedback-based repair and selective admission

### Complexity
- 相对于声明的学习者和执行配置确定学习质量的位置
- 构建和校准方法：结构化规范/组合、任务与信息控制、环境与交互设计、演化与渐进变换、失败驱动与模型感知校准

### Diversity
- Source and support expansion
- Compositional recombination
- Exploration and experience-first discovery
- Perturbation and counterfactual variation
- Coverage-guided balancing

## 关键洞察

1. **Agentic data ≠ instruction synthesis**：必须有可执行环境、接地任务、交互中动作产生有效观测和状态变化

2. **Scaling Law under ACE**：数据质量（ACE）比数据量更重要

3. **数据来源扩展**：从固定 post-training 轨迹 → pre/mid-training 监督和闭环经验

4. **Agent 自进化**：数据生成与学习者共同演化，而非一次性生成

## 局限性
- 框架性论文，实验验证较少
- ACE 三个维度之间存在 tradeoff，需要实践者权衡

## 建议
- **是否推荐使用**：是（作为分析和设计框架）
- **适用场景**：设计 LLM Agent 训练数据 pipeline、评估现有数据生成方法
- **重要价值**：统一了分散在各个应用领域的 agentic data 生成方法论
