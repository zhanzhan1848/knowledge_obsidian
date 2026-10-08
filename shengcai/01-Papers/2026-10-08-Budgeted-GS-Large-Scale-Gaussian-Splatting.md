---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, gaussian-splatting, real-time-rendering, LOD, large-scale, city-scale, EG-2027]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.03162
venue: EG 2027 submission (paper1075)
year: 2026
---

# Budgeted-GS: Real-Time Large-Scale Gaussian Splatting via Factoring LOD

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Large-Scale Gaussian Splatting via Factoring LOD |
| **作者** | Haipeng Wang et al. |
| **发表** | EG 2027 submission (paper1075), preprint |
| **链接** | [原文](https://arxiv.org/abs/2610.03162) |

---

## 核心贡献

> **Budgeted-GS**：将任意训练好的 3DGS 模型转换为 **factoring tree**（多分辨率层级、矩匹配聚合），单 quality 参数即可为每个视图选择匹配目标设备内存的 LOD。配套 **budget-centered training**：先测量场景需要多少 splat，再训练该规模。基础是来自 optimal transport 的 **capacity floor**（容量下限）和覆盖定理保证的选择规则。**城市级模型在单消费级 GPU 上原生 1920×1080 全 SH 实时渲染**。

1. **Factoring tree**：矩匹配的多分辨率聚合层级
2. **Post-hoc 压缩**：训练后处理，秒级构造
3. **Budget-centered training**：预算驱动的训练（避免浪费优化被丢弃的 splat）
4. **Capacity floor**：理论上确定场景需要多少 splat
5. **同一模型适配不同 GPU 容量**
6. 城市级捕获，**原生 1920×1080 + 完整 SH + 单消费 GPU 实时**

---

## 技术方案

### 核心思想

3DGS 视觉质量好且实时，但城市级模型是数百万 splat + GB 级显存，消费级 GPU 无法高质实时。

**两种方法**：
- **Post-hoc（Budgeted-GS）**：训练完成后几秒构造 factoring tree，单 quality 参数为每视图选 LOD
- **Budget-centered training**：先量容量下限，再训对应规模（避免训了再压缩的浪费）

### Capacity Floor 理论

```math
\text{Capacity}(\text{scene}) \geq \text{errors that must be reproduced}
```

由 **optimal transport in phase space** 推导；覆盖定理保证选择规则的**可证明性**。

### Factoring Tree

```
         Root (full)
        /    |    \
    L1    L2    L3   (different aggregation levels)
    / \   / \   / \
   ...splats / aggregates...
```

矩匹配 → 多分辨率聚合。

### 关键技术

| 技术 | 说明 |
|------|------|
| Factoring tree | 多分辨率矩匹配聚合 |
| Quality parameter | 单参数控制视图 LOD 选择 |
| Budget-centered training | 预算驱动，避免优化浪费 |
| Capacity floor | optimal transport 推导的容量下限 |
| Covering theorem guarantees | 选择规则的可证明性 |
| 13 scenes pre-registered protocol | 验证地板的测试集 |

---

## 公式

矩匹配聚合的关键是 optimal transport distance：
```math
W_2^p(\mu_{\text{original}}, \mu_{\text{aggregate}}) \leq \epsilon
```

保证聚合不损失超过 $\epsilon$ 的 Wasserstein 距离。

Budget-Error law：
```math
\text{Error}(\text{quality}, \text{memory}) = \text{Floor} + g(\text{quality}, \text{memory})
```

---

## 实验结论

- **场景**：13 个公开场景 + 1 个官方城市捕获
- **基线**：原始 3DGS、其他大规模 GS 方法
- **结果**：
  - 城市级捕获：原生 1920×1080 + 全 SH + 单消费 GPU **实时**
  - capacity floor 在 13 场景上验证
  - factoring tree 构造几秒
  - budget-centered training 节省训练成本

---

## 局限性

1. **EG 2027 投稿** —— 尚未正式发表
2. 28 页长文，方法复杂
3. Capacity floor 依赖 optimal transport 假设
4. 矩匹配聚合对极端非高斯分布可能失败

---

## 相关工作

- [[3D Gaussian Splatting]] (Kerbl 2023)
- City-scale neural rendering (Street Gaussians, DrivingGaussian)
- Level-of-Detail (LoD) rendering (经典)
- Optimal transport in graphics

---

## 实现建议

- **实现难度**：高（factoring tree + optimal transport + 矩匹配）
- **预期性能**：城市级实时（单消费 GPU）
- **适用场景**：
  - 城市级数字孪生
  - 自动驾驶场景重建
  - 大规模 VR/AR 资产
  - 消费级 GPU 的城市级 3DGS
- **对 moyuwan 的建议**：
  - **强烈推荐** 作为大规模 3DGS 渲染管线参考
  - 关键启示：**post-hoc 压缩 + budget-centered 训练**双管齐下
  - 可以考虑集成到现有 3DGS 渲染器中
  - 优先级：**高**