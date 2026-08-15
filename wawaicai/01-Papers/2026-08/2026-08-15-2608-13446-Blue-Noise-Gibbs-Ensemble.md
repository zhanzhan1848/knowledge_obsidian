---
tags: [几何, 采样, 蓝噪声, Gibbs分布]
---

# Blue Noise as a Lattice Gibbs Ensemble

## 论文信息
- **arXiv**: [2608.13446](https://arxiv.org/abs/2608.13446) [cs.GR]
- **作者**: Zhuoran Yi et al.
- **提交日期**: 2026-08-13
- **PDF**: [arXiv PDF](https://arxiv.org/pdf/2608.13446)

## 核心方法

### 问题定义
蓝噪声采样在计算机图形学中广泛应用，但现有方法将统计建模与可扩展生成分离。

### 核心创新
将蓝噪声生成形式化为 **Gibbs 分布** 上的采样问题，对二元格子occupancy进行成对排斥交互：

$$E = \sum_{i<j} V(r_{ij})$$

关键特点：
1. **密度、排斥强度、交互尺度、核硬度** 作为分布参数
2. **Coupling Towards The Past (CTP)** 追踪马尔可夫链，倒向cut固定深度
3. **Tile独立性**：足够halo的tile可bit-identical生成，不受域大小影响
4. **误差有界**：通过参数（而非切换算法）在精度和成本间权衡

## 验证结果
- 自适应stippling 14K分辨率
- 匹配理论预测的work和memory
- Tiled输出bit-identical验证
- 多类别扩展

## 几何处理相关性
⚠️ **采样理论相关** — 蓝噪声采样对几何处理中的点分布、网格生成有应用价值。

## 开源参考
- GitHub: (见论文链接)

## 关键词
`蓝噪声` `采样` `Gibbs分布` `Markov随机域` `CTP` `Blue Noise` `Sampling`
