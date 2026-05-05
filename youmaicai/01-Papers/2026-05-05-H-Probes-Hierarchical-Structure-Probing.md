# H-Probes: Extracting Hierarchical Structures From Latent Representations of Language Models

## 元信息
| 标题 | H-Probes: Extracting Hierarchical Structures From Latent Representations of Language Models |
|------|------|
| 作者 | Cutter Dawes, Aryan Sharma, Angelos Ioannis Lagos, Shivam Raval |
| 链接 | [原文](https://arxiv.org/abs/2605.00847) |
| arXiv | arXiv:2605.00847 |
| 会议/期刊 | - |
| 代码 | [GitHub](https://github.com/aryans-15/h-probes) |

## 核心贡献

1. **H-probes 框架**：提出一套线性探针方法，从 LLM 的隐表示中提取层级结构（树的深度和成对距离）
2. **因果重要性验证**：通过层级子空间消融实验，证明层级表示对任务成功具有因果作用
3. **跨域泛化**：发现层级结构在合成树任务、GSM8K 数学推理、HiBench 等多个层级任务中均以低维几何子空间形式存在

## 模型架构

### 探针设计
- **距离探针**：将 latent space X (经 PCA 降到 10 维) 通过投影 B ∈ ℝ^(p×10) 映射到 p 维子空间，用欧氏距离重建树节点对之间的距离
- **深度探针**：用 Ridge 回归（λ=0.01）从 PCA 子空间提取树的深度信息
- **层级子空间 H**：由距离探针的 p 维权重矩阵 B 和深度探针的 1 维权重向量张成，维度为 p+1

### 实验设置
- **合成任务**：二叉树遍历（深度 1-4），节点标签随机打乱
- **真实任务**：GSM8K 数学推理、HiBench 层级子任务
- **模型**：R1-distilled Qwen (1.5B/7B/14B)、Qwen 1.5 Chat (1.8B/7B/14B)

## 关键发现

### 1. 合成树任务
- 距离和深度探针在模型的 **中后层**（约第 25-35 层）表现最佳
- 完全正确（exact）样本的探针性能显著优于部分正确（inexact）样本
- 消融层级子空间导致准确率大幅下降，接近消融 PCA 基线的效果

### 2. 跨域泛化
- **域内泛化**：探针在 held-out 测试集上保持良好性能
- **跨深度泛化**：在 depth 1-2 上训练的探针成功迁移到 depth 3-4 的更深树，距离探针泛化能力强于深度探针
- **跨任务泛化**：在 GSM8K（r_dist=0.2875, r_depth=0.4891）和 HiBench（r_depth=0.911）上均发现层级结构

### 3. 因果重要性
- 消融层级子空间使准确率下降，接近消融总体 CoT 分布的主成分
- 层级子空间对 logits 的影响甚至超过消融整个空间

### 4. 跨模型稳定性
- 跨 5 个不同训练子集发现的层级子空间高度相似（余弦相似度接近 1）
- 1.5B 到 14B 参数规模均适用

## 实验结果摘要

| 任务 | 距离探针 (Pearson r) | 深度探针 (Pearson r) |
|------|------|------|
| 合成树 (in-domain, 14B reasoning) | ~0.8+ (exact) | ~0.8+ (exact) |
| 合成树 (depth 3-4 transfer) | ~0.4-0.6 | ~0.2-0.3 |
| GSM8K (14B reasoning) | 0.2875 | 0.4891 |
| HiBench (fundamental multiple-tree) | 0.371 | 0.911 |

## 局限性
- 主要实验基于小规模二叉树的短遍历任务，层级结构复杂度受限
- 在 HiBench 等真实任务上因果信号较弱

## 建议
- **推荐程度**：⭐⭐⭐⭐⭐
- **适用场景**：LLM 表征几何分析、Chain-of-Thought 可解释性研究
- **相关方向**：线性表征假设、SAE、表征工程
