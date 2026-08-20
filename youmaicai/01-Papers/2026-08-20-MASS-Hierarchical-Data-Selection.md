# MASS: Hierarchical Data Selection via Manifold Coverage and Sparse Feature Coverage

## 元信息
| 标题 | Hierarchical Data Selection via Manifold Coverage and Sparse Feature Coverage in LLM Post-training |
|---|---|
| 作者 | Peng Sun, Yi Yang et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.16927) |
| arXiv | arXiv:2608.16927 |

## 核心贡献
1. 将数据选择重新表述为**粗到细的层级覆盖问题**，提出 **MASS** 框架
2. 使用**密集自编码器**学习低维主流形坐标，进行粗粒度语义分组
3. 在每个组内使用 **TopK 稀疏自编码器**执行质量感知稀疏特征覆盖
4. 解决现有方法在原始嵌入空间中进行几何度量时的纠缠问题（语义方向、细粒度监督差异、局部噪声混在一起）

## 方法

### 粗粒度阶段
- 密集自编码器学习低维主流形坐标
- 基于流形坐标进行语义聚类分组

### 细粒度阶段
- TopK 稀疏自编码器进行质量感知稀疏特征覆盖
- 每组内选择覆盖多样特征的样本

## 实验结果
- 数据集：Vision Flan，LLaVA-CoT
- MASS 在多个数据预算下一致优于所有强数据选择基线
- 多个设置中用**小部分数据即可匹配或超越全数据训练**

## 与 Data-DPO 的互补性
MASS 关注层级语义覆盖的**多样性**维度，Data-DPO 关注目标模型兼容性。两者从不同角度解决 SFT 数据选择问题。

---
*关键词：Data Selection，SFT，Fine-tuning，多模态，稀疏自编码器，Manifold Learning，Post-training，Data Efficiency*
*领域：cs.LG, cs.CV*
