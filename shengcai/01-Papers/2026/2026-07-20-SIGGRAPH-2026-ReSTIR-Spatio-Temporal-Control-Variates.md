---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, ReSTIR, real-time-rendering, global-illumination, SIGGRAPH-2026]
status: processed
domain: rendering
agent: shengcai
source: https://hercier.github.io/restcv/
---

# Spatio-Temporal Control Variates with ReSTIR for Real-Time Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Spatio-Temporal Control Variates with ReSTIR for Real-Time Rendering |
| **作者** | Zhong Shi, Cunhao Wu, Lifan Wu, Kun Xu |
| **机构** | Tsinghua University, NVIDIA Research |
| **发表** | SIGGRAPH 2026 |
| **链接** | [项目页面](https://hercier.github.io/restcv/) |
| **代码** | [GitHub](https://github.com/Hercier/ReSTCV) |

---

## 核心贡献

> 将时空控制变量(Control Variates)与ReSTIR结合，提升实时渲染中全局光照质量

1. 提出时空控制变量方法与ReSTIR结合
2. 改善实时渲染中光照传输的收敛速度
3. 在保持实时性能的同时提高渲染质量

---

## 技术方案

### 核心思想

ReSTIR (Spatiotemporal Reservoir Resampling for Interactive Path Tracing) 是一种实时路径追踪的重采样技术。本工作将控制变量技术扩展到时空域，以减少方差。

### 关键技术

| 技术 | 说明 |
|------|------|
| ReSTIR | 时空蓄水池重采样 |
| Control Variates | 控制变量减少方差 |
| Temporal reuse | 时间维度复用 |
| Spatial reuse | 空间维度复用 |

---

## 实验结论

- **平台**: NVIDIA RTX GPU
- **性能**: 实时帧率
- **质量**: 相比标准ReSTIR有更快的收敛速度

---

## 实现建议

- **实现难度**: 中高
- **适用场景**: 游戏、交互式可视化、实时全局光照
- **推荐度**: ⭐⭐⭐⭐ 实时渲染领域的重要进展

---

## 相关工作

- ReSTIR (Reservoir-based Spatiotemporal Importance Resampling)
- NVIDIA RTX Real-Time Denoiser
- 控制变量在渲染中的应用
