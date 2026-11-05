---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 渲染, 光度立体, 事件相机, 表面法线, 图神经网络, 注意力机制, 传感器, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.08188
---

# PIE-PS: 基于物理辐照事件流的光度立体

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PIE-PS: Photometric Stereo from Physical Irradiance Event Streams |
| **作者** | Xiangze Meng, Guangyu Li, Jing Li, Di Mei, Songchen Ma, Mingkun Xu, Rui Ma |
| **发表** | arXiv 2026-10-06（cs.GR），**SIGGRAPH Asia 2026 / ACM TOG** |
| **链接** | [原文](https://arxiv.org/abs/2610.08188) · [HTML](https://arxiv.org/html/2610.08188v1) · [项目页](https://pie-ps.github.io) |
| **DOI** | — |
| **代码** | 项目页提供（论文未直接给出仓库地址） |

---

## 核心贡献

> **把「相邻两个事件 + 对应光照方向」配对成 Physical Irradiance Event (PIE)**，其特征 PIEF = **有符号事件率**，**从根本上不需要未知的对比度阈值**；再用 **PIE-GNN** 跨时空共享上下文、**RGA 可靠性加权**抑制不可靠观测，最后像素聚合得到稠密法线。

1. **成对事件光度学**：从事件触发模型出发，推导**相邻事件、光照运动与表面法线之间的物理关系** → 得到直接的「物理-only」求解器基线（同时暴露纯解析路线的局限）。
2. **PIE 表示**：把同像素的两个相邻事件与其时间戳对应的光照方向配对。**PIEF（Physical Irradiance Event Feature）= 事件极性 / 事件间隔时间 = 有符号事件率** → **测试时不需要对比度阈值 C**。
3. **PIE-GNN**：把每个 PIE 视为**图节点**（含 PIEF + 光照对几何），在空间与时间上跨邻近 PIE 共享上下文。
4. **RGA（Reliability-Grading Attention）**：预测每个 PIE 的**软可靠性等级**，降权不可靠观测（可靠性随局部外观、照明几何、传感器噪声变化）。
5. **全面超越基线**：DiLiGenT-Sim 上 MAE **8.70°**（比最佳已发表基线 EventUPS 低 **5.44°**）；PIE-Sim 上 **10.66°**；真实场景 6 个场景全优，平均 **10.38°**。

---

## 技术方案

### 核心思想

**背景**：光度立体（PS）用变化光照下的明暗变化估计稠密表面法线。传统帧式 PS 每个光照状态要拍一张图 → **受帧率与动态范围限制**（快速光照、大强度变化时尤甚）。

**事件相机的机会**：异步记录对数辐照度变化，微秒延迟、高动态范围。**在移动光照下，事件本身携带法线线索**。

**本文的差异化做法**：先前解析方法把事件流转成**逐像素的微分方程或区间轮廓方程**（EventPS 用对数辐照度变化；PS-EIP 用三个事件构造 Event Interval Profile，但需要 look-ahead 事件且不用事件极性）→ **空间上下文有限、对事件密度与阈值标定敏感**。

**本文**：从同一触发模型出发，但改为**推导成对（pairwise）光度约束** → 直接得到「事件对 ↔ 光照对变化 ↔ 法线」的关系。

### 关键技术

| 技术 | 说明 |
|------|------|
| **成对事件光度学** | 从事件触发模型 + 移动光照，推导相邻两事件间的物理关系 |
| **Direct Solver（物理-only 基线）** | 若已知对比度阈值 C 且每像素有足够事件对，可用**直接数值优化**求解约束。保留为基线是为了**让观测模型显式化**，同时暴露纯解析路线的三个限制：需要未知阈值 C、需要足够事件以构建稳定方程、**逐像素独立处理** |
| **PIE（Physical Irradiance Event）** | **不是新的传感器事件**，而是「同像素两个相邻事件 + 各自时间戳的光照方向」构成的结构化观测 |
| **PIEF（有符号事件率）** | $\text{事件极性}/\text{事件间隔时间}$ → **不需要未知的对比度阈值** |
| **PIE-GNN** | 每个 PIE = 图节点，节点特征 = PIEF + **光照对几何**；跨空间与时间交换信息，共享邻近像素/时刻的上下文 |
| **RGA（可靠性分级注意力）** | 预测每个 PIE 的可靠性权重，降权不可靠观测。**低可靠性观测仍可能保留有用线索**，故用软权重而非直接丢弃 |
| **像素聚合器** | 加权 PIE 嵌入聚合为像素特征 → 轻量像素聚合器预测稠密法线 |
| **训练损失** | 直接法线监督，主损失为最终法线的**平均角误差**（MAE，度） |

---

## 公式

**PIEF（有符号事件率）**：

```math
\mathrm{PIEF}=\frac{\mathrm{polarity}}{\Delta t}
```

**成对事件光度约束（概念式）**：

```math
\frac{\mathrm{PIEF}}{}\;\sim\;\frac{\partial}{\partial t}\log I(\mathbf{x},t),\qquad
\text{由光照方向变化 }(\omega_i^{t},\omega_i^{t+\Delta t})\text{ 与法线 }\mathbf{n}\text{ 共同决定}
```

**主损失（平均角误差）**：

```math
\mathcal{L}=\frac{1}{|\Omega|}\sum_{p\in\Omega}\arccos\!\left(\max\big(-1,\min(1,\mathbf{n}^{\text{pred}}_{p}\cdot\mathbf{n}^{\text{gt}}_{p})\big)\right)
```

其中 $\Omega$ 为有效训练像素集合。

**可靠性加权聚合**：

```math
\mathbf{f}_{\text{pixel}}(p)=\frac{\sum_{i\in\mathcal{N}(p)}\alpha_i\,\mathbf{e}_i}{\sum_{i\in\mathcal{N}(p)}\alpha_i},\qquad
\alpha_i=\text{RGA}(\mathbf{e}_i)\ \text{（软可靠性等级）}
```

---

## 代码片段

```text
# PIE 构造
for each pixel p:
    events_p = sorted(events at p by timestamp)
    for consecutive pair (e_k, e_{k+1}):
        PIE = {
            PIEF     : polarity(e_k) / (t_{k+1} - t_k),   # 有符号事件率，无需阈值 C
            geometry : (light_dir(t_k), light_dir(t_{k+1})) # 光照对几何
        }
        → 图节点

# PIE-GNN
nodes = [encode(PIEF, light_pair_geometry) for PIE in all]
edges = spatial-temporal proximity between PIE nodes
h = GNN(nodes, edges)          # 跨空间/时间共享上下文

# RGA
alpha_i = RGA(h_i)             # 软可靠性权重

# 像素聚合 → 法线
f_p = weighted_mean(h_i for PIE i at pixel p, weights=alpha_i)
n_p = PixelAggregator(f_p)
```

---

## 实验结论

- **数据集**:
  - **PIE-Sim**（本文构建）：沿用 **EventPS** 的仿真管线；对象来自 **Blobby**（Johnson & Adelson 2011）与 **Sculpture**（Wiles & Zisserman 2017）集合；随机姿态与外观参数；用 **ESIM**（Rebecq et al. 2018b）仿真事件流；**3 种光照轨迹**：circle、hypotrochoid、插值 DiLiGenT；每场景**独立采样对比度阈值与噪声实现** → 不同事件密度与间隔；每序列 600 帧；**77 训练场景 + 30 测试场景**（对象不重叠）
  - **DiLiGenT-Sim**：在 **DiLiGenT**（Shi et al. 2016）上仿真事件流，**9 个测试场景**
  - **真实数据**：① EventPS 的 **3 个真实场景**；② 自采 **3 个 3D 打印对象**（Bunny、Rectangle、Flower），GT 法线由 CAD 模型计算并用事件累积图 + **MeshLab 互信息配准**对齐到传感器观测
- **基线**:
  - **EventPS-FCN** / **EventPS-CNN**（Yu et al. 2024，已发布模型）
  - **EventUPS**（Liang et al. 2025，无公开代码，用已发表结果）
  - **PS-EIP**（Kitazawa et al. 2025）—— **因代码与基准数据不可得而省略**
  - **Direct Solver**（本文的物理-only 基线）
- **关键结果**:
  - **DiLiGenT-Sim**：PIE-PS 平均 MAE **8.70°** → 比最佳已发表基线 **EventUPS 低 5.44°**，比 direct solver **低 6.90°**
  - **PIE-Sim**：PIE-PS 平均 MAE **10.66°** → 比 direct solver **低 11.22°**，比 EventPS-FCN **低 15.18°**；**在每一个（对象族 × 光照轨迹）分组中都是最低误差**
  - **真实场景（6 个）**：PIE-PS **全部最优**，平均 MAE **10.38°** → 比 EventPS-FCN **低 10.53°**，比 direct solver **低 13.52°**
  - **定性**：EventPS 变体常能恢复粗略形状但误差图显示**大局部误差，尤其高曲率区域与真实采集**；direct solver **逐像素独立求解且无法剔除不可靠事件对** → 法线噪声大；PIE-PS 法线**更平滑更准确**，误差图更暗
- **消融**（PIE-Sim，MAE）:
  - **去掉 PIEF**（保留光照对几何）：**10.66° → 14.52°** → 证明**仅有光照对几何不够**，必须包含由光照变化引起的**有符号事件响应**
  - **去掉 RGA**（直接池化 PIE 观测）：**10.66° → 11.99°** → 证实学习式可靠性加权的价值
  - RGA 可视化：低 RGA 权重确实落在 GT 识别的不可靠 PIE 上 → **不是随机加权**

---

## 局限性

- **需要标定光照**：是「已知光照」下的标定方法，未标定版本由 EventUPS 覆盖
- **事件相机硬件依赖**：需要事件传感器（DAVIS 等）与移动光照装置；自采数据仅 3 个 3D 打印对象
- **PS-EIP 无法比较**：因代码与数据不可得，其结果缺失
- **EventUPS 无公开代码**：只能用已发表结果比较，公平性略受限
- **逐像素独立 vs 图建模的取舍**：PIE-GNN 依赖 PIE 节点间的图连通性；极端稀疏事件区域可能图结构退化
- **GT 对齐误差**：真实场景的法线对齐依赖互信息配准，引入额外误差源
- **只恢复法线**：不同时恢复反射率/材质（论文明确区分于 SVBRDF 方法）
- **仿真数据与真实数据仍有域差**：PIE-Sim 用 ESIM 仿真，真实事件含更复杂的噪声特性

---

## 相关工作

- [[Photometric-Stereo]] — Woodham 1980（奠基）
- [[DiLiGenT]] — Shi et al. 2016（标准基准）
- [[EventPS]] — Yu et al. 2024
- [[PS-EIP]] — Kitazawa et al. 2025
- [[EventUPS]] — Liang et al. 2025
- [[EFPS-Net]] — Ryoo et al. 2023（混合 RGB + 事件）
- [[ESIM]] — Rebecq et al. 2018b
- [[Event-NeRF]] / [[Event-3DGS]]

---

## 实现建议

- **实现难度**: **中高**（需要事件相机硬件 + 移动光照标定 + ESIM 仿真管线 + GNN 训练）
- **预期性能**: DiLiGenT-Sim MAE 8.70°；真实场景 MAE 10.38°，全面超越基线
- **适用场景**:
  - ✅ **高速/高动态范围光照下的稠密法线估计**（帧式 PS 的天然替代）
  - ✅ **工业检测/AR 的表面几何捕获**（内容创作、无损检测、增强现实）
  - ✅ 需要在**运动光照**下工作的场景（帧式 PS 受帧率限制）
  - ❌ 无事件相机的场景（可用帧式 PS）
  - ❌ 需要同时恢复材质/SVBRDF 的任务
- **落地建议**:
  1. **「有符号事件率 = 阈值无关的特征」是一个可独立迁移的传感器无关技巧**：任何事件相机应用中，只要涉及「变化量」都可以用极性/时间间隔构造阈值无关特征，避开对比度阈值标定这一老大难
  2. **先做纯物理求解器作为基线非常有价值**（本文的 Direct Solver 只需几十行）：它显式化观测模型，且能立刻暴露「逐像素独立」的缺陷，为学习方法提供明确改进空间
  3. **RGA 的设计值得借鉴到其他「观测可靠性不均」的融合任务**：与其硬阈值剔除不可靠观测，不如学一个软权重——论文消融显示去掉 RGA 后 MAE 从 10.66° 升到 11.99°，且 RGA 确实学会把低权重放在坏观测上
  4. 复现门槛主要在**硬件与数据**（事件相机 + 移动光源 + ESIM），算法本身可在 PIE-Sim 上先行验证
