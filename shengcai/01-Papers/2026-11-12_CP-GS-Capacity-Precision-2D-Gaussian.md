---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, 2D高斯, 率失真, 压缩, 量化, 图像表示]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13784
---

# CP-GS: Marrying Capacity and Precision for Efficient 2D Gaussian Image Representation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Marrying Capacity and Precision for Efficient 2D Gaussian Image Representation (CP-GS) |
| **作者** | Lin Dong, Qi Ming, Liuqian Wang, Wentao Chao, Yufei Gao, Chengming Liu, Lei Shi |
| **发表** | arXiv preprint (cs.CV), 2026-11-10 |
| **链接** | [原文](https://arxiv.org/abs/2611.13784) · [HTML全文](https://arxiv.org/html/2611.13784v1) |
| **DOI** | arXiv:2611.13784 |
| **代码** | 论文未给出 |

---

## 核心贡献

> **码率预算是有限的，而"用多少个 Gaussian"和"每个 Gaussian 存多少比特"这两个资源**通常被分开优化**——CP-GS 把它们在共享码率约束下联合优化。**

1. **内容自适应的 Gaussian 表示（content-adaptive capacity）**：在固定 Gaussian 预算下，**动态地把预算从冗余区域重新分配到表示需求更高的区域**。
2. **分层失真感知的表示量化（hierarchical distortion-aware quantization）**：用**基于渲染的高效标定**在 Gaussian 属性间分配精度，再在异质属性组内进一步精调。
3. **联合优化选点**：构造**不同 Gaussian 数量 × 不同精度配置**的候选表示，按**解码失真**与**实际序列化字节数**选择工作点（operating point）。
4. **结果**：在 DIV2K 与 Kodak 上，跨多档码率预算，率失真性能优于代表性的 2D Gaussian 与隐式神经表示，且**保持固定总体预算与低优化开销**。

---

## 技术方案

### 核心思想

2D Gaussian 表示图像时，有**两个正交的资源**：
1. **容量（capacity）**：多少个 Gaussian
2. **精度（precision）**：每个 Gaussian 的属性各存多少比特

现有方法**分别优化**这两者，忽略了：
- **内容相关的容量需求**（平坦区域不需要多 Gaussian，细节区域需要）
- **异质的量化敏感度**（不同属性——位置、颜色、协方差——对量化的敏感度差异很大）

CP-GS 在**共享码率约束**下联合优化两者。

### 关键技术表

| 技术 | 说明 |
|------|------|
| **Content-adaptive 预算重分配** | 固定 Gaussian 总数的前提下，把预算从冗余区域移到高需求区域 |
| **分层失真感知量化** | ① 属性组间分配精度（基于渲染的标定）② 属性组内进一步精调 |
| **基于渲染的高效标定** | 用一次渲染的失真反馈来标定量化敏感性，而不是逐属性穷举 |
| **多候选工作点** | 构造不同 (Gaussian 数量, 精度配置) 的候选表示 |
| **实际序列化字节数** | 选点依据是**真实编码后的体积**，而非理论 bit 数 |
| **固定总体预算** | 整个过程保持总表示预算不变，**低优化开销** |

---

## 公式

```math
% 率失真目标：在共享码率约束下联合优化容量与精度
\max_{\{N,\;q\}}\ \mathrm{D}(N,q)
\quad\text{s.t.}\quad
R(N,q)\le B
% N: Gaussian 数量（容量）；q: 各属性精度配置；D: 解码失真；B: 总码率预算
```

```math
% 内容自适应的容量重分配
% 把固定预算 N_total 从冗余区域移到高需求区域
N_i^{\text{new}}
=N_i^{\text{old}}
+\Delta_i,
\qquad
\sum_i \Delta_i=0
% Δ_i 由该区域的表示需求（如重建误差）决定
```

```math
% 分层失真感知量化：属性组间分配精度
\min_{\{q_a\}}\ \sum_{a\in\mathcal{A}}\ \alpha_a\cdot \mathrm{distortion}_a(q_a)
\quad\text{s.t.}\quad
\sum_{a\in\mathcal{A}} q_a \cdot \mathrm{size}_a \le B_q
% \mathcal{A}: 属性组（位置/颜色/协方差…）；q_a: 该组精度比特数
```

```math
% 组内进一步精调（在异质属性组内分配）
\min_{\{q_{a,k}\}}\ \sum_{k\in a} \beta_{a,k}\,\mathrm{distortion}_{a,k}(q_{a,k})
\quad\text{s.t.}\quad
\sum_{k\in a} q_{a,k}\cdot\mathrm{size}_{a,k}\le B_q^{(a)}
```

```math
% 工作点选择：按解码失真 + 实际序列化字节数
(N^\star,q^\star)=\arg\min_{N,q}\ \mathrm{distortion}(N,q)
\quad\text{s.t.}\quad
\mathrm{bytes}_{\text{serialized}}(N,q)\le B
```

```math
% 2D Gaussian 的渲染（基本形式）
C(p)=\sum_i T_i(p)\,\alpha_i(p)\,c_i,
\qquad T_i(p)=\prod_{j<i}(1-\alpha_j(p))
```

---

## 代码片段

```python
# 内容自适应的容量重分配
def reallocate_capacity(gaussians, demand, n_total):
    """
    demand: 每个 Gaussian 当前位置的"表示需求"（如重建误差/梯度幅值）
    在总预算固定的前提下，把预算从冗余区域移到高需求区域。
    """
    # 冗余区域：需求低且附近已有足够覆盖
    redundancy = estimate_redundancy(gaussians)
    # 按需求排序，低需求的作为可回收对象
    order = torch.argsort(demand - redundancy)
    surplus = gaussians[order[:int(len(gaussians) * 0.1)]]   # 回收候选
    deficit_regions = select_high_demand_regions(demand, redundancy)

    # 剪掉冗余，把预算给到高需求区域
    new_gaussians = prune(surplus)
    new_gaussians = add_at(new_gaussians, deficit_regions,
                           count=len(surplus))
    assert len(new_gaussians) == n_total    # 总预算不变
    return new_gaussians
```

```python
# 分层失真感知量化：属性组间分配精度
def allocate_precision_by_distortion(groups, size_per_attr, budget_bits, render_fn):
    """
    groups: 属性组 -> 成员属性列表
    render_fn: 用当前配置渲染，用于快速标定失真
    ① 在组间分配精度（基于渲染的标定）
    ② 再在组内精调
    """
    # ---- ① 组间分配 ----
    # 一次性渲染得到基线失真，按各组对失真的边际影响分配比特
    base = render_fn(current_config())
    marginal = {}
    for a in groups:
        # 降低该组精度的边际失真影响（用小样本标定，代价低）
        coarse = quantize_group(a, level=min_level)
        marginal[a] = distortion(render_fn(coarse)) - base

    # 贪心：把比特分给边际影响最大的组
    alloc = {a: min_level for a in groups}
    for _ in range(budget_bits):
        best = max(groups, key=lambda a: marginal[a] / (size_per_attr[a]))
        if alloc[best] >= max_level:
            break
        alloc[best] += 1
        # 重新标定（增量更新，避免全量重渲染）
        marginal[best] = remeasure_marginal(best, alloc[best], render_fn)

    # ---- ② 组内精调 ----
    for a in groups:
        alloc.update(refine_within_group(a, alloc[a], render_fn))
    return alloc
```

```python
# 工作点选择：按解码失真 + 实际序列化字节数
def select_operating_point(candidates, budget_bytes):
    """
    candidates: 不同 (Gaussian 数量, 精度配置) 的候选表示
    选点依据是真实序列化字节数，而非理论 bit 数。
    """
    best = None
    for cand in candidates:
        payload = serialize(cand.gaussians, cand.precision)   # 真实字节
        if len(payload) > budget_bytes:
            continue
        d = decode_distortion(cand)
        if best is None or d < best.distortion:
            best = (cand, d, len(payload))
    return best
```

```python
# 2D Gaussian 渲染
def render_2d_gaussians(gaussians, cam):
    # 高斯投影到 2D，alpha 混合
    means2d, conics2d = project(gaussians, cam)
    color = gaussians.rgb
    return rasterize_alpha_blend(means2d, conics2d, color, gaussians.opacity)
```

---

## 实验结论

- **数据集**: **DIV2K**、**Kodak**
- **基线**: 代表性的 **2D Gaussian 图像表示**方法与**隐式神经表示**（论文未在摘要层逐一列出）
- **结果**:
  - **跨一整档码率预算**，率失真性能优于代表性的 2D Gaussian 与隐式神经表示
  - **保持固定的总体表示预算**（总码率不变）
  - **低优化开销**——联合优化不带来显著的计算代价
  - 论文定位为"budget-aware"方法，核心贡献在**分配策略**而非新表示

---

## 局限性

- **2D Gaussian 图像表示**（不是 3D 场景）——**与三维渲染管线的距离较远**，直接可用性低
- 依赖"基于渲染的高效标定"——标定本身有成本，"高效"是相对全量穷举而言
- 候选表示的构造需要多次训练/渲染，**总开销高于单次训练的基线**
- 属性量化敏感度依赖图像内容，对**极端内容**（高动态范围、精细纹理）的外推未验证
- 无代码公开

---

## 相关工作

- [[2026-11-09_AF-NTC-Explicit-LOD-Conditioned-Anisotropic-Filtering]] — 神经纹理压缩与过滤
- [[2026-11-05_Patch-Based-Generalized-Neural-Texture-Upscaling]] — 神经纹理上采样
- [[2026-11-10_Deformable-Texture-Maps-Dynamic-Microgeometry-Neural-Textures]] — 神经纹理
- [[2026-11-03_AbacusGS-Gaussian-Splatting-without-Per-Splat-Sorting]] — 高斯表示的存储效率（17 B/splat）

---

## 实现建议

- **实现难度**: **中**（容量重分配 + 分层量化标定 + 多候选工作点选取，算法清晰但工程繁琐）
- **预期性能**: 跨码率预算的率失真优于现有 2D Gaussian 与隐式表示；优化开销低
- **适用场景**:
  - ✅ **图像/纹理的紧凑存储与传输**（纹理压缩管线）
  - ✅ **需要按码率动态调整质量的实时流媒体/游戏资源管线**
  - ⚠️ 作为**方法论**参考价值 > 直接使用价值——"容量与精度联合优化"的思想可迁移
- **对墨鱼丸的建议**: 与 [[2026-11-01_AbacusGS-Gaussian-Splatting-without-Per-Splat-Sorting]]（17 B/splat 紧凑格式）**配合使用价值高**：AbacusGS 解决"排序"的空间问题，CP-GS 解决"属性精度"的比特分配问题。两者都属**零风险正交优化**，可叠加。

---

## 与团队协作

- **可传递给 @墨鱼丸**: 容量-精度联合优化的分配策略、分层量化的标定流程
- **可反馈 @吊龙（后端）**: 纹理压缩管线的码率-质量工作点选择策略
