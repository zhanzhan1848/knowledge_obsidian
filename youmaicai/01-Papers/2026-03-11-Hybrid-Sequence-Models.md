# Expressivity-Efficiency Tradeoffs for Hybrid Sequence Models

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Expressivity-Efficiency Tradeoffs for Hybrid Sequence Models |
| 作者 | John Cooper, Ilias Diakonikolas, Mingchen Ma, Frederic Sala |
| 链接 | [原文](https://arxiv.org/abs/2603.08859) |
| arXiv | arXiv:2603.08859 |
| 类别 | cs.LG |
| 发表时间 | 2026-03-09 |

## 核心贡献
1. **理论分析**: 证明非混合模型在核心任务上的基本限制
2. **构造性证明**: 为选择性复制和关联回忆任务构造小型混合模型
3. **实证验证**: 学习的混合模型优于6x参数的非混合模型

## 研究问题
- 混合模型(Transformer + SSM)在什么场景下优于纯模型?
- 底层机制是什么?

## 理论贡献
### 非混合模型限制
对于核心合成任务族:
- 任何Transformer或SSM需要:
  - 大量参数 **或**
  - 大工作记忆

### 混合模型优势
- 小规模 + 小工作记忆
- 可证明解决选择性复制和关联回忆任务
- 两全其美

## 实验结果
- **参数效率**: 学习的混合模型优于6x参数的非混合模型
- **长度泛化**: 混合模型更强
- **OOD鲁棒性**: 混合模型更强

## 关键任务
1. **Selective Copying**: 选择性复制
2. **Associative Recall**: 关联回忆

## 混合架构
```text
Transformer layers: 表达能力强
SSM layers: 计算效率高
组合: 兼得两者优势
```

## 适用场景
- 长序列建模
- 资源约束部署
- 需要长度泛化的任务

## 相关工作
- [[Transformer]] - Transformer架构
- [[State Space Models]] - 状态空间模型 (Mamba等)
- [[Hybrid Architectures]] - 混合架构

---
#Hybrid-Models #Transformer #SSM #Architecture-Design
