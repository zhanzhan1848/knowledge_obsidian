---
type: paper
created: 2026-08-30
updated: 2026-08-30
tags: [paper, rendering, PBR, ray-tracing, mesh-reconstruction]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2608.24109
---

# From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition (ExMesh++)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | From Multi-View Images to Relightable UV-PBR Mesh Assets via Topology-Adaptive Reconstruction and Decomposition |
| **作者** | Chuanjin Fan 等 |
| **发表** | arXiv cs.GR, 2026-08-26 |
| **链接** | [原文](https://arxiv.org/abs/2608.24109) |
| **DOI** | https://doi.org/10.48550/arXiv.2608.24109 |

---

## 核心贡献

> 从多视角图像重建可重光照的 UV-PBR 网格资产生态系统

1. **拓扑自适应网格重建**：通过自适应顶点分裂与合并，在拓扑变化时保持 UV 一致性
2. **UV-PBR 材质优化**：在稳定网格-UV 载体上联合优化 UV 空间 PBR 材质图与环境光照
3. **次级光线追踪间接光照**：通过次级光线追踪（secondary-ray tracing）建模单跳漫反射间接光照，使用共享的 UV-PBR 材质

---

## 技术方案

### 核心思想

现有方法从隐式场、高斯原语或其他中间表示重建曲面，再转换为 PBR 网格时通常需要表面提取和纹理烘焙。ExMesh++ 提出两阶段框架：

1. **第一阶段**：细化显式网格几何和拓扑，通过自适应顶点分裂/合并保持 UV 一致性
2. **第二阶段**：固定网格-UV 载体，联合优化 UV 空间 PBR 材质图和环境光照

### 关键技术

| 技术 | 说明 |
|------|------|
| 拓扑自适应 | 顶点分裂/合并时保持 UV 一致性 |
| UV-PBR 载体 | 稳定的网格-UV 载体用于材质优化 |
| 次级光线追踪 | secondary-ray tracing 建模单跳漫反射间接光照 |
| 环境光照估计 | 与 PBR 材质联合优化 |

---

## 公式

光照传输模型：单跳漫反射间接光照通过次级光线追踪计算：

```math
L_{indirect}(x, \omega_o) = \int_{\Omega} f_r(x, \omega_i, \omega_o) L_i(x, \omega_i) (\omega_i \cdot n) d\omega_i
```

其中 $f_r$ 为 BRDF 材质，$L_i$ 为入射辐照度。

---

## 实验结论

- **几何精度**：具有竞争力的几何准确性
- **重光照性能**：强大的重光照表现
- **DCC 工作流兼容**：可直接导出为标准 DCC 工作流中的资产

---

## 局限性

- 单跳间接光照（次级光线追踪），不包含多跳全局光照
- 材质分解仍可能存在歧义

---

## 实现建议

- **实现难度**: 中高
- **预期性能**: 离线处理，适合资产生成流水线
- **适用场景**: 电影/游戏资产生成、可重光照 3D 重建、数字孪生

---

## 相关工作

- [[EAG-PT]] - Emission-Aware Gaussians and Path Tracing
- [[TRON]] - Tracing Rays to Orchestrate a Neural Renderer
- [[HoloPathTracer]] - Wave Path Tracing for Holography

---

## 与渲染领域的关联

本文使用 **次级光线追踪（secondary-ray tracing）** 计算单跳漫反射间接光照，属于 **路径追踪（path tracing）** 的简化版本。与以下技术相关：
- PBR 材质系统
- 环境光照映射
- 网格 UV 参数化
- 逆渲染中的材质分解
