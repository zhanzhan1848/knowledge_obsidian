---
type: paper
created: 2026-11-06
updated: 2026-11-06
tags: [paper, 渲染, 3DGS, 高斯泼溅, 在线重建, beta核, 置信度, 光栅化, LOD, 矩匹配, WACV2027, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.08288
---

# HIBS: 层级增量 Beta 泼溅在线重建（用核形状当几何置信度旋钮）

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hierarchical Incremental Beta Splatting for Online Reconstruction |
| **作者** | Linus Franke（University of Würzburg） |
| **发表** | arXiv 2026-11-05（cs.CV / cs.GR），**WACV 2027** |
| **链接** | [原文](https://arxiv.org/abs/2611.08288) · [HTML](https://arxiv.org/html/2611.08288v1) · [项目页](https://linus-franke.com/hibs/) |
| **DOI** | 10.48550/arXiv.2611.08288 |
| **代码** | 项目页提供源码与模型 |

---

## 核心贡献

> **在线重建的真正约束不是算力，而是「只生成一次、只优化几十步」**。本文不再改优化策略，而是改**基元本身**：把高斯换成可学习的 **beta 核**，用形状参数 $\beta$ 作为「几何承诺度」的连续旋钮——**有证据的地方生成硬表面片（solid surfel），没证据的地方生成软探针（soft probe）**，并配一套闭式矩匹配的 LOD 层级。

1. **核替换**：用有界支撑的 **beta 核**替代高斯，形状参数 $\beta$ 在「类高斯体」↔「平顶近不透明 surfel」之间连续插值 → **单个基元就能表达实心表面**，不再需要「靠大量高斯重叠堆出实心面」。
2. **可观测性感知生成（confidence-aware spawning）**：用**多视图深度一致性**（MVS vs 单目先验）与**几何可观测性**（三角化角 $B/z$）两个独立几何线索初始化不透明度与形状。
3. **误差驱动的增量重定位（error-driven relocation）**：替代离线 clone/split 致密化——把近死基元**回收**到光度误差热点，并做 render-preserving 拷贝堆叠。
4. **闭式矩匹配合并**：为 beta 基元推导**保留实体度（solidity）的闭式合并**，支撑大场景 LOD 层级；**KL 合并在此不适用**（有界核的父支撑外任何非零质量 → KL 发散）。
5. **Beta 专属光栅化剔除界**：对低不透明度的 solid kernel，**标准 3DGS 高斯阈值会错误丢弃 tile** → beta 界既是**正确性修复**也是加速。

---

## 技术方案

### 核心思想

**在线 3DGS 的三大反直觉假设**：
- 每张关键帧只**生成一次**基元，之后只做**几十步**优化 → 没有长时优化去补救糟糕的初始化
- **不做** clone/split 致密化、**不做**不透明度重置 → 「生成出来的是什么，模型基本就保留什么」
- 位置收到的优化梯度太少，无法从错误初始化中恢复

→ **关键决策（放什么、信任多少）必须在初始化时基于可测量证据做出，而不是指望优化去修。**

**为什么高斯是次优的**：高斯仅在中心完全不透明，其余处处半透明 → 表达实心表面必须靠**大量重叠**，且依赖离线致密化 + 长时优化。在线场景没有这些机制，只能生成半透明高斯并指望短优化 burst 排列到位。

**beta 核作为置信度轴**（关键设计）：

$$\alpha = o\,\mathcal{B}(x;b),\qquad \mathcal{B}(x;b) = (1-x)^{\beta(b)},\qquad \beta(b)=4e^{b}$$

其中 $x=r^2/9$，支撑 $r\le 3$（沿用常见 $3\sigma$ 范围）。
- $b=0$（$\beta=4$）→ 剖面**接近高斯**
- $\beta$ **减小** → 变平、趋向**实心平台**（solid plateau）
- $\beta$ **增大** → 变软、快速衰减的 blob

**必须用几何证据，不能用光度证据**：
> 朴素地生成 solid kernel 是**有害的**——紧凑近不透明的基元若深度错误，会**阻断透射率（transmittance）**并抑制其后的梯度。反过来，光度误差低也**不保证**几何正确：当三角化基线相对深度很小时，许多深度能同样好地解释观测视图，但只有狭窄范围在视差下保持一致。

### 关键技术

| 技术 | 说明 |
|------|------|
| **深度可观测性 $c_z$** | $c_z=\operatorname{clamp}\!\left(\dfrac{B/z}{\theta_0},0,1\right),\ \theta_0=2^\circ$。$B$ = 最大共视基线，$z$ = 候选深度。三角化角近似 $B/z$。$c_z$ 大 → 深度被几何约束；小 → 许多深度都能解释训练视图，新视差下不可靠 |
| **MVS 一致性 $c_{\mathrm{mvs}}$** | $c_{\mathrm{mvs}}=\operatorname{clamp}\!\left(1-\dfrac{|i_{\mathrm{mvs}}-i_{\mathrm{mono}}|}{r_{\mathrm{mvs}}},0,1\right)$，其中 $i$ 为逆深度。**在度量的对齐单目先验附近开半径 $r_{\mathrm{mvs}}$ 的窗口**做引导式 MVS。平坦匹配代价剖面时置 0 |
| **联合置信度** | $c=(c_{\mathrm{mvs}}\cdot c_z)^{\gamma}$，$\gamma=4$ |
| **生成参数初始化** | $o_{\mathrm{spawn}}=o_0+(o_1-o_0)c$（$o_0=0.1,\ o_1=0.3$）；$\beta_{\mathrm{spawn}}=\beta_{\mathrm{soft}}-(\beta_{\mathrm{soft}}-\beta_{\mathrm{solid}})c$（$\beta_{\mathrm{solid}}=1,\ \beta_{\mathrm{soft}}=5$）。MVS 无可靠对应（$c_{\mathrm{mvs}}=0$）时用保守下限 $o_{\mathrm{floor}}=0.02$ |
| **尺度补偿（保半最大值足迹）** | $s\leftarrow s\sqrt{\dfrac{u_{1/2}(\beta_1)}{u_{1/2}(\beta_2)}},\quad u_{1/2}(\beta)=1-2^{-1/\beta}$，$\beta_1=4$ → $\beta_2=\beta_{\mathrm{spawn}}$ |
| **实体度控制器（逐关键帧）** | 跟踪各基元主导像素的光度误差 EMA（$\eta=0.3$）。$b\leftarrow b\pm\Delta b$，$\Delta b=0.4$。**硬化**条件：年龄 $\ge 10$ 关键帧、$o>0.7$、观测 $>20$ 主导像素、统计来自 $\ge 3$ 视图、$\bar e<0.03$。**软化**仅当观测充分但高误差**强烈视图不一致**（$\bar e>0.03$ 且 $\bar e^2/(\bar e^2+\sigma_e^2)<0.5$）。**视图一致的误差交给重定位处理**（那说明是几何误差而非视图相关外观）。$\beta$ 钳制在 $[1,5]$ |
| **球面 beta 颜色基（零初始化瓣）** | $\mathbf{C}(\mathbf{v})=\mathbf{c}_0+\sum_k \mathbf{a}_k\max(0,\mathbf{d}_k\!\cdot\!\mathbf{v})^{4e^{b_k}}$。**离线 DBS 用非零瓣幅值初始化并在数千次迭代中优化掉；在线只有几十次更新 → 本文把瓣幅值全置零 + 随机方向** → 消除离线的持久视角相关颜色偏置，且幅值梯度在零处仍非零 |
| **误差驱动的重定位** | 每关键帧一次：低于回收不透明度阈值、在层级之外、过了生成保护窗的**死基元**作为源；按**每基元误差归因**（加权误差一致性）采样活的**目的基元**，**限制在误差最高的 top 10%**。每个源被**传送**为目的地位置/形状/颜色的拷贝 → 形成随残差误差增长的**拷贝堆叠**。优化前做 render-preserving 调整（调组合不透明度与尺度），再靠小位置抖动 + 优化器重置让拷贝分离 |
| **Beta 专属 tile 剔除界** | $x_{\mathrm{cut}}=\max\!\left(0,1-(255o)^{-1/\beta(b)}\right)$。**标准 3DGS 高斯阈值对 solid 低不透明度 beta 核不充分**，会丢掉含非零贡献的 tile |
| **FasterGS 式融合光栅器** | backward 重算 forward 量、中间梯度留在寄存器、稀疏 Adam 直接作用到优化器状态 → **基元梯度从不在显存中落地**。正则项在融合 backward/optimizer 内解析计算 |
| **闭式矩匹配合并** | 见下方公式。**KL 合并不适用**（有界核的父支撑外非零质量 → KL 无穷） |
| **分辨率感知加权 + 定向修复** | 层级周期性重建；观测基元低于其最细观测分辨率 1/4 的视图被排除出生成并降低更新权重（防重复生成）；**定向修复 pass** 给光度误差超过中位数 1.5× 的最差视图分配 1000 次迭代（缓解近因偏置） |

### 数学细节：闭式矩合并

单个基元的紧支撑核 $\rho(\mathbf{x})=o\,(1-\|\mathbf{w}\|^2/9)^{\beta}$（$\mathbf{w}$ 为白化偏移）。

**三个闭式量**：
- 质量 $Z$
- 协方差 $\mathrm{Cov}=\xi(\beta)\Sigma$，收缩因子 $\xi(\beta)=\dfrac{4.5}{\beta+2.5}$
- Mardia 峰度 $\kappa(\beta)=\dfrac{15(\beta+2.5)}{\beta+3.5}$

**关键性质**：$\kappa$ 对 $\beta$ 严格单调，且 $15-\kappa(\beta)=\dfrac{15}{\beta+3.5}$ → 在带 $(75/7,\ 15)$ 上有闭式逆 $\beta=\dfrac{15}{15-\kappa}-3.5$，**在 beta 族内唯一确定剖面**。

**合并公式**（质量权重 $w_i\propto Z_i$，偏移 $\delta_i=\mu_i-\mu^\star$）：

$$\mu^\star=\sum_i w_i\mu_i,\qquad \Sigma_{\mathrm{mix}}=\sum_i w_i\big(\xi(\beta_i)\Sigma_i+\delta_i\delta_i^\top\big)$$

$$\beta^\star=\frac{15}{15-\hat\kappa}-3.5,\qquad \Sigma^\star=\frac{\Sigma_{\mathrm{mix}}}{\xi(\beta^\star)},\qquad o^\star=\frac{\sum_i Z_i}{Z(\beta^\star,\Sigma^\star)}$$

$b^\star=\ln(\beta^\star/4)$。**协方差由全协方差定律得出，除掉收缩因子转回形状矩阵，质量守恒决定不透明度。**

---

## 代码片段

```cpp
// Beta 核的 tile 剔除界（低不透明度 solid kernel 必须用这个）
// 标准 3DGS 高斯阈值对此不充分 -> 会丢弃含非零贡献的 tile
float x_cut = fmaxf(0.0f, 1.0f - powf(255.0f * opacity, -1.0f / beta));

// 核剖面（支撑 r <= 3，即 x = r^2/9）
// alpha = o * pow(1 - x, beta),  beta = 4 * exp(b)

// 置信度 -> 生成参数（几何证据，非光度证据）
float c_z   = clamp((B / z) / theta0, 0.0f, 1.0f);   // theta0 = 2 deg
float c_mvs = clamp(1.0f - fabs(i_mvs - i_mono) / r_mvs, 0.0f, 1.0f);
float c     = powf(c_mvs * c_z, gamma);                // gamma = 4
float o_spawn   = o0 + (o1 - o0) * c;                  // o0=0.1, o1=0.3
float beta_spawn = beta_soft - (beta_soft - beta_solid) * c;  // 5 -> 1
if (c_mvs == 0.0f) o_spawn = o_floor;                  // 0.02

// 保半最大值足迹的尺度补偿
float u_half(float beta) { return 1.0f - powf(2.0f, -1.0f / beta); }
s *= sqrtf(u_half(4.0f) / u_half(beta_spawn));

// 闭式矩合并（KL 合并在有界核上会发散）
float xi(float beta)     { return 4.5f / (beta + 2.5f); }
float kappa(float beta)  { return 15.0f * (beta + 2.5f) / (beta + 3.5f); }
float beta_from_kappa(float k) { return 15.0f / (15.0f - k) - 3.5f; }
```

---

## 实验结论

- **数据集**: Mip-NeRF 360 (on-the-fly 协议)、TUM、StaticHikes、3DGS 基准（garden/counter/bonsai、Tanks&Temples、Deep Blending）、大场景 SmallCity & CityWalk
- **硬件**: RTX 5090 (32 GB)、i9-14900KS、64 GB DDR4、Windows 11
- **基线**: MonoGS、S3PO-GS、LongSplat、On-The-Fly NVS、i3DGS、DROID-Splat、CF-3DGS、ARTDECO、H3DGS、Octree-GS、GLOMAP 离线参考（BetaSplatting / Faster-GS）

**新视角合成（无位姿方法，Tab. 1）**：

| 数据集 | 方法 | PSNR↑ | SSIM↑ | LPIPS↓ | Time↓ |
|--------|------|-------|-------|--------|-------|
| TUM | i3DGS | 25.36 | 0.858 | 0.188 | 1:24 |
| TUM | **Ours** | **25.94** | **0.868** | **0.175** | 1:44 |
| MipNeRF360 (otf) | i3DGS | 26.66 | 0.835 | 0.224 | 2:09 |
| MipNeRF360 (otf) | **Ours** | **27.47** | **0.852** | **0.204** | **1:18** |
| StaticHikes | i3DGS | 22.17 | 0.699 | 0.269 | 2:53 |
| StaticHikes | **Ours** | **22.49** | **0.710** | **0.259** | **2:02** |

- MipNeRF360 (otf) 与 StaticHikes 上**三项指标全胜** pose-free 方法，且计算时间**最多减少 40%**
- TUM 上 LongSplat 的 PSNR/SSIM 略高，但耗时约 **50×**

**3DGS 基准（Tab. 2）**：MipNeRF360 上 SSIM/LPIPS 优于 i3DGS，时间 **1:17 vs 1:59**（最快）；Deep Blending 更难（换成 SH 颜色基可 +0.3 dB）

**大场景（Tab. 3）**：

| 方法 | SmallCity PSNR | CityWalk PSNR | CityWalk 时间 |
|------|---------------|---------------|--------------|
| Octree-GS | 24.18 | 17.33 | ~2.5 h |
| OtF NVS | 23.59 | 21.71 | 29:35 |
| i3DGS | 23.56 | 22.03 | 45:20 |
| **Ours** | **24.45** | **25.81** | — |

**组件消融（Tab. 4，九个 otf 场景平均）**：

| 配置 | PSNR | SSIM | LPIPS | t(s) |
|------|------|------|--------|------|
| Full (ours) | 25.30 | 0.810 | 0.213 | 101 |
| w/o SB lobes (→SH) | 25.12 | 0.807 | 0.214 | 106 |
| DBS lobe init prior | 25.19 | 0.809 | 0.214 | 100 |
| w/o confidence | 25.14 | 0.808 | 0.215 | 99 |
| w/o solidification | 25.15 | 0.807 | 0.216 | 100 |
| w/o error relocation | 25.09 | 0.804 | 0.219 | 95 |
| w/o regularizers | 24.98 | 0.803 | 0.216 | 108 |
| w/o fused rasterizer | 25.24 | 0.809 | 0.214 | 120 |

- 融合光栅器**减少约 16% 运行时间**；30 次迭代 burst 把 Garden 从 **287 ms → 170 ms**
- 误差重定位带来约 **6%** 运行时间代价但提升质量
- 大场景：**w/o moment merge** → CityWalk **−2.27 dB**（多层级场景下矩合并收益最大）

**核消融（Tab. 5）**：i3DGS 24.73 → 高斯 25.09 → β 冻结在 4 为 25.06 → 可学 β 25.11 → +$\beta_{\mathrm{spawn}}$ 25.15 → 完整（含固化）**25.30**。→ **beta 核相对高斯 +0.2 dB，且因有界支撑更快**

**重建过程中的质量**：持续优于 i3DGS（差距在 bootstrap 后不久出现并贯穿整个采集）；**绝大多数测试视图在注册后继续改善（点在对角线上方）→ 无灾难性遗忘**

---

## 局限性

- 与**完全优化的离线方法**相比仍有质量差距 → 后续提升需来自**在线位姿精化**（与本文正交）
- **合并是近似的**：外带（out-of-band）组与实际渲染贡献被近似
- **打乱输入顺序**会降低质量
- Deep Blending 上球面 beta 颜色基不如 SH（差约 0.3 dB）
- 未来方向：VR 集成、用置信度图指导精化

---

## 相关工作

- [[2026-11-05_AbacusGS-Gaussian-Splatting-Without-Per-Splat-Sorting]]
- [[2026-11-05_GaussianRenderFormer-Transformer-Rendering-3DGS]]
- [[2026-11-04_Phase-DGS-Phase-Guided-Dynamic-Gaussian-Splatting]]
- Deformable Beta Splatting（DBS，本文核的来源）
- 3DGS-MCMC（本文重定位机制的来源）
- i3DGS、On-The-Fly NVS（在线 NVS 对照）
- FasterGS（融合光栅器）
- [[2026-11-06_T2-Splat-Adaptive-Topology-Mesh-Splatting]]

---

## 实现建议

- **实现难度**: **中高**。需要改写光栅化器（beta 核 + 专属剔除界）、矩匹配合并、以及一套基于几何证据的基元生命周期管理。核心数学（矩匹配）有闭式解，实现不难；难在**在线管线的工程整合**
- **预期性能**: 在线场景下 **PSNR +0.5~0.8 dB**、**时间减少 ~40%**、同时**不减少**基元数量（相比 i3DGS 全面胜出）
- **适用场景**:
  - **在线/流式重建**（AR/VR 实时捕获、SLAM 式扫描）— 这是本文真正的目标场景
  - 需要**大场景**且显存受限的实时应用
  - 需要**逐基元置信度可视化**的场景（β 场天然就是置信度图）
- **可独立借鉴的子技术**（即使不做完整 HIBS）：
  1. **beta 核的有界支撑 tile 剔除界** — 可直接移植到任何高斯泼溅实现，兼得正确性 + 速度
  2. **闭式矩匹配合并** — 任何带形状参数的可展基元都能用（保留实体度而非简单缩放）
  3. **零初始化颜色瓣** — 在线/少迭代场景下消除视角相关颜色偏置，零成本
  4. **误差驱动重定位** — 替代离线 clone/split，在线场景的致密化替代方案
  5. **「几何证据 vs 光度证据」的分离** — 泛化思想：置信度必须来自独立的几何线索交叉验证
- **优先级建议**: 🟡 **P1** — 对做在线重建的团队价值极高；若自研管线是离线高斯泼溅，则优先级降为 🟢 观察
