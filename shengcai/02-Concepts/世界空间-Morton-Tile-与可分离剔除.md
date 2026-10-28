---
type: concept
created: 2026-10-28
tags: [concept, 渲染, 高斯渲染, 全局光照, 光传输方程, 加速结构]
domain: rendering
agent: shengcai
related: [[Gaussian Light Transport]], [[Neural Radiance Cache]], [[Honeycomb-Surfels]]
---

# 世界空间 Morton Tile 与可分离剔除（高斯/神经表示渲染的通用加速）

## 定义

当一个渲染系统需要**在随机分布的查询点上**评估大量高斯（或神经基元）时，**屏幕空间 tile**（3DGS 的标准做法）失效——因为查询之间没有屏幕空间相干性。

**世界空间 Morton tile** 是一种替代分块策略：按**世界空间位置**把基元分组，使随机查询能命中空间局部的一小组基元。

## 核心原理

### 1. Morton code 分块

每个查询基于「**所属 shape 的索引 + 3D 位置**」计算一个 **64-bit Morton code**；按 code 排序后截断固定前缀长度分组为 tile。

**收益**：
- 保证**空间局部性**（邻近位置的基元落在同一 tile）；
- 保证**内存访问连贯**（tile 内按 code 连续存储）。

### 2. 保守包围盒

对每个 tile，在**全部输入维度**上做**并行归约**，得到各维度的保守范围。

### 3. 高斯/tile 相交测试

若高斯在 tile 范围内的**预期指数**低于阈值，则丢弃该高斯对 tile 的贡献——等价于把每个核**截断为有限支撑域**。

### 4. 可分离剔除（separable culling）

若高斯的协方差是**块对角（可分离）**的，则**指数在去相关子空间上可加**：

```math
\exp\big(-v^\top\Sigma_k^{-1}v\big)
= \prod_{s \in \{x,\omega,a,n,r\}} \exp\big(-v_s^\top\Sigma_{k,s}^{-1}v_s\big)
```

于是可以：
- 先对 **1D 子空间**做 Mahalanobis 距离测试 → **廉价高效的早期拒绝**；
- 再对 3D 空间与方向分量用 tile 包围盒做类似测试。

**3D 保守 Mahalanobis 距离**的计算方式：先算高斯到包围盒**中心**的 Mahalanobis 距离，再**减去中心到某个角点的最大距离**。

## 公式

```math
% 保守 Mahalanobis 距离（tile 剔除）
d_{\text{cons}}(k,\text{tile})
= d_{\text{Mah}}(k,\text{center})
- \max_{\text{corner}}\big\| \text{center} - \text{corner} \big\|_{\Sigma_k^{-1}}
```

```math
% 可分离指数（13D 高斯分解为子空间独立高斯之积）
G_k(q) = G_x(x)\,G_\omega(\omega)\,G_a(a)\,G_n(n)\,G_r(r)
```

```math
% 截断支撑域判据（相对能量贡献）
\text{support}: \exp\big(-v^\top\Sigma_k^{-1}v\big) > \beta = -14
```

## 相关论文

- [[Gaussian Light Transport]]
- [[Honeycomb-Surfels]]
- [[CTBakeGS]]

## 代码实现

```cpp
// 3D 保守 Mahalanobis（tile 包围盒测试）
__device__ __forceinline__ float conservative_mahalanobis(
    const float3 center, const float3 half_extent,
    const float3 mu, const Mat3 inv_sigma)
{
    float d_center = mahalanobis2(center - mu, inv_sigma);
    float d_corner = mahalanobis2(half_extent, inv_sigma);
    return d_center - d_corner;   // 保守下界
}

// 可分离高斯的求值：各子空间独立，避免大矩阵求逆
__device__ __forceinline__ float eval_gaussian_separable(
    const float vx[3], const float vw[3], const float va[3],
    const float vn[3], const float r,
    const Gaussians13D& g, int k)
{
    float e = 0.0f;
    e += mahalanobis2(vx, g.sigma_x[k], g.mu_x[k]);
    e += mahalanobis2(vw, g.sigma_w[k], g.mu_w[k]);
    e += mahalanobis2(va, g.sigma_a[k], g.mu_a[k]);
    e += mahalanobis2(vn, g.sigma_n[k], g.mu_n[k]);
    e += (r - g.mu_r[k]) * (r - g.mu_r[k]) / (g.sigma_r[k] * g.sigma_r[k]);
    return __expf(-0.5f * e);
}
```

## 参考资料

- [Gaussian Light Transport (SIGGRAPH Asia 2026)](https://arxiv.org/abs/2609.11430)
- [Honeycomb-Surfels (arXiv 2610.37668)](https://arxiv.org/abs/2610.37668)
