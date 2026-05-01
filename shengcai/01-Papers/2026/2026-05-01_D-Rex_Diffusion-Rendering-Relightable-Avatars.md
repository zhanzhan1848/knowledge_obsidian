---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [relighting, diffusion, avatar, neural-rendering, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.27871
---

# D-Rex: Diffusion Rendering for Relightable Expressive Avatars

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | D-Rex: Diffusion Rendering for Relightable Expressive Avatars |
| **作者** | Xilong Zhou (et al., MPI) |
| **发表** | arXiv cs.GR, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.27871) |
| **DOI** | 10.48550/arXiv.2604.27871 |
| **代码** | https://vcai.mpi-inf.mpg.de/projects/DRex/ |

---

## 核心贡献

> 利用预训练视频扩散模型的强大生成先验，通过 LoRA 微调实现可重光照的逼真人体头像渲染，将重光照与头像建模完全解耦。

1. **解耦重光照与头像建模**：将重光照作为图像空间后处理，而非耦合在3D建模流程中
2. **扩散模型先验 + LoRA 微调**：利用预训练视频扩散 relighting 模型，在光场采集的配对数据上微调
3. **白光源头像系统兼容**：flat-lit driving frames 可由任意白光源头像系统生成，无需修改
4. **表情+重光照联合**：首次同时实现强面部动画与重光照的完整人体头像

---

## 技术方案

### 核心思想

现有可重光照全身头像方法依赖显式 3D 固有分解 + 解析反射模型，需精确几何注册和细致优化才能捕获真实光传输效果。D-Rex 提出将重光照**完全从头像建模解耦**——作为图像空间后处理：学习从 flat-lit/albedo-like 渲染到目标 HDR 照明的图像翻译。

### 流程

```
白光源头像框架 (e.g., INSTA, etc.)
    ↓ flat-lit 驱动帧
D-Rex: 视频扩散重光照模型 (LoRA 微调)
    ↓
HDR relit 输出 (view- and temporally consistent)
```

### 关键技术

| 技术 | 说明 |
|------|------|
| 视频扩散模型 (Video Diffusion) | 预训练 relighting prior |
| LoRA 微调 | 光场采集的 flat-lit / relit 配对帧 |
| 图像空间翻译 | flat-lit → target HDR illumination |
| 光阶段 (Light Stage) | 采集配对训练数据 |

---

## 实验结论

- **数据集**: 自采集 light stage 配对数据
- **基线**: 物理基础可重光照头像方法
- **结果**: 更好地保持 expressive motion 和细粒度面部细节，视角和时间一致性重光照

---

## 局限性

- 依赖光场采集设备
- 当前仅支持白光源头像系统输出的 flat-lit 驱动帧

---

## 实现建议

- **实现难度**: 高（需视频扩散模型训练 + 光场数据采集）
- **预期性能**: 生成质量高，但推理速度取决于扩散模型
- **适用场景**: 远程呈现、游戏、虚拟制作
- **可借鉴点**: 图像空间后处理解耦重光照的思路，适用于需要将渲染管线模块化的场景

---

## 相关工作

- [[Neural Relighting]]
- [[Gaussian Splatting Avatar]]
- [[Diffusion for Rendering]]
