---
type: paper
created: 2026-10-24
updated: 2026-10-24
tags: [paper, water-rendering, ocean-rendering, underwater, 3DGS, volume-rendering, SIGGRAPH-Asia-2026, Gaussian-Splatting]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2609.29985
---

# OceanXL: Large-scale Underwater 3D Gaussian Splatting via Block Partitioning and Adaptive Pruning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | OceanXL: Large-scale Underwater 3D Gaussian Splatting via Block Partitioning and Adaptive Pruning |
| **arXiv ID** | 2609.29985v1 |
| **作者** | Haoran Wang, Shaoyu Cai, Adrian Azzarelli, Zhuodong Jiang, Guoxi Huang, Eng Tat Khoo, Brett Seymour, Fan Zhang, David Bull, Nantheera Anantrasirichai |
| **发表** | **SIGGRAPH Asia 2026 Conference Papers**（2026-12-01~04, Kuala Lumpur） |
| **链接** | [原文](https://arxiv.org/abs/2609.29985) |
| **DOI** | 待定（ACM DL 收录中） |
| **渲染类别** | **体积渲染 / 3DGS + 水下介质** |

---

## 核心贡献

> 用**分块划分 + 自适应剪枝**解决 3DGS 在**大规模水下场景**中的内存爆炸与优化低效问题，并配套发布大规模水下数据集。

1. **Divide-and-Conquer 分块划分**：将场景切分为空间连贯的 block，各 block 独立优化同时保持全局几何一致性 —— 突破单一大场景优化的内存墙。
2. **水下专用自适应剪枝（adaptive pruning）**：移除水下冗余 primitive，在几乎不损失视觉保真度的前提下得到紧凑表示。
3. **大规模水下数据集**：覆盖多样海洋环境（marine environments），填补水下 3D 重建基准空白。
4. **效率-质量权衡**：5 个大场景上优于大场景基线；在 SeaThru-NeRF 小规模集上以**显著更小的模型体积**达到有竞争力的重建质量。

---

## 技术方案

### 核心思想

水下 3D 重建的三大物理障碍：

| 障碍 | 物理成因 | 对 3DGS 的影响 |
|------|---------|--------------|
| 光衰减 | 吸收 (absorption) | 远景对比度塌陷 |
| 散射 | 散射 (scattering) | 体积雾遮挡，深度歧义 |
| 视场覆盖有限 | 介质浑浊 | 稀疏视角 → 几何欠约束 |

3DGS 本身的瓶颈在**大规模**：primitive 数量随体积增长 → VRAM 爆炸 + 优化迭代缓慢。

OceanXL 的思路：**空间分块降低单次优化的规模 + 自适应剪枝回收冗余容量**，两条腿同时解决"大"的问题。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Spatial Block Partitioning** | 按空间连贯性切块；每块独立优化，同时约束保持全局几何一致性 |
| **Adaptive Pruning** | 针对水下条件定制剪枝准则，剔除冗余 primitive，压缩表示体积 |
| **Underwater-aware Dataset** | 大规模、多样海洋环境水下数据集（本文发布） |
| **3DGS Base Pipeline** | 沿用 3DGS 光栅化渲染主干，水下渲染依赖其快速实时特性 |

---

## 公式

论文核心为系统与策略贡献，核心算子可归纳为分块划分下的高斯集合：

```math
\mathcal{G} = \bigcup_{k=1}^{K} \mathcal{G}_k,\quad
\mathcal{G}_k = \{(\mathbf{m}_i, \mathbf{s}_i, \mathbf{q}_i, \mathbf{o}_i)\}_{i \in \mathcal{I}_k}
```

剪枝保留集合 $\mathcal{I}_k^{\text{keep}} \subset \mathcal{I}_k$，满足在给定视角集合下的光度损失约束：

```math
\min_{\mathcal{I}_k^{\text{keep}}} \sum_{v \in V} \left\| I_{\text{render}}(v; \mathcal{G}_k^{\text{keep}}) - I_v \right\|^2
\quad \text{s.t.} \quad
\|\mathcal{G}_k^{\text{keep}}\| \le \beta \|\mathcal{G}_k\|
```

其中 $\beta$ 为压缩比，$\mathbf{m}$ 为均值、$\mathbf{s}$ 为尺度、$\mathbf{q}$ 为旋转、$\mathbf{o}$ 为不透明度。

---

## 实验结论

- **数据集**: 本文新发布的大规模水下数据集（5 个大场景）+ SeaThru-NeRF（受控小规模对比）
- **基线**: 大场景 3DGS 类基线；水下专用方法（对比模型体积）
- **结果**:
  - 5 个大场景：可扩展性、紧凑性、效率-质量权衡**全面占优**
  - SeaThru-NeRF：重建质量有竞争力，且**模型体积显著更小**（优于 underwater-specific 方法）

---

## 局限性

- 论文以 **3DGS** 为基础，未涉及**显式水体/流体界面渲染**（无自由液面、无折射/焦散）。
- 水下散射主要体现为**采集端的数据特性**，而非渲染端的物理次表面散射模型。
- 分块划分带来**块间接缝**与全局一致性维护的额外开销（摘要未给出量化）。

---

## 相关工作

- [[AquaNeRF-Underwater-NeRF]] — 本领域最早的 NeRF 水下方案
- [[Physics-Shaped-Underwater-Image-Restoration-Audit]] — 水下图像复原综述（2026-10-15 收录）
- [[Hamiltonian-Wave-Flow-Coupling-SIGGRAPHAsia2026]] — 同为 SIGGRAPH Asia 2026 的流体渲染工作
- [[3D Gaussian Splatting]]
- [[SeaThru-NeRF]] — 对比数据集来源

---

## 实现建议

- **实现难度**: 🟡 中（分块 3DGS 改造 + 剪枝调度）
- **预期性能**: 大场景训练效率与模型体积显著优于朴素 3DGS
- **适用场景**: 海洋探测、生态监测、海底基础设施巡检

### 🌱 豆苗评注

**这篇的核心价值不在"渲染"而在"介质场景的可扩展重建"**。对流体渲染的启发在于：**水下是唯一把"散射"和"衰减"同时拉满的渲染环境**，它的分块 + 剪枝策略本质上是一套**面向高噪声介质的资源分配方案**。如果把这套"按块自适应分配容量"的思路反向用到**烟雾/浑浊流体的体积渲染**上——即在浓密区域保留更多样本、在稀薄区域激进剪枝——就是一套现成的**自适应步进 + 早停策略**，可以显著削减 ray marching 的采样开销。值得跟踪 OceanXL 是否开源剪枝准则。

---

## 🩸 可行性分析：自适应剪枝驱动的自适应光线步进

## 渲染方法
- 类型：体积渲染（粒子/介质）
- 技术：将 OceanXL 的 adaptive pruning 准则迁移为 ray marching 的自适应采样密度控制

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（沿用原方法）
- 风格化支持：是（密度函数可参数化）

## 性能预期
- 帧率：预期 1.5–3× 提升（浓密区加密、稀薄区早停）
- GPU 需求：中
- 内存占用：显著下降

## 实现建议
- 着色器复杂度：中
- 管线要求：密度场 + 分级采样密度
- 推荐度：✅
