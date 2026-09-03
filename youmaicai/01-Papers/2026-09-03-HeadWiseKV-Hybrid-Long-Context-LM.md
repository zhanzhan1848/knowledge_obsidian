# HeadWiseKV: Budgeted Per-Head Cache Residency for Hybrid Long-Context Language Models

## 元信息
| 标题 | HeadWiseKV: Budgeted Per-Head Cache Residency for Hybrid Long-Context Language Models |
|------|------|
| 作者 | Renjie Xie et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.02029) |
| arXiv | arXiv:2609.02029 |

## 核心贡献
1. 长上下文推理中 KV-cache 消耗大量 GPU 内存，hybrid 语言模型的 residual global-attention 层主导了上下文相关的缓存需求
2. 提出 **HeadWiseKV**：训练-free 框架，为 hybrid LM 的 residual global KV cache 分配多级历史窗口，压缩缓存同时保留 native local/recurrent/linear paths
3. 将分配问题形式化为受限 operational rate-distortion 问题，提出 **SeqCalib** 算法

## 模型架构 / 方法
- **Per-head multilevel history window**：每物理 KV head 分配静态多级历史窗口
- **SeqCalib**：按执行顺序处理层，每步决策条件于部署时使用的低层策略
- **Grouped-cache runtime**：将策略实现为实际 per-head KV residency 而非对完整缓存的 mask
- 支持 hybrid long-context models（local + recurrent + linear attention）

## 实验结果
- 在 4 个 hybrid long-context 模型上保持 near-Full-KV RULER 和 LoCoMo 质量
- 112K 上下文长度下 sampled peak device memory 减少 8.59%
- 最大验证成功上下文从 114K 扩展到 161K

## 局限性
- 仅压缩 residual global attention，未处理其他 attention 类型的 cache
- Triton GEMV microbenchmark 显示 4.6x 慢于 FP16 cuBLAS

## 关键词
#long-context #KV-cache #hybrid-attention #efficiency #inference-optimization
