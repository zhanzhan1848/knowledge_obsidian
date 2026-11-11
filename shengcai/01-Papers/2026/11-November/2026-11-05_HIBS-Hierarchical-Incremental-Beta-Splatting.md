---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, 3dgs, beta-kernel, online-reconstruction, rasterization, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.08288
arxiv_id: 2611.08288
---

# HIBS: Hierarchical Incremental Beta Splatting for Online Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hierarchical Incremental Beta Splatting for Online Reconstruction |
| **作者** | Linus Franke |
| **发表** | arXiv cs.CV / cs.GR, 2026-11-05（预印本） |
| **链接** | [原文](https://arxiv.org/abs/2611.08288) |
| **项目页** | [https://linus-franke.com/hibs/](https://linus-franke.com/hibs/) |
| **代码** | 项目页提供 |

---

## 核心贡献

> 把 **beta kernel** 引入增量式（在线）3DGS 重建：用形状参数当"几何置信度旋钮"，几何可验证处生成硬核元，几何不可验证处生成柔和可修正元。

1. **Beta kernel 作为置信度旋钮**：形状参数在"柔软、高斯状"与"平顶、近不透明 surfel"之间插值。
2. **置信度感知生成 (confidence-aware spawning)**：用几何可观测性 + 多视角深度一致性初始化不透明度**与形状**——几何可验证处生成硬质 primitive，不可验证处生成柔和可修正 primitive。
3. **误差驱动重定位 (error-driven relocation)**：在线致密化过程中，把过时/僵死的 primitive 回收利用到光度误差热点上。
4. **精确 tile 剔除**：有界的 beta kernel 支撑使 tile culling 精确，光栅化更快。
5. **保形闭式合并**：提供 LOD 层级用于快速优化与实时渲染。

---

## 技术方案

### 核心思想

在线 3DGS 的困境：每个关键帧生成的 primitive 只被精炼几十次迭代，几乎没机会修正糟糕的初始化或缺失细节。而且高斯本身"软"，需要大量重叠才能形成实心表面。

Beta kernel 的形状参数 $\beta$ 提供了两端：
- $\beta \to$ 高斯状（软、重叠多）
- $\beta \to$ 平顶近不透明 surfel（硬、单片即实心）

于是"该多硬"变成一个可学习的、按几何可信度设定的旋钮。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Beta kernel** | 可调形状参数的核，介于高斯与 surfel 之间 |
| **形状参数 $\beta$** | 几何置信度编码 |
| **可观测性角度 $\theta_0$** | 判断该 primitive 是否被足够多视角观测到的角度阈值（默认 $2^\circ$） |
| **实体化不透明度门 $o_{\mathrm{solid}}$** | 判定"已足够实心"的不透明度阈值（默认 0.7） |
| **已验证生成不透明度 $o_1$** | 几何验证通过时的初始不透明度（默认 0.3） |
| **误差驱动重定位** | 把近死 primitive 回收至持续高误差区域，保持总数不变 |
| **有界支撑 + 精确 tile culling** | beta kernel 支撑有界 → 可精确剔除 |
| **保形闭式合并** | shape-preserving merging，构成 LOD 层级 |

### 公式

```math
// 置信度驱动的形状/不透明度选择（语义形式）
// 几何可观测性：多视角深度一致性 -> 可观测性角度 θ0
float obsAngle = computeObservabilityAngle(prim, views);
bool verified  = (obsAngle >= theta_0);

// 形状参数在软/硬之间插值
float beta = lerp(beta_soft, beta_hard, confidence);   // confidence ∈ [0,1]

// 不透明度：已验证 -> 硬质实心；未验证 -> 柔和可修正
float opacity = verified ? o_1 : o_soft;               // o_1 = 0.3, o_solid = 0.7

// 实体化门：累积不透明度超过 o_solid 则视为已实心，停止继续增密
if (accumulatedOpacity >= o_solid) { /* stop growing */ }
```

---

## 代码片段

```python
# 置信度感知生成（语义伪代码）
def spawn_primitives(keyframe, views):
    for prim in keyframe.candidates:
        # 多视角深度一致性 -> 可观测性角度
        obs = compute_observability_angle(prim, views)
        verified = obs >= THETA_0                       # 默认 2°

        # 形状参数当置信度旋钮
        confidence = clamp(verified ? 1.0 : 0.0, 0, 1)
        prim.beta = lerp(BETA_SOFT, BETA_HARD, confidence)
        prim.opacity = verified ? O_1 : O_SOFT          # O_1 = 0.3

        # 实体化门：累积不透明度超阈值则不再增密
        if (accumulated_opacity(prim) < O_SOLID):       # O_SOLID = 0.7
            spawn(prim)

# 误差驱动重定位：回收僵死 primitive 到光度误差热点
def relocate_stale(prims, photometric_error_map):
    stale = [p for p in prims if p.near_dead()]
    hotspots = sample_error_hotspots(photometric_error_map, len(stale))
    for p, tgt in zip(stale, hotspots):
        p.recenter(tgt)                                # 保持总数不变
```

---

## 实验结论

- **数据集**: Mip-NeRF 360（on-the-fly 协议）、fr2/xyz
- **结果**:
  - **PSNR 最高提升 0.8 dB**，同时**优化时间减少最多 40%**
  - fr2/xyz 上完整方法：**28.45 dB / LPIPS 0.133**
  - **消融关键结论**：把误差加权替换为 3DGS-MCMC 的不透明度采样，比**完全禁用重定位更差**（27.89 dB vs 28.21 dB，LPIPS 0.148 vs 0.136）——说明不透明度采样主要在强化本来就强的区域
  - 超参消融（Garden / University2）：$\theta_0$ 在 $1^\circ$–$4^\circ$、$o_{\mathrm{solid}}$ 在 0.5–0.9、$o_1$ 在 0.2–0.5 范围内 PSNR 变化均在 ±0.1 dB 内 → **方法对超参不敏感，稳健**
- **效率**: 有界 beta kernel 支撑 → 精确 tile culling → 更快光栅化；LOD 层级支持实时渲染

---

## 局限性

- 预印本，未见同行评审
- 需要"多视角深度一致性"作为几何验证依据，单目/弱多目在线采集下可用性下降
- Beta kernel 相对高斯增加了每个 primitive 的参数与光栅化实现复杂度
- 在线重建中 primitive 只精炼数十次迭代的固有问题依然存在（论文用置信度生成部分缓解，未根治）

---

## 相关工作

- [[2026-09-08_TileGS-Gaussian-Rasterization]]
- [[2026-08-18-GS-Voxel-Fitting-Free-Structured-Latents]]
- [[2026-07-20-Instant-NuRec-Feed-Forward-3D-Gaussian-Reconstruction]]
- 概念：[[3D高斯泼溅]], [[Beta核]], [[在线重建]], [[LOD层级]]

---

## 实现建议

- **实现难度**: 中（需实现 beta kernel 光栅化 + 置信度生成 + 误差驱动重定位）
- **预期性能**: PSNR +0.8 dB、优化时间 −40%、精确 tile culling 加速光栅化
- **适用场景**: **在线/流式 3DGS 重建**（AR/VR 扫描、机器人、自动驾驶采集）
- **与团队的关系**: 误差驱动重定位的消融结论很有价值——**不透明度加权会强化强区域而非修复弱区域**。若团队已有 3DGS 致密化实现，这条经验可直接套用。建议 @墨鱼丸 参考
- **优先级**: 中
