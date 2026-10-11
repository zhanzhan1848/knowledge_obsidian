---
type: paper
created: 2026-10-11
updated: 2026-10-11
tags: [paper, geometry-processing, mesh-decomposition, convex-decomposition, GPU-computing, CUDA, warp-level, physics-simulation]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2609.28731
venue: SIGGRAPH Asia 2026 (ACM TOG), arXiv 2026-09-23
arxiv_id: "2609.28731"
doi: "10.1145/3829340.3842217"
---

# CuACD: A Fully GPU-Resident Approximate Convex Decomposition

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CuACD: A Fully GPU-Resident Approximate Convex Decomposition |
| **作者** | Ruoxi Shi (et al.) |
| **发表** | SIGGRAPH Asia 2026 / ACM TOG, 2026-09-23 |
| **链接** | [arXiv:2609.28731](https://arxiv.org/abs/2609.28731) |
| **DOI** | [10.1145/3829340.3842217](https://doi.org/10.1145/3829340.3842217) |
| **领域** | 凸分解 / 网格预处理 / GPU 算法设计 |

---

## 核心贡献

> 首个**全 GPU 常驻**的近似凸分解（ACD）系统：以 warp（而非 thread / block）作为算法设计单元，把异构几何处理流水线的多阶段融合到单一 warp-resident kernel 中，配合设备端堆内存分配器，端到端避免 host round trip。

1. **Warp 级算法模板**：将异构（搜索 / mesh cutting / 凸包构造）的多阶段融合，消除 kernel 边界处的"尾波"，避免 host-device 通信
2. **设备端堆分配器**：变长中间结果在 GPU 上分配，无需 host 来回
3. **跨平台可复用 GPU 组件**：作为开源独立 CUDA 模块，可插入任何基于搜索的 ACD 流水线
4. **一个数量级加速**：在 V-HACD、PartNet-Mobility、Objaverse 子集上比 CoACD 快 10× 以上，质量匹配或更好

---

## 技术方案

### 核心问题

现代 ACD 算法（CoACD / V-HACD / VisACD）流程：

```
搜索候选切平面 → mesh cut → convex hull → 评估 → 循环
```

多阶段异构：
- 计算模式差异大：搜索是"候选集合 + 排序"；切割是"局部连通性修改"；凸包是"3D 包络"
- 各阶段输出长度不固定 → 当前实现必须 host 端分配下一阶段的输入
- VisACD 加速了"可见性"度量，但搜索/切割/凸包仍 CPU

### 核心思想：Warp as Unit of Algorithm Design

借鉴图处理社区用 warp 处理"不规则尾波"的思路：

- **同一 warp 32 线程协作**：处理一个候选切平面的整个生命周期（评估 → cut → 凸包）
- **warp 内共享内存**：同一 warp 内的 mesh 切割结果直接在 shmem 中流转
- **设备端堆**：每次阶段输出的 convex part buffer 在 GPU 上 bump-pointer 分配
- **fused kernel**：搜索 + 切 + 凸包三阶段融合到单一 kernel launch

### 关键技术

| 技术 | 说明 |
|------|------|
| Warp-resident fused kernel | 异构多阶段在同一 warp 内完成 |
| Device-side heap allocator | 变长中间结果在 GPU 上分配 |
| Search-based ACD pipeline | 候选切平面 + 评估 + 接受/拒绝 |
| Convex hull in warp | QuickHull / incremental hull 在 warp 内完成 |
| Mesh cutting | 半边结构 warp 内分裂 |

---

## 实验结论

- **数据集**: V-HACD benchmark, PartNet-Mobility, Objaverse 子集
- **基线**: CoACD（CPU SOTA），V-HACD，VisACD
- **关键结果**:
  - 速度：**>10× 加速** vs CoACD（典型 mesh CoACD 数十秒 → CuACD 数秒）
  - 质量：凸 part 数、平均凸度误差**匹配或更优**
  - 工程：开源独立 CUDA 模块，可直接替代 search-based ACD 流程的 CPU 部分

---

## 局限性

- **依赖 NVIDIA CUDA**：暂未支持 AMD / Intel GPU（架构假设 warp 协作）
- **Mesh 规模**：单 GPU 显存约束；超大 mesh 需多 GPU 扩展（未给出方案）
- **凸度度量选择**：与 CoACD 使用相同 convexity measure，未探索新的度量
- **物理仿真精度**：加速并未带来凸度度量精度提升

---

## 与本知识库其他笔记的关系

- [[PCAsplat]] - 同样把 GPU 算法推到几何处理一侧
- [[PhysLDM]] - CuACD 输出的凸 part 是物理仿真常见输入
- [[CoACD-Notes]] (待创建) - CPU baseline 算法笔记
- [[Warp-Level GPU Algorithms]] (待创建) - 主题笔记

---

## 实现建议

- **实现难度**: 高（warp 级别 CUDA 编程 + 几何数据结构设计 + 设备端堆）
- **依赖项**:
  - NVIDIA CUDA Toolkit 12.x
  - half-edge mesh 结构（自定义或基于 OpenMesh GPU 移植）
  - QuickHull / incremental 凸包（warp 内实现）
- **可复用模块**: 作者开源独立 CUDA 模块，可直接嵌入
- **预期性能**: 单 GPU 数秒级完成中等规模 mesh 凸分解
- **适用场景**: 物理仿真预处理、机器人 articulated-object 数据集生成、游戏资材烘焙

---

## 🥬 可行性结论

✅ **强烈推荐关注** — 这是 GPU 几何处理流水线的范式提升。
- 学术价值：把"warp = algorithm unit"思路从图处理跨界带到几何处理
- 工程价值：开源模块可立即用于内部 physics / collision pipeline
- 已被 **SIGGRAPH Asia 2026** 接收（ACCEPTED），是顶会成果
- 推荐下一步：评估在现有碰撞检测 / 物理仿真中的集成点，准备替换 CoACD
