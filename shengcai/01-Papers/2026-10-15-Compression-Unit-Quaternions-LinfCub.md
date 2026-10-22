---
type: paper
created: 2026-10-22
updated: 2026-10-22
tags: [paper, 渲染, 四元数, 压缩, 高斯泼溅, 蒙皮动画, 法线贴图, CGF, 2026, arXiv]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.22052
arxiv_id: 2610.22052
---

# Compression of Uniformly Distributed Unit Quaternions

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Compression of Uniformly Distributed Unit Quaternions |
| **作者** | Carsten Faber; Bastian Kuth; Rinaldo Schuster; Daniel Pauls; Quirin Meyer |
| **单位** | Coburg University of Applied Sciences and Arts, Germany (1); **AMD**, Germany (2) |
| **发表** | arXiv preprint 2026-10-15（cs.GR），**CGF / Eurographics 会议投稿格式**（CGFStandardLicense） |
| **链接** | [原文](https://arxiv.org/abs/2610.22052) |
| **代码** | https://github.com/GeoFlowResearch/UnitQuaternionCompressionSupplemental （参考 C 实现） |
| **DOI** | 10.48550/arXiv.2610.22052 |

---

## 核心贡献

> 提出 $\ell_\infty^{\mathrm{cub}}$ 四元数参数化 + **混合基数打包（mixed-radix packing）**，在**同等存储**下取得所有对比方法中**最低的最大误差**，且**解码开销不超过**现役编解码器——是可直接替换的 drop-in codec。

1. **理论分析**：系统研究常用单位向量参数化的**最大量化误差**，给出解析刻画（此前仅有经验结果）。
2. **混合基数打包**：把 **chart 索引 + 全部量化参数**打包成**单个整数码字**。不同于独立 bit 字段，它几乎用满任意大小码字的全部状态，且**每个参数精度相同**、允许**每参数小数位数**（fractional bits）。
3. **$\ell_\infty^{\mathrm{cub}}$ 参数化**：用**三次 warp 函数**近似 tangent，解码只需**三次融合乘加（3 FMA）**；单个参数 $a$ 经优化以最小化最大误差。
4. **三大应用验证**：骨架动画（集成进 **ozz-animation**）、切线空间法线贴图、**3D 高斯泼溅**——均优于各领域现役 codec，同存储、同或更低解码成本。

---

## 技术方案

### 核心思想

四元数作为 $S^3$（4D 单位超球面）上的 3 维流形，只需少量 **chart**（图册）即可参数化。压缩的四元数 = 3 个自由参数 + 一个图表索引。

**为什么重要**：内存与带宽（而非算力）日益成为性能瓶颈——每个旋转省一个字节就同时省存储、传输和缓存压力。四元数出现在：骨架动画（每关节每关键帧一个）、切线帧（法线贴图）、**3D 高斯泼溅（数百万个各向异性高斯的朝向）**。

**此前空白**：3D 单位向量的压缩方案已被大量对比研究，而**单位四元数只有经验性结果**。本文填补这一空白。

### 对比的方法族

| 方法 | 说明 | 现状 |
|------|------|------|
| $\ell_{2I}$（smallest-three） | 丢最小分量；如 ozz-animation、**glTF EXT_meshopt_compression**、**SPZ**、**SOG** | 工业标准 |
| $\ell_2$ | 固定丢某分量；Animation Compression Library、Unreal Engine 4 | 经典 |
| Exp | 单位球映射（Reynolds）；Rijsdijk 等的 GS 渲染器 | 在用 |
| $\ell_\infty$ | 投影到超立方体；**MPEG-4**（第 8.3.3 节） | 标准 |
| $\ell_\infty^{\mathrm{tan}}$ | tangent-warp 的 $\ell_\infty$；MPEG-4 用的就是这个 | 标准但**慢** |
| **$\ell_\infty^{\mathrm{cub}}$** | **本文**：三次多项式近似 tangent | — |

> 注：**CryEngine** 用 4×16-bit 的 QTangents（把 handedness 编码在第 4 分量符号上并偏置使其量化后符号存活）；**DOOM Eternal** 用 3 字节（2 字节八面体法线 + 1 字节切线角，无 handedness）。

### 关键技术

| 技术 | 说明 |
|------|------|
| **三次 warp** | $w(x;a) = a\cdot x^3 + (1-a)\cdot x$。约束 $w(-1)=-1$、$w(0)=0$、$w(1)=1$ 保证相邻 chart 无缝，只剩**一个参数 $a$**。 |
| **$\ell_\infty$ 投影** | 把四元数按 $\ell_\infty$ 范数归一化映射进超立方体（unit ball / hyper-cube），再量化。 |
| **混合基数打包** | 把 chart 索引与各量化参数编成**一个整数**；等价于均匀分布下的非对称记数系统。支持 $\lfloor 2^{46/3}\rfloor = 41\,285$ 这种每分量**非整数位**预算。 |
| **无需存符号位** | 因 $\hat{\mathbf{x}}$ 与 $-\hat{\mathbf{x}}$ 表示同一旋转，可省符号位。**Ozz 未利用**这点（剩 46 bit 无法被 3 个整数字段均分，故保留符号位 + 每分量 15 bit）；本文混合基数打包允许小数位 → **可直接省下这 1 bit**。 |
| **解码成本** | 三次 warp 可与反量化**融合成 3 次 FMA**；$\ell_\infty^{\mathrm{tan}}$ 需三角函数（编译为 $\tan x=\sin x/\cos x$），**每预算贵 80–159 cycle**。 |
| **cell 最大误差的精确求解** | 单元内最大测地误差位于由 4 角点构成的 **Delaunay 四面体的外接球心**（4D 叉积零空间归一化）；$\binom{8}{4}=70$ 个候选中只取非退化、外接球为空、球心在域内者。边界单元（$u_i=1$）只有半宽，最大值可落在边界面 → 固定该轴为 1 以替代一个等距约束。 |

---

## 公式

**三次 warp**（式 20）：

```math
w(x;a) = a\cdot x^{3} + (1-a)\cdot x
```

约束 $w(-1)=-1,\; w(0)=0,\; w(1)=1$，仅一个自由度 $a$。

**最优 $a$ 的求解**（网格搜索）：
- 因 chart 在符号与轴序上的对称性，只需在 $[0,1]^3$ 中 $u_1\le u_2\le u_3$ 的区域打分，即 chart 的 **$1/48$**。
- $a\in[0,1)$ 取 1000 个初始样本，取最优 $a'$，在其邻域取子区间，**逐步收缩至 $<10^{-8}$**。
- GPU 上约 **8 分钟**，因此 8–32 bit 可行；更大预算利用 $a^\ast(k)$ 收敛性，在 $[a^\ast(k-1)\pm0.01]$ 内取 11 点精细化。

**$\ell_2$ 参数化**（对照，式 3）：

```math
\mathbf{f}_{\ell_2}(\mathbf{u};c) = \hat{\mathbf{x}}
  = \begin{bmatrix} \mathbf{u} \\ (-1)^{c}\cdot\sqrt{1-\|\mathbf{u}\|_2^{2}} \end{bmatrix}
```

**误差下界**：任何有 $2^k$ 个状态的码，最大误差至少为

```math
\kappa_{\mathrm{lower}}\cdot 2^{-k/3},\qquad \kappa_{\mathrm{lower}} \approx 96^{\circ}
```

即 $\ell_\infty^{\mathrm{cub}}$ 在大预算下仅比下界多约 $3\log_2\!\big(\kappa^{\mathrm{cub}}/\kappa_{\mathrm{lower}}\big) \approx 1.5$ bit（接近最优）。

---

## 实验结论

### 参数化误差与解码成本（Table 2）

硬件：GS 实验用 **NVIDIA RTX 4070 Ti**，其余用 **AMD Radeon RX 7900 XTX**；解码成本以 GPU **cycle** 计（硬件周期计数器，扣除空函数开销）。参考：同 GPU 上**一次 slerp 需 171 cycle**。

**32 bit，range 量化，最大误差（°）：**

| 方法 | Cycles ↓ | Mean ↓ | **Max ↓** |
|------|---------|--------|-----------|
| $\ell_{2I}$ | 135 | 0.0531 | 0.1620 |
| Exp | 155 | 0.0582 | 0.1198 |
| $\ell_\infty$ | 115 | 0.0493 | 0.1195 |
| $\ell_\infty^{\mathrm{tan}}$ | 273 | 0.0468 | **0.0942** |
| **$\ell_\infty^{\mathrm{cub}}$（本文）** | **111** | 0.0469 | **0.0927** ✅ |

**最优参数**：range 量化 $a^\ast = 0.373\,964$，得 $\Delta Q^{\mathrm{range}}=0.5889\,\varepsilon$、$\kappa^{\mathrm{range}} = 135°$ ——比 $w(x,a_{\mathrm{tan}})$ 低 **10.7%**、比 $\ell_\infty^{\mathrm{tan}}$ 低 **13.4%**。domain 量化 $a^{\ast\mathrm{domain}} = 0.241\,752$、$\kappa^{\mathrm{domain}}=152°$。

（Remez 算法给 $\tan$ 的最佳近似为 $a_{\mathrm{tan}} = 0.238\,798$，但 tangent 只对 2D 单位向量最优，对四元数并非好选择。）

### 三应用实测（§5.2–5.4）

| 应用 | 结果 |
|------|------|
| **骨架动画** | 集成进开源 **ozz-animation**（仅替换四元数压缩方案）。基线 Ozz $\ell_{2I}$-48（48 bit/四元数）vs 本文 **$\ell_\infty^{\mathrm{cub}}$-40（40 bit）**。在 Mixamo 语料全部关键帧上测测地误差。teaser 显示 40 bit 版本误差图明显优于 Ozz 48 bit 基线。 |
| **切线空间法线贴图** | teaser：参考图 vs $\ell_\infty^{\mathrm{cub}}$ **32 bit/tangent frame**（含对角线拆分）及误差图。 |
| **3D 高斯泼溅** | teaser：参考图 vs $\ell_\infty^{\mathrm{cub}}$ **30 bit/四元数旋转** 及其 **FLIP** 误差。RTX 4070 Ti 上测量。 |

> 注：表 2 中 $\ell_\infty^{\mathrm{cub}}$ 的 $\Delta Q$ 列为 "—"，因其渐近预测与实测的最大误差不再严格对应（因为它优化的是**最大误差**而非渐近常数）。

**总体结论**：$\ell_\infty^{\mathrm{cub}}$ 在**所有预算与两种量化方案**下都取得**所有方法中最低的最大误差**，代价是均值误差最多比 $\ell_\infty^{\mathrm{tan}}$ 高 **2%**。除 $\ell_\infty^{\mathrm{tan}}$ 外，**所有解码器在 $\le 32$ bit 时都比一次插值（slerp）便宜**。

---

## 局限性

- **假设均匀分布**：明确限定四元数在 $S^3$ 上**均匀分布**。若旋转集中在某些区域（如角色动画的关节朝向有强先验），压缩效率会低于最优——**这是最重要的适用前提**。
- **固定码率、需随机访问**：与并行解压 codec（如 KOK\*25）一样，只支持**每个四元数独立解码**的定长码，不支持跨帧/跨元素的上下文建模与熵编码。
- **仅限 8 个 chart 以内**（$c$ 最多 3 bit），不支持需要更多 chart 的高压缩比场景。
- **精度换内存的常 tradeoff**：均值误差比 $\ell_\infty^{\mathrm{tan}}$ 略高（最多 2%），若下游对平均精度敏感则需权衡。
- **不含查表加速**：论文强调解码"仅需少数算术指令、**不用查表**"，这是优点但也意味着无法像 Alexa 方法那样用大表换极致压缩（Alexa 无逆映射，32-bit 需 64 GiB 表，故论文不采用）。

---

## 相关工作

- **Shoemake (1985)**：四元数引入图形学
- **$\ell_{2I}$ / smallest-three**：Fie15；ozz-animation、**EXT_meshopt_compression**、**SPZ**、**SOG**
- **MPEG-4** §8.3.3：$\ell_\infty^{\mathrm{tan}}$（切线 warp）
- **Reynolds (2017)**：单位球映射（Exp）；Rijsdijk 等 (2026) 的 GS 渲染器在用
- **Alexa (2022)**：近均匀分布的索引→朝向映射（无逆映射）
- **Zucker & Higashi (2018)**：优化奇次多项式最小化 $S^2$ 面积失真（本文改为最小化 $S^3$ 上的量化最大角误差）
- **QTangents**（CryEngine）、**八面体法线**（DOOM Eternal, MSS\*10, Meyers 2012）

---

## 实现建议

- **实现难度**：**低**。核心是三次多项式 + 混合基数打包，**3 次 FMA** 解码，无查表，无三角函数。作者已提供 C 参考实现。
- **预期性能**：
  - 32 bit：最大误差 **0.0927°**（比 MPEG-4 的 $\ell_\infty^{\mathrm{tan}}$ 低 13.4%），解码 **111 cycle**
  - 24 bit：**67 cycle**，最大误差 **0.5898°**（range）
  - 16 bit：**103 cycle**，最大误差 **3.77°**（domain）/ **3.39°**（range）
  - 内存：4×32-bit float (128 bit) → **48 bit 可省约 2.7×**；→ 32 bit 可省 4×
- **适用场景**（按收益排序）：
  1. **3D 高斯泼溅资产压缩** ⭐ 最高——数百万四元数，30 bit 即可，肉眼与 FLIP 误差极小，**内存收益最大**
  2. **骨架动画资产** ⭐ 高——集成 ozz-animation，改动仅限压缩方案；**40 bit 版本优于 Ozz 的 48 bit 基线**（省 1 字节/四元数且更准）
  3. **切线空间法线贴图** ——32 bit/tangent frame 优于 CryEngine 的 4×16-bit（64 bit），**省一半**
  4. 流式传输/网络带宽受限的资产管线
- **对 @墨鱼丸 的建议**：
  1. **如果我们的项目涉及 3DGS，优先落地 $\ell_\infty^{\mathrm{cub}}$（30 bit/四元数）**。GS 的四元数数量级是千万级，从 128-bit float 降到 30-bit 是**数量级的显存收益**，且参考实现开源（C），替换成本极低。这是**本次日报中投入产出比最高的技术**。
  2. 混合基数打包支持**每分量小数位**这一点很关键：它让我们能省掉符号位，而很多现有实现（如 Ozz）因为只能用整数字段而被迫保留符号位——**若沿用别人的打包格式，注意这里有可挖的 1 bit**。
  3. **务必验证我们的旋转是否近似均匀分布**。若我们的场景（如角色动画某些关节）分布集中，应考虑非均匀码本或熵编码，此时本文的固定均匀假设会失效。
- **优先级**：**高**。低难度、立即可用、收益确定（尤其对 3DGS 场景）。**建议本周内评估落地。**