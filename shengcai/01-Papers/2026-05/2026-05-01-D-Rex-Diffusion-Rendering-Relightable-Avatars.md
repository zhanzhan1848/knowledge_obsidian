---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [paper, rendering, relighting, avatar, diffusion, neural-rendering]
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
| **作者** | Xilong Zhou (MPII), et al. |
| **发表** | arXiv cs.GR, April 30, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.27871) |
| **DOI** | 10.48550/arXiv.2604.27871 |
| **代码** | https://vcai.mpi-inf.mpg.de/projects/DRex/ |

---

## 核心贡献

> 提出将重光照完全解耦于化身建模，通过图像空间后处理和预训练视频扩散模型的微调，实现可重光照、表情丰富的人体全身化身渲染。

1. **解耦重光照策略**：将重光照作为图像空间后处理，完全独立于化身建模
2. **扩散先验利用**：利用预训练视频扩散重光照模型的强大生成先验
3. **白光源化身兼容**：flat-lit驱动帧可由任何白光源化身系统生成，直接适用

---

## 技术方案

### 核心思想

现有可重光照全身化身方法依赖显式3D固有分解和解析反射模型，需要精确几何配准和仔细优化才能捕捉真实光传输效果。这种紧耦合限制了表情表现力。

**本文方法**：将重光照完全解耦为图像空间后处理——从 flat-lit、albedo-like 渲染到目标HDR照明的学习翻译。

### 关键技术

| 技术 | 说明 |
|------|------|
| LoRA微调 | 在light stage采集的paired数据上微调预训练视频扩散模型 |
| Flat-lit驱动帧 | 由独立的表情全身化身框架在白光条件下生成 |
| 图像空间翻译 | 学习从flat-lit到relit的映射，无需修改底层avatar系统 |
| 视图/时间一致性 | 通过扩散模型保证多视角和时间上的重光照一致性 |

---

## 实验结论

- **质量**：outperforms物理基可重光照化身基线
- **表情保真度**：保留表情动作和精细面部细节
- **视图一致性**：view-consistent relighting
- **零样本适用性**：适用于任何白光源化身系统

---

## 局限性

- 依赖light stage采集数据
- 对扩散模型质量有依赖

---

## 实现建议

- **实现难度**: 中（需LoRA微调，依赖light stage数据）
- **预期性能**: 高质量重光照，实时性取决于基础avatar系统
- **适用场景**: 远程呈现、游戏、虚拟制作

---

## 标签

#渲染 #重光照 #神经渲染 #扩散模型 #化身
