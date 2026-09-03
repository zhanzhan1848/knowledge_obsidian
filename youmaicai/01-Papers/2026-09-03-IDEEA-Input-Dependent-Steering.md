# IDEEA: Training-free Input-Dependent Steering via Activation Cluster Matching

## 元信息
| 标题 | IDEEA: training-free Input-Dependent stEEring via Activation cluster matching |
|------|------|
| 作者 | Zheng Wang et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.02089) |
| arXiv | arXiv:2609.02089 |
| 会议 | EMNLP 2026 Findings |

## 核心贡献
1. 大多数现有 training-free steering 方法是 input-independent 的：单一方向一次拟合，共享给所有输入
2. 提出 **IDEEA**：training-free input-dependent steering 框架
   - 对每个 attention head 的正负激活支持进行聚类
   - 求解最优匹配问题，构建一组 cluster-conditional 方向
   - 推理时选择与输入自身激活最匹配的方向进行 steering

## 模型架构 / 方法
- **Activation clustering**：对正负激活 support 聚类
- **Optimal-matching**：构建 cluster-conditional steering 方向池
- Input-dependent selection：推理时匹配输入激活

## 实验结果
- TruthfulQA 上 truth × info rate 平均提升 9.9%（最高 23.5%）vs 最佳 input-independent 基线
- 证据：编码概念的激活占据表示空间的多个不同子区域而非单一区域

## 局限性
- 聚类数量需要调优
- 对某些概念效果更好，对其他概念可能有限

## 关键词
#steering #model-editing #training-free #LLM #interpretability
