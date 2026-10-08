---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, rasterization, vector-graphics, differentiable-rendering, WebGPU, bezier, coverage]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.02468
venue: arXiv preprint
year: 2026
---

# Windfoil: Closed-Form Coverage for Real-Time and Differentiable Vector Graphics

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Closed-Form Coverage for Real-Time and Differentiable Vector Graphics |
| **作者** | Matt DesLauriers |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2610.02468) |

---

## 核心贡献

> **Windfoil**：基于**闭式**二次 Bézier 轮廓的 box-filtered winding number 评估，把 rasterization 和 differentiable vector graphics 作为**同一个问题的两面**。WebGPU 实现，可跨平台运行（含浏览器）。**比 Skia 更精确，比 Slug 相当速度**，**比 DiffVG/Bézier Splatting 更快**。

1. **闭式 box-filtered winding number** 评估
2. WebGPU 实现 → 浏览器内可运行
3. **3 大场景**：实时 2D 渲染、高分辨率打印光栅化、可微渲染
4. 重建质量优于 DiffVG / Bézier Splatting，每步成本更低
5. 支持**上万形状**交互式优化

---

## 技术方案

### 核心思想

传统 GPU 矢量光栅化（如 Slug）使用**解析扫描线**算法，**不可微**。
可微矢量图形（DiffVG、Bézier Splatting）使用**采样估计**，**精度慢**。

**关键洞察**：盒滤波器下的 winding number 可以**闭式**解析求值。这意味着：
- **一次评估 = 全像素精确覆盖**（无采样噪声）
- **天然可微**（解析导数）

### 算法

对二次 Bézier 轮廓：
```math
C(x, y) = \frac{1}{A_{\text{pixel}}} \iint_{\text{pixel}} W(\mathbf{p}) \, d\mathbf{p}
```

其中 $W(\mathbf{p})$ 是 winding number，闭式积分 → 单次数学运算。

### 关键技术

| 技术 | 说明 |
|------|------|
| Box-filtered winding number | 闭式评估 |
| Quadratic Bézier contours | 输入域 |
| WebGPU shader | 实现 |
| Multi-purpose | 实时、打印、可微 |

---

## 公式

Box-filtered winding number（关键数学）：
```math
C = \frac{1}{A_{\text{pixel}}} \iint_{\text{pixel}} W(\mathbf{p}) \, dA
```

对二次 Bézier 段，$W$ 是关于 $(x, y)$ 的分段多项式，积分闭式。

---

## 实验结论

- **基线**：
  - **Skia**（生产级光栅化）
  - **Slug**（GPU 光栅化，游戏 / 实时）
  - **DiffVG**（可微矢量图形）
  - **Bézier Splatting**（可微矢量图形）
- **结果**：
  - **比 Skia 更接近参考 box-filtered coverage**
  - **比 Slug 相当速度**，更精确
  - **比 DiffVG / Bézier Splatting 重建质量更好或相当，每步成本更低**
  - **上万形状交互速率**

---

## 局限性

1. 仅限二次 Bézier（不支持三次等）
2. 闭式公式可能复杂（实现难度高）
3. 论文未给完整代码（不确定是否开源）

---

## 相关工作

- [[Skia]] - Google 2D 图形库
- [[Slug]] - GPU 矢量光栅化
- [[DiffVG]] - 可微矢量图形
- Bézier Splatting
- Winding number algorithms

---

## 实现建议

- **实现难度**：高（闭式数学 + WebGPU shader）
- **预期性能**：实时，可微优化加速
- **适用场景**：
  - 浏览器内矢量图形渲染
  - 可微 SVG / 插画渲染
  - 字体渲染优化
  - 数字艺术工具（Procreate、Photoshop 类似）
- **对 moyuwan 的建议**：
  - **不直接属于 3D 渲染**，但**二维渲染**有重要参考价值
  - "闭式 coverage 评估"思路可启发**3D 几何的解析覆盖**研究
  - **WebGPU**实现展示了现代 GPU 编程的方向