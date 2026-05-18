---
title: "An efficient multi-GPU implementation for the Discontinuous Galerkin ocean model SLIM"
authors:
  - Miguel De Le Court
  - Vincent Legat
  - Ange P. Ishimwe
  - Colin Scherpereel
  - Emmanuel Hanert
  - Jonathan Lambrechts
date: 2026-05-15
arxiv_id: "2605.16082"
categories: ["cs.DC", "physics.ao-ph", "physics.comp-ph", "physics.flu-dyn"]
tags: ["CFD", "Discontinuous Galerkin", "GPU", "ocean modeling", "high-performance computing", "FEM"]
status: processed
---

# 核心贡献

提出针对 **Discontinuous Galerkin (DG)** 海洋模型 SLIM 的完整 3D GPU 加速实现，支持单卡和多卡扩展。

## 关键性能指标
- **单 NVIDIA A100** ≈ 1500 CPU cores
- **4xA100** 相比 128-core CPU 节点加速 ~50x
- 弱扩展性维持到 1024 GPUs
- 大堡礁应用：空间分辨率比现有最精确模型提升 5 倍

---

## 数值方法

### 离散化
- **方法**: Discontinuous Galerkin Finite Element (DG-FE)
- **网格**: 非结构化网格 (unstructured mesh)
- **支持局部网格细化** (local grid refinement)
- **矩阵自由求解器** (matrix-free solvers) 用于垂直方向过程

### 并行策略
- 内存布局优化 (memory layout optimization)
- 核函数级并行化 (kernel-level parallelization)
- 支持 NVIDIA 和 AMD 架构
- 元素级计算天然适合大规模并行

---

## 物理应用

- 海岸应用 (coastal applications)
- 海洋环流建模
- Great Barrier Reef 高分辨率模拟

---

## 技术亮点

1. **DG-FE 适合 GPU**: 元素逐个计算的特性与 GPU 并行架构高度契合
2. **矩阵自由方法**: 避免存储大型稀疏矩阵，降低内存压力
3. **多 GPU 通信**: 高效的 GPU 间通信策略维持扩展性
4. **实际验证**: 大堡礁案例展示工程实用性

---

## 与现有方法对比

| 方法 | 优点 | 缺点 |
|------|------|------|
| DG-FE (本文) | 高精度、几何灵活性 | 计算量大 |
| 有限体积法 | 鲁棒性好 | 精度受限 |
| 连续有限元 | 内存效率 | 自由度多 |

---

## URL
- arXiv: https://arxiv.org/abs/2605.16082
- PDF: https://arxiv.org/pdf/2605.16082

---

#metadata
#cfd #ocean-modeling #gpu-computing #discontinuous-galerkin