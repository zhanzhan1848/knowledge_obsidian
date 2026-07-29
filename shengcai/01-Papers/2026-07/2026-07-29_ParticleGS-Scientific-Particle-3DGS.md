---
type: paper
created: 2026-07-29
updated: 2026-07-29
tags: [paper, 3DGS, compression, rendering, scientific-visualization, particle]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.22956
---

# ParticleGS: 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 3D Gaussian Splatting for Scientific Particle Data Compression and Rendering |
| **作者** | Bo Jiang, Youyuan Liu, Taolue Yang, Sheng Di, Sian Jin |
| **机构** | （见论文） |
| **发表** | SC 2026 (accepted) |
| **链接** | [原文](https://arxiv.org/abs/2607.22956) |
| **PDF** | [下载](https://arxiv.org/pdf/2607.22956) |

---

## 核心贡献

> 将 3DGS 应用于科学粒子数据压缩，直接优化渲染图像质量而非数据空间误差，实现 65× 压缩比下 30dB PSNR，662 FPS 渲染

1. **可视化感知压缩框架**：基于 3DGS 学习紧凑表示，直接优化渲染图像质量而非粒子坐标重建误差

2. **多阶段多轨道训练管道**：VizMapper 轻量网络可在推理时适应用户指定的渲染参数（粒子半径、不透明度）

3. **空间块训练**：KD-tree 分解 + 全局微调，实现 2.81 亿粒子 HACC 宇宙学模拟的压缩和高质量渲染

---

## 技术方案

### 核心问题
- 传统有损压缩（SZ3, ZFP, MGARD）操作数据空间，无法保证下游可视化保真度
- SZ3 65× 压缩仅达 ~24.7 dB PSNR，且产生轴对齐条纹伪影
- ParaView 渲染 2.81 亿粒子仅 0.28 FPS

### ParticleGS 架构
```
281M 粒子 HACC 数据
    ↓
多阶段多轨道训练
    ├─ 阶段1: 基础 Gaussian 分布学习
    ├─ 阶段2: 细化 + 参数分离
    └─ 阶段3: 全局微调
    ↓
VizMapper（轻量网络）
    └─ 推理时适应用户渲染参数
    ↓
KD-tree 空间块分解（8块并行）
    ↓
3DGS 光栅化渲染
```

### 性能数据
| 指标 | 数值 |
|------|------|
| 压缩比 | 65× |
| PSNR | 30.03 dB |
| vs SZ3 增益 | +5~8 dB |
| 渲染速度 | 662 FPS (单 GPU) |
| vs ParaView 加速 | 2,300× |

### 可调渲染参数
- 粒子半径（揭示不同尺度结构）
- 粒子不透明度
- 视角切换

---

## 实验结论

- 281M 粒子 HACC 宇宙学模拟：65× 压缩达 30.03 dB PSNR，优于 SZ3 5-8 dB
- 泛化到额外 HACC 区域和 FIRE-2 暗物质模拟，无需调优
- 662 FPS 渲染比 ParaView 快 2,300×
- SC 2026 接收

---

## 局限性

- 主要针对宇宙学 N 体模拟粒子，对其他类型粒子数据（分子动力学等）未验证
- VizMapper 的泛化能力受训练分布限制
- 3DGS 压缩会丢失粒子物理属性（如质量、速度）

---

## 可行性分析

| 维度 | 评分 |
|------|------|
| **创新性** | ⭐⭐⭐⭐ 可视化感知压缩是连接科学计算和渲染的新思路 |
| **实用性** | ⭐⭐⭐⭐⭐ 直接影响科学可视化工作流，性能提升显著 |
| **实现难度** | ⭐⭐⭐ 中等，核心是 3DGS 训练流程定制 |
| **适用场景** | 科学可视化、宇宙模拟、分子动力学可视化 |

**推荐结论**: ✅ 推荐实现（适合科学可视化渲染系统参考）

---

## 相关工作

- SZ3 (scientific lossy compressor)
- ZFP / MGARD
- 3D Gaussian Splatting (Kerbl et al., 2023)
- ParaView (scientific visualization)
- HACC (N-body cosmology code)
- FIRE-2 (galaxy formation)

---

## 标签

#渲染 #3DGS #压缩 #科学可视化 #粒子模拟 #实时渲染 #2026 #SC2026
