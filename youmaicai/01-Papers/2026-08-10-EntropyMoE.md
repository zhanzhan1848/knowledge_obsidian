# EntropyMoE: Entropy-Aware Sparse Expert Routing for Tokenizer-Free LLMs

## 元信息
| 标题 | EntropyMoE: Entropy-Aware Sparse Expert Routing for Tokenizer-Free LLMs |
|------|------|
| 作者 | Bo Liu, Muxuab Yu, Yu Zhang, Pengfei Gao, Yongping Zhang |
| 链接 | [原文](https://arxiv.org/abs/2608.06398) |
| arXiv | arXiv:2608.06398v1 |
| 领域 | cs.AI |
| 发表 | 2026-07-31 |

## 核心贡献
1. **EntropyMoE**：首个为动态 byte patch 设计的使用 patch entropy 作为路由信号的 MoE 架构
2. **核心洞察**：patch entropy（patch 语义复杂度）可作为有效的路由坐标，驱动稀疏条件计算
3. **扩展 MoE 边界**：将 MoE 建模从 tokenizer-based 表示扩展到 tokenizer-free 表示

## 模型架构

### 问题背景
现有 byte-level LLM 将 bytes 分组成动态大小的 patches，但仍然对所有 patch 应用**相同密集的前馈计算**，无法适应 patch 语义和粒度差异。

### 核心设计
- **Top-K Expert Layers**：将全局 patch Transformer 中的密集 FFN 替换为 Top-K 专家层
- **Dynamic Patch as Routing Unit**：每个动态 patch 作为专家路由的基本单元
- **Byte Coverage → Workload Accounting**：patch 的 byte 覆盖范围决定其对工作量的贡献
- **Patch Entropy + Length**：联合作为专家专业化的特征空间调节信号

```
路由信号 = f(patch_entropy, patch_length)
```

### 与传统 MoE 的区别
| 传统 MoE | EntropyMoE |
|----------|------------|
| Token 作为路由单元 | Dynamic Patch 作为路由单元 |
| 固定 token 粒度 | 可变 patch 粒度（由 entropy 驱动）|
| 路由信号：token embedding | 路由信号：patch entropy + length |

## 训练方法
- 无需 tokenizer
- 无需预定义的 patch 边界（动态学习）
- 端到端训练，patch 构建与 MoE 路由联合优化

## 实验结果
- **Bits-per-Byte**：在 matched dense 和 sparse 基线中均达到最低
- **Downstream Accuracy**：保持可比的下游准确率
- **结论**：Patch entropy 是稀疏条件计算的有效路由坐标

## 局限性
- 主要在特定基准上验证，跨任务泛化性待更多评估
- patch entropy 的理论分析尚不完整

## 建议
- **是否推荐**：✅ 是
- **适用场景**：Tokenizer-free LLM、边缘设备部署、byte-level 视频/音频生成
- **相关方向**：Token-free LLM、MoE、Efficient Inference、Byte-level Models

---
> 🥬 论文由 [[EntropyMoE]] 收录 | 2026-08-10
