---
type: paper
created: 2026-06-15
updated: 2026-06-15
tags: [paper, path-tracing, holography, wave-optics, siggraph2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.14173
---

# HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | HoloPathTracer: Fast and Accurate Wave Path Tracing for Holography |
| **作者** | (Authors from paper) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4, Article 39, July 2026 - SIGGRAPH 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.14173) |
| **DOI** | Pending |
| **代码** | N/A |

---

## 核心贡献

> 将路径追踪与波动光学结合，实现全息显示中3D视觉 cues 的物理精确编码

1. **同时求解渲染方程和 Rayleigh-Sommerfeld 积分** - 使用 Monte Carlo 方法同时处理光辐射估计和波传播
2. **Path Reuse 加速** - 通过时间复用随机全息图实现数量级收敛加速
3. **环境辐射缓存** - 快速近似方案进一步提升一个数量级的速度

---

## 技术方案

### 核心思想

现有 CGH (Computer-Generated Holography) 方法将辐射估计与波传播解耦，先在离散场景扇区预渲染辐射度，再进行波传播。这种分离限制了可以忠实再现的焦深 cues 和视觉效果。

HoloPathTracer 提出统一的波动光学渲染框架：
- 使用 Monte Carlo 路径追踪同时求解**渲染方程**和 **Rayleigh-Sommerfeld 衍射积分**
- 兼容现代图形学技术
- 生成编码综合视觉效果（如焦散模糊、视图相关效果、反射高光）的相干波场

### 关键技术

| 技术 | 说明 |
|------|------|
| Monte Carlo 路径追踪 | 求解渲染方程 |
| Rayleigh-Sommerfeld 积分 | 波前传播计算 |
| Path Reuse | 时间复用随机全息图，减少计算 |
| 环境辐射缓存 | 加速收敛 |

### 算法流程

```math
L_o(\mathbf{x}, \omega_o) = L_e(\mathbf{x}, \omega_o) + \int_{\Omega} f_r(\mathbf{x}, \omega_i, \omega_o) L_i(\mathbf{x}, \omega_i) (\omega_i \cdot \mathbf{n}) d\omega_i
```

渲染方程 + 波动方程同时求解

---

## 实验结论

- **方法**: 仿真 + SLM 显示原型实验验证
- **结果**: 
  - 真实的 3D cues 重构（焦散模糊、视图相关效果）
  - 复杂材质的真实外观（高光、反射、折射）
  - 显著快于现有方法

---

## 局限性

- 计算复杂度仍然较高
- 需要精确的光学系统校准
- 材质模型需要适配波动光学

---

## 相关工作

- [[Path Tracing]] - Monte Carlo 光线追踪
- [[Holography]] - 全息显示技术
- [[Global Illumination]] - 全局光照

---

## 实现建议

- **实现难度**: 高（需同时实现路径追踪和波动光学）
- **预期性能**: 收敛速度提升 10x（使用 radiance cache）
- **适用场景**: VR/AR 全息显示、光场渲染、科学可视化