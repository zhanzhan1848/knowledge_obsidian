# G-RRM: 用递归推理模型引导符号求解器

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Guiding Symbolic Solvers with Recurrent Reasoning Models |
| **arXiv** | [2607.02491](https://arxiv.org/abs/2607.02491) |
| **作者** | Timo Bertram et al. |
| **分类** | cs.AI |
| **发表** | 2026-07-02 |

## 核心贡献

1. **SE-RRMs**: 符号等变递归推理模型的实例化，对更大问题规模具有更好的外推能力

2. **G-RRM 方法**: 神经符号方法，将 SE-RRMs 与约束满足问题的符号求解器集成

3. **NEURAL 引导**: SE-RRMs 作为神经求解器生成完整解决方案建议，引导经典符号求解器 (如 backtracking, Glucose 4.1, CaDiCaL 3.0.0)

4. **何时有效**: 研究神经引导何时改善符号求解器的搜索效率

## 方法

### G-RRM
```
SE-RRM (神经求解器) → 生成解决方案建议 → 引导符号求解器
```

### 有效条件
1. 问题实例具有 expansive combinatorial search space
2. 求解器架构必须能够动态覆盖其分支选择以从神经提示不完美时恢复

## 实验结果

### 9×9 Sudoku
- SE-RRM 正确解决 91.1% 实例
- Backtracking 加速 33.3×
- Glucose 4.1 加速 1.70× (p<0.001)

### 25×25 Grid (完美提示)
- Glucose 4.1 保持 1.17× 加速

### CaDiCaL 3.0.0
- 无显著加速 (1.02×)
- 原因: 运行时开销主导，且总是尊重注入的分支提示而非覆盖

## 关键结论

> 当满足条件时，神经引导可转化为实际加速。神经引导何时转化为实际加速是有条件的。

## 建议

- **是否推荐使用**: 是 (特定场景)
- **适用场景**: 约束满足问题、神经符号求解、组合优化
- **相关方向**: Neuro-Symbolic, SAT Solving, Combinatorial Optimization, Recurrent Reasoning Models

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
