---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [paper, point-cloud, particle, compression, 3DGS]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2607.22956
---

# ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering |
| **作者** | Bo Jiang et al. |
| **发表** | arXiv cs.GR, SC26 |
| **链接** | [原文](https://arxiv.org/abs/2607.22956) |
| **DOI** | 10.48550/arXiv.2607.22956 |
| **代码** | 待查 |

---

## 核心贡献

> 基于3DGS的粒子数据压缩框架，直接优化渲染图像质量，在28亿粒子数据上实现65倍压缩

1. **可视化感知压缩**：直接优化渲染质量而非数据保真度
2. **多轨道多阶段训练**：Multi-orbit training pipeline
3. **VizMapper**：轻量级网络，推理时适配用户指定的可视化参数

---

## 技术方案

### 核心思想

大规模粒子模拟产生海量粒子数据（数亿级别），给存储、传输和交互可视化带来挑战：
- 现有有损压缩器（如SZ3）在数据空间操作
- 无法保证下游可视化保真度

ParticleGS 方案：
- 基于 3D Gaussian Splatting 学习紧凑表示
- 直接优化渲染图像质量
- 支持可视化参数调整

### 关键技术

| 技术 | 说明 |
|------|------|
| Multi-stage Multi-orbit Training | 多阶段多轨道训练 |
| VizMapper | 轻量级可视化参数映射网络 |
| Spatial Block Training | 空间块训练 + KD-tree 分解 |
| Global Fine-tuning | 全局微调 |

---

## 实验结果

| 数据 | 结果 |
|------|------|
| HACC宇宙学模拟 (2.81亿粒子) | 30.03 dB PSNR @ 65x压缩 |
| 对比SZ3 | 同样压缩比下 PSNR 高5-8 dB |
| 渲染速度 | 662 FPS (单GPU)，比ParaView快2300倍+ |

---

## 实现建议

- **实现难度**: 中等
- **相关技术**: 3D Gaussian Splatting, 点云压缩
- **应用场景**: 科学可视化, 宇宙模拟, 粒子系统

---

## 相关笔记

- [[Point Cloud Compression]]
- [[3D Gaussian Splatting]]
- [[Scientific Visualization]]
