---
title: "SUPRA-TEX: 3D Generation with Super-Aligned Texture"
authors: "Chen Yang, Jiemin Fang, Fanpeng Meng, Zihao Huang, Jichen Pang, Guanjun Wu, Zhikuan Bao, Qi Tian"
date: 2026-10-15
source: arXiv (cs.CV, cs.GR)
url: https://arxiv.org/abs/2610.22352
pdf: https://arxiv.org/pdf/2610.22352
arxiv_id: "2610.22352v1"
tags: [rendering, paper, 2026, PBR, relighting, texture-generation, 3D-generation, neural-rendering, MLLM, material-VAE]
status: unread
---

# SUPRA-TEX: 3D Generation with Super-Aligned Texture

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | SUPRA-TEX: 3D Generation with Super-Aligned Texture |
| 类别 | cs.CV (cross-list cs.GR) |
| 年份 | 2026 |
| 发布时间 | 2026-10-15 |
| 项目页 | https://supra-3d.github.io/supratex/ |
| 链接 | [原文](https://arxiv.org/abs/2610.22352) |
| PDF | [下载](https://arxiv.org/pdf/2610.22352) |

## 核心贡献
1. 提出 SUPRA-Tex：**解耦可见材质估计 / 表面对齐 / 观测引导的 3D 补全**三大任务，专注于保留可见证据并补全未观测表面。
2. 用 MLLM 图像编辑模型**预测参考视图的光照分离 PBR maps**；通过预训练 material VAE encoder 投影到与生成目标同 latent 空间的 **native observation latents**。
3. Interleaved flow transformer 将上述 latents 作为**固定只读锚点**，交替未观测区域与全表面更新，生成完整 material latents；实现 **WYSIWYG** 级别的可见区域保真与未观测区域的连贯补全。

## 技术方案
### 核心问题
单图 3D 生成需要在给定 mesh 上**装配可重新照明的材质**并忠实保留参考图像的视觉细节。现有方法在融合不一致多视图预测时引入伪影，或在隐式图像特征条件化下难以保留细节。

### 关键技术

| 技术 | 说明 |
|------|------|
| MLLM 图像编辑 | 预测参考视图的光照分离 PBR 贴图 |
| Material VAE encoder | 将 PBR 投影到生成目标的 latent space |
| Native observation latents | 与生成器共享 latent 空间的观察锚点 |
| Interleaved flow transformer | 交替未观测/全表面更新 |
| 公共数据集训练 | 无私有数据；通用化能力强 |

### 工作流（简化）

```
参考图像 → MLLM → 光照分离 PBR maps 
                     ↓
   (投影到可见表面 + material VAE) → observation latents (固定锚点)
                     ↓
   interleaved flow transformer ← 全表面生成目标
                     ↓
              完整 material latents → 3D mesh + 可重照明材质
```

## 实验结论
- 任务：几何条件贴图 + 端到端资产生成。
- 数据：仅公共数据集训练。
- 结果：在 SOTA 表现上**匹配或超越领先商业系统**（针对 in-the-wild 图像）；几何条件贴图和端到端生成均优。
- 视觉保真：可见区域 WYSIWYG 级别；未观测区域连贯补全。

## 局限性
- 依赖 MLLM 的图像编辑质量与一致性 — MLLM 误差会传导至 PBR 分离。
- 仅在公共数据训练，特殊材质（金属、玻璃、皮肤次表面）的细节可能仍欠。
- Latent 空间对极端复杂材质的可表达性未充分验证。
- 与传统离线 PBR 渲染管线（Substance、Clarisse 等）工具链兼容性需评估。

## 可行性分析
- 实现难度：**高**。需要：(1) MLLM 训练；(2) 专门 material VAE；(3) 复杂 interleaved transformer 训练管线。开源实现可能性低，更多作为方法参考。
- 性能预期：生成阶段是离线流程；推理时间取决于 transformer 规模。
- 适用场景：3D 资产生成 pipeline、AR/VR 内容自动化、电商产品建模、游戏资产批量生成。
- 推荐度：**⭐⭐⭐** — 对**资产生成方向**有价值，对**实时渲染管线**直接相关性较弱；可作为团队了解"AI × PBR 材质"前沿趋势的参考。

## 相关工作
- 单图 3D 生成工作群（SyncDreamer、Wonder3D 等）
- PBR 材质生成（Material Palette、MatFuse 等）
- MLLM 在视觉任务中的应用
- [[2026-04-02_Palette-Color-Grading-3DGS]] — 同期 PBR × 3DGS 工作

## 笔记
- 关键启示：**MLLM 分离 PBR + 预训练 VAE 锚点 + interleaved transformer** 三件套是当前"AI × PBR 材质"的最强模式之一。
- 对团队的指导：若关注离线资产管线，可考虑"AI 生成粗模 → SUPRA-Tex 类方法补充 PBR 材质 → 离线渲染"的工作流。
- 与 [[2026-10-14-VisibilitySplat-Ray-Traced-Occlusion-Relighting-3DGS]] 形成对照：前者解决 **3DGS + 显式可见性**的 relighting；本工作解决**单图 → 完整 PBR 资产**的生成。两者都是"AI + PBR"趋势的不同切入点。