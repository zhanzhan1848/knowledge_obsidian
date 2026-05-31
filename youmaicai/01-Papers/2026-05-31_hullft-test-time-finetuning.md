# HullFT: Efficient Test-Time Finetuning of LLMs via Convex Reconstruction and Gradient Caching

## 元信息
| 标题 | Efficient Test-Time Finetuning of LLMs via Convex Reconstruction and Gradient Caching |
| 作者 | Alaa Khamis et al. |
| 发表 | Preprint |
| 链接 | [原文](https://arxiv.org/abs/2605.30337) |
| arXiv | arXiv:2605.30337 |

## 核心贡献
1. **问题**：Test-time finetuning (TTFT) 的两个瓶颈
   - 选择（selection）：快速检索常冗余
   - 微调（finetuning）：多样性感知选择带来每查询 prohibitive cost
2. **提出 HullFT**：几何方法解决双瓶颈
   - **Convex Reconstruction**：将查询嵌入表示为少量训练序列的稀疏凸组合（Frank-Wolfe 优化，无投影）
   - **Geometric Integerization**：将分数凸权重转换为精确整数多重集用于微调
   - **Gradient Reuse**：利用重复示例在重复微调步骤间分摊前向后向计算

## 核心方法

```
Query embedding → Sparse convex combination of training sequences
(Frank-Wolfe optimization, projection-free)

→ Support set: inherently relevant + diverse
→ Integer multiset for finetuning
→ Gradient reuse across repeated examples
```

## 实验结果
- 在质量-效率权衡上优于当前 SOTA TTFT 方法
- 更低的 bits-per-byte，更低的总运行时

## 技术细节

**Frank-Wolfe 优化**
- 高效、无投影（projection-free）
- 产生内在相关且多样的支持集

**Geometric Integerization**
- 分数凸权重 → 精确整数多重集
- 重复示例自然创建重复次数（multiplicities）

**Gradient Reuse**
- 在重复微调步骤间分摊前向后向计算
- 利用整数化的重复次数

## 标签
#test-time-finetuning #efficiency #optimization #LLM