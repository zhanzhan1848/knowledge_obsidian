# Merging Methods for Multilingual Knowledge Editing for LLMs

## 元信息
| 标题 | Merging Methods for Multilingual Knowledge Editing for Large Language Models: An Empirical Odyssey |
|------|------|
| 作者 | Kunil Lee, Ki-Young Shin, Jong-Hyeok Lee, Young-Joo Suh |
| 链接 | [原文](https://arxiv.org/abs/2605.13919) |
| arXiv | arXiv:2605.13919 |
| 领域 | cs.CL, cs.LG |

## 核心贡献
1. 首次系统研究多语言知识编辑（MKE）的大规模批量编辑，在12种语言上并行编辑（批量大小=700×12）
2. 评估6种向量合并方法，发现**带共享协方差向量求和**是最可靠的整体策略
3. 发现 TSVM 只能在有限条件下减少干扰，整体上无法弥合 MKE 与单语 KE 之间的差距
4. 发现最优权重缩放因子可超过默认值1.0，且较低秩压缩比往往效果更好

## 问题背景
- **跨语言KE**：编辑时不可用的语言进行评估
- **多语言KE（MKE）**：多语言同时进行编辑和评估，语言特定编辑相互干扰
- 现有方法（如ROME、MEMIT）在单语设置下效果好，但多语言环境下性能下降

## 方法
### 向量合并方法
六种合并变体：
1. 向量求和（无共享协方差）
2. 向量求和（带共享协方差）← 最佳
3. 向量平均
4. Task Vector averaging
5. TIES-Merging
6. TSVM (Task Singular Vectors for Merging)

### 核心公式
基于 Transformer FFN 的线性关联记忆（LAM）：
```
m^l = W_out^l σ(W_in^l γ(h^{l-1} + a^l))
```
知识编辑通过对权重矩阵进行闭式扰动 Δ 来修改知识。

### 关键发现
- **带共享协方差求和**最优，简单无协方差求和表现最差
- TSVM 可在某些设置下改善，但减少多语言干扰的能力有限
- 权重缩放因子敏感，较大值（超过默认值1.0）通常更好
- 低秩压缩比通常产生更好结果

## 实验
- 基准：MzsRE（12语言）
- 骨干：2个主流LLM
- 基础KE方法：ROME、MEMIT
- 批量编辑设置：700×12编辑请求

## 局限性
- 当前合并方法无法有效弥合MKE与单语KE的性能差距
- TSVM 的多语言干扰缓解能力有限

## 建议
- 适用场景：多语言知识编辑、模型权重合并
- 推荐策略：使用带共享协方差的向量求和方法