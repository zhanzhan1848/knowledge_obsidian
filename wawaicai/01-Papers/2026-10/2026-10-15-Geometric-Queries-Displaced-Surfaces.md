---
type: paper
created: 2026-10-18
updated: 2026-10-18
tags: [paper, geometry-processing, displacement-map, surface-queries, tessellation-free]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/abs/2610.21584
---

# Geometric Queries on Tessellation-Free Displaced Surfaces

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Geometric Queries on Tessellation-Free Displaced Surfaces |
| **作者** | Bing Xu 等 |
| **发表** | arXiv 2610.21584 (cs.GR), 2026-10-15 |
| **链接** | [原文](https://arxiv.org/abs/2610.21584) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.21584 |
| **代码** | 未提及 |

---

## 核心贡献

> 提出**一阶纹理空间层次** (texture-space hierarchy)，节点存储局部仿射高度面 + 保守残差界，无需预先镶嵌即可支持表面采样、镜面流形搜索、最近点查询等几何操作。

1. 用仿射高度面（affine height plane）替代标量 min-max 区间，保留空间高度变化
2. 表面封闭（surface enclosures）支持求交与距离搜索；平面高度 + 斜率支持采样面积估计
3. 额外斜率界（slope bounds）支持镜面光路搜索；面向 caustic rendering、displaced emitter sampling、surface PDE solver 的统一算法

---

## 技术方案

### 核心思想

Displacement map 通常需要预先镶嵌为稠密三角网格以支持几何查询。本文绕开镶嵌，构建纹理空间层次：每个节点携带局部仿射高度面 $h(u,v) \approx \mathbf{a}^\top (u,v) + b$ 与残差界 $\delta$，用这两个量重建**保形**的表面积分。

### 关键技术

| 技术 | 说明 |
|------|------|
| Affine height plane + residual bound | 节点级几何代理；比 scalar bounds 保留更多变化 |
| Surface enclosure | 用仿射面 + 残差给相交与距离搜索 |
| Area estimate | 从仿射面高度与斜率得到表面积，用于重要性采样 |
| Slope bounds | 提供表面切空间的方向范围，支撑 specular manifold search |
| Query-specific traversal | caustic / sampling / PDE 三种专用遍历、剪枝、采样算法 |

---

## 公式

```
h_approx(u,v) = a_u * u + a_v * v + b        (仿射高度面)
|h(u,v) - h_approx(u,v)| ≤ δ                  (残差界)
dA ≈ sqrt(1 + a_u^2 + a_v^2) du dv            (表面积分估计)
```

---

## 代码片段

```text
// 概念伪代码：仿射高度面层次查询
struct TextureNode {
    u_min, u_max, v_min, v_max;        // 节点范围
    float a_u, a_v, b;                 // 仿射高度面参数
    float residual_bound;              // 残差界
    float slope_min_u, slope_max_u;    // 切空间斜率界
    float slope_min_v, slope_max_v;
};

// 表面封闭用于求交
bool intersect_ray(ray, node, t_min, t_max) {
    // 用仿射面闭包做粗筛，再结合残差判断
    ...
}
```

---

## 实验结论

- **数据集**: 作者自构 displaced surface 测试集 + caustics / emitter sampling / PDE 求解场景
- **基线**: 预镶嵌（pre-tessellation）方法 + query-specific baselines
- **结果**: 相对预镶嵌显著节省内存；相对 query-specific baseline 性能提升；同时保留高效 ray tracing

---

## 局限性

- 一阶仿射假设对高曲率细节的逼近可能粗糙，需要多层细化
- 残差界的 tightness 取决于 displacement map 的局部平滑性
- 未公开代码与数据集，复现门槛较高

---

## 相关工作

- [[OctMesh]] (无关于 displacement，但同样是 mesh 压缩/查询方向)
- [[PCAsplat]] (几何正则化思路相近)
- 相关概念：displacement mapping, geometry queries, BVH-style spatial index, ray-tracing displaced surface

---

## 实现建议

- **实现难度**: 中高。需要 displacement map 解析器 + 层次构建 + 三类查询算法
- **预期性能**: 显著节省显存（相对全镶嵌）；CPU/GPU 加速后接近专用 baseline
- **适用场景**: caustic rendering、displaced light source sampling、surface PDE solve（heat / wave）、BRDF 预积分
- **推荐依赖**: libigl（辅助网格处理），Embree / OptiX（ray tracing 内核），OpenVDB（类似层次结构参考）
- **数值稳定性**: 中。仿射面闭包是 conservative bound；残差界需做范围传播以避免漏命中
- **推荐度**: ✅ 推荐关注（caustics / PDE on surfaces 场景；不适合需要二阶导的高频细节）

---

## 传递给 @墨鱼丸

🥢 **可行性分析：Tessellation-Free Displaced Surface Geometry Queries**

**算法复杂度**
- 时间：节点遍历 O(N) (N = 节点数)
- 空间：与纹理分辨率 + 残差精度成正比

**实现难度**：中高
- 几何封闭推导较繁琐
- 残差界紧度影响性能
- 数值稳定性：中（仿射面闭包是 conservative bound）

**依赖项**：libigl（辅助），Embree / OptiX（参考），OpenVDB（层次结构参考）

**推荐结论**：✅ 推荐关注（caustics / surface PDE 求解场景）

已传递给 @墨鱼丸。