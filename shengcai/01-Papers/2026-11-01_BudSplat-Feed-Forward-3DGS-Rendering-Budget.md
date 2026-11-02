---
type: paper
created: 2026-11-01
updated: 2026-11-01
tags: [paper, 渲染, 神经渲染, Gaussian-Splatting, 前馈重建, 剪枝, 实时渲染, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.38278
---

# BudSplat: Feed-forward 3D Gaussian Splatting under a Rendering Budget

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | BudSplat: Feed-forward 3D Gaussian Splatting under a Rendering Budget |
| **作者** | Muyu Xu, Fangneng Zhan, Yu Wei, Ling Shao, Shijian Lu |
| **发表** | arXiv preprint 2026-10-28（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2610.38278) · [HTML](https://arxiv.org/html/2610.38278v1) |
| **DOI** | 10.48550/arXiv.2610.38278（DataCite pending） |
| **代码** | 论文未给出仓库链接（待跟踪） |

---

## 核心贡献

> 前馈 3DGS 从稀疏输入扩展到稠密多视图时，**候选高斯数量急剧增长**（因为更多视角覆盖重复区域），但已有方法**无法可靠区分冗余图元** → 渲染成本上升而画质几乎不涨。BudSplat 学习在**限定图元预算**下保留最有价值的那些高斯。

1. **Detail-aware importance score（细节感知重要性分数）**：从**多层级视觉 token** 中提取显式的重要性线索，明确指示「哪些区域被剪枝会损害感知质量」。这个分数的关键设计是：它**可以注入 voxel fusion 阶段**，从而在多视图聚合过程中就**保护高价值的局部贡献者**（而不只是事后剪枝）。
2. **Quality-aware Gaussian pruning（质量感知剪枝）**：联合考虑**渲染贡献**与**细节重要性**来挑选紧凑图元集合。
3. **Local quota redistribution（局部配额重分配）**：避免把图元过量分配给「面积大但冗余」的区域 —— 这正是稀疏→稠密视图扩展时的典型失效模式（重复观测区域被过度分配）。
4. **结果**：在 RE10K、DL3DV、ACID 上取得渲染质量与效率的良好权衡。

---

## 技术方案

### 核心思想

前馈 3DGS 的图元数量 $\mathcal{N}$ 随输入视图数 $\mathcal{V}$ 增长，因为每个视图都会在自己的像素对齐位置生成候选高斯：

```math
\mathcal{N} \approx \mathcal{V} \times H \times W \quad \text{(pixel-aligned 情形)}
```

而**多视图之间存在大量重叠观测**，重叠区域产生了功能重复的高斯。问题因此是：**在图元预算 $\mathcal{B}$ 下，如何选出 $\mathcal{B}$ 个「贡献最大」的高斯**。

BudSplat 的两个设计对应两个不同的干预时机：

- **detail-aware score 注入 voxel fusion**：在**融合阶段**就区分高价值区域 → 高价值局部贡献者在聚合过程中被保留（这是「前向保护」）
- **quality-aware pruning**：在**剪枝阶段**做最终选择 → 联合渲染贡献与细节重要性（这是「后向筛选」）

### 关键技术

| 技术 | 说明 |
|------|------|
| **Detail-aware importance score** | 从多层视觉 token 提取；显式指示剪枝的感知代价 |
| **Voxel fusion 中注入重要性** | 在多视图聚合阶段保护高价值局部贡献者，而非事后补救 |
| **Quality-aware pruning** | 联合「渲染贡献」+「细节重要性」两个维度选择 |
| **Local quota redistribution** | 把配额从大面积冗余区转移到高价值区，避免 over-allocation |
| **渲染预算 $\mathcal{B}$** | 框架的核心约束，图元数为显式可控变量 |

### 公式

多层级 token 的细节重要性聚合（结构化形式化）：

```math
s_{\mathrm{det}}(v) = \sum_{\ell \in \mathcal{L}} w_\ell \cdot \mathrm{Norm}\big(F_\ell(v)\big),
\qquad \mathcal{L} = \{\ell_1, \ell_2, \dots, \ell_L\}
```

质量感知剪枝打分（渲染贡献 + 细节重要性联合）：

```math
s(v) = \underbrace{\alpha \cdot c_{\mathrm{render}}(v)}_{\text{渲染贡献}}
     + \underbrace{(1-\alpha) \cdot s_{\mathrm{det}}(v)}_{\text{细节重要性}}
```

Voxel fusion 中的重要性注入（融合权重按重要性调制）：

```math
w^{\mathrm{fuse}}_{v,i} \;=\; w^{\mathrm{base}}_{v,i} \cdot \big(1 + \lambda\, s_{\mathrm{det}}(v)\big)
```

局部配额重分配（在预算 $\mathcal{B}$ 内按区域价值分配）：

```math
\mathcal{B}_r = \mathcal{B} \cdot \frac{V_r}{\sum_{r'} V_{r'}},
\qquad
V_r = \sum_{v \in r} s_{\mathrm{det}}(v) \cdot c_{\mathrm{render}}(v)
```

其中 $r$ 为空间区域（voxel/cluster），$V_r$ 为区域价值。相较「按面积或观测数分配配额」，这避免了冗余大区域的过度分配。

### 代码片段

```python
# 概念级伪代码：细节感知得分 + 质量感知剪枝 + 局部配额重分配
def bud_splat_budget(voxel_features, multi_level_tokens,
                     render_contrib, budget):
    # 1) 多层级 token 提取细节重要性
    s_det = sum(w[l] * F[l](multi_level_tokens) for l in levels)
    s_det = per_gaussian_normalize(s_det)

    # 2) 在 voxel fusion 中注入重要性（前向保护高价值贡献者）
    fused = voxel_fusion(voxel_features, weights_base * (1 + lam * s_det))

    # 3) 联合打分
    score = alpha * render_contrib(fused) + (1 - alpha) * s_det

    # 4) 局部配额重分配：按区域价值而非面积分配预算
    regions = voxel_regions(fused)
    value_r = region_sum(score, regions)
    quota_r = budget * value_r / value_r.sum()

    # 5) 各区域内做 top-k 选择，合并
    selected = []
    for r in regions:
        k = int(quota_r[r])
        selected.append(topk(score[regions[r]], k))
    return merge(selected)
```

---

## 实验结论

- **数据集**：RE10K（RealEstate10K）、DL3DV、ACID
- **评测维度**：新视角合成质量 + 渲染效率（fps / 图元数）
- **结论**：在三个数据集上取得渲染质量与效率的良好权衡（favorable trade-off among rendering quality and efficiency）
- **数值细节**：摘要未给出具体 PSNR/SSIM/LPIPS/fps 表，也未列出具体基线；论文正文表格可能有，摘要未披露
- **对比关系**：与 [[2026-11-01_ACD-GS-Asymmetric-Curvature-Densification]] 相反——ACD-GS 治「训练期冗余增殖」，BudSplat 治「前馈推理期图元预算」

---

## 局限性

1. **摘要未给量化对比**：无法判断相对具体基线（如 pixelSplat / MVSplat / GPS-GS / Flash3D）的增益幅度
2. **需额外训练一个重要性预测分支**：detail-aware score 不是免费的，需要从多层视觉 token 学出来；引入额外监督或训练成本（摘要未说明是否端到端联合训练）
3. **预算 $\mathcal{B}$ 的最优点依场景而异**：稀疏/稠密视图下的最优预算不同，摘要未给自适应策略
4. **Local quota redistribution 依赖区域划分**：voxel/cluster 粒度选择影响结果，摘要未讨论敏感性
5. **与「内生紧凑」路线的关系未明**：与 ACD-GS 这类从源头减少冗余的方法相比，BudSplat 更像是预算约束下的选择器，二者是否可叠加未在摘要中提及

---

## 相关工作

- [[2026-11-01_ACD-GS-Asymmetric-Curvature-Densification]] — 训练期致密化改进，同为紧凑化目标
- [[2026-11-01_ParetoGS-Continuous-Budget-Gaussian-Splatting]] — 连续预算压缩，方法论相近
- [[2026-11-01_GeoGSplat-Geometry-Grounded-Non-Pixel-Aligned-GS]] — 非像素对齐路线，直接针对图元数量问题
- [[2026-11-01_GradSplat-Gradients-Inside-Forward-Pass]] — 同为前馈 3DGS，从「精修」而非「裁剪」角度切入
- [[2026-10-31_Gaussian-Grid-Frequency-Adaptive-Neural-Representation]] — 频率自适应计算划分
- [[Gaussian-Splatting]] / [[Voxel-Fusion]] / [[Feed-Forward-3DGS]] — 基础技术

---

## 实现建议

- **实现难度**：**中**。需要：(a) 多层级视觉 token 的重要性打分分支；(b) voxel fusion 权重的调制接口（要求 fusion 阶段可插拔）；(c) 渲染贡献度量的计算（通常需要一次额外的贡献采样/近似）；(d) 区域划分与配额重分配逻辑；(e) 预算约束下的 top-k 选择（可 GPU 化）。
- **预期性能**：摘要仅称「良好权衡」，无具体数字。建议实现前先复现基线的质量-效率曲线再做对比。
- **适用场景**：
  - ✅ 前馈 3DGS 的**在线服务 / 端侧部署**（图元预算必须硬约束）
  - ✅ 稠密多视图输入的前馈重建（冗余最严重的场景）
  - ✅ 需要「质量随预算可调」的系统（预算作为可配置项）
  - ❌ 不适用于逐场景优化训练的 3DGS（无 voxel fusion 阶段）
- **推荐度**：**⭐⭐⭐ 推荐** —— 工程价值明确（预算硬约束是部署刚需），但方法增量偏工程化，缺少强理论突破。建议在有明确端侧/服务端部署需求时再实现。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.38278
- HTML 全文：https://arxiv.org/html/2610.38278v1
- PDF：https://arxiv.org/pdf/2610.38278
