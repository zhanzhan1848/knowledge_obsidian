---
type: paper
created: 2026-10-25
updated: 2026-10-25
tags: [paper, 渲染, 实时渲染, 路径追踪, path-guiding, radiance-cascades, MIS, ReSTIR, TOG, SIGGRAPH2026]
status: processed
domain: rendering
agent: shengcai
source: https://doi.org/10.1145/3840291
---

# RCPG: Real-Time Product Path Guiding Using Radiance Cascades

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RCPG: Real-Time Product Path Guiding Using Radiance Cascades |
| **作者** | Julius Ikkala, Pekka Jääskeläinen, Markku Mäkitalo |
| **发表** | ACM Transactions on Graphics (TOG) Vol. 46 No. 2, pp. 1–25, 2026 |
| **链接** | [原文](https://doi.org/10.1145/3840291) |
| **DOI** | 10.1145/3840291 |
| **代码** | 未公开（TOG 期刊通道，无 arXiv 预印本） |
| **arXiv** | ❌ 无（检索 2026-10-25 确认无预印本） |

---

## 核心贡献

> 首次把 **radiance cascades** 的层级结构用于**乘积采样（product sampling）**：采样时同时考虑入射辐射与材质 BSDF，使实时路径引导在色度场景下质量与性能双优。

1. **推导 radiance interval 的边界**，保证层级 radiance cascade 不会误表征入射光方向 —— 这是此前 cascade 类方法无法用于方向性引导的根本障碍。
2. **产品采样方案（product sampling）**：采样分布直接取 **入射辐射 × BSDF** 的乘积，而不像以往实时路径引导那样需要为「辐射」和「BSDF」分别设计重要性采样再靠多采样 MIS 融合。
3. **可计算任意方向上的采样 PDF** → 天然兼容 **MIS** 与 **无偏 ReSTIR**。
4. **世界空间数据结构** → 可从**屏幕外路径顶点**生成采样，这是有效**多次弹射路径引导**（multi-bounce path guiding）的必要条件。

---

## 技术方案

### 核心思想

传统实时路径引导（path guiding）在实时渲染中面临两个困境：

- **色彩噪声**：色度场景下，单一方向的辐射估计无法同时照顾多个颜色通道
- **性能开销**：为了兼顾「入射辐射重要性」与「BSDF 重要性」，需要 **多采样 + MIS**，采样预算被摊薄

RCPG 的做法是把 cascade 的**层级性**真正用起来：

```
Radiance Cascade (层级辐射缓存)
   ↓ 每层给出 radiance interval [L_lo, L_hi]
   ↓ 边界保证：区间不误表征方向
Product Sampling
   ↓ p(ω) ∝ w_radiance(ω) · w_bsdf(ω)
   ↓ 单次采样同时服务两个目标
   ↓ PDF 可解析 → MIS / 无偏 ReSTIR 即插即用
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Radiance interval 边界** | 推导 cascade 层级的保守区间，使得「按层近似」不会丢失方向信息 —— 解决 cascade 原本只能做全向环境光缓存的局限 |
| **Product sampling** | 采样概率 ∝ 辐射权重 × BSDF 权重，一次采样覆盖两个重要性分布 |
| **PDF 解析可得** | 与 `ReSTIR`/`MIS` 无缝集成，保持无偏性 |
| **世界空间结构** | 支持 off-screen path vertex 出发采样 → 多弹射引导 |
| **单采样替代多采样 MIS** | 采样预算集中，实时帧率内可追踪约 **2 倍**的路径数 |

---

## 公式

```math
p_{\text{RCPG}}(\omega) \propto \underbrace{w_{\text{radiance}}(\omega)}_{\text{来自 radiance cascade 的层级估计}}
\cdot \underbrace{w_{\text{BSDF}}(\omega)}_{\text{材质散射方向分布}}
```

```math
\text{Radiance interval 条件：}\quad
L(\omega) \in [L_{\text{lo}}(\omega),\, L_{\text{hi}}(\omega)]
\;\Longrightarrow\;
\text{cascade 层级近似不误表征 } \omega
```

---

## 代码片段

```cpp
// 概念示意：产品采样
// 1) 从 radiance cascade 取得入射辐射的层级权重
float w_radiance = cascade.Weight(direction, level);

// 2) 取得 BSDF 重要性（考虑光源选择 / lobe）
float w_bsdf     = bsdf.Evaluate(hit, direction);

// 3) 乘积采样：单次采样同时服务两个目标
float p = w_radiance * w_bsdf;

// 4) PDF 解析可得 → 可直接送入 MIS 权重或无偏 ReSTIR
reservoir.Update(throughput * p, pdf = p / normalization);
```

---

## 实验结论

- **数据集**: 实时路径追踪基准场景（多弹射、含色光源场景）
- **基线**: 此前 SOTA 实时路径引导方法（基于多采样 MIS 的方案）
- **结果**:
  - 质量与性能**同时优于**既有 SOTA 实时路径引导方法
  - 相比多采样 MIS 方案，**每像素追踪路径数约 2×**（在实时帧率预算内）
  - 无偏 ReSTIR 兼容 → 可与 ReSTIR DI/PT 组合

---

## 局限性

- **无公开代码/预印本**：TOG 期刊通道发布，复现成本高（需自建 radiance cascade + path guiding 框架）
- 世界空间数据结构对**动态场景**的更新策略未在摘要中说明
- 依赖 radiance cascade 本身的构建质量（继承 Split Radiance Cascades 的假设）

---

## 相关工作

- [[2026-07-24_Split-Radiance-Cascades-GI]] — 同组的 radiance cascade 前作（real-time GI 基础）
- [[2026-07-20-SIGGRAPH-2026-ReSTIR-Spatio-Temporal-Control-Variates]] — 互补：ReSTIR 采样 + 控制变量降色度噪声
- [[2026-10-24-Ray-by-Ray-Fine-Grained-GPU-Ray-Tracing-Resource-Management]] — 互补：RT 单元资源分配
- [[ReSTCV_SIGGRAPH2026]] — 同为实时路径追踪采样改进

---

## 实现建议

- **实现难度**: **高**（需要完整的 radiance cascade 数据结构 + 层级边界推导 + product sampling PDF）
- **预期性能**: 每像素路径数 2× 于多采样 MIS 基线；质量提升但无端到端帧率数字（无公开 artifact）
- **适用场景**: 实时路径追踪器（ReSTIR DI/PT）中的多弹射间接光引导；有色光源场景收益最大
- **⭐ 优先级**: **高** — 填补了本库「实时路径引导 × 乘积采样 × cascade」方向的空白；可与已有的 ReSTCV 笔记组合成一条完整的实时路径追踪改进路线

---

## 备注

- 检索来源：**Crossref API**（ACM DL 页面受 Cloudflare 拦截，无法直接抓取）
- 该论文是 TOG **Vol. 46 No. 2**（2026-10-09 上线），属于本次 24h 窗口内的**新上线 TOG 论文**
