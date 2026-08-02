---
type: paper
created: 2026-08-02
updated: 2026-08-02
tags: [fluid-rendering, particle-rendering, gaussian-splatting, compression]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2607.22956
---

# ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering |
| **作者** | Bo Jiang 等 |
| **发表** | SC26 (The International Conference for High Performance Computing, Networking, Storage and Analysis) |
| **链接** | [原文](https://arxiv.org/abs/2607.22956) |
| **DOI** | Pending |
| **代码** | 未提供 |

---

## 核心贡献

> 针对大规模粒子模拟数据的可视化压缩与渲染框架

1. **多阶段多轨道训练管道**：适应大规模粒子数据的训练策略
2. **VizMapper**：轻量级网络，推理时自适应可视化参数
3. **空间块训练**：KD-tree 分解 + 全局微调

---

## 技术方案

### 核心思想

将 3D Gaussian Splatting (3DGS) 应用于科学粒子模拟数据压缩，直接优化渲染图像质量而非数据压缩率。

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Gaussian Splatting | 基于高斯基元的新型渲染表示 |
| VizMapper | 可调可视化参数的自适应网络 |
| KD-tree 分解 | 空间块训练策略 |
| HACC 宇宙模拟 | 2.81亿粒子测试数据 |

---

## 实验结论

- **数据集**: 281-million-particle HACC cosmological simulation, FIRE-2 simulation
- **基线**: SZ3 (现有有损压缩器)
- **结果**: 
  - 65x 压缩率下达到 30.03 dB PSNR
  - 比 SZ3 在相同压缩率下高出 5-8 dB
  - 单 GPU 渲染速度: 662 FPS (比 ParaView 快 2300x)

---

## 局限性

- 针对科学可视化数据，对艺术导向的流体效果可能需要调整
- 需要预先定义的物理参数进行 VizMapper 映射

---

## 相关工作

- [[3D Gaussian Splatting]]
- [[粒子系统渲染]]
- [[流体可视化]]

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 662 FPS @ 单一 GPU
- **适用场景**: 科学可视化、大规模粒子模拟、流体模拟数据压缩与渲染
