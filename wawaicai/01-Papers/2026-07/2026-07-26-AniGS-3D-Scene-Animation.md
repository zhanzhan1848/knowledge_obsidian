---
type: paper
created: 2026-07-26
updated: 2026-07-26
tags: [paper, 3DGS, scene-animation, video-diffusion, ambient-motion]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.18539
---

# AniGS: Bridging Rendering and Diffusion Prior for 3D Scene Animation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AniGS: Bridging Rendering and Diffusion Prior for 3D Scene Animation |
| **作者** | (Multiple authors from Waymo, Meta, UIUC) |
| **发表** | arXiv (2026-07) |
| **链接** | [原文](https://arxiv.org/abs/2607.18539) |

---

## 核心贡献

> 为大尺度复杂场景的 3DGS 重建添加环境动态（植被运动等），同时保持刚性结构

1. **场景级动画**: 超越单一物体，扩展到大尺度可导航场景
2. **Canonical 3DGS + Deformation Field**: 表示场景几何和时间条件变形场
3. **视频扩散模型**: 利用预训练视频扩散模型提供运动线索
4. **迭代 Dataset-Model 更新**: 扩展视角覆盖，反复更新训练视频
5. **组合 Video-to-Video 精化**: 限制运动到目标区域，防止静态区域伪影

---

## 技术方案

### 核心思想

现有 3D 动画技术局限于物体级或小区域。AniGS：
- Canonical 3DGS 表示场景几何和外观
- 时间条件变形场建模合成的运动
- 预训练视频扩散模型提供运动先验
- Render-and-refine 策略

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Gaussian Splatting | 场景表示 |
| Video Diffusion | 运动先验 |
| Deformation Field | 时间条件变形 |
| Novel View Rendering | 新视角合成 |

---

## 实验结论

- **数据集**: 5 个真实大尺度室外场景
- **结果**: 自然环境动态 + 高质量新视角视频

---

## 知识点

- #3DGS #scene-animation #video-diffusion #ambient-motion #novel-view
