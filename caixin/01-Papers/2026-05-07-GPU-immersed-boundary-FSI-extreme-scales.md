# GPU-Accelerated Simulations of Moving Boundaries and FSI at Extreme Scales

**arXiv**: [2605.04335](https://arxiv.org/abs/2605.04335)  
**日期**: 2026-05-05  
**Subjects**: Computational Physics (physics.comp-ph); Distributed Computing (cs.DC); Fluid Dynamics (physics.flu-dyn)

---

## 核心贡献

提出**sharp-interface immersed boundary方法**的GPU优化实现，实现O(10亿)网格规模流固耦合模拟。

---

## 方法框架

### ViCar3D框架
基于笛卡尔网格上的sharp-interface immersed boundary方法

### 并行化技术
| 层级 | 技术 |
|------|------|
| GPU加速 | OpenACC, CUDA |
| 多GPU通信 | NCCL |
| 节点间通信 | MPI |

---

## 性能结果

### 单GPU加速
- **20X speedup** vs 现有CPU实现
- 网格规模: O(10M) → O(1B) points

### 多GPU扩展
- **>90% strong scaling efficiency**
- **>90% weak scaling efficiency**
- CUDA streams + NCCL communicators优化

---

## 验证案例

### 湍流流固耦合
- **Re = 5000** 下蝙蝠翼扑动
- 模拟飞行中的流体流动和耦合响应

### 复杂静止/运动物体
- 任意复杂几何
- 移动和变形边界

---

## 数值方法

| 组件 | 方法 |
|------|------|
| 界面追踪 | Sharp-interface immersed boundary |
| 离散化 | 笛卡尔网格 |
| 湍流 | LES (implicit) |
| 耦合 | 双向流固耦合 |

---

## 关键创新

1. **Sharp-interface精度**: 无需加密网格或平滑界面
2. **GPU-first设计**: 从头GPU并行
3. **混合并行**: CUDA+MPI+NCCL协同
4. **极端规模**: 突破10亿网格瓶颈

---

## 与OpenFOAM/商业软件的差异

| 特性 | OpenFOAM等 | 本文 |
|------|-----------|------|
| 界面处理 | 滑移/浸没边界 | Sharp-interface |
| GPU支持 | 有限 | 原生CUDA/OpenACC |
| 规模 | ~千万级 | ~十亿级 |
| FSI | 需要特殊求解器 | 内置耦合 |

---

## 应用场景

- 飞行器气动弹性
- 旋转机械
- 航行器设计
- 生物流体力学

---

## 备注

- 22 pages
- 提交至 Torque 2026
