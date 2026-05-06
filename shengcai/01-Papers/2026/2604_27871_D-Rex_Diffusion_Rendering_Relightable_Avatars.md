---
type: paper
created: 2026-05-06
updated: 2026-05-06
tags: [paper, relighting, diffusion-rendering, PBR, avatars]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.27871
---

# Diffusion Rendering for Relightable Expressive Avatars

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Diffusion Rendering for Relightable Expressive Avatars (D-Rex) |
| **作者** | Xilong Zhou |
| **发表** | arXiv cs.GR, 2026-04-30 |
| **链接** | [原文](https://arxiv.org/abs/2604.27871) |
| **DOI** | https://doi.org/10.48550/arXiv.2604.27871 |
| **代码** | https://vcai.mpi-inf.mpg.de/projects/DRex/ |

---

## 核心贡献

> 将重光照作为图像空间后处理，通过视频扩散模型的LoRA微调，实现可重光照、可驱动、具表现力的人体虚拟形象

1. 将重光照与虚拟形象建模完全解耦，作为图像空间后处理
2. 利用预训练视频扩散模型的强大生成先验
3. 通过LoRA在光场捕获的配对数据上微调
4. 可直接应用于任何白光照明的虚拟形象系统

---

## 技术方案

### 核心思想

现有可重光照虚拟形象方法依赖显式3D分解和解析反射模型，需要精确几何配准和仔细优化，限制了表现力。本方法将重光照作为图像空间后处理：从平坦光照的类albedo渲染生成目标HDR光照渲染。

### 关键技术

| 技术 | 说明 |
|------|------|
| 图像空间重光照 | 解耦重光照与虚拟形象建模 |
| 视频扩散模型 + LoRA | 利用预训练生成先验 + 轻量微调 |
| 配对数据捕获 | 光场设备捕获 flat-lit 和 relit 配对帧 |
| 白光虚拟形象 | 独立于avatar框架，支持面部动画 |

---

## 实验结论

- **数据集**: 光场捕获数据
- **基线**: 物理基础可重光照虚拟形象基线
- **结果**: 视图和时间一致的重光照，保留表情运动和精细面部细节

---

## 局限性

- 需要光场捕获设备
- 依赖预训练扩散模型

---

## 实现建议

- **实现难度**: 高（需要光场捕获和模型微调）
- **预期性能**: 高质量重光照渲染
- **适用场景**: 远程呈现、游戏、虚拟制作
