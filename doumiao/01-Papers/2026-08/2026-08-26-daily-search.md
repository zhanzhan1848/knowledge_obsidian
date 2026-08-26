---
type: paper
created: 2026-08-26
updated: 2026-08-26
tags: [fluid-simulation, smoke-rendering, gaussian-splatting, volumetric-rendering, neural-rendering, sparse-reconstruction]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://dl.acm.org/doi/10.1145/3799902.3811148
---

# GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GauSmoke: Hybrid Physics-Optical Gaussian Splatting for Sparse Smoke Reconstruction |
| **作者** | Wenran Zhang, Yuxiang Cai, Letian Huang, Dongwei Ye, Jie Guo, Ren Bo |
| **发表** | SIGGRAPH 2026 Conference |
| **链接** | [原文](https://dl.acm.org/doi/10.1145/3799902.3811148) |
| **DOI** | 10.1145/3799902.3811148 |
| **代码** | - |

---

## 核心贡献

> 将物理引导的高斯优化与体积渲染结合，从稀疏视角视频重建动态烟雾，实现物理一致性与视觉保真度的双重提升

1. **物理引导的 Gaussian 优化** — 在全局体积保持速度场下演化基元，避免任意粒子形变，有效保持体积同时恢复细尺度湍流细节
2. **联合光流-密度预测** — 将流体动力学与可微渲染紧密耦合，联合预测速度场和密度
3. **稀疏视角重建** — 仅需稀疏视角即可实现稳定、高质量的3D烟雾重建

---

## 技术方案

### 核心思想

将烟雾视为4D Gaussian primitives，通过物理引导的优化过程演化。不同于传统NeRF方法直接优化隐式场，本方法显式维护Gaussian primitives，在全局速度场约束下运动，保持体积守恒的同时恢复精细湍流细节。

### 关键技术

| 技术 | 说明 |
|------|------|
| Gaussian Splatting | 将烟雾表示为可优化的3D Gaussian primitives，保留点源光束特性 |
| 体积保持速度场 | 全局协调的速度场驱动Gaussian运动，避免不物理的形变 |
| 可微体积渲染 | 将Gaussian原语渲染为图像，通过渲染损失端到端优化 |
| 稀疏视角输入 | 仅需2-4个视角视频即可重建，超越传统多视角立体重建需求 |

---

## 实验结论

- **数据集**: 合成烟雾数据集 + 真实烟雾视频
- **基线**: NeuSmoke等现有烟流体重建方法
- **结果**: 在视觉保真度和物理一致性上均超越SOTA，支持稀疏视角下的稳定3D重建

---

## 局限性

- 计算资源需求较高（需GPU）
- 对极稀疏视角（<2）的鲁棒性有待验证

---

## 相关工作

- [[NeuSmoke]] — 神经传输场烟雾重建
- [[PhysGaussian]] — 物理信息 Gaussian 方法
- [[LagrangianSplats]] — 散度自由传输（同一会议相关工作）

---

## 实现建议

- **实现难度**: 高（需可微渲染 + 流体优化）
- **预期性能**: 实时渲染潜力（基于Gaussian Splatting的特性）
- **适用场景**: VFX 烟雾采集重建、稀疏视角监控场景烟雾重建

---

# ST-FLIP: Spacetime FLIP for Fast Free-Surface and Two-Phase Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ST-FLIP: Spacetime FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps |
| **作者** | （待补充，作者信息需进一步检索） |
| **发表** | SIGGRAPH 2026 Conference |
| **链接** | [SIGGRAPH 2026 Announcement](https://s2026.siggraph.org/siggraph-2026-technical-papers-showcase-the-research-making-visual-computing-faster-more-reliable-and-accessible/) |
| **DOI** | - |

---

## 核心贡献

> 将粒子视为4D时空样本，实现比传统求解器大一个数量级的时间步长，在单工作站上完成数十亿粒子模拟的速度提升

1. **时空 FLIP (ST-FLIP)** — 把粒子当作4D时空样本处理，突破 CFL 条件限制
2. **超大时间步长** — 时间步比传统求解器大10倍
3. **多十亿粒子可扩展** — 单工作站运行数十亿粒子模拟
4. **兼容现有管线** — 作为 FLIP/PIC/APIC 求解器的轻量级插件

---

## 技术方案

### 核心思想

将 FLIP (Fluid Implicit Particle) 方法扩展到时空维度。传统 FLIP 受 CFL 条件限制，每个时间步内的粒子位移受限于网格单元大小。ST-FLIP 将粒子视为时空样本，跨时间步长追踪粒子状态，从而允许更大的时间步。

### 关键技术

| 技术 | 说明 |
|------|------|
| 4D 时空粒子 | 粒子同时表示空间位置和时间参数 |
| 大时间步长积分 | 在守恒约束下实现远超 CFL 限制的时间步 |
| APIC/FLIP/PIC 兼容 | 作为插件集成到现有粒子求解器 |

---

## 实验结论

- **性能**: 多十亿粒子模拟，单工作站
- **速度提升**: 比传统 FLIP 快数倍
- **视觉保真**: 保持详细表面结构和视觉保真度

---

## 局限性

- 需对现有求解器进行管线改造
- 超大时间步长可能影响某些细节捕捉

---

## 相关工作

- [[FLIP]] — 流体隐式粒子
- [[APIC]] — 仿射粒子云方法
- [[MPM]] — 物质点法

---

## 实现建议

- **实现难度**: 中（插件集成，现有求解器改造）
- **预期性能**: 数倍速度提升
- **适用场景**: 影视特效大规模流体模拟、游戏引擎实时流体

---

# Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Gabor Fields: Orientation-Selective Level-of-Detail for Volume Rendering |
| **发表** | SIGGRAPH 2026 Conference — **Top 10 Fast Forward** |
| **链接** | SIGGRAPH 2026 Top 10 Papers |
| **DOI** | - |

---

## 核心贡献

> 体积渲染的方向选择性 LOD，在多尺度分析中保持体积细节方向性，提升渲染质量和效率

1. **方向选择性基函数** — 基于 Gabor 函数的方向选择性核
2. **LOD 层级渲染** — 不同细节层级自动适应观察距离
3. **体积渲染优化** — 在保持视觉质量的同时提升渲染效率

---

## 技术方案

### 核心思想

Gabor Fields 将 Gabor 小波的思想引入体积渲染 LOD。与传统各向同性基函数不同，Gabor 基函数支持方向选择性，能够在保持体积细节方向性特征的同时实现多尺度表示。

### 关键技术

| 技术 | 说明 |
|------|------|
| Gabor 基函数 | 振荡高斯核，支持方向参数化 |
| 多尺度 LOD | 自适应细节层级，距离越远细节越粗 |
| 体积渲染积分 | 沿射线体积积分，支持半透明介质 |

---

## 相关工作

- [[Volume Rendering]] — 体积渲染
- [[Level of Detail]] — 多细节层级
- [[Gabor Wavelet]] — Gabor 小波

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 渲染效率提升
- **适用场景**: 科学可视化、体积数据渲染、云/烟体积渲染 LOD

---

# 每周流体渲染论文搜索报告 (2026-08-26)

## 搜索范围

- **arXiv cs.GR**: 2026-08-20 ~ 2026-08-26 (14篇论文)
- **SIGGRAPH 2026**: 流体仿真相关论文

## 搜索结果汇总

| 论文 | 领域 | 来源 | 关键创新 |
|------|------|------|----------|
| GauSmoke | 烟雾渲染 + Gaussian Splatting | SIGGRAPH 2026 | 物理引导的烟雾重建，稀疏视角3D恢复 |
| ST-FLIP | 流体模拟 | SIGGRAPH 2026 | 时空FLIP，超大时间步长 |
| Gabor Fields | 体积渲染 LOD | SIGGRAPH 2026 Top 10 | 方向选择性体积LOD |
| ExMesh++ | 网格重建 + PBR | cs.GR (2608.24109) | 可重光照UV-PBR网格资产（间接相关：体积材质） |

## arXiv cs.GR 本周论文概览 (2026-08-20 ~ 2026-08-26)

本周共14篇论文，无直接流体渲染论文。间接相关论文：

- **2608.24109** ExMesh++ — 网格拓扑 + PBR材质，可作为流体表面渲染参考
- **2608.23606** XPBD扩展 — 刚体/Cosserat棒模拟，与流体模拟中的粒子方法相关
- **2608.20803** CubicSplat — 可微向量光栅化，与Gaussian Splatting系列相关

## 下周关注方向

- SIGGRAPH Asia 2026 论文征集中（2026年12月）
- arXiv cs.GR 持续追踪 Gaussian Splatting 在流体中的应用
- 关注 Neural Volume Rendering 在烟雾/火焰中的应用进展
