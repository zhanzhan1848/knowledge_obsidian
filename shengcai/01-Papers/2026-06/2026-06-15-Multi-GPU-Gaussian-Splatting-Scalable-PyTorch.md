---
type: paper
created: 2026-06-15
updated: 2026-06-15
tags: [paper, gaussian-splatting, multi-gpu, large-scale, distributed-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.11390
---

# A Scalable PyTorch Abstraction for Multi-GPU Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Scalable PyTorch Abstraction for Multi-GPU Gaussian Splatting |
| **作者** | Matthew Cong et al. |
| **发表** | arXiv cs.CV, June 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.11390) |
| **DOI** | Pending |
| **代码** | N/A |

---

## 核心贡献

> 通过 PyTorch 后端实现多 GPU Gaussian splatting，将重建扩展到更高分辨率和更大场景

1. **PyTorch 原生抽象** - 将多个 GPU 作为聚合 PyTorch 设备暴露
2. **CUDA 统一内存 + NVLink** - 分布式 Gaussian 参数和 splatting 操作
3. **十亿级 Gaussians** - 城市级重建，超过当前 SOTA 25 倍以上

---

## 技术方案

### 核心思想

问题：Gaussian splatting 方法受限于计算和内存约束，难以扩展到高分辨率和大规模场景。

解决方案：
- 多 GPU 并行 Gaussian splatting
- PyTorch 后端分布式 Gaussian 参数
- CUDA unified memory + NVLink 提供高带宽通信
- 操作级分布，模型代码无需显式跨设备通信

### 关键技术

| 技术 | 说明 |
|------|------|
| PyTorch 抽象层 | 聚合多 GPU 为单一设备 |
| CUDA 统一内存 | 跨 GPU 共享内存访问 |
| NVLink | 高带宽 GPU 互联 |
| 操作级并行 | splatting operator 分布 |

---

## 实验结论

- **规模**: 城市级重建，街道级细节
- **Gaussians 数量**: 超过 **10 亿**（1B+）
- **对比**: 超过当前 SOTA **25 倍** 以上
- **应用**: 大规模 3D 重建、城市 mapping、VR/AR

---

## 局限性

- 需要 NVLink 支持（高端 GPU 配置）
- 同步开销可能限制极致规模
- 依赖特定硬件拓扑

---

## 相关工作

- [[3D Gaussian Splatting]] - 基础方法
- [[Multi-GPU Rendering]] - 多 GPU 渲染
- [[Large-Scale Reconstruction]] - 大规模重建

---

## 实现建议

- **实现难度**: 中高（需要 CUDA 编程和分布式系统知识）
- **预期性能**: 线性扩展到 GPU 数量
- **适用场景**: 城市级 3D 重建、电影级场景采集、自动驾驶数据处理