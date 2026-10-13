---
title: "Sensitivity as an Arbitrary Output Variable for Differentiable Rendering"
date: 2026-10-13
tags: [differentiable-rendering, AOV, sensitivity-analysis, reverse-mode-AD, debug]
authors: [Linas Beresna et al.]
arxiv: 2610.10852
venue: SIGGRAPH Asia 2026 Technical Communications
doi: 10.1145/3829339.3847832
status: processed
subjects: cs.GR
---

## 核心创新点

提出 **Sensitivity AOV** — 把"标量目标对场景参数的导数"作为**第一类渲染产物**输出并供人检查，类比于传统 AOV 把图像分解为多通道。

### 关键技术

1. **单次反向 pass** — 填充覆盖整个场景参数层次的 sensitivity buffer
2. **延迟着色式读取** — 类似 deferred shading，从 sensitivity buffer 中读取不同视图，无需重新微分
3. **多视角输出**
   - 图像空间 sensitivity（按 object / parameter-type 粒度）
   - 从任意检查视点投影到场景
   - 对空间变化参数，按纹理坐标投放为逐 texel 字段
4. **分离固定/自由相机** — 固定相机决定 objective，自由相机用于 inspector 查看
5. **正向模式对照** — 把 reverse-mode attribution 与 forward-mode dual 联系起来

### 目标

- **不是新算法**，而是建立导数输出的**基础设施**
- 让 derivative 输出与 primal image 等价的第一类渲染产物

## 适用场景

- 流体/材质参数反演的"可视化诊断"
- 大型神经渲染场景中哪个资产贡献最多 loss

## 推荐度

✅ 推荐 — 工程师友好的工具化方法

## 关键词

`differentiable rendering` `AOV` `sensitivity analysis` `inspect visualization` `reverse-mode AD`

## 相关工作

- [[2026-10-13-ResLRB-Differentiable-Light-Tracing]] — 同作者/团队 SIGGRAPH Asia 2026 工作

---
*由豆苗自动收集于 2026-10-13*
