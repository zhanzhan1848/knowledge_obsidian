---
type: paper
created: 2026-07-20
updated: 2026-07-20
tags: [paper, 3D-Gaussians, neural-reconstruction, autonomous-driving, NVIDIA]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2607.14203
---

# Feed-Forward 3D Gaussian Reconstruction for Driving Scene Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Feed-Forward 3D Gaussian Reconstruction for Driving Scene Simulation |
| **作者** | Jiahui Huang, Jiawei Ren等 (NVIDIA) |
| **发表** | arXiv cs.GR, July 2026 |
| **链接** | [原文](https://arxiv.org/abs/2607.14203) |
| **DOI** | https://doi.org/10.48550/arXiv.2607.14203 |
| **代码** | https://research.nvidia.com/labs/sil/projects/instant-nurec/ |

---

## 核心贡献

> NVIDIA提出的Instant NuRec：一种前馈神经网络重建模型，可在单次前向传递中将短多视角驾驶日志转换为可模拟的3D Gaussian Splatting世界

1. **即时重建**: 10-20秒多摄像头场景约1.5秒重建
2. **性能提升**: 在Waymo Open Dataset上PSNR比最强基线高2.01 dB
3. **端到端集成**: 深度集成到NuRec，与AlpaSim兼容用于闭环仿真

---

## 技术方案

### 核心思想

Instant NuRec是一个前馈神经重建模型，接受校准摄像头 rig 的多视角输入，输出分层的：
- 静态3DGS层
- 动态3DGS层  
- 天空立方体贴图
- 每摄像头ISP校正

### 关键技术

| 技术 | 说明 |
|------|------|
| 3D Gaussian Splatting | 场景表示 |
| 3DGUT | 支持非针孔相机模型 |
| Multi-view输入 | 校准摄像头rig |
| Feed-forward | 单次前向传递重建 |

### 性能数据

- **重建时间**: 10-20秒场景 → ~1.5秒
- **PSNR提升**: +2.01 dB vs. 最强基线
- **数据集**: Waymo Open Dataset

---

## 应用场景

- 自动驾驶仿真平台
- 端到端策略评估
- 降低开发成本、提高安全性

---

## 局限性

1. 需要短多视角驾驶日志输入
2. 主要针对驾驶场景
3. 动态物体处理依赖于日志质量

---

## 实现建议

- **实现难度**: 高（需要深度学习+3DGS+自动驾驶知识）
- **适用场景**: 自动驾驶仿真、闭环测试、场景重建
- **推荐度**: ⭐⭐⭐⭐⭐ 自动驾驶领域的重要进展

---

## 相关工作

- NuRec (神经重建)
- 3D Gaussian Splatting
- AlpaSim (闭环仿真)
- Waymo Open Dataset
