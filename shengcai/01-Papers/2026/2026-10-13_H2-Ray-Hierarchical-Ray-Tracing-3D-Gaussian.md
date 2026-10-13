---
type: paper
created: 2026-10-13
updated: 2026-10-13
tags: [paper, ray-tracing, bvh, 3d-gaussian, hardware, real-time, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.13498
---

# H2-Ray: A Hybrid and Hierarchical Ray Tracing Method for Efficient 3D Gaussian Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Hybrid and Hierarchical Ray Tracing Method for Efficient 3D Gaussian Rendering |
| **作者** | Tiancheng Zhao et al. |
| **发表** | arXiv 2026-10 |
| **链接** | [原文](https://arxiv.org/abs/2610.13498) |
| **DOI** | 10.48550/arXiv.2610.13498 |
| **代码** | - |

---

## 核心贡献

> 针对 3D Gaussian Splatting (3DGS) 的光线追踪加速架构，相比纯光栅化方案可开启次级光照、畸变镜头与景深等效果。

1. **Load-Balanced Spatial BVH (LB-SBVH)** — 密度感知的空间 BVH，将极度不均衡的全局负载转换为均衡的局部遍历单元。
2. **Ray-Cluster Path Reuse (RCPR)** — 让代理光线与邻居光线共享遍历状态，复用冗余遍历。
3. **Unified Intersection Engine (UIE)** — 统一的 Gaussian + Triangle 求交引擎，通过模式多路复用数据通路，复用 40% 的浮点单元。

---

## 技术方案

### 核心思想

> 把 3DGS 当作真正的光线追踪原语处理，而非用光栅化近似。核心痛点：Gaussian 原语空间分布极度不均、相邻像素遍历路径冗余、Gaussian 与 Triangle 异构工作负载难以在同一 GPU 架构上高效处理。

### 关键技术

| 技术 | 说明 |
|------|------|
| LB-SBVH | 均匀网格 + 密度感知表示，解决工作负载不均 |
| RCPR | 相邻光线 state-sharing，减少冗余遍历 |
| UIE | Gaussian/Triangle 求交双模单元，共享 40% FP 单元 |
| RT Core 扩展 | 修改 RT Core 数据通路，cycle-accurate 模型 |

---

## 公式

```math
T_bvh = LB-SBVH(partition(G), density_weight)
T_trace = RCPR(state_pool, rays_in_cluster)
T_intersect = UIE(mode, primitive_type)
```

---

## 代码片段

```cpp
// 概念性伪代码
void H2Ray_Trace(Ray* rays, int N) {
    auto bvh = LB_SBVH_Build(scene);
    auto clusters = Cluster_Rays(rays, N);
    for (auto& c : clusters) {
        Traverse(bvh, c.proxy_ray);   // 共享遍历状态
        for (auto& r : c.rays) Reuse_Traversal(r, c.shared_state);
    }
}
```

---

## 实验结论

- **数据集**: 8 个场景（含 Gaussian 与 Triangle 混合）
- **基线**: RaySplats（之前的 ray-traced 3DGS 工作）
- **硬件**: NVIDIA RTX A5000
- **结果**:
  - 几何均值加速比 **3.77×**
  - 最大加速比 **9.26×**
- **方法**: Cycle-accurate 模型 + 实测 CUDA 时间

---

## 局限性

- 仍为 NVIDIA 专用硬件路径（RT Core 假设）
- Gaussian 与 Triangle 混合的精度-性能权衡需进一步研究
- 评估场景集中于静态与中等动态

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 提供 GPU 加速结构设计参考
- 与黄喉 (huanghou): Gaussian 原语几何结构可与几何处理组讨论
