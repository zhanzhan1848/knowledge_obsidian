---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, 渲染, 路径追踪, 全局光照, 体积渲染, 神经渲染, 实时渲染, 蒙特卡洛, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12103
arxiv_id: 2611.12103
---

# Real-Time Volumetric Light Transport Inference without a Path (HaloRT)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Volumetric Light Transport Inference without a Path |
| **作者** | Ludwic Leonard, Ruediger Westermann（Technical University of Munich, Germany） |
| **发表** | arXiv cs.GR, 2026-11-09（提交 2026-11-09） |
| **链接** | [原文](https://arxiv.org/abs/2611.12103) / [HTML 全文](https://arxiv.org/html/2611.12103v1) |
| **DOI** | —（arXiv 预印本） |
| **代码** | 论文未提供（正文提及实现为 Vulkan + CUDA） |
| **模型名** | **HaloRT**（Halo-attention-based Radiative Transfer model） |

---

## 核心贡献

> **首次证明：体积渲染的光传输解可以不经过任何路径采样，直接从廉价的「主射线特征」确定性解码出来——把体积渲染从「MC 采样 + 去噪」范式改为「特征 + 解码」范式。**

1. **形式化「特征充分性 (A1) + 噪声不变性 (A2)」两条可独立检验的假设**，把体积渲染重述为从噪声辅助特征到辐射度的**确定性映射**，而非对单个随机估计量的去噪。
2. **一套紧凑的主射线特征**：光学深度、多尺度交互深度、向光源的透射率、首次交互点的环境光照、局部介质属性——被证明对云场景的多重散射**近似充分**。
3. **结构化解码器 HaloRT**：利用「光传输对光照的线性性」与「颜色通道的独立性」，训练**两个单通道解码器**（环境项 $S_e$ + 方向光项 $S_l$），配 U-Net + HaloNet 局部窗口注意力，在 2048² 下 10.5 ms/通道。
4. **实时云渲染器**：在 RTX 5090 上对**训练中未见的云与环境**实时重建完整体积全局光照，比「增强版去噪器 DenoiserX」快 2 倍以上，且**完全不依赖路径采样**。

---

## 技术方案

### 核心思想

传统体积渲染必须做 MC 路径追踪（每像素 4⁴ spp），再用去噪器滤掉噪声。这篇论文反问：**路径样本是必需的吗？**

答案是：对于**云这类介质**，主射线上的少量廉价特征（光学深度、首次交互深度、透射率、环境光）已经携带了绝大部分光传输信息。于是把渲染算子 $R(\theta)$ 换成一组**廉价的辅助前向算子** $\{F_k\}$，再学习一个确定性解码器 $S$：

$$\hat{\mathbf{F}}=\mathbf{F}(\theta;\xi)=\big(F_1(\theta;\xi),\dots,F_n(\theta;\xi)\big),\qquad \xi\sim p(\xi)$$

两条关键假设：

- **(A1) 充分性**：渲染结果只通过特征的分布依赖于场景
  $$\mathbf{F}(\theta;\xi)\overset{d}{=}\mathbf{F}(\theta';\xi)\;\Rightarrow\;R(\theta)=R(\theta')$$
- **(A2) 噪声不变性**：存在确定性映射 $S$，对同一场景的所有特征实现都解码出同一图像
  $$S\big(\mathbf{F}(\theta;\xi)\big)=S\big(\mathbf{F}(\theta;\xi')\big)=R(\theta)\quad\text{almost surely}$$

**关键洞察（论文反复强调）**：MC 去噪是本框架的**特例**——单个算子 $F_{\text{MC}}$ 给出无偏辐射度估计，$R(\theta)=\mathbb{E}_\xi[F_{\text{MC}}(\theta;\xi)]$，此时 (A1) **平凡成立**，全部难度都压在 (A2) 上。本文换了特征之后，**平衡被反转**：(A2) 变得容易（特征几乎确定），(A1) 只在云这一类场景上近似成立。

### 关键技术

| 技术 | 说明 |
|------|------|
| 光学深度特征 $F_\tau$ | $\tau(d)=\int_0^d \sigma_t(x_t)\,dt$，归一化编码 $\hat\tau(d)=1-\frac{1}{1+0.5\tau(d)}$（抑制高不透明区的指数饱和，改善数值条件） |
| 交互深度 $F_d$ | 首次散射事件的条件期望光学深度 $\tau_c=1-\frac{\tau e^{-\tau}}{1-e^{-\tau}}$，取满足 $\tau(t_1)=\tau_c$ 的最小距离 $t_1$（**始终落在介质内部**，避免自由飞行估计落入空隙） |
| 交叉层 $F_c$ | 用逐步降低的消光系数（$\times 4,\times 1,\times 0.25,\times 0.1$）计算多尺度首次交互深度，取**相邻交叉的距离**而非深度序列（对相机变化更稳定） |
| NEE 透射率 $F_n$ | 首次交互点 $x_{t_1}$ 向方向光源的透射率 $T(x_{t_1}\leftrightarrow x_l)$；用确定性 ray marching 前 $0.1\mathrm{u}$ + 随机 ratio tracking 降方差 |
| 环境光照 $F_e$ | $\int_{\mathcal{S}^2}T(x_{t_1}\leftrightarrow x_i)\,\rho(x_{t_1},\omega,\omega_i)L(x_i,\omega_i)\,d\omega_i$，用 **8 个样本**的 MC 估计；equirect 环境图上用四叉树按亮度重要性采样 |
| 介质属性 $F_m$ | 首次交互点的 Henyey–Greenstein 各向异性 $g$ 与单次散射反照率 $\varphi(x_{t_1})$ |
| 结构化解码 | 光照线性性 → 环境项/方向光项解耦为 $S_e$、$S_l$；通道独立性 → 共享权重的单通道解码器 |
| HaloRT 架构 | U-Net（残差块）下采样 6 次，瓶颈 64 通道；4 个阶段 + 瓶颈用 HaloNet **局部窗口自注意力**（非全局注意力） |
| 渲染管线 | Vulkan 实现，CUDA 导出的 device memory 直接喂给网络推理，**免去 host 端同步**；主射线用穷举 ray-marching（步长 0.001u）+ DDA 跳过空区；主光栅（majorant）网格加速 delta/ratio tracking |

### 核心公式

**体积渲染方程（各向异性散射的物理基础）**：

$$L(x_0,\omega)=\int_0^d T(x_0\leftrightarrow x_t)\,\sigma_t(x_t)\,\big[\varphi(x_t)L_s(x_t,\omega)+(1-\varphi(x_t))L_e(x_t,\omega)\big]\,dt+T(x_0\leftrightarrow x_d)\,L(x_d,\omega)$$

$$T(x_a\leftrightarrow x_b)=\exp\!\left(-\int_{x_a}^{x_b}\sigma_t(x)\,dx\right),\qquad
L_s(x_t,\omega)=\int_{\mathcal{S}^2}\rho(x_t,\omega,\omega_i)\,L(x_t,\omega_i)\,d\omega_i$$

**光照线性性 → 解耦**（论文的关键结构化假设）：

$$I=e\,\big(TB+I_e\big)+l\,I_l$$

其中 $e,l$ 为环境光/方向光强度，$TB$ 为沿主射线的透射环境项（已知），只需推断 $I_e,I_l$。

**解码器训练目标**：

$$\Psi^{\star}=\arg\min_{\Psi}\;\mathbb{E}_{\theta\sim p(\theta)}\,\mathbb{E}_{\xi\sim p(\xi)}\Big[\ell\big(S_{\Psi}(\mathbf{F}(\theta;\xi)),\,R(\theta)\big)\Big]$$

内层期望**奖励对 $\xi$ 的不变性**（即 A2），外层期望**把 A1 限制在场景分布 $p(\theta)$ 上**。

**损失函数（$\ell_1$ + 对数压缩变体的组合）**：

$$c(x)=\mathrm{sgn}(x)\,\log(1+(100-1)|x|)/\log 100$$
$$\mathcal{L}=0.6\|\hat{I}-I\|_1+0.4\|c(\hat{I})-c(I)\|_1$$

---

## 代码片段

```cpp
// 主射线特征提取要点（论文 4.1 / 4.3 节）
// 场景体素缩放到 [-1,1]^3 立方体内
constexpr float step_size = 0.001f;      // 穷举 ray-marching 步长
constexpr float direct_light_raymarch_radius = 0.1f;  // NEE 确定性段长度

// 第一遍遍历：计算光学深度 tau
// 第二遍遍历：从第一个非零密度处开始，计算多尺度交叉点
//   scales = {4.0, 1.0, 0.25, 0.1}  (sorted → 单次遍历处理所有交叉)
//   若所有交叉已确定可提前终止

// 环境重要性采样：equirect 环境图上建四叉树，采样密度 ∝ 亮度
// 方向光透射率：先确定性 ray-marching 半径 0.1u，再 ratio tracking + Russian roulette
```

```python
# HaloRT 网络结构要点（论文 4.2 / 4.4）
# U-Net: 残差块 + 局部窗口自注意力(HaloNet, VRS*21)
#   下采样 6 次，瓶颈 64 通道
#   局部窗口注意力应用于 4 个阶段 + 瓶颈
# 输入: 8 通道特征图 → 输出: 1 通道
# 训练: AdamW, lr 从 1e-3 指数衰减至 1e-6 (240K 步) + 恒定 120K 步
#   batch=16, micro-batch=4
#   水平翻转增强 + 3 个颜色通道各反传 (共 6 次前向/反传)
#   环境采样数在 1~16 间均匀采样 → 对噪声水平鲁棒
```

---

## 实验结论

- **数据集**：自建合成数据集。1000 张 Stable Diffusion 合成的 HDR 环境图 + Cloudy Project 数据集（LTW25）的 500 个云体 → 共 **22,000 个实例**，每张 **4096 spp** 参考图；随机化相机位姿、光照方向、HG 各向异性 $g$、逐通道散射反照率。
- **基线**：Denoiser（Hofmann et al. I3D 2021 体积去噪器）、DenoiserX（本文特征替换其原始辅助缓冲）、MRPNN（SIGGRAPH'23）、Intel OIDN。
- **结果（Table 2，评估集平均）**：

| 方法 | MAE↓ | PSNR↑ (dB) | SSIM↑ | LPIPS↓ | RMS-SD↓ | 时间↓ (ms) |
|---|---|---|---|---|---|---|
| Denoiser | 0.00391±0.00179 | 41.62±3.05 | 0.9687±0.0250 | 0.0901±0.0652 | 0.00628±0.00330 | 23.84±9.61 |
| DenoiserX | 0.00338±0.00151 | 44.23±2.80 | 0.9827±0.0151 | 0.0517±0.0420 | 0.00323±0.00123 | 24.76±9.98 |
| **HaloRT** | **0.00324**±0.00265 | 42.79±3.91 | **0.9874**±0.0112 | **0.0420**±0.0418 | **0.00070**±0.00035 | **10.66**±0.52 |

  - **稳定性（RMS-SD）是最亮眼指标**：HaloRT 的 0.00070 **不到 DenoiserX 的 1/4**，**只有 Denoiser 的 1/9**——直接量化了 A2 假设。
  - **速度**：10.66 ms vs 24.76 ms（快 2.3 倍），且**方差极小**（±0.52 vs ±9.98）。
  - PSNR 略低于 DenoiserX（-1.44 dB），但 **LPIPS 最优**（感知质量更好），SSIM 最优。

- **结果（Table 1，推理耗时随分辨率缩放，RTX 5090，8 通道输入 / 1 通道输出）**：

| 架构 | 256² | 512² | 1024² | 2048² |
|---|---|---|---|---|
| **HaloRT** | 1.411 | 1.563 | 2.914 | **10.528** |
| HaloRT 去掉注意力 | 1.233 | 1.378 | 2.646 | 10.007 |
| 同阶段全注意力 | 1.446 | 1.618 | 4.700 | **31.659** |
| CNN 自编码器 | 1.029 | 1.132 | 1.835 | 6.830 |

  → **局部注意力相比全局注意力在 2048² 快 3 倍**（10.5 ms vs 31.7 ms），且在瓶颈处实现全图信息交换。

- **关键定性结论**：
  - 网络**从未被显式告知光照方向**，仍能重建背光区域——靠方向光透射率与其他特征之间的空间相干可见性模式推断。
  - 相机推近时去噪器耗时随屏幕覆盖率上升，HaloRT **维持近乎恒定 FPS**（不依赖路径采样，与密度/相机距离的相关性低得多）。
  - 单色单方向光下，HaloRT 单次推理**无噪声**且比 MRPNN 单次前向更快（MRPNN 边界处噪声明显）。

---

## 局限性

- **A1 只在「合理场景」上成立**：强方向光或全局传输主导时，光传输依赖离开主射线邻域的体积结构，这些信息特征未显式捕获——此时 PSNR 低于 DenoiserX，但**局部细节恢复更好**。
- **A2 残留**：可见性特征仍是随机的，跨实现的标准差虽小但非零；论文建议用 deep shadow map 估计方向光可见性。
- **适用范围受限**：只训练/评测了单一数据集的云状介质、Henyey–Greenstein 相函数、**非自发光**介质、单一远处光照体（平滑环境图 + 一个主方向光）；**不支持介质内/周围表面、局部光源、自发光**。
- **颜色通道**：共享消光系数；若消光逐通道不同需每通道单独遍历体。
- **环境图全部为合成**（Stable Diffusion 生成），泛化到真实 HDR 环境未经检验。
- 误差三来源：特征仅近似充分（A1）、解码器容量/数据/优化受限、可见性特征仍随机（A2）。
- 网络占主导成本：2048² 下 10.5 ms/次，且**每个光照分量、每个颜色通道各需一次**。

---

## 相关工作

- [[2026-11-10_HaloRT-Real-Time-Volumetric-Light-Transport-Inference]]
- 光线追踪 / 全局光照：[[路径追踪]] [[蒙特卡洛去噪]]
- 神经渲染：[[神经辐射缓存]] [[实时体积渲染]]
- 关键引文：Kajiya 1986（渲染方程）、Novák et al. 2018（MC 体积光传输）、Hofmann et al. I3D 2021（交互式路径追踪与稀疏体重建）、Hofmann et al. 2023（联合神经去噪）、Kallweit et al. 2017（Deep Scattering）、Hu et al. SIGGRAPH'23（MRPNN）、Leonard et al. CGF 2021（学习多次散射解）、Olajos et al. 2026（环境体积神经着色）、Liang et al. SIGGRAPH'26（多特征辐射烘焙）、Schied et al. HPG 2017（时空方差引导滤波）
- 同作者相关：Leonard & Westermann, *Light transport-aware diffusion posterior sampling* (CVPR 2025)

---

## 实现建议

- **实现难度**：**高**（需要 Vulkan 渲染器 + CUDA 零拷贝推理管线 + 自建 22k 高 spp 数据集 + 360K 步训练；单卡 RTX 5090 可完成）
- **预期性能**：RTX 5090 上 2048² 约 10.5 ms/通道/分量；相对 MC 去噪器提速 ~2.3×，跨实现稳定性提升 4–9×
- **适用场景**：
  - ✅ 云 / 雾 / 烟等**参与介质**的实时渲染（游戏、VR、影视预览）
  - ✅ 需要**帧间绝对稳定**（无去噪器闪烁、无需时域滤波）的场景
  - ✅ 大量相机的自动驾驶 / 世界模型仿真（数字孪生）
  - ❌ 表面渲染（本文只针对体积介质，A1 未经表面验证）
  - ❌ 需要逐样本物理精确性（如离线参考图、能量守恒验证）的场景
- **落地建议**：
  1. 先做**消融原型**：实现 5 个特征算子（光学深度 / 交互深度 / 交叉层 / NEE 透射率 / 环境光），用小规模数据验证 A1 是否成立——**这是整个方法的前提，先验证再投入**
  2. 利用「光照线性性 + 通道独立性」把问题拆成 2 个单通道模型，**大幅降低模型容量需求**（论文明确指出联合模型效果更差）
  3. 用 HaloNet 局部注意力替代全局注意力，2048² 下可省 3× 时间
  4. 环境采样数从 8 起做扫描——论文 Fig.6 显示 8 个样本即可让方差不可察觉
  5. 把解码器与渲染器用 device memory 打通，避免 host 端同步
  6. 训练时环境采样数在 1~16 间均匀采样，提升对噪声水平的鲁棒性
- **优先级**：**高**——本轮唯一直接命中「全局光照 / 路径追踪 / 实时渲染」核心关键词且方法论有突破的论文
