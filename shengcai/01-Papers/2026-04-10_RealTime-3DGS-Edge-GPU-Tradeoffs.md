---
type: paper
created: 2026-04-10
updated: 2026-04-10
tags: [paper, gaussian-splatting, real-time-rendering, 3DGS, GPU-optimization, edge-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.07177
---

# Exploring Performance-Energy Trade-offs in Real-Time 3D Gaussian Splatting under Constrained GPU Budgets

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Exploring Performance-Energy Trade-offs in Real-Time 3D Gaussian Splatting under Constrained GPU Budgets |
| **作者** | Anand Bhojan 等 |
| **发表** | arXiv cs.GR, 2026-04-08 |
| **链接** | [原文](https://arxiv.org/abs/2604.07177) |
| **DOI** | 10.48550/arXiv.2604.07177 |
| **代码** | - |

---

## 核心贡献

> 通过 GPU 频率降频和功耗封顶模拟不同 GPU 能力等级，系统分析 3DGS 实时光栅化在边缘客户端（移动/嵌入式到高端消费级 GPU）的性能-能耗权衡，为边缘部署的可行性提供量化依据。

1. **GPU 能力等级模拟方法**：通过降频和功耗封顶在单一高端 GPU 上模拟多档性能，测量 FPS-功耗曲线、每帧能耗、性能/瓦特
2. **3DGS 边缘部署分析**：覆盖嵌入式/移动级到高端消费级 GPU 的性能包络
3. **大规模场景实验**：不同复杂度场景、多管线配置和优化技术

---

## 技术方案

### 核心思想

采用 emulation-based 方法评估 3DGS 实时光栅化在边缘客户端的可行性。通过 GPU 核心频率降频和功耗封顶模拟不同 GPU 能力等级，在单一高阶 GPU 上复现多档性能表现，系统测量帧率、运行时行为和功耗。

### 关键实验设置

| 模拟档位 | 描述 |
|------|------|
| 嵌入式/移动级 | 低频率 + 低功耗上限 |
| 中端移动/平板 | 中频率 + 中功耗上限 |
| 高端消费级 | 高频率 + 较高功耗上限 |
| 旗舰/桌面级 | 标称频率和功耗 |

### 测试场景

- 不同复杂度 3DGS 场景
- 不同 Gaussian Splat 数量
- 多种管线和优化配置

### 测量指标

- **FPS-功耗曲线**：性能与功耗的关系
- **每帧能耗 (Joules/frame)**：能效指标
- **性能/瓦特 (FPS/W)**：能效比

---

## 实验结论

- 系统揭示了 3DGS 从嵌入式/移动设备到高端消费级 GPU 的性能包络
- 边缘设备（VR 头显、瘦客户端）存在明确的可行下界
- 能耗与渲染质量（Gaussian 数量）存在可量化的权衡曲线

---

## 局限性

- Emulation 方式可能不完全准确反映真实硬件特性
- 限于实时 3DGS 光栅化，未涉及路径追踪等高质量渲染
- 功耗测量受 GPU 架构差异影响

---

## 实现建议

- **实现难度**：低（评估/分析类工作，无需新算法实现）
- **预期性能**：提供边缘部署的能耗基准数据
- **适用场景**：移动端 3DGS 渲染优化、VR/AR 头显、边缘计算

---

## 相关工作

- [[3D Gaussian Splatting]] - 3DGS 基础技术
- [[Real-time Rasterization]] - 实时光栅化
- [[GPU Power Management]] - GPU 功耗管理
- [[Edge Rendering]] - 边缘渲染
