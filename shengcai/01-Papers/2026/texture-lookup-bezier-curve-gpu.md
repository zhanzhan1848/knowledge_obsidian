---
title: A Texture Lookup Approach to Bézier Curve Evaluation on the GPU
authors: Alan Wolfe
date: 2026-03-18
source: arXiv cs.GR
url: https://arxiv.org/abs/2603.15447
pdf: https://arxiv.org/pdf/2603.15447
tags: [rendering, paper, 2026, GPU, Bézier, texture-interpolation, curve-evaluation]
status: unread
---

# A Texture Lookup Approach to Bézier Curve Evaluation on the GPU

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Texture Lookup Approach to Bézier Curve Evaluation on the GPU |
| 作者 | Alan Wolfe |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.15447) |
| PDF | [下载](https://arxiv.org/pdf/2603.15447) |

## 核心贡献
1. 提出一种基于纹理的技术，利用固定功能线性纹理插值硬件在GPU上评估Bézier曲线
2. 将曲线评估卸载到纹理插值器，可以在计算密集型GPU工作负载中提高性能
3. 方法可自然扩展到Bézier曲面和体积，并支持高级曲线类型如B-splines、NURBS和多项式

## 技术方案
该论文提出了一种创新的GPU优化方法：

1. **纹理插值替代计算**：使用GPU的固定功能纹理插值硬件来评估Bézier曲线，而不是在着色器中进行多项式计算
2. **性能优化**：通过将曲线评估卸载到纹理插值器，可以释放计算资源，提高整体GPU性能
3. **通用性**：方法不仅适用于Bézier曲线，还支持：
   - Bézier曲面和体积
   - B-splines
   - NURBS（非均匀有理B样条）
   - 积分和有理多项式
4. **Seiler插值**：展示了如何将Seiler插值纳入此框架以提高效率

## 公式
```math
Bézier曲线的传统评估公式：
B(t) = Σ_{i=0}^{n} C(n,i) * (1-t)^{n-i} * t^i * P_i

纹理查找方法的核心思想：
将多项式评估映射到纹理坐标和纹理采样操作
```

## 代码
```glsl
// 传统方法：在着色器中直接计算Bézier曲线
vec3 evaluateBezier(vec3 p0, vec3 p1, vec3 p2, vec3 p3, float t) {
    float u = 1.0 - t;
    float tt = t * t;
    float uu = u * u;
    float uuu = uu * u;
    float ttt = tt * t;
    
    vec3 p = uuu * p0; // (1-t)^3 * P0
    p += 3 * uu * t * p1; // 3(1-t)^2 * t * P1
    p += 3 * u * tt * p2; // 3(1-t) * t^2 * P2
    p += ttt * p3; // t^3 * P3
    
    return p;
}

// 纹理查找方法（概念）
vec3 evaluateBezierTexture(sampler2D bezierTex, float t) {
    // 使用纹理插值硬件进行曲线评估
    return texture(bezierTex, vec2(t, 0.5)).rgb;
}
```

## 实验结论
论文对比了纹理查找方法与传统着色器计算的性能和准确性：
- **性能**：在计算密集型GPU工作负载中，纹理查找方法可以显著提高性能
- **准确性**：需要评估纹理插值与直接多项式计算之间的精度差异
- **适用场景**：特别适合需要大量曲线/曲面评估的渲染场景

## 局限性
1. **精度限制**：纹理插值的精度可能受到纹理格式和硬件精度的限制
2. **内存开销**：需要预计算并存储纹理数据
3. **动态更新**：对于动态变化的曲线，纹理更新可能引入额外开销
4. **硬件依赖**：性能提升依赖于GPU纹理插值硬件的效率

## 可行性分析
- **实现难度**：中等 - 需要理解纹理插值和曲线评估的映射关系
- **性能预期**：高 - 在计算密集型场景中可显著提升性能
- **适用场景**：
  - 大量Bézier曲线/曲面的实时渲染
  - 字体渲染和矢量图形
  - CAD/CAM可视化
  - 曲面细分和置换贴图

## 相关工作
- GPU曲线渲染技术
- 纹理硬件加速方法
- 实时曲面细分

## 笔记
这篇论文提供了一种非常实用的GPU优化技术，通过巧妙地利用固定功能硬件（纹理插值器）来加速曲线评估。这种方法的优势在于：

1. **硬件加速**：利用了GPU上专门的纹理插值硬件，这些硬件通常处于闲置状态
2. **通用性强**：不仅支持Bézier曲线，还支持多种曲线表示方法
3. **易于集成**：可以很容易地集成到现有的渲染管线中

**推荐给墨鱼丸**：
- 这项技术可以用于优化我们的曲线/曲面渲染管线
- 特别适合需要大量曲线评估的场景（如字体渲染、CAD模型可视化）
- 需要进一步研究纹理精度对最终渲染质量的影响
