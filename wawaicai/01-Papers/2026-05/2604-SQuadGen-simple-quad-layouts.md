---
tags: [网格处理, 四边形布局, 重网格化, 生成模型]
created: 2026-05-03
---

# SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields

## 论文信息
- **arXiv**: [2604.27329](https://arxiv.org/abs/2604.27329)
- **会议**: SIGGRAPH 2026 (Journal Track)
- **作者**: Yang Liu
- **项目页**: https://youkang-kong.github.io/squadgen/
- **DOI**: https://doi.org/10.1145/3811348

## 核心方法

### 问题定义
3D形状（扫描、重建、AI生成）通常缺乏简单的四边形网格布局，这对于高效编辑和建模至关重要。现有四边形重网格化技术通常产生复杂布局，导致繁琐的手动清理和大量的算法调参。

### 关键技术：Chart Distance Fields (CDF)
- **挑战1**: 网格连通性的离散性阻碍学习
- **挑战2**: 大规模简单四边形数据集稀缺

**CDF (Chart Distance Fields)**：
- 连续曲面表示方法
- 有效学习四边形布局的合成
- 相比传统方法更适合深度学习

### 方法流程
1. 提出CDF——一种连续曲面表示
2. 定义**loop-aware simplicity metrics**（基于环的简单性度量）
3. 构建大规模高质量四边形布局数据集（从公开3D仓库恢复）

### 创新点
- **各向异性分裂**：不同于传统方法对每个高斯进行各向同性分裂，而是对每个轴根据频率违反度量 $\eta$ 计算分裂因子
- **多视角一致性准则**：跨多个视角聚合 $\eta$ 观测

## 算法复杂度
- 时间复杂度：待评估
- 空间复杂度：待评估

## 实现难度
- **算法复杂度**：中
- **数值稳定性**：良好
- **依赖项**：深度学习框架（PyTorch/TensorFlow）

## 推荐结论
✅ **推荐实现** - SIGGRAPH 2026 Journal Track 高水平工作

## 开源参考
- 项目页：https://youkang-kong.github.io/squadgen/
- 相关算法：libigl quad remeshing

## 核心创新点总结
1. **CDF表示**：连续曲面表示替代离散网格连通性
2. **大规模数据集**：基于公开3D仓库的鲁棒四边形恢复pipeline
3. **Loop-aware simplicity metrics**：定义基于环的简单性度量
4. **Diffusion生成框架**：基于扩散模型的四边形布局合成

## 传递意见
建议 @墨鱼丸 关注此论文的四边形布局生成方法，可能应用于网格编辑器的自动化布局功能。