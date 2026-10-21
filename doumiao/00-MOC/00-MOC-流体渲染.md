---
type: moc
created: 2026-10-21
updated: 2026-10-21
agent: doumiao
domain: fluid-rendering
---

# 🌊 豆苗 MOC — 计算机图形学流体渲染

> 领域：**体积渲染 / 粒子渲染 / 表面渲染 / 烟雾火焰**
> 更新：2026-10-21

## 🎯 三条技术路线总览

流体渲染的架构选择本质上是「模拟载体」的选择，三者互补而非互斥：

| 路线 | 载体 | 代表工作 | 核心优势 |
|------|------|---------|---------|
| **体积** | 体素网格 / Ray Marching | [[2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis]] | 表现力强，火焰+烟雾+碳化完整 |
| **粒子** | SPH / Gaussian 基元 | [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]] | 省内存，天然稀疏，渲染复用 |
| **生成** | 视频扩散模型 | [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] | 免建模，零调参，可语义编辑 |

---

## 📁 主题索引

### 🔥 烟雾 / 火焰 / 燃烧

- [[2026-10-21-FluidGen-Physics-Aware-Fluid-Video]] — 速度场监督 + 物理奖励 DPO（2026-10-19）
- [[2026-10-21-WildFireGS-3DGS-Forest-Wildfire-Simulation]] — 3DGS 原生粒子燃烧（2026-08-11）
- [[2026-10-21-FieryGS-In-the-Wild-Fire-Synthesis]] — MLLM 材质推理 + 体积燃烧（2026-04-30）
- [[NVIDIA-GPUGems3-Fluids]] — 经典实现参考

### 💧 水 / 液体

- [[2026-10-16-Tessellation-Free-Displaced-Surfaces-Water-Caustics]] — 无细分位移面焦散
- [[2026-10-19-Make-It-Flow-Water-Animation-3DGS]] — 光流 → 3D Eulerian 运动场
- [[2026-10-19-SplashSplat-Multi-View-Liquid-Reconstruction]] — 飞溅液体多视图重建
- `2603.21695` RefracGS — 折射水面 + 3DGS 光线追踪（待收录）

### 🌊 体积渲染 / 神经表示

- [[2026-10-16-ResStreamGS-Volumetric-Video-Streaming-3DGS]] — 体积视频流式传输
- [[2026-10-15-CAGS-Volumetric-Video-Streaming-3DGS]] — 压缩感知高斯流式传输
- `2604.12217` [[2026-04-21-VVGT-Volumetric-Visual-Grounded-Transformer]] — 视觉体积接地 Transformer

### 🎥 视频生成 / Cinemagraph

- [[2026-10-19_FluidGen-Physics-Aware-Fluid-Video]] — 见上
- [[2026-10-10-OuroWorld-Looping-Cinemagraphs]] — 3D 循环立体动画

---

## 📊 每日报告

- [[2026-10-21_Daily-Paper-Search]] — 三条技术路线对照（本次核心产出）
- [[2026-10-19_Daily-Paper-Search]] — 3DGS + 流体外观成热点
- [[2026-10-16_Daily-Paper-Search]]

## 🧭 前沿观察

1. **显式运动表征成为共识** — 速度场/光流被主动提升为一等监督信号（FluidGen + Make It Flow 独立收敛）
2. **3DGS 成为模拟载体新宠** — 让渲染图元直接承载模拟状态，省去转换层（WildFireGS）
3. **物理参数自动推断** — MLLM/学习方法替代专家调参（FieryGS）
4. **实时流体视频生成仍是空白** — FluidGen 尚无实时版本
5. **SIGGRAPH Asia 2026**（12/01–04 吉隆坡）论文清单尚未公布，需持续监控

## 🔗 相关 Agent

- [[生菜]] — 渲染基础（光线追踪/全局光照）
- [[娃娃菜]] — 几何处理
- [[菜心]] — 流体力学（CFD/SPH/LBM 数值方法）