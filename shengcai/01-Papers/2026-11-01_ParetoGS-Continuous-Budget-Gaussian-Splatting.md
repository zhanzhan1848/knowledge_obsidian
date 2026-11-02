---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, 渲染, 神经渲染, Gaussian-Splatting, 连续预算, 模型压缩, 前馈重建, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.34235
---

# ParetoGS: High-Quality Continuous-Budget 3D Gaussian Splatting with Sparse Adapted Anchors

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | ParetoGS: High-Quality Continuous-Budget 3D Gaussian Splatting with Sparse Adapted Anchors |
| **作者** | Xiaobin Deng, Changyu Diao, Min Li, Duanqing Xu（与 BoundedGS 同组） |
| **发表** | arXiv preprint 2026-10-25（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2610.34235) · [HTML](https://arxiv.org/html/2610.34235v1) · [项目页](https://xiaobin2001.github.io/ParetoGS-Web/) |
| **DOI** | 10.48550/arXiv.2610.34235（DataCite pending） |
| **代码** | 项目页 https://xiaobin2001.github.io/ParetoGS-Web/ |

---

## 核心贡献

> 「一个场景表示服务多个高斯数量预算」的可伸缩 3DGS，其**质量-预算曲线**往往落后于「为每个预算单独优化」的模型。根因：减少高斯数同时改变了**两件事**——(1) **哪些成员被保留**，(2) **幸存者承担的重建任务**；从高预算模型继承下来的参数，对低预算表示往往并不适配。ParetoGS 用**稀疏的「适配后预算锚点」**描述成员变化与参数演化，从而**无需在每个请求的图元数上单独优化**即可解码中间预算。

1. **交替剪枝 + 定员适配（alternating pruning and fixed-member adaptation）**：构建**嵌套锚点（nested anchors）**，且锚点成员**保持持久身份（persistent identities）**——这是能插值的前提。
2. **紧凑残差图集（compact residual atlas）**：把锚点相对全模型的参数变化编码进一个紧凑的残差图集，而非为每个锚点存完整副本。
3. **连续预算解码**：在解码时**插值共享成员的状态**，并**渐进引入新成员的渲染贡献**，把稀疏锚点连成一条连续的质量-预算曲线。
4. **结果（13 场景）**：
   - 相对**前缀式方法（prefix methods）**：在**每个方法自身全模型的 10%** 预算下，取得更好的平均 PSNR / SSIM / LPIPS，且高斯数更少
   - 相对 **FlexGS-imp**：在其训练的 1% / 5% / 10% 预算上均更优
   - 相对 **NanoGS-imp**：在 1% 与 0.1% 预算上更优
   - 在 **Garden** 场景上，非锚点预算点的质量接近「独立优化 GNS 模型」的实证参考，在更低保留率处**反超**
   - **编码开销**：13 场景上平均额外状态从 **390.0 MB → 85.7 MB**（-78%），PSNR 平均变化仅 **0.01 dB**

---

## 技术方案

### 核心思想

这是**质量-预算前沿（quality-budget frontier）**的建模问题。朴素做法「训练一个全模型，然后按某种排序取前 k 个」（prefix method）之所以差，是因为：

- 取前 k 个**改变了表示的任务分配**：原本由被裁掉的成员承担的空间区域，现在必须由幸存者重新承担；
- 但幸存者的参数**仍是按全模型的任务分配优化出来的**，与新任务不匹配 → 需要「适配」。

ParetoGS 的解法是把这两个变化**显式建模**：

```
成员变化（哪些图元被裁）  →  嵌套锚点 + 持久身份
参数演化（幸存者如何适配） →  定员适配 + 残差图集
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Nested anchors（嵌套锚点）** | 锚点之间形成嵌套关系；成员身份持久，可跨预算追踪 |
| **Alternating prune + fixed-member adaptation** | 交替执行「剪枝」与「在固定成员集合上适配参数」，逐步构建嵌套锚点 |
| **Compact residual atlas** | 参数变化编码为相对全模型的残差图集，存储 390.0 → 85.7 MB |
| **State interpolation** | 解码中间预算时，插值共享成员的状态 |
| **Gradual contribution introduction** | 新成员被渐进式引入渲染贡献（不是硬切换），保证连续性 |
| **Continuous-budget representation** | 稀疏锚点 + 插值 = 连续的预算轴，无需每预算单独优化 |

### 公式

质量-预算前沿的建模（问题定义）：

```math
\max_{\mathcal{G}_k}\ \mathcal{Q}(\mathcal{G}_k)
\quad\text{s.t.}\quad |\mathcal{G}_k| = k,
\qquad \mathcal{Q} = \mathrm{PSNR} \;(\text{或 SSIM/LPIPS})
```

理想前沿是 $\mathcal{Q}^*(k)$，需要为每个 $k$ 单独优化：$\mathcal{G}_k^* = \arg\max_{|\mathcal{G}|=k}\mathcal{Q}(\mathcal{G})$。ParetoGS 用锚点集 $\mathcal{A}=\{a_1,\dots,a_m\}$ 与解码器逼近它：

```math
\mathcal{G}(k) = \mathrm{Decode}\big(\mathcal{A},\ \alpha(k)\big),
\qquad \alpha(k) = \text{锚点间插值权重}
```

共享成员状态插值：

```math
\theta_{\mathrm{shared}}(k) = \sum_{a} \alpha_a(k)\, \theta^{(a)}_{\mathrm{shared}},
\qquad \sum_a \alpha_a(k) = 1
```

新成员贡献的渐进引入（软混合）：

```math
\mathcal{L}_{\mathrm{render}}(k) = \sum_{g \in \mathcal{G}_{\mathrm{shared}}} c_g\,\mathcal{R}(g)
\;+\; \sum_{g \in \mathcal{G}_{\mathrm{new}}} \underbrace{\gamma(k)}_{\text{渐增系数}} c_g\,\mathcal{R}(g),
\qquad \gamma(k) \in [0, 1]
```

其中 $\gamma(k)$ 随 $k$ 增大而从 0 渐增到 1，实现「先部分引入、再完全接管」的平滑过渡。

残差图集编码（相对全模型）：

```math
\Delta\theta^{(a)} = \theta^{(a)} - \theta^{(\mathrm{full})},
\qquad
\text{Storage}(\Delta) \ll \text{Storage}\big(\{\theta^{(a)}\}\big)
\]

嵌套锚点的构建（交替过程）：

```math
\text{for } a \in \mathcal{A}:
\quad
\mathcal{M}^{(a)} \leftarrow \mathrm{Prune}\big(\mathcal{M}^{(a-1)}\big),
\qquad
\theta^{(a)} \leftarrow \mathrm{Adapt}\big(\theta^{(a)}, \mathcal{M}^{(a)}\big)
\quad \text{(成员集合固定，只调参数)}
```

### 代码片段

```python
# 概念级伪代码：构建嵌套锚点 + 解码连续预算
def build_nested_anchors(full_model, budgets):
    """交替剪枝与定员适配，锚点成员保持持久身份。"""
    anchors = {}
    members = full_model.gaussian_ids          # 持久身份
    theta = full_model.params

    for b in budgets:
        # (a) 剪枝：改变成员集合
        members = prune_by_score(members, theta, keep=b)
        # (b) 定员适配：在固定成员集合上优化参数
        theta = adapt_parameters(theta, members, fixed_members=True)
        # (c) 残差图集：只存相对全模型的差异
        anchors[b] = {
            'members': members,                      # 持久身份
            'residual_atlas': compress(theta - full_model.params),
        }
    return anchors

def decode_at_budget(anchors, k):
    """在锚点间插值，渐进引入新成员的渲染贡献。"""
    lo, hi = bracket_anchors(anchors, k)
    alpha = interpolate_weight(lo, hi, k)

    # 共享成员：插值状态
    shared = intersect_members(lo['members'], hi['members'])
    theta_shared = alpha * lo.residual[shared] + (1-alpha) * hi.residual[shared]

    # 新成员：渐进引入渲染贡献
    new = setdiff(hi['members'], lo['members'])
    gamma = ramp(alpha)                        # 0 → 1 平滑过渡
    return compose(shared, theta_shared, new, gamma)
```

---

## 实验结论

- **数据集**：13 个场景（含 **Garden**）
- **基线**：prefix methods（取前缀式方法）、**FlexGS-imp**、**NanoGS-imp**、独立优化的 **GNS** 模型（作为经验参考）

**核心结果**：

| 对比项 | 预算 | ParetoGS 结果 |
|--------|------|--------------|
| vs. 各方法自身全模型的 **10%** | 10% | **更好**的平均 PSNR / SSIM / LPIPS，且高斯数**更少** |
| vs. FlexGS-imp | 1% / 5% / 10% | 在其训练预算点上**均更优** |
| vs. NanoGS-imp | 1% / 0.1% | **更优** |
| vs. 独立优化 GNS（经验参考） | Garden | 非锚点预算点**接近**参考；在更低保留率处**反超** |

**编码开销（13 场景平均）**：

| 指标 | 基线 | ParetoGS | 变化 |
|------|------|----------|------|
| 平均额外状态 | 390.0 MB | **85.7 MB** | **-78.0%** |
| PSNR 变化 | — | — | 仅 **0.01 dB** |

> 「状态存储降 78%、画质仅损失 0.01 dB」是本篇最硬的核心数字。

---

## 局限性

1. **需要一组预算点的离线构建成本**：锚点构建需在若干预算上分别做「剪枝 + 适配」优化，摘要未给构建时间
2. **插值不保证最优**：连续解码是锚点间的插值，理论上前沿是凸的/光滑的才成立；摘要未讨论插值误差的理论界
3. **摘要未给具体 PSNR 数值表**：仅有相对结论（更好/更优）与 0.01 dB 的编码代价，缺少绝对量级
4. **「持久身份」的实现难度未说明**：跨预算追踪同一逻辑图元的身份，在剪枝/重训中并非平凡
5. **依赖图元可排序性**：本质仍是「按某个分数排序后取前缀/嵌套」，排序分数的质量决定了整个方法的上限（论文未强调此依赖）
6. **与 ACD-GS / BudSplat 的关系未讨论**：若图元本身从源头就少了（ACD-GS）或预算选择更聪明（BudSplat），ParetoGS 的相对增益可能缩小

---

## 相关工作

- [[2026-11-01_BoundedGS-Memory-Efficient-High-Resolution-3DGS]] — 同组作者的显存侧工作，互补
- [[2026-11-01_ACD-GS-Asymmetric-Curvature-Densification]] — 内生紧凑路线，减少「前缀排序」的空间
- [[2026-11-01_BudSplat-Feed-Forward-3DGS-Rendering-Budget]] — 前馈场景的预算选择器
- [[FlexiGS]] / [[NanoGS]] — 直接对比的基线方法
- [[GNS]] — 独立优化的参考模型
- [[Gaussian-Splatting]] / [[Model-Compression]] — 基础技术

---

## 实现建议

- **实现难度**：**中偏高**。需要：(a) 图元的持久身份管理；(b) 跨锚点的成员求交/差集；(c) 每个锚点的「定员适配」优化循环（参数优化器需支持成员集合冻结）；(d) 残差图集的压缩编码；(e) 解码时的插值 + 渐进贡献引入（需要渲染器支持逐图元的贡献权重）。
- **预期性能**：状态存储 -78%（390.0 → 85.7 MB），PSNR 代价 0.01 dB；相对 FlexGS-imp / NanoGS-imp 在 0.1%–10% 预算区间更优。
- **适用场景**：
  - ✅ 同一场景需要在**多个质量档位**下服务（VR LOD、远景降级、带宽分级传输）
  - ✅ **存储/传输受限**的 splat 分发（85.7 MB 的额外状态远小于存多份完整模型）
  - ✅ 需要「一个模型服务整个质量-预算前沿」的系统设计
  - ❌ 不适用于只服务单一预算的场景（此时直接训一个对应预算的模型更省事）
- **推荐度**：**⭐⭐⭐⭐ 推荐** —— 「**一个模型 + 连续预算轴**」是 3DGS 部署的标准需求形态，ParetoGS 提供了干净的数学框架。核心数字（-78% 状态、-0.01 dB）有说服力。实现难点集中在「持久身份」与「渐进贡献引入」的渲染器改造。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.34235
- HTML 全文：https://arxiv.org/html/2610.34235v1
- PDF：https://arxiv.org/pdf/2610.34235
- 项目页：https://xiaobin2001.github.io/ParetoGS-Web/
