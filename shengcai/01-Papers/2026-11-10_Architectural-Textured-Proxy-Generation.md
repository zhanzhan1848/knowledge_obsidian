---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, 建筑可视化, 纹理映射, 代理模型, 重建, SIGGRAPH-Asia-2026, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12077
arxiv_id: 2611.12077
---

# Architectural Textured Proxy Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Architectural Textured Proxy Generation |
| **作者** | Weidan Xiong, Shihao Feng, Kaijie Qu, Hao Li, Mingqi Zhang, Daniel Cohen-Or, Hui Huang（香港大学 / 北京大学等） |
| **发表** | **SIGGRAPH Asia 2026**（arXiv 2611.12077, 2026-11-09） |
| **链接** | [原文](https://arxiv.org/abs/2611.12077) / [HTML 全文](https://arxiv.org/html/2611.12077v1) |
| **DOI** | —（SIGGRAPH Asia 2026 会议论文，DOI 待 ACM DL 上载） |
| **代码** | 论文未在摘要中给出 |

---

## 核心贡献

> **把「建筑代理模型生成」从纯几何问题改为「图像引导」问题**：代理生成阶段就同时受稠密重建与航拍图像约束，从源头消除立面/边缘/交线的跨视角错位，而不是把错误推迟到下游纹理映射阶段再补救。

1. **范式转变**：从 **geometry-only** 到 **image-guided** 的代理生成形式化——之前是「先抽象几何，再投影纹理」的顺序流水线，几何阶段忽略图像证据，导致结构特征错位，**且错位一旦推到下游纹理阶段就再也无法可靠恢复**。
2. **基于法线的相机位姿精化**：用单目法线估计（MoGe）作为先验，用**可微渲染器**渲染法线图并反向优化相机位姿，解决「建筑朝向的相机误差」。
3. **ProxySAM**：基于自建 **PlaneSet** 基准（东京数据集约 3.62 km²，1000 个航拍视角）LoRA 微调 **SAM 3**，从航拍图像中分割「facade plane」实例。
4. **2D→3D 平面先验 + 局部/全局法线引导**：把 2D 平面实例投影到稠密网格，按面法线一致性、平面性、连通性评估质量，再区域生长聚合为 3D 平面区域。
5. **结果**：结构特征对齐显著改善，减少**边缘重复、纹理漂移、跨视角不一致**等伪影，产出几何–纹理对齐良好的紧凑代理模型。

---

## 技术方案

### 核心思想

**问题**：传统流水线中，代理几何仅由稠密重建推导（忽略图像证据），导致立面、边缘及其交线在视角间错位；这些不一致被推迟到纹理阶段修正，但那时底层几何结构已无法可靠恢复。

**本文**：代理生成**同时**受稠密重建和输入航拍图像约束 → 代理从一开始就与观测到的特征对齐。

### 关键技术

| 技术 | 说明 |
|------|------|
| 初始化 | ContextCapture（特征映射 → SfM → MVS → 表面重建）得到初始位姿 $\{\mathcal{C}_k\}^0$ 与稠密模型 $\mathcal{D}=(\mathcal{F},\mathcal{V})$ |
| 建筑朝向相机误差 | 标定目标（场景级特征一致性）可能全局合理但**单栋建筑局部不准**，造成重建模型与图像视图错位 |
| 法线引导位姿精化 | MoGe 估计输入图像法线先验 $\{\widehat{\mathcal{N}}_k\}$；可微渲染器以相同位姿渲染 $\mathcal{D}$ 得到 $\mathcal{N}_k$，损失回传优化位姿 $C_k=(R_k,t_k)$。Adam，lr 0.005，每视角 1000 迭代，每 100 步衰减 $\gamma=0.995$ |
| PlaneSet 基准 | 东京数据集（MLIT, 2023）约 3.62 km²，渲染约 1000 个航拍视角；region growing 聚合相似法线面；用 Stable Diffusion 3.5 + 双 ControlNet（Depth + Canny）生成写实渲染，得到平面结构掩码 |
| ProxySAM | 用 PlaneSet 对 SAM 3 做 LoRA 微调；输入航拍图 + 文本提示 "facade plane"，输出所有不同平面结构的掩码；**掩码在后续阶段保持固定** |
| 3D 平面先验 | 2D 实例掩码投影到稠密网格得三角面集合 $\{f\}_m$；按面法线一致性/平面性/连通性评估质量 $Q$；对高频观测面找其观测掩码集合，贪心区域生长聚合为 3D 平面区域；面相似度用 Jaccard |
| 全局引导（平面面） | 球面 K-means（$K=3$）聚类平面面法线得主方向及其反向 $\{u\}$；**实验发现不强制正交**反而更贴合重建的建筑形状与纹理 |
| 局部引导（非平面面） | 选最连贯的 one-ring patch $p_i$，剔除法线距离 $<\tau_n=0.95$ 的面，面积加权平均得代表法线 $g_i$；再用联合双边权重（锚定在 $g$）聚合邻域法线 |
| 顶点优化 | $L_{Proxy}=L_{Planar}+\lambda_l L_{Lap}+\lambda_r L_{PReg}$，$\lambda_l=1$，$\lambda_r=100$；平面损失把面法线拉向引导法线；Laplacian 项防止退化；PReg 保结构 |
| 纹理重映射 | 用精化后的位姿 + 图像引导代理做纹理重映射生成 $\mathcal{U}$ |

---

## 公式

```math
// 相机位姿精化目标（式 1）
L_{Camera}=L_{Normal}+L_{Reg}

// 法线损失（式 2）
L_{Normal}=\frac{1}{|\mathcal{A}_{k}|}\|\mathcal{A}_{k}\odot(\widehat{\mathcal{N}}_{k}-\mathcal{N}_{k})\|_{2}^{2}

// 位姿正则（式 3）
L_{Reg}=\|\bm{t}_k-\bm{t}_k^{0}\|_{2}^{2}+\|\log(\bm{R}_k^{\top}\bm{R}_k^{0})\|_{2}^{2}

// 代理生成目标（式 4）
L_{Proxy}=L_{Planar}+\lambda_{l}L_{Lap}+\lambda_{r}L_{PReg},\qquad \lambda_l=1,\ \lambda_r=100

// 平面损失（式 5）
L_{Planar}=\frac{1}{|\mathcal{F}|}\sum_{i}\|n_{i}-G_{i}\|_{2}^{2}

// Laplacian 损失（式 6）
L_{Lap}=\frac{1}{|\mathcal{V}|}\sum_{v_{j}\in\mathcal{V}}\left\|v_{j}-\frac{\sum_{m\in H_{j}}v_{m}}{|H_{j}|}\right\|^{2}
```

---

## 代码片段

```python
# 相机位姿精化（论文 4.1）
optimizer = torch.optim.Adam([params_of_C_k], lr=0.005)
for it in range(1000):
    # 1) 用当前 C_k 可微渲染稠密模型 D，得到法线图 N_k
    N_k = differentiable_render(D, C_k)                 # 法线渲染
    # 2) 单目法线估计先验（MoGe）
    N_hat_k = MoGe(I_k)
    # 3) 损失
    L_normal = ((A_k * (N_hat_k - N_k))**2).sum() / A_k.sum()   # A_k 为建筑区域激活掩码
    L_reg = ((t_k - t_k0)**2).sum() + (torch.log(R_k.T @ R_k0)**2).sum()
    loss = L_normal + L_reg
    loss.backward(); optimizer.step()
    if it % 100 == 0:
        for g in optimizer.param_groups: g['lr'] *= 0.995   # 指数衰减 γ=0.995

# 引导法线计算（论文 4.2.2）
# 平面面：球面 K-means (K=3) 得主方向 u（及其反向），不强制正交
#   G_i 初始为平面实例的平均法线 n̄；若 cos(G_i, u) > tau=0.95 则替换为 u
# 非平面面：one-ring patch → 剔除法线距离 < tau_n=0.95 的面 → 面积加权平均 → 联合双边权重聚合
```

---

## 实验结论

- **数据**：低空 UAV 航拍图像（建筑场景）；自建 **PlaneSet** 基准基于东京数据集（MLIT 2023，约 3.62 km²，约 1000 个渲染视角）。
- **基线**：纯几何方法（Nan & Wonka 2017、Bauchet & Lafarge 2020、Pan et al. 2025、Cohen-Steiner et al. 2004）；平面结构分割基线 SAM 3；平面提取方法（Liu et al. 2019、Yu et al. 2019 的实例级方法，以及 Transformer/基础模型方法 Tan et al. 2021、Zhang et al. 2024a/b、Deng et al. 2025、Liu et al. 2025a）。
- **结果**：在多种建筑场景上，产出的代理模型**几何–纹理对齐**，结构特征对齐显著改善；**边缘重复（edge duplication）、纹理漂移（texture drift）、跨视角不一致**三类伪影明显减少；相对现有方法**视觉保真度显著提升**，同时保持代理模型的紧凑性。
- **方法论结论（论文明确强调）**：现有平面提取方法主要面向**室内场景或街景影像**（平面是近距离视角下的局部表面），而本文目标是**低空 UAV 影像的建筑平面提取**，需要在斜视航拍视角下对大面积立面与屋顶结构做**全局一致推理**；且**细粒度航拍立面标注的稀缺**限制了直接套用现有监督式平面提取流水线——这正是构建 PlaneSet 的动机。
- **训练配置细节**：ProxySAM 基于 SAM 3 + LoRA 微调；SAM 3 提供了足够训练数据下的强语义理解能力。

---

## 局限性

- 依赖 **MoGe 单目法线估计**的质量作为位姿精化先验——法线估计误差会直接传导。
- 依赖 **PlaneSet 上的 LoRA 微调**，对新建筑类型/新城市的泛化性未经充分验证。
- ProxySAM 的掩码在后续阶段**固定不变**，若初始分割错误则无法在后续纠正。
- 3D 平面区域的**贪心区域生长**受初始 2D 掩码质量影响。
- 全局引导**不强制主方向正交**——这是经验性选择，在几何更规整的场景可能不是最优。
- 论文聚焦建筑场景，泛化到其他代理模型场景（人物、道具）未经检验。

---

## 相关工作

- [[2026-11-10_Architectural-Textured-Proxy-Generation]]
- 建筑可视化：[[代理模型]] [[纹理映射]] [[纹理重映射]] [[可微渲染]]
- 重建：[[多视图立体]] [[SfM]] [[稠密重建]]
- 平面检测：[[平面提取]] [[分割模型]] [[SAM 系列模型]]
- 关键引文：ContextCapture（商用重建服务）、MoGe（Wang et al. 2025）、SAM 3（Carion et al. 2025）、Stable Diffusion 3.5（Esser et al. 2024）、ControlNet（Zhang et al. 2023）、LoRA（KMUTT 2025）、region growing（Rabbani et al. 2006 / Marshall et al. 2001）、joint bilateral filter（Petschnigg et al. 2004）、spherical K-means（Hornik et al. 2012）

---

## 实现建议

- **实现难度**：**高**（需要 ContextCapture 级重建能力 + 可微法线渲染 + 自建标注基准 + SAM 3 微调 + 多阶段网格优化）
- **预期性能**：论文未给出具体数值指标（以视觉对比为主）；产出「紧凑、几何-纹理对齐」的代理模型
- **适用场景**：
  - ✅ **低空无人机航拍建筑**的快速可视化 / 代理建模（城市规划、VR 场景搭建）
  - ✅ 需要**跨视角一致**的建筑代理（避免立面错位、纹理漂移）
  - ✅ 大规模城市场景的 LOD 化资产生产
  - ❌ 地面视角近距离建筑（现有平面检测方法已足够）
  - ❌ 非建筑类主体
- **落地建议**：
  1. **先解决相机位姿，再谈几何**：建筑朝向的相机误差是最上游的错误源，用可微法线渲染 + 位姿优化的性价比极高
  2. 平面先验的**质量评估要同时考虑法线一致性、平面性、连通性**三项，单看法线会聚出破碎区域
  3. **不要强制主方向正交**——论文的实验发现反直觉但有效，值得复现验证
  4. 顶点优化时 $\lambda_r=100$（强结构正则）远大于 $\lambda_l=1$，调整时注意保结构优先
  5. 若无 PlaneSet 微调资源，可先用通用 SAM 3 + 提示词做原型，验证「图像引导代理」这一范式转变本身的价值
- **优先级**：**中**——范式转变有价值，但依赖较重的重建与分割基建
