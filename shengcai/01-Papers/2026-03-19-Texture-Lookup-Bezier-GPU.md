---
type: paper
created: 2026-03-19
updated: 2026-03-19
tags: [paper, GPU, bezier, texture, real-time-rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2603.15447
---

# A Texture Lookup Approach to Bézier Curve Evaluation on the GPU

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | A Texture Lookup Approach to Bézier Curve Evaluation on the GPU |
| **作者** | Muhammad Anas, Alan Wolfe |
| **发表** | arXiv 2026 |
| **链接** | [原文](https://arxiv.org/abs/2603.15447) |
| **DOI** | 10.48550/arXiv.2603.15447 |
| **代码** | N/A |

---

## 核心贡献

> 利用 GPU 固定功能纹理插值硬件评估 Bézier 曲线，提高计算受限工作负载性能

1. **纹理插值硬件利用**：将曲线评估卸载到纹理插值器
2. **通用性**：支持 Bézier 曲面、体积、B-splines、NURBS
3. **Seiler 插值**：集成 Seiler 插值提高效率

---

## 技术方案

### 核心思想

传统 GPU 曲线评估在着色器代码中计算多项式，可能成为计算瓶颈。本方法将曲线评估转换为纹理查找操作，利用固定功能硬件的线性插值能力。

### 关键技术

| 技术 | 说明 |
|------|------|
| 纹理插值 | 利用 GPU 纹理采样硬件 |
| 线性插值基 | 将多项式转换为纹理坐标 |
| Seiler 插值 | 更高效的插值方案 |

### 扩展支持

- **Bézier 曲线**：基础支持
- **Bézier 曲面**：2D 扩展
- **Bézier 体积**：3D 扩展
- **B-splines**：分段多项式
- **NURBS**：有理多项式
- **积分/有理多项式**：通用支持

---

## 公式

Bézier 曲线：
```math
B(t) = \sum_{i=0}^{n} \binom{n}{i} (1-t)^{n-i} t^i P_i
```

纹理查找映射：
```math
\text{texture}(u) \approx B(u)
```

---

## 代码片段

```glsl
// 传统着色器评估
vec3 bezier_traditional(float t, vec3 p0, vec3 p1, vec3 p2, vec3 p3) {
    float t2 = t * t;
    float t3 = t2 * t;
    float mt = 1.0 - t;
    float mt2 = mt * mt;
    float mt3 = mt2 * mt;
    return mt3*p0 + 3.0*mt2*t*p1 + 3.0*mt*t2*p2 + t3*p3;
}

// 纹理查找方法
vec3 bezier_texture(float t) {
    return texture(bezierTexture, t).rgb;
}
```

---

## 实验结论

- **性能**：在计算受限工作负载中提高性能
- **精度**：与着色器评估相当
- **通用性**：支持多种曲线类型

---

## 局限性

- 需要预计算纹理
- 纹理内存开销
- 精度受纹理分辨率限制

---

## 相关工作

- [[GPU-优化]]
- [[曲线渲染]]
- [[实时渲染]]

---

## 实现建议

- **实现难度**：低（直接使用纹理采样）
- **预期性能**：减少着色器计算负载
- **适用场景**：大量曲线/曲面评估、矢量图形渲染、字体渲染
