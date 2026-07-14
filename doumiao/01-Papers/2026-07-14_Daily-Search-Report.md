# 每日论文搜索报告 - 2026-07-14

## 搜索概况
- **搜索时间**: 2026-07-14 14:10 UTC
- **搜索范围**: arXiv cs.GR (最近7天) + SIGGRAPH 2026
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 🎯 SIGGRAPH 2026 流体渲染论文

### ⭐ Spatiotemporal FLIP ( Honorable Mention )

**论文**: [Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_174&sess=sess108)

**来源**: SIGGRAPH 2026 Technical Papers (ACM Transactions on Graphics)

**作者**: 
- Bernhard Braun, Rene Winchenbach, Nils Thuerey (Technical University Munich)
- Jan Bender (RWTH Aachen University)

**核心创新**:
- 将粒子视为 4D 时空采样，对 FLIP 方法进行时空扩展
- 支持比传统求解器大一个数量级的时间步长
- 在单台工作站上运行数十亿粒子模拟时可实现数倍加速
- 保留详细的表面结构和视觉保真度
- 作为现有 FLIP、PIC、APIC 求解器的轻量级插件设计

**技术细节**:
- 方法: Spatiotemporal FLIP (ST-FLIP)
- 适用场景: 免费表面流、两相流
- 性能提升: 时间步长大 10 倍，速度提升数倍

**应用价值**: 
- 电影/VFX 团队可实现更快的高分辨率预览
- 更多创意迭代
- 最终模拟更符合生产周期

**渲染相关度**: ⭐⭐⭐⭐⭐ (流体模拟是渲染的前置步骤)

---

## 📄 arXiv cs.GR 流体相关论文

### Sand Boils: 水利工程中的颗粒-水交互

**论文**: [Multi-Conditioned Diffusion Synthesis of Sand Boils for Low-Resource Earthen-Levee Inspection](https://arxiv.org/abs/2607.08794)

**arXiv ID**: 2607.08794

**领域**: cs.GR (Graphics)

**作者**: (待补充)

**核心内容**:
- 土堤沙涌（sand boils）是水利工程中的安全关键缺陷
- 像素级检测受限于稀缺的标注数据
- 提出基于扩散的合成管道，使用 Stable Diffusion XL + DreamBooth 微调
- 采用多分支 ControlNet 栈进行条件控制
- 软掩码 inpainting 协议保留真实缺陷像素

**与流体渲染的关系**:
- 涉及水-颗粒两相流的可视化
- 沙涌是水渗流穿过土堤时形成的颗粒喷发现象
- 相关于渲染中的颗粒系统（particle system）和两相流模拟

**渲染相关度**: ⭐⭐⭐ (颗粒-流体交互可视化)

---

## 其他 arXiv cs.GR 论文（2026-07-08 ~ 2026-07-14）

以下论文与流体渲染领域不直接相关，仅记录概览：

| arXiv ID | 标题 | 领域 |
|----------|------|------|
| 2607.11627 | Real-time Free-form Manifold Mesh Reconstruction | 3D重建 |
| 2607.10623 | LATO.2: Factorized 3D Mesh Generation | 网格生成 |
| 2607.10560 | PoseAlign: Text-Guided Mesh Deformation | 网格变形 |
| 2607.10313 | Learn2Chat: Dyadic Talking Heads | 数字人 |
| 2607.08804 | MeshForge: Collision Mesh Editing | 碰撞网格 |
| 2607.08798 | GReFEM: MLLM for Finite Element Meshing | 有限元 |
| 2607.08741 | ARDY: Autoregressive Diffusion Human Motion (SIGGRAPH 2026) | 动作生成 |
| 2607.08398 | Unified TetSphere Mesh Reconstruction (ECCV 2026) | 网格重建 |
| 2607.05938 | Scalable Hand Motion Completion | 手部动作 |
| 2607.05598 | SSA-3DGS: Screen-Space Artifacts Removal | 3DGS |
| 2607.05421 | Procedural Volumetric Plant Branching Structures | 植物建模 |

---

## 📊 搜索结论

本次搜索发现了 **1 篇 SIGGRAPH 2026 重要流体论文** 和 **1 篇 arXiv 流体相关论文**。

SIGGRAPH 2026 的 **Spatiotemporal FLIP** 是今年流体模拟领域的重要进展，值得深入研究其在时空采样和大规模模拟方面的创新。

---

*🌱 豆苗 - 流体渲染知识研究助手*
*自动生成于 2026-07-14 14:10 UTC*
