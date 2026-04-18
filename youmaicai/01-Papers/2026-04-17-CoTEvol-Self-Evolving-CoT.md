# Self-Evolving Chain-of-Thoughts for Data Synthesis in Mathematical Reasoning (CoTEvol)

## 基本信息
- **arXiv**: [2604.14768](https://arxiv.org/abs/2604.14768) [cs.AI]
- **作者**: Zhuo Wang et al.
- **发表**: 2026-04-16
- **会议**: ACL 2026 Findings

## 核心贡献

### CoTEvol 框架
遗传进化框架，将 CoT 生成建模为基于推理轨迹的种群搜索：

1. **Reflective Global Crossover**：轨迹级全局交叉
2. **Local Mutation (uncertainty-guided)**：步骤级局部变异
3. **Task-aware Fitness Functions**：轻量级任务感知适应度函数

## 关键创新

### 演化机制
- **全局交叉**：在轨迹级别重组推理路径
- **局部变异**：基于不确定性的细粒度步骤细化
- **适应度引导**：向准确且多样的推理方向发展

### 与现有方法对比
| 方法 | 优势 | 劣势 |
|------|------|------|
| 蒸馏 from 强 LLM | 质量高 | 成本高、 diminishing returns |
| Self-synthesis (test-time search) | 无需外部模型 | 计算开销大 |
| CoTEvol (本文) | 高效 + 高质量 | 需要设计适应度函数 |

## 实验结果

- **正确 CoT 合成成功率**：提升 30%+
- **结构多样性**：显著增强
- **8 个数学基准平均提升**：6.6%
- **效率**：明显优于蒸馏和自合成方法

## 方法论亮点

### 适应度函数设计
轻量级任务感知：
- 准确性导向
- 多样性保持

### 演化过程
```
轨迹种群 → 全局交叉 → 局部变异 → 选择 → 新种群
     ↑__________________________________|
```

## 局限性
- 依赖任务特定适应度函数设计
- 在非数学领域的效果待验证

## 建议
- **推荐程度**：⭐⭐⭐⭐⭐
- **适用场景**：数学推理数据合成、CoT 训练数据增强
- **创新点**：首个将遗传进化用于 CoT 合成

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | CoT 与数学推理*
