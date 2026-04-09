---
tags: [渲染, 云渲染, 3DGS, 实时渲染]
date: 2026-04-09
status: 待读
---

# Streaming Real-Time Rendered Scenes as 3D Gaussians

## 元信息
| 标题 | Streaming Real-Time Rendered Scenes as 3D Gaussians |
| 作者 | Matti Siekkinen et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2604.02851) |
| 领域 | Cloud rendering, 3D Gaussian Splatting, Real-time rendering |
| 提交日期 | 2026-04-03 |

## 核心贡献
1. 提出基于 3D Gaussian Splatting (3DGS) 的云渲染替代方案,替代传统的 2D 视频流传输
2. Unity 原型实现:服务器端从实时渲染参考视图构建并连续优化 3DGS 模型
3. 支持重光照(relighting)和刚体动态的增量更新流式传输
4. 客户端本地重建 Gaussian 模型并从接收到的表示渲染当前视角

## 技术方案

### 核心思想
传统云渲染传输 2D 视频流,视角受限于服务器渲染视角。本文提出传输 live 3DGS 场景表示的替代方案。

### 系统架构
```
Unity 游戏引擎
    ↓
参考视图捕获 (输入相机 + 参考相机)
    ↓
高斯初始化 (位置、缩放、四元数、SH系数)
    ↓
连续优化 (异步优化线程)
    ↓
流式传输 (全量快照 + 增量更新)
    ↓
客户端重建 + 本地渲染
```

### 关键技术点
- **在线高斯模型构建**: 从游戏引擎原生数据在线构建 3DGS 表示,无需离线 SfM/摄影测量
- **增量更新**: 支持 relighting 和 rigid object dynamics
- **带宽优化**: 全量快照 + 增量更新混合传输

## 公式
(论文中包含优化目标函数和损失函数设计)

## 实验结论
- 相比 depth-based reprojection baseline 提供更好的视觉质量收敛
- 支持动态场景的多用户场景建模 amortized cost 降低

## 局限性
- 主要针对刚体动态,对复杂变形场景支持有限
- 需要游戏引擎端明确提供几何和外观数据

## 相关笔记
- [[2026-04-06_Streaming-3DGS-Cloud-Rendering]] (相关早期工作)

## 链接
- [arXiv HTML](https://arxiv.org/html/2604.02851v1)
- [PDF](https://arxiv.org/pdf/2604.02851)

---

#标签 #云渲染 #3DGS #实时渲染 #2026-04
