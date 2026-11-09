---
type: paper
created: 2026-11-09
updated: 2026-11-09
tags: [paper, rendering, 稀疏网格, GPU, VDB, 体素化, 光线步进, 实时渲染, 物理模拟, TOG, SIGGRAPH-Asia-2026, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.08665
---

# Dynamic GPU Sparse Grids and Voxel-sequential Processing in NanoVDB

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Dynamic GPU Sparse Grids and Voxel-sequential Processing in NanoVDB |
| **作者** | Eftychios Sifakis, Francis Williams, Christopher Horvath, Rohan Sawhney, Mark Harris, Jonathan Swartz, Ken Museth (NVIDIA) |
| **发表** | **ACM Transactions on Graphics (SIGGRAPH Asia) 2026** · DOI 10.1145/3842564 |
| **链接** | [arXiv 2611.08665](https://arxiv.org/abs/2611.08665) · [NVIDIA PRL](https://research.nvidia.com/labs/prl/publication/sifakis2026dynamic/) |
| **DOI** | 10.1145/3842564 |
| **代码** | NanoVDB / OpenVDB (开源，Apache-2.0) |
| **arXiv 标题** | *Dynamic GPU Voxel Grids and Voxel-sequential Processing in NanoVDB*（会议版改名为 Sparse Grids） |

---

## 核心贡献

> **NanoVDB 此前最大的限制是「拓扑只读」**——稀疏网格一旦建好，体素集合就不能变，导致它无法用于模拟和动态几何过程。本文解除这一限制，并引入「体素序贯访问」范式，让稀疏数据在 GPU 上也能跑满带宽。

1. **动态 GPU 原生拓扑更新**：一套 bit-parallel 拓扑算子（形态学膨胀 / 剪枝 / 网格合并 / 跨分辨率粗化与细化），**数毫秒内重建含数亿体素的网格**，彻底解除 NanoVDB 的只读约束。
2. **体素序贯访问（voxel-sequential access）+ Voxel Block Manager (VBM)**：新加速结构编码「序贯索引 → 笛卡尔坐标」的**逆映射**（VDB 此前只提供正映射），把稀疏数据以扁平线性序列流式处理，消除树遍历开销。
3. **跨领域应用验证**：3D 重建 / 实景捕获、流体与气体模拟、大规模网格体素化（三者均取得数倍到 10× 的性能提升）。

---

## 技术方案

### 核心思想

**分层「纪元（epoch）」模型**——拓扑演化分三步：
1. **集体决策**（bulk-synchronous）：所有拓扑变更一次性决定；
2. **批量物化**：变更以 bulk 方式落地，得到新的合法拓扑 + 数据状态；
3. 在新纪元上恢复计算。

这使得「level set 窄带更新」这类经典流程可以被重写为三个离散算子的组合：**投机性膨胀**（预留界面运动余量）→ **定拓扑数值更新** → **剪枝**（重建窄带限制）。

### 五个拓扑算子

| 算子 | 作用 |
|------|------|
| Morphological dilation | 把活跃体素集扩展到其紧邻邻域（26 邻域 face-edge-vertex） |
| Pruning | 按输入 mask 移除体素 |
| Merging | 两个 Index-Grid 的布尔并集 |
| Coarsening | 各轴 2:1 结构化降采样（体积 8:1） |
| Refinement | 粗化的伴随算子，按同比例上采样 |

### 拓扑重建七步流水线（fig. 4）

```
Step 1 [算子相关]  候选 root tile 集合（每个覆盖 4096³ 体素），保守覆盖
Step 2 [通用]      为每个候选 root tile 分配稠密位图：
                   upperMasks (Mask<5>, 32³ bit)  +  lowerMasks (32³ 个 Mask<4>)
Step 3 [算子相关]  并行标记需要物化的下层/叶节点（atomicOr 归约）
Step 4 [通用]      枚举所有必要树节点（剪空枝），单块分配存储
Step 5 [通用]      从位图 scratchpad 并行重建树连通性
Step 6 [算子相关]  填充活跃体素标记
Step 7 [通用]      自底向上 sweep 更新元数据（体素偏移、包围盒、校验和）
```

### 关键数据结构：Mask 层级

| 层级 | LOG2DIM | 分支数 | 体素跨度 |
|------|---------|--------|----------|
| Root | — | nTiles | 无界 |
| Upper Internal | 5 | 32³ = 32,768 | 4096³ |
| Lower Internal | 4 | 16³ = 4,096 | 128³ |
| Leaf | 3 | 8³ = 512 | 8³ |

### 形态学膨胀：三级 bit-parallel 技巧

**（a）叶级邻居影响掩码**——8×8×8 体素占据掩码被 bit-pack 进 8 个 `uint64_t`（即 `Mask<3>`）。对 3×3×3 盒式膨胀，通过**按位 OR 合并切片 + 按位 AND 预设掩码隔离 8³ 体的「面」**，直接算出每个叶的 **27-bit 影响掩码**，指示 26 个叶邻居中哪些需要物化。

> **关键性质**：任意半径 $R \le 8$ 的模板，其对某个 $8^3$ 叶节点的影响**严格限制在紧邻的 $3^3$ 叶邻居簇内** → 这一步是唯一检查模板形状的地方，后续步骤只依赖结果掩码。
> （叶角上的单个边界体素最多引发 7 个相邻叶节点物化。）

**（b）叶主序 → 抽头主序转置**——原方案是「每个叶向 27 个抽头 scatter」，atomic 争用严重。改为在 shared memory 中并行转置成「抽头主序 gather」（下层节点做 27 次统一空间平移）。

**（c）前缀和 + 单块分配**——三个中间计数数组：
- `upperCounts`（nTiles）：上节点是否有活跃下节点孩子
- `lowerCounts`（nTiles × 32K）：下节点是否有活跃叶孩子
- `leafCounts`（nTiles × 32K）：下节点的叶孩子数（`popcnt(childMask)`）

用 NVIDIA CUB 做并行前缀和扫描 → 末元素给出该层全局节点总数 → **一次性（monolithic）分配最终 NanoVDB buffer**。

### 关键洞察：scratchpad 开销可忽略

> 每个候选 root tile 的记账结构仅 **upperMasks 4 KB + lowerMasks 16 MB**。
> **一旦某 tile 的占据率超过 0.01%，单个标量 float 通道的数据占用就已超过这些临时簿记结构。**
> 实践上网格很少超过几十个 tile → 簿记开销可忽略。

### Sidecar 注入算子（injectData）

拓扑更新与数据载荷更新**故意分离**（因为 GPU 上拓扑更新耗时通常短于流式传输 sidecar）：

```
injectData(srcGrid, dstGrid, srcSidecar, dstSidecar)
```
- 语义：两 Index-Grid 交集内的体素，把源 sidecar 数据拷到目标 sidecar 的同坐标位置；目标 sidecar 其余数据**保持不动**。
- 实现：当一个拓扑是另一个的子集时，**读或写之一必然是合并访问（coalesced）**。把同源叶节点对分配给**一个 warp**，利用「单叶内活跃体素在 sidecar 中连续」这一保证。
- 另提供 strided sidecar 与多维（向量值）特征变体（fVDB 机器学习场景常见）。

### 体素序贯访问与 Voxel Block Manager (VBM)

**问题**：NanoVDB Index-Grid 本质是**正映射**（笛卡尔坐标 → 序贯活跃体素索引）。体素序贯访问需要其**逆映射**（序贯索引 → 树中位置 → 笛卡尔坐标），VDB 此前从未提供。

**GPU 上的负载均衡困境**：标准做法是「按叶节点启动 kernel，整个线程块并行处理一个叶的 8³=512 体素，活跃与否都算」。映射到 32 体元组但不全活跃的 warp，会在非活跃比例上浪费 SIMT 吞吐。

**VBM 结构**（编译期块宽 $W \ge 64$，通常取 128/256 以匹配线程块大小）：
- 把活跃体素序列切成对齐的 $W$ 长区间（VBM block）
- 每块存两项元数据：
  - **`firstLeafID`**（uint32_t）：块内第一个活跃体素所在的叶节点索引
  - **`jumpMap`**：每活跃体素 1 bit（打包进 uint64_t，$W/64$ 个）。位 $p>0$ 置位表示块内位置 $p$ 是某个新叶节点的第一个活跃体素
- **总开销 ≤ 1.5 bit / 活跃体素**，与网格大小、载荷类型、叶占据率**均无关**

**依赖的两条不变式**（并非 NanoVDB 核心结构规定，但现所有工具事实保证，现被强制为规范）：
1. 无零活跃体素的叶节点
2. 跨叶节点的活跃体素索引连续（叶 L 最后一个体素索引为 K，则叶 L+1 首个体素索引为 K+1）

**解码**：每 $W$ 线程的 CUDA 块启动 → 读 `firstLeafID` 与 `jumpMap` 行 → 在 shared memory 写出 `leafIndex[W]`（uint32）与 `voxelOffset[W]`（uint16_t，xyz 八进制，每轴 3 bit）。
- 重叠叶节点数 = `popcnt(jumpMap) + 1`
- 对每个叶并行遍历全部 512 体素，探测是否活跃及其线性索引（用 GPU 内建 `popcnt`）
- **无精细同步、无全局显存流量** → 除极端稀疏（>95% 非活跃）外，代价远低于读取 sidecar 本身

**抽头优化（Stencil-tap Optimization）**：
> **窄支撑模板能触及的叶节点数远少于其抽头数。**
> 五阶 Hamilton–Jacobi WENO 模板有 **19 个抽头**（偏移 $(-3..3,0,0)$、$(0,-3..3,0)$、$(0,0,-3..3)$），但**最多只触及 4 个叶节点**（中心所在叶 + 最多 3 个）。
> → 用 `probeLeaf` 批量取回邻居，再以**完全 warp 同步、无分歧**的操作计算全部 19 个抽头索引。
> 同理：3×3×3 卷积模板触及最多 7 个叶节点即可算出全部 27 个抽头。

### 公式

```math
// TSDF 融合（Algorithm 1，深度与 LiDAR 共用前 3 行）
G_t \leftarrow \textsc{mergeGrids}(G_{t-1}, \mathit{shell})
(d_t, w_t) \leftarrow \textsc{inject}(G_{t-1} \to G_t, (d_{t-1}, w_{t-1}), \mathit{init}{=}0)

// 深度模态：单写者加权滑动平均（无 atomic）
\mathit{sdf}_v \leftarrow \textsc{truncSDF}(Z[\Pi(x_v)] - z_{cam}(x_v), \tau)
\bigl(d_t[v], w_t[v]\bigr) \leftarrow \textsc{weightedAvg}(d_t[v], w_t[v], \mathit{sdf}_v, w_{obs})

// LiDAR 模态：每输入点一线程，沿传感器射线 HDDA 遍历，atomicAdd 累加
\mathit{sdf}_v \leftarrow \textsc{truncSDF}(\|p - o\| - \|x_v - o\|, \tau)
\textsc{atomicAdd}(s_d[v], w_{obs}\,\mathit{sdf}_v), \quad \textsc{atomicAdd}(s_w[v], w_{obs})
(d_t, w_t) \leftarrow (s_d/s_w, s_w)

// 叶占据率定义（性能分析核心指标）
\equiv \texttt{activeVoxels} / (\texttt{nLeaves} \cdot 512)

// 抽头数 vs 触及叶节点数（窄支撑模板的杠杆点）
\text{WENO5: } 19 \text{ taps} \to \le 4 \text{ leaves}
\text{3x3x3 conv: } 27 \text{ taps} \to \le 7 \text{ leaves}
```

### 关键技术

| 技术 | 说明 |
|------|------|
| Epoch-based 拓扑演化 | 集体决策 → 批量物化 → 恢复计算，三阶段解耦 |
| Bit-parallel 膨胀 | `Mask<3>` 按位 OR/AND 直接算 27-bit 叶邻居影响掩码 |
| 叶主序→抽头主序转置 | shared memory 转置消除 atomic 争用 |
| CUB 并行前缀和 | 三层计数数组 → 单块分配最终 buffer |
| VBM 逆映射 | 1.5 bit/活跃体素，编码序贯索引→树位置 |
| 抽头优化 | 用「触及叶节点数」替代「抽头数」做邻域取数 |
| HDDA 射线遍历 | NanoVDB 内建层级 DDA，用于 LiDAR 融合与网格渲染 |

---

## 实验结论

### 网格体素化（hairball 网格，McGuire 2017，280 万三角形）

| 体素尺寸 | 本文（MeshToGrid） | OpenVDB（meshToUDF） | 加速比 |
|---|---|---|---|
| 0.003 | 1.026×10⁹ 体素 / **2.30 s** | 1.025×10⁹ 体素 / 23.87 s | **≈10×** |
| 0.001 | 9.88×10⁹ 体素 / **3.24 s** | **未完成（显存耗尽）** | — |

> 多十亿体素规模仍保持交互级构建时间。渲染时用 NanoVDB 内建 HDDA 遍历稀疏 index-grid，通过 UDF 等值面穿越检测命中。

### 实景捕获 —— 与 nvblox / VDBFusion 的对比

| 数据集 / 序列 | 体素 | 本文 ms/f | GB | nvblox ms/f | GB | VDBFusion ms/f |
|---|---|---|---|---|---|---|
| Mai City 700f | 40 cm | **3.44** | **0.17** | 19.52 | 0.93 | 130.04 |
| | 10 cm | **5.07** | **0.77** | 18.03 | 1.98 | 474.15 |
| | 5 cm | **11.22** | 4.47 | **OOM** | — | 965.28 |
| | 3 cm | **19.98** | 9.30 | **OOM** | — | 1666.65 |
| | 2 cm | **32.26** | 17.47 | **OOM** | — | 2723.86 |
| | 1.0 cm | **OOM** | — | — | — | — |
| KITTI seq 00 (4541f) | 10 cm | **17.81** | 15.78 | **OOM** | — | 443.41 |
| | 5 cm | **OOM** | — | **OOM** | — | 965.39 |

**分辨率外推加速比（vs nvblox）**：

| 体素 | 本文 ms/f | nvblox ms/f | 加速 |
|---|---|---|---|
| 20 cm | 5.8 | 20.1 | 3.5× |
| 10 cm | 7.7 | 21.6 | 2.8× |
| 5 cm | 15.6 | 53.2 | 3.4× |
| 3 cm | 27.1 | 146.8 | **5.4×** |
| 2 cm | 41.7 | 351.7 | **8.4×** |
| 1.5 cm | 59.1 | 678.6 | **11.5×** |
| 1 cm | 93.3 | OOM | 仅本文可行 |
| 5 mm | 270.2 | OOM | 仅本文可行 |

### ESDF 扫描（本文 vs nvblox）

| 数据集 / 序列 | 体素 | 本文 Cold (ms) | Warm (μs) | 峰值 (GB) | nvblox Cold (ms) | 峰值 (GB) |
|---|---|---|---|---|---|---|
| Mai City 700f | 20 cm | **129.0** | 25 | 2.04 | 174.5 | 1.67 |
| | 10 cm | **416.4** | 32 | 4.17 | 740.4 | 2.50 |
| | 5 cm | **1628.0** | 59 | 11.82 | **OOM** | — |
| | 3 cm | **5567.9** | 266 | 30.59 | **OOM** | — |
| KITTI seq 00 | 2 cm | **5906** | 365 | 38.61 | **OOM** | — |

> **分辨率越高优势越大**：nvblox 在 5 cm KITTI seq 02 / 3 cm 全场景 OOM；本文在 1 cm 仍可运行（93.3 ms/f）。

### WENO5 窄带重初始化（流体模拟，VBM vs accessor 基线）

- **VBM 稳定在 ≈20 Gvoxel-updates/s**，kernel 尺寸仅由活跃集决定
- accessor 基线随叶占据率下降**从 14.0 掉到 9.8**（线程落在非活跃槽位）
- **VBM 加速比达 1.98×**，且**随占据率下降而上升**

### 与 Open3D / nvblox 的 TSDF-ESDF 对比（Replica ×2000 帧）

| 体素 | 本文 TSDF | 本文 ESDF | nvblox TSDF | nvblox ESDF | Open3D TSDF |
|---|---|---|---|---|---|
| 20 mm | 2.64 | 38.46 | **0.81** | 75.60 | **0.25** |
| 10 mm | **5.23** | 125.83 | 6.43 | 529.54 | 0.26 |
| 5 mm | **19.05** | 617.71 | OOM | OOM | 0.42‡ |
| 4 mm | **28.06** | 926.85 | OOM | OOM | 0.41‡ |
| 3 mm | **44.50** | 1614.89 | OOM | OOM | crash |

> **诚实披露**：Open3D 在 20–5 mm 区间以 11–46× 领先（其块哈希分配器有十年手调积累）；nvblox 在 20 mm 快 3.3×，但从 10 mm 起落后于本文。

---

## 局限性

1. **膨胀半径上限**：模板半径不得超过叶节点尺寸（8 体素），否则需修改流水线中的「通用」组件。半径 ≤ 8 的盒式模板可由 bit-parallel 直接处理。
2. **非规则模板不友好**：显著不规则（非矩形、非对称）形状的模板，bit-parallel 优化机会减少。
3. **形态学腐蚀未实现**：作者计划用现有 prune 算子实现其逆。
4. **scratchpad 固定开销**：每个可能重叠的 4096³ root tile 需约 16 MB 记账空间。对**极小规模的领域**，可能削弱相对「完全重建」方案的优势。
5. **VBM 收益依赖占据率**：叶节点接近稠密时收益消失（此时传统 leaf-level dense NanoVDB 网格可能更合适）。
6. **计算密集 > 内存密集**：memory-bound 负载（如标量场上的小模板梯度/散度算子）收益有限；compute-bound 负载（WENO、稀疏卷积）收益最大。
7. **非流式空间一致访问**仍更适合 accessor 类工具。
8. **冷启动 ESDF 成本比 nvblox 高 1.0–2.0×**（20 cm KITTI 区间）；从 Mai City 20 cm、KITTI 5 cm 起才反超。
9. **VBM 对 ESDF sweep 的加速仅 3–6%**（非数量级）——因为膨胀步骤使 ESDF 叶节点密集占据，逐叶槽位派发的浪费很少。**VBM 的真正价值在低占据率的模板计算工作负载**。
10. **增量 ESDF 暖复用的早期设计比 nvblox 慢 400×**；dirty-mask Python 短路将无变化情形降到亚 400 μs，才与 nvblox 的亚 100 μs 块缓存命中持平。

---

## 相关工作

- [[2026-11-09_Self-Penetration-Repair-Skinned-Characters]]
- [[2026-11-09_Geometric-Texture-Segmentation-Meshes]]
- [[2026-11-08_Inverse-Rendering-Line-Primitives-FuzzyDR]]
- [[2026-11-08_X-Splat-Unified-Gaussian-RGB-Xray]]
- 概念：[[稀疏网格]], [[VDB]], [[BVH]], [[光线步进]]

---

## 实现建议

- **实现难度**: **中**（动态拓扑算子）~ **高**（VBM 与 bit-parallel 膨胀）——但**可直接使用开源 NanoVDB，无需从零实现**
- **预期性能**:
  - 网格体素化 **≈10×**（OpenVDB 基准）
  - 实景捕获 **2.8–11.5×**（nvblox 基准，随分辨率提升而扩大）
  - 流体 WENO5 **1.98×**（且随占据率下降而扩大）
  - 显存 **可容纳 10× 密度的体素**（1 cm 而非 5 cm）
- **适用场景**:
  - **实时渲染**：NanoVDB 本身就是「面向实时渲染与模拟」的 GPU 友好 VDB 结构；HDDA 层级 DDA 可直接做稀疏体素场的光线步进
  - **大尺度几何操作**：网格→UDF 体素化、多分辨率重建、动态场景几何操作
  - **物理模拟**：窄带 level set、流体/气体（WENO5）
- **落地路径**:
  1. **直接升级 NanoVDB 版本**即可获得动态拓扑算子（零改造成本，收益立竿见影）
  2. 若自研稀疏结构，借鉴**「纪元模型 + 拓扑/数据分离 + 1.5 bit/元素的逆映射」**三条设计
  3. **抽头优化**（模板触及叶数 << 抽头数）是**最容易迁移的技巧**——适用于任何基于稀疏块的模板计算

---

## 原始链接

- arXiv: https://arxiv.org/abs/2611.08665
- HTML 全文: https://arxiv.org/html/2611.08665
- NVIDIA PRL: https://research.nvidia.com/labs/prl/publication/sifakis2026dynamic/
- DOI: 10.1145/3842564
