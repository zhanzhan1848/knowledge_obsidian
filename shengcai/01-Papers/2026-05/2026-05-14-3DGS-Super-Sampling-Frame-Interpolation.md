---
type: paper
created: 2026-05-14
updated: 2026-05-14
tags: [paper, 3DGS, super-sampling, frame-interpolation, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.11489
---

# Joint Super Sampling and Frame Interpolation for Real-Time Large-Scale 3DGS Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Joint Super Sampling and Frame Interpolation for Real-Time Large-Scale 3DGS Rendering |
| **作者** | Youcheng Cai |
| **发表** | arXiv cs.GR, 2026-05-12 |
| **链接** | [原文](https://arxiv.org/abs/2605.11489) |

---

## 核心贡献

> 一句话总结：提出3DGS³框架，通过后处理联合执行超采样和帧插值，实现高分辨率高帧率渲染

1. **3DGS³框架**: 统一的后渲染框架，联合执行超采样和帧插值
2. **GASS模块**: 梯度感知超采样，使用3DGS连续可微性提取图像梯度引导GRU细化网络
3. **LTFI模块**: 轻量时域帧插值，基于紧凑U-Net-like骨架融合时域线索

---

## 技术方案

### 核心思想

3DGS可实现高质量实时3D渲染，但在超密集场景和高分辨率下面临计算瓶颈。3DGS³不优化splatting管线本身，而是通过可微分处理低分辨率输出实现超采样和帧插值。

### 关键技术

| 技术 | 说明 |
|------|------|
| GASS (梯度感知超采样) | 提取图像梯度引导GRU细化网络实现高保真超采样 |
| LTFI (轻量时域帧插值) | 紧凑U-Net-like骨架，融合时域和可微分空间线索合成时间连贯的中间帧 |
| 可微分后处理 | 不修改原始splatting管线 |

---

## 实验结论

- 在公开数据集上优于SOTA方法
- 与现有3DGS加速技术兼容
- 优越的渲染效率和视觉质量

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 高分辨率高帧率
- **适用场景**: 实时渲染、大规模场景、延迟敏感应用

---