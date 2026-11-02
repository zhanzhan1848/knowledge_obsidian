---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, 渲染, 光栅化, Gaussian-Splatting, 显存优化, CUDA, 实时渲染, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.34233
---

# BoundedGS: Memory-Efficient High-Resolution Training for 3D Gaussian Splatting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BoundedGS: Memory-Efficient High-Resolution Training for 3D Gaussian Splatting |
| **作者** | Xiaobin Deng, Changyu Diao, Min Li, Duanqing Xu |
| **发表** | arXiv preprint 2026-10-25（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2610.34233) · [HTML](https://arxiv.org/html/2610.34233v1) · [项目页](https://xiaobin2001.github.io/BoundedGS-Web/) |
| **DOI** | 10.48550/arXiv.2610.34233（DataCite pending） |
| **代码** | 项目页 https://xiaobin2001.github.io/BoundedGS-Web/ |

---

## 核心贡献

> 把 3DGS 高分辨率训练的**显存峰值**从「随分辨率无界增长」压成「**常数上界**」：核心洞察是 *complete-view update*（整视图梯度聚合）中，**每个 region 的 forward/backward cache 在其梯度贡献被收集后即可立即释放**。据此把 rasterization backward 与 projection backward **分离**，并按实测负载**限界（bound）活跃的局部光栅化工作集**。

1. **Backward 阶段分离**：将 `rasterization backward` 与 `projection backward` 拆成两个独立 pass。原因是二者对缓存的持有期不同——分离后，rasterization 的 tile 级缓存可以在逐 region 收集完梯度后立刻释放，不必与整视图的 projection / gradient state 同时驻留。
2. **限界活跃工作集（bounded working set）**：根据实测负载动态决定同时活跃的局部光栅化区域数量，把峰值显存与「分辨率 × Gaussian 数」的乘积解耦，变成一个**可配置的常数上界**。
3. **Candidate-indexed projection + 紧凑梯度存储**：projection backward 改为按 candidate index 索引（而非全量稠密缓冲），梯度用紧凑表示存储，直接压掉 view-level 峰值。
4. **CPU 辅助结构重建 + 有界图像供给**：把 densification/pruning 的结构重建放到 CPU 侧，把图像按帧有界供给，使显存管理完全解耦于渲染本身。
5. **结果**：固定 ~6M Gaussians 的分辨率扫描中，渲染工作集在 **1K→16K 分辨率下稳定在 1.073–1.077 GiB**；5 个原生 5K 户外场景全量训练，平均渲染工作集从 **9.97 GiB → 1.76 GiB（-82.3%）**，重建质量保持相近，训练时间 **36.7 → 33.9 min**。

---

## 技术方案

### 核心思想

高分辨率 3DGS 训练的显存瓶颈不在前向渲染本身，而在 **backward 阶段多个大缓存的共驻**：

```
像素数 ↑  →  像素–Gaussian tile 交点数 ↑  →  rasterization cache ↑
                                    ↕ 共驻
                          projection state + gradient state（视图级）
```

BoundedGS 的做法是**重构缓存生命周期**而非降低精度：

- 完整视图更新时，每个 region 的 forward/backward cache 在其贡献被收集后**即可释放**；
- 由此把 rasterization backward 与 projection backward **在时间上错开**，两者不必同时占满显存；
- 再按实测负载限定同时活跃的 region 数 → 得到一个**与分辨率无关的显存上界**。

> 这与 CVTSplat 的「chunked rasterizer + 逐 tile 原子早退」是同一类工程哲学：**在光栅化器内部引入显式的分块 / 分级调度协议**，把不可控的峰值变成可控的分块累积。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Rasterization / Projection backward 分离** | 两个 pass 顺序执行，消除二者缓存共驻；region 粒度收集完梯度后立即释放其 forward cache |
| **Bounded active working set** | 按实测负载决定活跃 region 数上限 → 分辨率无关的常数显存上界（实测 1K–16K 恒定在 ~1.07 GiB） |
| **Candidate-indexed projection** | projection backward 的中间量按 candidate index 索引存储，避免稠密全量缓冲 |
| **紧凑梯度存储** | 梯度以紧凑布局保存，削减 view-level 峰值 |
| **CPU 辅助结构重建** | densify/prune 的结构维护放到 CPU，避免 GPU 侧同时持有完整结构副本 |
| **Bounded image supply** | 图像按帧有界供给，显存管理与渲染解耦 |

### 公式

论文核心是一组**资源守恒式**的工程约束，可形式化为：

```math
M_{\mathrm{peak}} \;\approx\; M_{\mathrm{struct}}
+ M_{\mathrm{image}}
+ \underbrace{M_{\mathrm{raster}}^{\mathrm{active}}}_{\text{受限于 } B}
+ \underbrace{M_{\mathrm{proj}} + M_{\mathrm{grad}}}_{\text{按 candidate index 索引}}
```

其中 $M_{\mathrm{raster}}^{\mathrm{active}}$ 是**同时活跃**的 region 集合 $R_{\mathrm{act}}$ 的缓存总占用：

```math
M_{\mathrm{raster}}^{\mathrm{active}}
= \sum_{r \in R_{\mathrm{act}}} C_r
\;\le\; B,
\qquad
|R_{\mathrm{act}}| = \left\lceil \frac{\mathrm{tile\_count}}{|R_{\mathrm{chunk}}|} \right\rceil
```

即：把 tile 空间切分为 chunk，**每次只让有限个 chunk 处于活跃状态**，从而

```math
\lim_{\text{res} \to \infty} M_{\mathrm{raster}}^{\mathrm{active}} = \text{const}
```

这正是实测中 1K→16K 显存恒定（1.073 → 1.077 GiB）的数学原因。

### 代码片段

```cuda
// 概念级伪代码：bounded rasterization backward
// 关键点：region 粒度收集梯度后立即释放其 forward cache
void raster_backward_bounded(const TileBatch& tiles,
                              const float* grad_rgb,   // per-candidate
                              float* grad_out,          // per-gaussian, 紧凑存储
                              int   chunk_size,
                              float budget_bytes) {
    // 1) 计算可并行的活跃 region 数（受 budget 约束）
    const size_t per_region = estimate_region_bytes(tiles);
    const int    max_active = clamp((int)(budget_bytes / per_region), 1,
                                     tiles.num_regions);

    for (int base = 0; base < tiles.num_regions; base += max_active) {
        const int n = min(max_active, tiles.num_regions - base);

        // 2) forward cache 只为活跃 region 分配
        auto cache = alloc_region_cache(n);            // ← 峰值由此受限
        launch_forward_only(tiles, base, n, cache);

        // 3) 逐 region 反向：贡献收集完即释放该 region 的 cache
        for (int i = 0; i < n; ++i) {
            launch_region_backward(tiles, base + i, cache, i,
                                   grad_rgb, grad_out);
            release_region_cache(cache, i);             // ← 关键：即时释放
        }
        destroy_region_cache(cache);
    }
    // 4) projection backward 独立 pass（此�� rasterization cache 已全部释放）
    launch_projection_backward_candidate_indexed(grad_out);
}
```

---

## 实验结论

- **分辨率扫描（固定 ~6M Gaussians）**：

| 分辨率 | 渲染工作集 | 单次 warm pass |
|--------|-----------|--------------|
| 1K | 1.073 GiB | — |
| 11K | ~1.07 GiB | **19.79 s**（vs 全帧 21.76 s） |
| 16K | 1.077 GiB | — |

→ 工作集在 16 倍分辨率跨度上**基本恒定**，这是「限界工作集」策略的直接验证。

- **5 个原生 5K 户外场景全量训练**：

| 指标 | 基线（全帧） | BoundedGS | 变化 |
|------|------------|-----------|------|
| 平均渲染工作集 | 9.97 GiB | **1.76 GiB** | **-82.3%** |
| 训练时间 | 36.7 min | **33.9 min** | -7.6% |
| 重建质量 | — | 相近 | 保持 |

---

## 局限性

1. **未给出与传统实现的逐算子速度对比**：11K 分辨率下 19.79 s vs 21.76 s（**约 9% 加速**），显存收益（-82.3%）远大于速度收益，说明代价被显存瓶颈吸收掉了。
2. **依赖「complete-view update」范式**：分块策略建立在整视图梯度聚合可分解的前提上。若改为逐 tile / 逐窗口更新，协议需重新设计。
3. **结构重建搬到 CPU**：densification/pruning 的 CPU 往返可能成为小批量或高频更新场景的瓶颈，论文未给出该部分的分离量化。
4. **质量保持为「相近」而非「更优」**：数值上略有浮动，摘要未给出具体的 PSNR/SSIM 差值（论文表格可能有，但摘要未披露）。
5. **未在抽象化 / 极端场景验证**：仅测试了 3DGS 户外场景，未涉及路径追踪或神经辐射场等缓存行为完全不同的渲染器。

---

## 相关工作

- [[2026-10-27_CVTSplat-Adaptive-Centroidal-Voronoi-Tessellation]] — 同样采用 chunked rasterizer + 逐 tile 原子早退协议，可与 BoundedGS 的限界工作集组合
- [[2026-10-29_Honeycomb-Surfels-Hexagonal-Primitive]] — 减少图元数量的另一条压缩路径，与「降低分辨率显存」互补
- [[2026-10-29_GraftRay-Physically-Based-Mesh-Insertion-GS-Scenes]] — 同为 3DGS × 光线追踪交叉
- [[CUDA-Rasterization]] / [[Tile-Based-Rendering]] — 通用 GPU 光栅化缓存管理技术
- [[Gaussian-Splatting]] — 基础表示

---

## 实现建议

- **实现难度**：**中**。不涉及新算法，主要是 CUDA kernel 调度重构：(a) rasterization / projection backward 的 pass 分离；(b) region 粒度缓存的即时释放（需要 tile→region 映射与原子计数器管理生命周期）；(c) candidate-indexed 投影与紧凑梯度缓冲；(d) densify/prune 的 CPU 侧迁移。
- **预期性能**：显存峰值降 82.3%，训练时间仅降 7.6%。真正的收益是**让高分辨率训练变得可行**——原本会 OOM 的配置现在能跑。
- **适用场景**：
  - ✅ 高分辨率（≥4K/5K）3DGS 训练，显存受限
  - ✅ 需要在同一张卡上并行多个场景的批量训练（单场景 1.76 GiB 可并发多实例）
  - ✅ 生产环境的训练服务化（显存上界可预测）
  - ❌ 不适用于离线 path tracing / 神经辐射场等缓存生命周期不同的渲染器（需重新设计）
- **推荐度**：**⭐⭐⭐⭐⭐ 推荐** —— 这是**工程价值最高**的一篇：不改算法、不损质量、纯调度优化，直接解决真实训练中的 OOM 问题。且它的「限界工作集」思想可推广到任何 tile-based GPU 渲染器，是与 CVTSplat chunked rasterizer 同一层级的可复用资产。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.34233
- HTML 全文：https://arxiv.org/html/2610.34233v1
- PDF：https://arxiv.org/pdf/2610.34233
- 项目页：https://xiaobin2001.github.io/BoundedGS-Web/
