---
tags: [几何, 高斯泼溅, Beta核, 在线重建, LOD层次结构, 矩匹配合并, 可观测性, 3DGS, splatting, RADIANCE-field]
date: 2026-11-07
source: arXiv
arxiv_id: 2611.08288
venue: WACV 2027 (accepted)
status: processed
agent_id: wawaicai
authors: Linus Franke (University of Würzburg)
url: https://arxiv.org/abs/2611.08288
code: https://linus-franke.com/hibs/
pdf: https://arxiv.org/pdf/2611.08288
---

# HIBS: Hierarchical Incremental Beta Splatting for Online Reconstruction

> 用 **Beta 核**替代高斯核作为在线重建的图元，用「几何可观测性」驱动**置信度旋钮**，并用**矩匹配**做闭式合并，构建 LOD 层次结构。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Hierarchical Incremental Beta Splatting for Online Reconstruction |
| **作者** | Linus Franke（University of Würzburg） |
| **发表** | arXiv cs.CV/cs.GR, 2026-11-05，**WACV 2027 接收** |
| **链接** | [原文](https://arxiv.org/abs/2611.08288) / [项目页](https://linus-franke.com/hibs/) |
| **篇幅** | 正文 + 大量附录（A~M，含闭式合并完整推导） |
| **许可** | CC BY 4.0（HTML 全文可读） |

---

## 核心贡献

> 在线 3DGS 的根本痛点是「**图元只生成一次、只优化几十次**」——没有纠错机会。本文让图元自身携带**几何置信度**，并用可观测性证据在线「硬化」或「软化」它。

1. **Beta 核作为置信度旋钮** —— 核的形状参数 β 从「软、近似高斯」连续插值到「平顶、近乎不透明的 surfel」。**低 β = 已赚得的（earned）几何承诺；高 β = 未解决的、视角相关的证据**。
2. **可观测性感知生成（Observability-Aware Spawning）** —— 用**三角化角**度量深度可观测性 + 双深度估计器交叉验证，**同时**初始化不透明度与核形状。
3. **确定性「实体度」控制器** —— 每关键帧一次，基于光度误差的 EMA 统计量（均值 + 方差）更新 β，带**视角一致性判据**。
4. **误差驱动的增量重定位（Relocation）** —— 借鉴 3DGS-MCMC，把死图元「传送」到光度误差热点，堆叠成可分离的副本。
5. **Beta 专用的精确 tile 剔除界** —— 修正了高斯阈值对实心低不透明度 beta 核**不适用导致的正确性 bug**。
6. **矩匹配闭式合并** —— 放弃 KL 散度合并（对紧支撑核会发散），改为**质量/协方差/峰度矩匹配**，保证 LOD 合并后**保留实体度**。

---

## 技术方案

### 核心思想

在线 3DGS（i3DGS、On-The-Fly NVS 一类）的流程是：注册 → 采样有图像细节的像素 → 抬升到 3D → 生成**低不透明、半透明、各向同性高斯** → 只做几十次迭代的短优化 burst。**不做离线 3DGS 的 clone/split 稠密化和不透明度重置** —— 所以**初始化质量决定一切**。

高斯的根本缺陷是「**本质柔软**」：要形成实心表面必须靠大量重叠。Beta 核的平顶特性提供了「近乎不透明」的 surfel 行为，但直接用 beta 核又缺乏「哪部分几何可信」的表达。作者的答案是：**让 β 成为一个由证据驱动的状态量**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Beta 核定义** | 紧支撑：$\rho(\mathbf{x}) = o\,(1-\|\mathbf{w}\|^2/9)^{\beta}$，$\mathbf{w}$ 为白化偏移；$\beta = 4e^{b}$，$b$ 为可学习对数参数 |
| **深度可观测性** | $c_z = \text{clamp}(B/(z\theta_0), 0, 1)$，$\theta_0 = 2°$，$B$ 为最大共视基线。三角化角 $\approx B/z$。$c_z$ 大 = 深度被几何约束；小 = 多深度都能解释训练视图，**在新视角视差下不可靠** |
| **实体度控制器** | 每关键帧一次：跟踪被支配像素上光度误差的 EMA（$\eta=0.3$）均值 $\bar e$ 与方差 $\sigma_e^2$；$b \leftarrow b \pm \Delta b$，$\Delta b = 0.4$，$\beta = 4e^b$。**硬化**条件：老（≥10 关键帧）+ 不透明（$o>0.7$）+ 观测充分（>20 支配像素、≥3 视图）+ 低误差（$\bar e<0.03$）。**软化**仅在「观测充分但误差高且**视角不一致**」（$\bar e>0.03$ 且 $\bar e^2/(\bar e^2+\sigma_e^2)<0.5$）时朝 $\beta=5$ 进行。$\beta\in[1,5]$ 硬钳制 |
| **视角一致性判据** | $\bar e^2/(\bar e^2+\sigma_e^2)$ = 信噪比型指标。**视角一致的误差 → 交给 relocation**（那是几何误差）；视角不一致的误差 → 软化（那是外观问题） |
| **误差驱动重定位** | 死图元（低于回收阈值、在层次结构之外、过生成保护期）作为**源**；按逐图元误差归因加权采样**活的**目标，**限制在前 10%**，高误差区获得更多容量。源被传送为目标的位姿/形状/颜色副本，形成「副本堆」，其大小随残余误差增长。优化前调整合成不透明度与尺度使其**渲染保持** |
| **Beta 光栅化剔除界** | $x_{\text{cut}} = \max(0, 1-(255o)^{-1/\beta(b)})$。**关键修正**：3DGS 的标准高斯阈值对**实心低不透明度** beta 核不足，会丢弃含非零贡献的 tile —— 这是**正确性修复**，同时也是加速 |
| **融合光栅器** | FasterGS 风格：backward 重算 forward 量，中间梯度留在寄存器，**稀疏 Adam 直接作用于优化器状态** —— 图元梯度**从不落地内存**。正则项在融合 backward/优化器更新内解析应用 |
| **闭式矩匹配合并** | 见下方公式。**放弃 KL 合并**：紧支撑核下只要父核支撑外有非零质量，KL 散度就发散 |
| **LOD 层次** | 屏幕空间 LOD：4 个相邻图元各自投影 <0.5 像素时替换为粗糙父节点；非活跃精细层卸载到主机内存（应对公里级采集超出 VRAM） |

### 关键公式

**Beta 核与矩的闭式表达**

$$
\rho(\mathbf{x}) = o\,(1-\|\mathbf{w}\|^{2}/9)^{\beta},\qquad \beta = 4e^{b}
$$

$$
\mathrm{Cov} = \xi(\beta)\,\Sigma,\qquad \xi(\beta) = \frac{4.5}{\beta + 2.5}
$$

$$
\kappa(\beta) = \frac{15(\beta+2.5)}{\beta+3.5},\qquad 15-\kappa(\beta) = \frac{15}{\beta+3.5}
$$

> $\kappa$ 对 $\beta$ **严格单调**（$15-\kappa$ 随 $\beta$ 单调递减），故在带 $(75/7,\,15)$ 上有闭式逆 $\beta = 15/(15-\kappa) - 3.5$，**在族内唯一确定剖面**。这是闭式合并可行的根本原因。

**矩匹配合并（式 9–10）**

$$
\mu^{\star} = \sum_i w_i \mu_i,\qquad
\Sigma_{\text{mix}} = \sum_i w_i\,\big(\xi(\beta_i)\Sigma_i + \delta_i\delta_i^{\top}\big)
$$

$$
\beta^{\star} = \frac{15}{15-\hat\kappa}-3.5,\qquad
\Sigma^{\star} = \frac{\Sigma_{\text{mix}}}{\xi(\beta^{\star})},\qquad
o^{\star} = \frac{\sum_i Z_i}{Z(\beta^{\star},\Sigma^{\star})}
$$

- 权重 $w_i \propto Z_i$（质量），$\delta_i = \mu_i - \mu^{\star}$
- $\kappa_{\text{mix}}$ 是逐子项 trace 的**闭式质量加权和**（附录 A）
- 协方差来自**全协方差律**，除掉收缩因子转回形状矩阵，质量守恒决定不透明度
- $\hat\kappa$ 需**裁剪到 beta 族可表示带**

> **对比（Fig. 5）**：KL 风格合并（高斯经典做法）会产生**过大且实心**的图元；矩匹配能**保住 footprint**。

---

## 实验结论

- **协议**：Meuleman et al. 的在线协议；MipNeRF360（garden/counter/bonsai，标 otf）、TUM、StaticHikes；另有标准 3DGS benchmark 与两个大规模采集（SmallCity、CityWalk）
- **硬件**：RTX 5090 (32 GB) + i9-14900KS / 64 GB DDR4 / Windows 11；结果为 5 次运行平均

### 主结果（在线/无位姿方法）

| 场景 | 方法 | PSNR↑ | SSIM↑ | LPIPS↓ | Time↓ |
|------|------|-------|-------|--------|-------|
| **MipNeRF360 (otf)** | On-The-Fly NVS | 22.51 | 0.671 | 0.370 | 1:45 |
| | i3DGS | 26.66 | 0.835 | 0.224 | 2:09 |
| | **HIBS (Ours)** | **27.47** | **0.852** | **0.204** | **1:18** |
| **TUM** | On-The-Fly NVS | 23.37 | 0.824 | 0.241 | 1:00 |
| | i3DGS | 25.36 | 0.858 | 0.188 | 1:24 |
| | **HIBS (Ours)** | **25.94** | **0.868** | **0.175** | 1:44 |
| **StaticHikes** | On-The-Fly NVS | 21.14 | 0.619 | 0.338 | 2:08 |
| | i3DGS | 22.17 | 0.699 | 0.269 | 2:53 |
| | **HIBS (Ours)** | **22.49** | **0.710** | **0.259** | **2:02** |

> 摘要总结：**PSNR 最高提升 0.8 dB，同时优化时间最多降低 40%**。
> TUM 上 LongSplat 的 PSNR/SSIM 略高，但**耗时约为 50×**。

### 离线参考（7k 迭代 + GLOMAP 位姿）

| 方法 | TUM PSNR | Mip360 PSNR | StaticHikes PSNR |
|------|----------|-------------|------------------|
| G+Beta-Splatting (7k) | 22.73 | 27.75 | 20.36 |
| G+Faster-GS (7k) | 23.08 | 27.81 | 20.57 |
| **HIBS (在线)** | **25.94** | **27.47** | **22.49** |

> **在线方法在 TUM / StaticHikes 上超过 7k 迭代的离线基线**（含 GLOMAP 位姿估计时间）。

### 其他关键数字

- DeepBlending 上换成球谐（SH）颜色比球面 beta 颜色**提升约 0.3 dB**（附录 E）
- 对比 exhaustive-GLOMAP 参考（30k 迭代）：质量更高，但耗时为本文的 **6–12×**，且需要**完整采集先于优化**
- MipNeRF360 上顺序匹配可能丢帧（如 bicycle），指标仅在成功注册的视图上计算

---

## 复杂度分析

- **单图元**：核求值 O(1)；光栅化 per-pixel O(1)
- **tile 剔除**：beta 界 $x_{\text{cut}}$ 给出**更紧**的包围 → 相比高斯减少 tile 数（既正确又更快）
- **融合优化器**：梯度不落地 → 显存与带宽降低
- **合并**：闭式 O(1) per primitive pair（无迭代优化），**这是相对 KL/梯度合并的根本优势**
- **LOD**：4 图元一组判定，屏幕空间 O(n) 遍历
- **空间复杂度**：O(#primitives)，LOD 非活跃层卸载主机内存

---

## 数值稳定性

- **β 的双向钳制**：$\beta \in [1,5]$。**注意**：梯度下降会让 $\beta$ 跑到钳制范围外 —— 作者明确承认这一点，钳制只是**控制器施加的硬约束**，而 $\beta$ 本身在优化中自由
- **尺度补偿**：$\beta$ 变化时必须做**尺度补偿**（式 7），否则核的支撑体积会漂移
- **矩合并的 $\hat\kappa$ 裁剪**：混合峰度可能落到 beta 族不可表示区，必须裁剪，否则 $\beta^\star$ 会爆炸或变负
- **out-of-band 混合**：附录 A 有专门的 out-of-band 情形分析 —— 子图元有质量落在父核支撑外时，矩匹配是**近似**而非精确

---

## 局限性

1. **与完全优化的离线方法仍有质量差距**（作者承认），需要靠在线位姿精化来追 —— 与本文正交
2. **合并是近似**：out-of-band 组与实际渲染贡献只是近似
3. **输入乱序会降低质量**（附录 M）
4. **未做系统的运行时性能评估**是本文自己点明的局限（仅在纹理放大那篇中声明，此处为合并近似）
5. **速度限制**：单关键帧 burst 仍受限于「每关键帧能新增的细节总量」

---

## 相关工作

- [[3DGS]] / [[GaussianSplatting]] — 原始 3D Gaussian Splatting
- [[BetaSplatting]] — 静态 beta 核泼溅（HIBS 的离线参考）
- [[FasterGS]] — 融合光栅器（HIBS 直接采用）
- [[3DGS-MCMC]] — relocation 机制的来源
- [[i3DGS]] / [[OnTheFlyNVS]] — 在线基线
- [[MipNeRF360]] / [[TUM]] / [[StaticHikes]] — 评测数据集
- [[LOD-Hierarchy]] / [[Octree]] — 层次结构加速

---

## 实现建议

- **实现难度**: **高**（需要自写 CUDA 融合光栅器 + beta 核解析梯度 + 闭式合并推导）
- **预期性能**: RTX 5090 上 Mip360 在线 ~78 秒/场景，PSNR 27.47
- **适用场景**:
  - **在线/流式 3D 重建**（车载、AR、VR 遥操作）
  - 需要**区分「可信几何」与「待修正区域」**的重建管线 —— β 场本身就是一张**置信度图**
  - 大规模采集的 LOD 渲染（公里级）
- **最值得单独复用的技术点（工程价值最高）**:
  1. **Beta 专用的 tile 剔除界** $x_{\text{cut}}=\max(0,1-(255o)^{-1/\beta})$ —— 这是**正确性修复**，任何用紧支撑核的渲染器都该照抄
  2. **闭式矩匹配合并** —— 用质量/协方差/峰度三个矩匹配替代 KL 合并，解决紧支撑核 KL 发散问题
  3. **「视角一致性」判据** $\bar e^2/(\bar e^2+\sigma_e^2)$ —— 把误差分成「几何误差」和「外观误差」的通用技巧，可迁移到任何带置信度的重建方法
- **依赖项**: 无现成库；需自实现 CUDA（beta 核光栅化、融合 Adam）。libigl 可用于离线分析

---

## 🔗 相关笔记

- [[2026-11-07-4DPS-4D-Point-Splatting-mmWave-Radar]] — 同日论文（点泼溅的跨模态应用）
- [[2026-11-07-SfC-Structure-from-Collision-Hypothesis-Space]] — 同日论文（几何 + 物理）
- [[2026-11-06-T2-Splat-Adaptive-Topology-Mesh-Splatting]] — 同类「网格+泼溅」解耦思路
- [[MeshSimplification]] · [[LOD-Hierarchy]] · [[PointCloudProcessing]] · [[GaussianSplatting]]

---

*Generated by 黄喉 (wawaicai) at 2026-11-07*
