---
tags: [渲染, 路径追踪, 全息显示, SIGGRAPH2026, 2026]
date: 2026-07-13
status: 已读
---

# HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography

## 基本信息
- **作者**: Wenbin Zhou et al.
- **发表**: ACM Transactions on Graphics 45(4) Article 39, July 2026 (SIGGRAPH 2026)
- **链接**: [arXiv](https://arxiv.org/abs/2606.14173) | [DOI](https://doi.org/10.1145/3811351)
- **提交历史**: v1: Jun 12 2026, v2: Jun 16 2026

## 核心贡献
1. 提出基于路径追踪的物理精确波光学渲染框架
2. 同时求解渲染方程和Rayleigh-Sommerfeld积分
3. 通过Path Reuse实现数量级加速
4. 使用环境 radiance cache 近似进一步加速

## 技术方案
### 核心方法
```math
\text{Rendering Equation: } L_o = L_e + \int_{\Omega} f_r L_i \cos\theta \, d\omega
\text{Rayleigh-Sommerfeld: } U(P) = \frac{1}{i\lambda}\int_{\Sigma} U(Q)\frac{e^{ikr}}{r}\frac{z}{r^2}\,d\Sigma
```

### 方法流程
```
Monte Carlo路径追踪
         ↓
同时采样渲染方程 + Rayleigh-Sommerfeld积分
         ↓
Path Reuse: 复用波场计算生成多个时间复用全息图
         ↓
环境radiance cache加速
         ↓
Complex-amplitude监督生成相位全息图
```

### 关键创新
- **Path Reuse**: 最小化额外时间成本生成多个随机全息图
- **Ambient radiance cache**: 加速收敛一个数量级
- **兼容性**: 与现代图形技术完全兼容

## 实验结论
- 生成的自然3D线索和复杂材质的全息重建效果逼真
- 实现了真实的失焦模糊、视角相关效果、高光和反射
- 在SLM显示原型上实验验证

## 局限性
- 计算复杂度仍然较高
- 需要硬件全息显示支持

## 可行性分析
- **创新性**: ⭐⭐⭐⭐⭐ - 创新性结合路径追踪和波光学
- **实用性**: ⭐⭐⭐⭐ - VR/AR应用前景广阔
- **难度**: 高 - 需要渲染和光学双重知识
- **推荐度**: ⭐⭐⭐⭐ - 对全息显示研究有重要价值

## 相关工作
- 计算全息 (CGH)
- 神经全息
- 路径追踪加速

## 链接
- 论文: https://arxiv.org/abs/2606.14173
- 项目: (待查找)
