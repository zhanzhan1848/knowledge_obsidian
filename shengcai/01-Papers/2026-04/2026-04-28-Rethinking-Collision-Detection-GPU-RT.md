---
type: paper
created: 2026-04-28
updated: 2026-04-28
tags: [paper, ray-tracing, BVH, collision-detection, GPU, Purdue]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.23520
---

# Rethinking Collision Detection on GPU Ray Tracing Architecture

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Rethinking Collision Detection on GPU Ray Tracing Architecture |
| **作者** | Durga Mandarapu, Isaac Fuksman, Artem Pelenitsyn, Gilbert Bernstein, Milind Kulkarni |
| **发表** | arXiv cs.GR (2026), ICS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.23520) |
| **DOI** | 10.1145/3797905.3807836 |
| **代码** | https://github.com/MDurgaKeerthi/Mochi-DCD-on-RT |
| **机构** | Purdue University, University of Washington |

---

## 核心贡献

> 提出 Mochi，一种利用 GPU 光线追踪架构加速离散碰撞检测的新 reduction，支持非均匀半径球体

1. 发现现有 RT-based DCD 方法的根本局限：将 DCD 简化为固定半径邻居搜索不适用于非均匀球体
2. 提出利用碰撞关系对称性的 sound reduction，通过 proxy spheres 实现更紧凑的包围盒
3. 集成到 DEM 粒子模拟管线，大规模测试显示显著性能提升

---

## 技术方案

### 核心思想

**关键洞察**：碰撞关系是对称的，只需检测一次即可（而非 prior work 要求双方独立检测）

### 现有方法问题

现有 RT-based DCD 将 DCD 简化为 neighbor search：
- 对均匀半径球体有效
- 对非均匀半径球体失效：需要过大的统一包围球，导致大量重复碰撞检测

### Mochi 方法

引入 **per-object proxy spheres**：
- 分离 BVH 包围体积与碰撞搜索半径
- 每个球体使用独立的 proxy sphere（比实际球体+碰撞半径更紧凑）
- 保持正确性：只要求碰撞对的一侧检测碰撞

### 关键技术

| 技术 | 说明 |
|------|------|
| Symmetry exploitation | 利用碰撞对称性，只需检测一次 |
| Proxy sphere | 独立 proxy sphere 实现紧凑包围盒 |
| Sound reduction | 形式化证明无 true collision 遗漏 |
| DEM pipeline | 集成到离散单元方法粒子模拟 |

### 与 prior work 关系

NNS-based uniform-radius 方法是 Mochi 的特例

---

## 实验结论

- 在大规模粒子工作负载上一致加速
- 超越 SOTA BVH-based 和 RT-based DCD 实现
- 支持 uniform 和 non-uniform 球体
- 代码开源：https://github.com/MDurgaKeerthi/Mochi-DCD-on-RT

---

## 局限性

- 限于球体几何（不直接支持三角形网格）
- 依赖 GPU RT 架构硬件

---

## 相关工作

- BVH-based DCD
- RT-based neighbor search (Zhao et al.)
- GPU particle simulation
- DEM (Discrete Element Method)

---

## 实现建议

- **实现难度**: 中
- **预期性能**: 大规模粒子模拟显著加速
- **适用场景**: 粒子模拟、流体仿真、Granular materials

---

## 标签

#渲染 #光线追踪 #BVH #碰撞检测 #GPU #粒子模拟 #Purdue
