---
title: "UltraDiff: Differentiable Ray Tracing in Ultrasound for Shape Optimization"
date: 2026-10-13
tags: [differentiable-rendering, ray-tracing, ultrasound, monte-carlo, volume-rendering, inverse-problem]
authors: [Unspecified]
arxiv: 2610.07941
venue: SIGGRAPH Asia 2026 Technical Communications
doi: 10.1145/3829339.3847840
status: processed
subjects: cs.GR, cs.CV
---

## 核心创新点

把**可微物理渲染**的范式**扩展到医学超声**：
- 超声成像 ≈ 瞬态渲染（按飞行时间分 bin）
- 不同于光投影到像平面
- 提出 **UltraDiff**，基于 Mitsuba 3 的**可微超声光线追踪框架**

### 关键技术

1. **路径空间积分公式** — 由换能器到组织接口的飞行时间 gating
2. **前向与梯度估计的 Monte Carlo estimator**
3. **反演几何估计**
   - 从球体出发优化 SDF
   - 直到模拟回声匹配测量
   - 验证：B-mode 仿真扫描 + 实际机器人采集脊柱 phantom
4. **无监督分析-合成** — 不依赖预分割图像
5. **竞争性几何精度** — 与 SOTA 超声形状重建方法相当

### 跨界意义

- 把 path tracing 的可微反演技术带到新感知模态
- 流体散射/反射/体积渲染的可微工具链可启发其他物理成像

## 推荐度

✅ 推荐 — 对做可微成像反演的图形学团队有启发

## 关键词

`differentiable rendering` `ray tracing` `ultrasound` `transient rendering` `volume rendering` `inverse problem`

---
*由豆苗自动收集于 2026-10-13*
