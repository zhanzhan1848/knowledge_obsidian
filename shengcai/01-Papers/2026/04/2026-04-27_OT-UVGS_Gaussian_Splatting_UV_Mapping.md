---
type: paper
created: 2026-04-27
updated: 2026-04-27
tags: [paper, gaussian-splatting, UV-mapping, optimal-transport, rendering, Eurographics-2026]
status: processed
domain: real-time-rendering, 3DGS
agent: shengcai
source: https://arxiv.org/abs/2604.19127
---

# OT-UVGS: Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Revisiting UV Mapping for Gaussian Splatting as a Capacity Allocation Problem |
| **作者** | Byunghyun Kim et al. |
| **发表** | Eurographics 2026 Short Papers, arXiv cs.GR, 2026-04-21 |
| **链接** | [原文](https://arxiv.org/abs/2604.19127) |
| **DOI** | 10.48550/arXiv.2604.19127 |

---

## 核心贡献

> 将 UV mapping 重构为容量分配问题，提出基于最优传输的 OT-UVGS 方法，显著提升 UVGS 的 PSNR/SSIM/LPIPS

1. **问题诊断**：现有 UVGS 使用确定性球面投影分配 Gaussian 到 UV 位置，忽略全局分布，导致 UV 槽空置与密集区域碰撞并存
2. **容量分配框架**：将 UV mapping 视为固定 UV 预算下的容量分配问题
3. **OT-UVGS 方法**：轻量级一维最优传输启发式映射，全局耦合分配，保留原 UVGS 表示
4. **O(N log N) 复杂度**：基于排序实现，可作为球面 UVGS 的直接替代

---

## 技术方案

### 问题背景

UV-parameterized Gaussian Splatting (UVGS) 将非结构化 3D Gaussians 映射到规则 UV tensor，实现紧凑存储和显式容量控制。但现有方法使用确定性球面投影，忽略全局 Gaussian 分布：
- 大量 UV 槽空置
- 密集区域频繁碰撞

### 核心方法

将 UV mapping 重新解释为**固定 UV 预算下的容量分配问题**，提出 OT-UVGS：

```
关键洞察：UV 空间是固定 "budget"，每个 Gaussian 是有面积影响力的 "item"
→ 目标：将 items 分配到 slots，最大化利用率
```

采用**一维最优传输启发式映射**：
- rank-based sorting
- 分离的一维处理（先 U，再 V）
- 全局耦合分配

### 算法复杂度

- **O(N log N)** for N Gaussians
- 可作为球面 UVGS 的 drop-in replacement

---

## 实验结论

在 **184 个 object-centric 场景 + Mip-NeRF 数据集**上统一改进：
- **PSNR** 提升
- **SSIM** 提升  
- **LPIPS** 提升

改进伴随：
- 更高非空槽比例
- 更少碰撞
- 更高 Gaussian 保留率

结论：**仅重新审视映射方法就能释放 UVGS 潜在容量的相当大一部分**

---

## 可行性分析

| 维度 | 评估 |
|------|------|
| **实现难度** | 低 — O(N log N) 排序，直接替代现有 UVGS |
| **实用性** | 高 — 改善渲染质量/存储效率，适用于所有 UVGS 应用 |
| **代码可用性** | 待确认（Eurographics Short Paper） |
| **与渲染管线集成** | 直接替代球面投影，无需修改渲染器 |

---

## 相关工作

- UVGS (原始): Spherical projection UV mapping
- Gaussian Splatting (3DGS): 基础表示
- Optimal Transport: 用于全局分配优化

## 标签

#渲染 #3DGS #UV映射 #最优传输 #Eurographics2026 #2026
