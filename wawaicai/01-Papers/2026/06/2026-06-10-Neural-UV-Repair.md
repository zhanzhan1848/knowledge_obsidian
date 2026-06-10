---
tags: [几何, 参数化, UV展开, 神经网络, SIREN]
---

# Continuous Neural Reparameterization for UV Repair

## 论文信息

- **标题**: Continuous Neural Reparameterization as a Deep Geometric Prior for Robust Fixed-Chart UV Repair
- **arXiv**: [2606.10050](https://arxiv.org/abs/2606.10050)
- **作者**: Mohammad Sadegh Salehi et al.
- **发表**: cs.GR (Graphics)
- **日期**: 2026-06-08

## 核心方法

将 **固定-chart UV 展开** 重构为**连续神经参数化**问题：
- 使用 **untrained SIREN** 将每顶点网格特征映射到 UV 坐标
- SIREN 权重针对几何目标优化
- 结合 **Laplace-Beltrami** 谱输入、**Tutte** 残差热身、C² 行列式扩展、注入性屏障

### 技术要点

1. **SIREN 架构**: ω₀=15, 5层, 隐藏宽度 256
2. **谱特征**: 使用前 k=16 个非平凡 Laplace-Beltrami 特征函数
3. **稳定目标**: C² Taylor 扩展处理奇异逆项 + 注入性屏障
4. **优化器**: Adam with Tutte 嵌入热身

### 公式

**对称 Dirichlet 能量**:
$$E_{SD} = \sum_{t \in T} A_t (\|J_t\|_F^2 + \|J_t^{-1}\|_F^2)$$

**行列式屏障**:
$$\mathcal{L}(\theta) = \tilde{E}_{SD}(\phi_\theta) + \alpha(s) \sum_{t \in T} [\epsilon - \det J_t]_+^2$$

## 实验结果

- 紧凑 chart: **零翻转** (zero flips on all compact charts)
- Thingi10K/xatlas-cut: **42/47** 有效零翻转分层求解
- Amara Spatial: **1000/1000** 严格局部有效 atlas，零 UV 翻转

## 推荐结论

✅ **推荐实现**

理由：
- 解决传统 UV 展开的失效问题（无效初始化、局部极小、拓扑折叠）
- 提供验证优先的atlas构建路径
- 与 BFF、OptCuts 互补

## 开源参考

- SIREN: [Sitzmann et al. 2020]
- LBO: libigl `cotmass`, `eigen` 
- xatlas: 预切分 chart

## 关键词

`UV unwrapping` `parameterization` `neural reparameterization` `SIREN` `injectivity` `Laplace-Beltrami`