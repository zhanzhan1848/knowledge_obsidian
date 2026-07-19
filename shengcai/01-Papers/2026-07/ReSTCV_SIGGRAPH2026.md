---
type: paper
created: 2026-07-19
updated: 2026-07-19
tags: [paper, rendering, real-time, path-tracing, ReSTIR, control-variates]
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
| **作者** | Zhong Shi, Cunhao Wu, Lifan Wu, Kun Xu (Tsinghua University, NVIDIA) |
| **发表** | SIGGRAPH Conference Papers '26 |
| **链接** | [Project Page](https://hercier.github.io/restcv/) |
| **DOI** | 10.1145/3799902.3811113 |

---

## 核心贡献

> 将时空控制变量集成到 ReSTIR，实现更清洁的颜色稳定性

1. **时空控制变量**：跨像素和帧复用相关估计
2. **差分估计**：用 reservoir 样本估计像素差异
3. **累积着色**：用累积路径贡献替代单样本着色
4. **低开销**：仅需适度开销，显著提升色彩稳定性

---

## 技术方案

### 核心思想

标准 ReSTIR 在 reservoir 中存储一个代表性样本。ReSTCV 保留这个复用结构，但额外维护一个颜色估计作为控制变量。在时空复用过程中，相邻 reservoir 提供辅助估计，而基于 ReSTIR 的差分估计器修正目标像素。

### 关键技术

| 技术 | 说明 |
|------|------|
| Control Variate | 每个 reservoir 存储额外累积颜色估计 |
| Temporal Reuse | 跨帧复用相关估计 |
| Spatial Reuse | 跨像素复用邻居估计 |
| Difference Estimation | 用 reservoir 样本估计像素差异 |

---

## 算法流程

```
1. 标准 ReSTIR 存储单一代表性样本
2. ReSTCV 额外维护累积颜色估计
3. 复用时使用邻居 reservoir 提供辅助估计
4. 用差分估计器修正目标像素
5. 最终着色使用控制变量估计
```

---

## 实验结论

- **色彩稳定性**: 显著减少色噪
- **动态场景**: 保持高效采样分布
- **直接/间接光照**: 两者都受益于累积贡献

---

## 局限性

- 需要额外的显存存储控制变量
- 对非彩色场景优势不明显

---

## 相关工作

- [[ReSTIR PT Enhanced]]
- [[Gradient-Domain ReSTIR Path Tracing]]

---

## 实现建议

- **实现难度**: 中 (需要理解 ReSTIR 原理)
- **预期性能**: 提升色彩稳定性，轻微性能开销
- **适用场景**: 高质量实时路径追踪，特别是彩色场景
