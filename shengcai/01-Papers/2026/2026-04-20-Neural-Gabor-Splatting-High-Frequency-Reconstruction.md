---
type: paper
created: 2026-04-20
updated: 2026-04-20
tags: [paper, rendering, Gaussian-splatting, neural-rendering, high-frequency, CVPR-2026, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.15941
---

# Neural Gabor Splatting: Enhanced Gaussian Splatting with Neural Gabor for High-frequency Surface Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Gabor Splatting: Enhanced Gaussian Splatting with Neural Gabor for High-frequency Surface Reconstruction |
| **作者** | Haato Watanabe, Nobuyuki Umetani |
| **发表** | arXiv cs.CV/cs.GR, April 2026 (Accepted to CVPR 2026) |
| **链接** | [原文](https://arxiv.org/abs/2604.15941) |
| **DOI** | https://doi.org/10.48550/arXiv.2604.15941 |

---

## 核心贡献

> 为解决 3DGS 高频外观细节下原语数量爆炸问题，为每个 Gaussian 原语添加轻量级 MLP，通过 Gabor 滤波器建模单原语内的颜色变化

1. **Neural Gabor Splatting**：为每个 Gaussian 原语添加 MLP，使用 Gabor 滤波器建模宽范围颜色变化
2. **频率感知致密化策略**：基于频率能量的错配原语剪枝和克隆选择，控制原语数量
3. **高频表面精确重建**：在挑战性高频表面（如棋盘格）上实现精确重建

---

## 技术方案

### 问题
- 3DGS 的显式表示（Gaussian primitives）支持快速训练、实时渲染和便捷后处理
- **关键缺陷**：高频外观细节场景中，原语数量急剧增长
- 每个原语只能表示单一颜色，导致每个锐利颜色过渡需要多个原语

### 解决方案

#### 1. Neural Gabor Splatting
- 为每个 Gaussian 原语配备轻量级 MLP
- MLP 在单个原语内建模宽范围颜色变化
- Gabor 滤波器提供方向性高频特征

#### 2. 频率感知致密化（Frequency-aware Densification）
- 基于频率能量选择错配原语进行剪枝和克隆
- 控制原语数量，避免爆炸
- 保留高频细节同时保持效率

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Gaussian Splatting | 基于原语的显式场景表示 |
| Gabor Filter | 方向性带通滤波器，捕获高频特征 |
| MLP | 轻量级神经网络，嵌入每个原语 |
| Frequency-aware Densification | 基于频率的致密化策略 |

---

## 实验结论

- **数据集**：Mip-NeRF360、高频数据集（棋盘格等）
- **结果**：在高频表面实现精确重建
- **对比**：消融实验验证方法有效性

---

## 局限性

- MLP 增加了计算开销
- 需要额外的训练步骤学习 MLP 参数
- 对低频场景可能不如标准 3DGS 高效

---

## 实现建议

- **实现难度**：中（需要修改 3DGS 原语结构）
- **预期性能**：高频场景下原语数量大幅减少，整体效率提升
- **适用场景**：高频材质、复杂纹理、细节丰富的场景重建
- **推荐度**：⭐⭐⭐⭐⭐ 强烈推荐，对 3DGS 质量提升显著
