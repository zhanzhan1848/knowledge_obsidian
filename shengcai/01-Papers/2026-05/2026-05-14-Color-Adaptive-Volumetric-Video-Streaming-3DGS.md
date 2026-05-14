---
type: paper
created: 2026-05-14
updated: 2026-05-14
tags: [paper, 3DGS, volumetric-video, streaming, LOD, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2605.09279
---

# Color-Adaptive Volumetric Video Streaming with Dynamic 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Color-Adaptive Volumetric Video Streaming with Dynamic 3D Gaussian Splatting |
| **作者** | (待获取) |
| **发表** | SIGGRAPH 2026 Conference Paper, arXiv cs.GR, 2026-05-10 |
| **链接** | [原文](https://arxiv.org/abs/2605.09279) |
| **代码** | https://github.com/yindaheng98/ColorAdaptiveGaussianSplatting |

---

## 核心贡献

> 一句话总结：提出颜色自适应方案，使用向量量化建立LoD，用低分辨率参考图像校正颜色失真

1. **Color-Adaptive Scheme**: 使用VQ建立LoD，用参考图像校正颜色失真
2. **CAGS系统**: 自适应体视频流系统，兼容多种高斯表示
3. **服务器端参考图像渲染 + 客户端颜色恢复**: 架构分离

---

## 技术方案

### 核心思想

3DGS用于实时照片级渲染，但面临带宽消耗挑战。现有LoD方法基于密度，不适合高斯表示。激进属性压缩会导致颜色失真，可用参考图像有效校正。

### 关键技术

| 技术 | 说明 |
|------|------|
| 向量量化(VQ) LoD | 建立多级细节，控制带宽 |
| 颜色失真校正 | 使用低分辨率参考图像 |
| 颜色自适应渲染 | 服务器渲染参考图像，客户端恢复 |

### 性能数据

- PSNR提升5~20 dB（对比现有自适应流系统）
- 操作显著快于现有可扩展高斯压缩方法
- 适应不同高斯表示

---

## 局限性

- 依赖参考图像质量
- 带宽波动下性能有波动

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 高质量低带宽
- **适用场景**: 体视频流、远程存在、机器人遥操作

---