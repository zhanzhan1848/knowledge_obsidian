---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, 渲染, 实时渲染, 路径追踪, ReSTIR, 时间复用, 遮挡, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://research.nvidia.com/labs/rtr/publication/hong2026multilayer/
---

# Multi-Layer Reservoir Splatting for Temporal Reuse under Disocclusion

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Multi-Layer Reservoir Splatting for Temporal Reuse under Disocclusion |
| **作者** | Jiaqi Hong, Xianzhong Zhang, Daqi Lin, Markus Kettunen, Chris Wyman, Cem Yuksel |
| **发表** | **SIGGRAPH 2026 Conference Track** |
| **链接** | [NVIDIA RTG](https://research.nvidia.com/labs/rtr/publication/hong2026multilayer/) |
| **单位** | NVIDIA / University of Utah |

---

## 核心贡献

> ReSTIR 的时间复用依赖屏幕空间重投影，一旦表面被遮挡，其 reservoir 状态就无法前传；重新露出时只能从低样本噪声估计重启，形成运动物体拖尾状噪声。本文以 reservoir splatting 为基座，把重采样域从「像素」扩展为**「像素-层」**，让被遮挡样本落入深层 reservoir，之后再贡献给可见像素。

1. **多层屏幕空间 reservoir**：把「像素-层」对 `(p, i)` 作为**独立重采样域**，第 `i` 层积分对应「沿相机光线第 `i` 近的交点」，从而保留被遮挡样本的历史贡献——**等价于把 deep frame buffer 用于时间复用**。
2. **Depth ranges 重新定义积分域**：把「确定目标层」从多次连续最近命中光线查询降为 **2 次可见性查询**。
3. **Active domains 选择性维护**：通过传递式激活 + 空洞填充，只维护「上一帧可见过、可能重新出现」的域，把维护的域数量从 `kN` 降到**远小于 `kN`**，实测覆盖了 **66%–90%** 的 disoccluded 像素。

---

## 技术方案

### 关键技术

| 技术点 | 做法 | 作用 |
|--------|------|------|
| **层定义** | `A_i = {x | rank(x) = i}`，rank 为相机光线上交点序号 | 形式化「第 i 近命中」积分 `I_i` |
| **层归属判定（原始）** | 沿相机方向**连续追踪光线**，逐个推进 origin，统计交点数 | 正确但昂贵 |
| **Depth ranges** | 每像素独立：用像素中心光线的代表交点 `c_{p,i}` 深度扩展为**非重叠区间** `D_i = [L_i, R_i]` | **2 次可见性查询**替代多次光线 |
| **代表交点** | 从像素中心追踪得到，逐帧只预计算一次 | 定义域与深度区间 |
| **Active domains** | **传递式激活**：若 `(p,i)` 活跃 → splat 其代表交点 → 标记 `(p',i')` 活跃 | 只维护可能重现的域 |
| **空洞填充** | 活跃域半径 **3 像素**内的邻居参与采样，但**不激活**下一帧 | 提升空间连续性 |
| **假阳性过滤** | 比较 `T(c_{p,i})` 与 `c_{p',i'}` 的**遮挡者 instance ID**，不同则不激活 | 抑制 point-sample 近似误差 |
| **背面剔除** | 只保留**奇数序号**交点（层 `i` ↔ 第 `(2i−1)` 次交点） | 排除不贡献的背面 |
| **空间复用范围** | **只对前层 `A₁` 做空间复用** | 深层收益不抵成本 |
| **置信度权重更新** | 把代表交点投影回上一帧，复用对应 reservoir 的 confidence weight | 保持时间复用**无偏** |
| **存储** | 活跃域**压紧为连续 buffer**，一域一线程 | 提升线程利用率 |

### 「重新定义积分域」的具体做法

严格 layer 定义要求「必须是沿光线的第 i 近交点」，但最终图像只由前层 `A₁` 覆盖，**深层只需「大致对应」即可**。因此对 `i > 1`：

1. 每像素从中心光线取代表交点深度序列，扩展成**互不重叠**的深度区间 `D_i = [L_i, R_i]`；
2. 实现中 `D_i = [(1−ε)t, (1+ε)t]`，`ε = 0.01`；
3. 相邻区间重叠时取中点截断：`R'_i = L'_{i+1} = (R_i + L_{i+1})/2`；
4. splat 样本 `x` 时：先做一次全距可见性光线判断是否属于 `A₁`；否则按 `d(x, x₀)` 落入的区间 `D_i` 发射**限制在该区间内**的可见性光线，若是该区间最近命中则归入第 `i` 层，否则丢弃。

→ 「层归属」只依赖 **2 条光线**（一次无约束 + 一次区间约束），而无需沿光线逐层推进统计交点。

---

## 公式

**层积分定义：**

```math
I_1 = \int_\Omega f(\bar{x})\,d\bar{x},
\qquad
\bar{x} = [x_0, x_1, x_2, \ldots],\quad V(x_0,x_1)=1
```

```math
I_i = \int_\Omega [x_1 \in A_i]\; g(\bar{x})\,d\bar{x},
\qquad
A_i = \{x \mid \mathrm{rank}(x) = i\}
```

**重新定义后的层（基于 depth ranges）：**

```math
A_i = \left\{x \;\middle|\; d(x,x_0) \in D_i,\; V(x,x_0)=0,\; V(x, x_0 + L_i\, r(x)) = 1\right\},
\quad D_i = [L_i, R_i]
```

**重采样权重：**

```math
w_i = m_i(Y_i)\,\hat{p}(Y_i)\,W_{X_i}\left|\frac{\partial T_i}{\partial X_i}\right|,
\qquad
Y_i = T_i(X_i)
```

```math
W_Y = \frac{1}{\hat{p}(Y)}\sum_{i=1}^{M} w_i
```

**Depth ranges 的具体参数：**

```math
D_i = [(1-\varepsilon)t,\; (1+\varepsilon)t],\quad \varepsilon = 0.01
```

```math
R'_i = L'_{i+1} = \frac{R_i + L_{i+1}}{2}
```

---

## 代码片段

```cpp
// Depth ranges 版本的层归属判定：只需 2 条光线
// 1) 一次无约束可见性光线 -> 判断是否属于 A1
// 2) 一次区间约束可见性光线 -> 判断落入哪个 Di
__device__ int classify_layer(const Ray& center_ray,
                              float depth_t,            // 代表交点深度
                              float eps = 0.01f)
{
    // 全距可见性测试
    Hit h = trace_any_hit(center_ray);
    if (h.valid && h.t == center_ray.t_max) return 1;   // 属于 A1

    // 区间约束：Di = [(1-eps)t, (1+eps)t]
    float L = (1.0f - eps) * depth_t;
    float R = (1.0f + eps) * depth_t;
    Ray constrained = center_ray;
    constrained.t_min = L; constrained.t_max = R;
    Hit hc = trace_any_hit(constrained);
    if (!hc.valid) return -1;                          // 丢弃
    return layer_index_for_interval(L, R);             // 归入第 i 层
}

// 传递式激活 + 空洞填充
__device__ void propagate_active_domains(
    ActiveDomainBuffer& buf,      // 压紧为连续 buffer，一域一线程
    const GBuffer& gbuf,
    int radius = 3)               // 空洞填充半径
{
    // 传递式激活：活跃域 splat 其代表交点 -> 标记目标 (p',i') 活跃
    // 空洞填充：半径内邻居参与采样但不激活下一帧
}

// 假阳性过滤：遮挡者 instance ID 不同则不激活
__device__ bool same_occluder(uint occId_p, uint occId_p2) {
    return occId_p == occId_p2;
}
```

---

## 实验结论

- **环境**：**Falcor** 框架，Intel i9-13900K + **RTX 4090**，**1920×1080**；误差用 **MAPE** 与 **FLIP**。
- **场景**：Bistro / Subway / Emerald Square（相机运动）、Carousel（物体运动）。最大层数按可见深度复杂度设为 **2–5**。

### Equal-time 对比（Fig. 9）

| 场景 | 方法 | 时间 | MAPE | FLIP |
|------|------|------|------|------|
| Bistro | Reservoir Splatting | 10.0 ms | 1.016 | 0.446 |
| Bistro | more neighbors(9) | 11.0 ms | 1.011 | 0.444 |
| Bistro | more initial spp(8) | 10.9 ms | 1.007 | 0.442 |
| Bistro | **Ours (2 layers)** | 10.9 ms | **0.942** | **0.413** |
| Subway | Splatting | 6.5 ms | 1.483 | 0.755 |
| Subway | **Ours (4 layers)** | 9.6 ms | **1.186** | **0.609** |
| Emerald Square | Splatting | 13.8 ms | 1.001 | 0.733 |
| Emerald Square | **Ours (3 layers)** | 17.3 ms | **0.865** | **0.610** |
| Carousel | Splatting | 15.5 ms | 1.863 | 0.696 |
| Carousel | **Ours (5 layers)** | 22.5 ms | **1.631** | **0.624** |

### Table 1 关键统计

- **维护域数**（Uniform / Ours）：
  - Bistro 2.07M / **0.26M**；Subway 5.74M / **1.21M**；Carousel 7.32M / **1.91M** → **约 4–8× 缩减**
- **disoccluded 像素覆盖率**：Uniform 88.0% / 73.6% / 98.0% / 97.0% → **Ours 75.0% / 66.1% / 90.1% / 88.2%**
- **Depth ranges 效果**：splatting 追踪光线数减少最多 **59%**（Carousel 29.32M → 14.41M）；splatting 时间 6.05 → **3.93 ms**
- **内存**：Base 380 MB → Ours 428 / 525 / 602 / 731 MB

### 其它

- Carousel：Splatting 15.5 ms vs **Ours 22.5 ms** vs Uniform 5 layers **42.8 ms** → 质量接近 uniform 5 层，**成本约一半**。
- 层数消融（Carousel）：1 层 16.4 ms → 2 层 18.2 ms → 3 层 20.2 ms。

---

## 局限性

- **多层需要额外的时间与内存开销**（Carousel 15.5 → 22.5 ms；内存 380 → 428~731 MB）。
- 深层积分域是**近似**的（用 depth ranges 替代严格 rank）——「最终图像只由前层覆盖」是这一近似的正确性前提。
- 假阳性过滤依赖 **instance ID**（需要几何实例信息）。
- **空洞填充半径 3 像素**是经验值；活跃域传播链过长时可能漏掉重新出现的表面。
- 空间复用**只对前层 `A₁` 做**，深层没有空间复用收益。

---

## 相关工作

- [[Reservoir Splatting]]
- [[ReSTIR]]
- [[Area ReSTIR]]
- [[2026-10-28_ReSTIR-Compatibility-Neighbor-Selection|Compatibility-Guided Neighbor Selection for ReSTIR]]
- [[2026-10-28_ReSTIR-Level-of-Detail|Real-Time Level-of-Detail Rendering with ReSTIR]]

---

## 实现建议

- **实现难度**：**中高**。核心改动是把 ReSTIR 的重采样域从「像素」扩展为「像素-层」，需要：
  - 多层 reservoir 存储与压紧；
  - depth ranges 的层归属判定；
  - 传递式激活与空洞填充；
  - instance ID 假阳性过滤。
- **预期性能**：
  - Bistro（2 层）**等时**（10.9 vs 10.0 ms）：MAPE 1.007 → **0.942**，FLIP 0.442 → **0.413**；
  - Carousel（5 层）比 uniform 5 层**快近一倍**（22.5 vs 42.8 ms）而质量接近；
  - depth ranges 让 splatting 的光线数减少最多 **59%**。
- **适用场景**：
  1. **动态场景的实时路径追踪**——运动物体拖尾状噪声（disocclusion noise）是 ReSTIR 的经典痛点；
  2. 任何有大量遮挡-重新暴露的相机运动场景。
- **行动建议**：**✅ 推荐实现，优先级：中高**。
  - 理由：直接解决 ReSTIR 在动态内容上的**主要视觉缺陷**，且「depth ranges 把光线查询降为 2 次」的技巧是**独立可复用**的工程优化；
  - 落地建议：
    1. 先实现 **depth ranges** 部分（独立收益：光线数 −59%、splatting 时间 6.05 → 3.93 ms），**优先级：高**；
    2. 再实现多层 reservoir（需依赖 instance ID 与多层存储）；
    3. **层数从 2 开始**（Bistro 场景 2 层即等时超越基线），按场景深度复杂度递增到 3–5。
