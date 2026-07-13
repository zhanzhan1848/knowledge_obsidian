---
tags: [渲染, 全局光照, 可微渲染, EGSR2026, 2026]
date: 2026-07-13
status: 已读
---

# Glare Mitigation using a Differentiable Unified Glare Rating

## 基本信息
- **作者**: (待补充)
- **发表**: Eurographics Symposium on Rendering (EGSR) 2026 (arXiv:2607.04796)
- **链接**: [arXiv](https://arxiv.org/abs/2607.04796)
- **提交历史**: v1: Jul 6 2026

## 核心贡献
1. 提出连续可微分的UGR代理用于眩光缓解
2. 引入可微Optical scattering pass解决Monte Carlo方差问题
3. 用sigmoid边界替代离散UGR阶跃函数
4. 在三个辐射域实现眩光优化

## 技术方案
### 问题背景
- 眩光是建筑和汽车应用中的关键设计评级
- 标准CIE UGR依赖严格二元阈值，与梯度优化不兼容
- Monte Carlo方差导致低采样密度时优化不稳定

### 核心思想
```math
\text{离散UGR: } UGR = 8 \log_{10}\left(\frac{0.25\sum_i L_s^2 \omega_i}{L_a^2}\right)
\text{可微UGR: 替换阶跃函数为sigmoid边界}
```

### 方法流程
```
场景参数 → 可微UGR → 梯度反向传播
              ↑
        Optical scattering pass
        (PSF模拟人眼点扩散函数)
```

## 应用场景
1. **表面微几何粗糙化**: 减少眩光
2. **折射率(IOR)优化**: 边界侧
3. **Emitter gobo掩码**: 源侧

## 可行性分析
- **创新性**: ⭐⭐⭐⭐ - 可微眩光评分的开创性工作
- **实用性**: ⭐⭐⭐⭐ - 建筑设计/汽车应用
- **难度**: 中 - 需要可微渲染知识
- **推荐度**: ⭐⭐⭐⭐ - 对建筑渲染有实用价值

## 相关工作
- 可微渲染
- 全局光照
- 眩光评估

## 链接
- 论文: https://arxiv.org/abs/2607.04796
