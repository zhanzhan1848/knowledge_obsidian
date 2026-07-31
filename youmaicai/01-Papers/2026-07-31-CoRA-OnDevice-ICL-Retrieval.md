# CoRA: Gradient-free Task-Conditioned Retrieval for On-Device ICL

## 元信息
| 标题 | Gradient-free Task-Conditioned Retrieval for On-Device In-Context Learning |
|------|------|
| 作者 | Xinyu Luo 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.27766) |
| arXiv | arXiv:2607.27766 [cs.CL] |
| 发表 | 2026-07-30 |

## 核心贡献
1. **提出 CoRA (Conditional Retrieval Alignment)**：无需梯度、无需重训练的 task-conditioned retriever
2. **低秩分解压缩**：输出仅在离线索引构建时使用，查询时仅需 query input + 预计算索引
3. **端到端树莓派部署验证**：在计算、内存、数据暴露受限的边缘设备上有效

## 方法

### CoRA 核心思想
将冻结 encoder 转换为 task-conditioned retriever，使用配对的候选输入输出：

1. **选择互补 encoder 层**
2. **从候选记忆构建输出派生条件空间**
3. **通过闭式岭回归将候选输入表示对齐到该空间**
4. **低秩分解生成紧凑检索基**

### 关键特性
- 查询时检索**仅需 query input + 预计算索引**（无需目标模型调用）
- 支持流式两遍构造，避免物化完整拟合矩阵
- 扩展到多模态：视觉表示纳入条件和检索空间

## 实验

### 文本 (10 datasets)
- Llama-3.2-1B, MobileLLM-Pro

### 多模态 (4 benchmarks)
- OpenFlamingo-3B, Qwen3.5-2B

### 边缘部署
- Raspberry Pi 5 端到端部署验证

## 理论保证
- CoRA 的 rank-constrained basis 是输出条件拟合表示的最优低秩压缩

## 标签
#in-context-learning #on-device #retrieval #edge-AI #gradient-free #multimodal
