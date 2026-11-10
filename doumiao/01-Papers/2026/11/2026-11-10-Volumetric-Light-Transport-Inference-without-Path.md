---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, fluid-rendering, volume-rendering, volumetric, ray-marching, neural-rendering, clouds, smoke, real-time, light-transport, attention, halo, denoising, siggraph-asia-2026]
status: processed
domain: 流体渲染
agent: doumiao
source: https://arxiv.org/abs/2611.12103
---

# Real-Time Volumetric Light Transport Inference without a Path

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Volumetric Light Transport Inference without a Path |
| **作者** | Ludwic Leonard, Ruediger Westermann（LMU Munich，图形学与可视化组） |
| **arXiv ID** | [2611.12103](https://arxiv.org/abs/2611.12103) (v1, 2026-11-09) |
| **分类** | cs.GR（主）、cs.CV |
| **DOI** | [10.48550/arXiv.2611.12103](https://doi.org/10.48550/arXiv.2611.12103)（DataCite 注册中） |
| **发表** | 预印本（预计 SIGGRAPH Asia 2026 / Eurographics 2027） |
| **代码** | 论文未在摘要中声明公开仓库 |
| **HTML 版** | https://arxiv.org/html/2611.12103v1 |
| **关键词** | Computing methodologies — Rendering / Neural networks / Ray tracing |

---

## 核心贡献

> **把"体积渲染"从"对随机辐射样本去噪"重构为"从确定性传输特征直接解码最终辐照度"**——推理阶段**完全不需要做任何路径追踪**（不做蒙特卡洛多散射采样、不做 denoise），仅用廉价的**主光线特征 + 少量环境采样** + 一个带局部自注意力的图像到图像网络，即可在 RTX 5090 上实时重建云/烟/雾等参与介质的**完整多次散射全局光照**。

1. **形式化：渲染 = 确定性解码**。提出两条可检验假设：
   - **(A1) 充分性（Sufficiency）**：$F(\theta;\xi)\overset{d}{=}F(\theta';\xi)\Rightarrow R(\theta)=R(\theta')$——渲染结果只通过特征分布依赖场景，**不需要反解场景参数 $\theta$**。
   - **(A2) 噪声不变性（Noise-invariant decoding）**：$S(F(\theta;\xi))=S(F(\theta;\xi'))=R(\theta)$ 几乎必然成立——同一场景的所有特征实现必须解码到同一张图。
   - 关键洞见：**MC 去噪只是 (A1) 平凡成立、(A2) 全部困难的特例**；本文的特征把矛盾反转——噪声不变性变得容易，充分性对云近似成立。
2. **一套紧凑的主光线特征**（6 类，取代整条路径）：光学深度 $F_\tau$、多尺度交互深度 $F_d$、交叉层 $F_c$、向光源的透射率 $F_n$、环境光照 $F_e$、介质局部属性 $F_m$。
3. **结构化解码器 HaloRT**：利用光传输**对光照的线性性**与**颜色通道的独立性**，把网络拆成两个**单通道**解码器（$S_e$ 环境光分支 / $S_l$ 平行光分支），用 **Halo 局部窗口自注意力**替代全注意力，跨图交换信息。
4. **实时且稳定**：在**训练时从未见过的云和环境贴图**上实现实时；推理结果对随机实现近乎不变（不需跨帧累积），且**运行时间不随介质密度和相机距离增长**。

---

## 技术方案

### 核心思想

体积渲染的物理基础是体积渲染方程：

```math
L(x_0,\omega)=\int_0^d T(x_0\leftrightarrow x_t)\,\sigma_t(x_t)\bigl[\varphi(x_t)L_s(x_t,\omega)+(1-\varphi(x_t))L_e(x_t,\omega)\bigr]\,dt+T(x_0\leftrightarrow x_d)L(x_d,\omega)
```

其中透射率

```math
T(x_a\leftrightarrow x_b)=\exp\left(-\int_{x_a}^{x_b}\sigma_t(x)\,dx\right)
```

内散射项对球面方向积分

```math
L_s(x_t,\omega)=\int_{\mathcal{S}^2}\rho(x_t,\omega,\omega_i)L(x_t,\omega_i)\,d\omega_i
```

相函数用 **Henyey–Greenstein**（各向异性系数 $g$），非发光介质（$L_e=0$）。

**核心转向**：不再去求 $R(\theta)$（代价高昂的高维路径积分），而是构造一组廉价的**传输投影算子** $\{F_k\}$，把渲染降级为一个学习到的映射：

```math
\hat{\mathbf{F}}=\mathbf{F}(\theta;\xi)=(F_1(\theta;\xi),\dots,F_n(\theta;\xi)),\qquad \xi\sim p(\xi)
```

```math
\Psi^{\star}=\arg\min_{\Psi}\;\mathbb{E}_{\theta\sim p(\theta)}\;\mathbb{E}_{\xi\sim p(\xi)}\Bigl[\ell\bigl(S_{\Psi}(\mathbf{F}(\theta;\xi)),\,R(\theta)\bigr)\Bigr]
```

- **内层期望**把同一场景的所有特征实现 $\mathbf{F}(\theta;\xi)$ 配对到同一目标 $R(\theta)$，**直接奖励 (A2) 的不变性**；
- **外层期望**把充分性 (A1) 限制在训练分布 $p(\theta)$ 内——解码器可以利用"典型云结构"这类先验来消解特征留下的歧义。

### 关键技术

| 技术 | 说明 |
|------|------|
| **$F_\tau$ 归一化光学深度** | $\hat{\tau}(d)=1-\dfrac{1}{1+0.5\,\tau(d)}$，$\tau(d)=\int_0^d\sigma_t(x_t)dt$。**不是**直接用透射率 $T$——归一化可抑制高不透明区域的指数饱和，保留稠密介质中的相对变化，改善重建时的数值条件 |
| **$F_d$ 交互深度** | 首次散射事件的条件期望光学深度 $\tau_c=1-\dfrac{\tau e^{-\tau}}{1-e^{-\tau}}$，再取满足 $\tau(t_1)=\tau_c$ 的**最小距离 $t_1$**。相比"期望自由飞行距离"，$t_1$ **永远落在介质内部**，消除了估计器的噪声与不连续性，且对 $\tau>0$ 恒有定义 |
| **$F_c$ 多尺度交叉层** | 用逐级递减的消光系数（$\times4,\times1,\times0.25,\times0.1$）计算多个交互深度场，取**相邻交叉的间距**而非深度序列——对相机变化更稳定。密度尺度已排序，故只需第二次遍历即可处理全部交叉 |
| **$F_n$ 下一事件透射率** | 在首个交互点 $x_{t_1}$ 处估计朝方向光源的透射率 $T(x_{t_1}\leftrightarrow x_l)$。为了降方差：先在半径 $0.1u$ 的短段做**确定性 ray marching**，之后接**随机 ratio tracking** |
| **$F_e$ 环境光照** | $\int_{\mathcal{S}^2}T(x_{t_1}\leftrightarrow x_i)\,\rho(x_{t_1},\omega,\omega_i)L(x_i,\omega_i)\,d\omega_i$，用**低样本数 MC 估计**（论文取 **8 个样本**为成本/稳定性的折中，环境样本数在 1~16 间随机变化以让模型对噪声水平鲁棒）。方向按 equirect 环境图的**四叉树重要性采样**，采样密度正比于亮度 |
| **$F_m$ 介质属性** | 首个交互点处的 HG 各向异性系数 $g$ 与单散射反照率 $\varphi(x_{t_1})$ |
| **光照线性性分解** | 把远场光照拆为平滑环境贴图 $L_{\mathrm{env}}$（强度 $e$）+ 主方向光 $\omega_l$（强度 $l$）：$I=e(TB+I_e)+lI_l$。$T$、$B$ 已知，只需推理 $I_e$、$I_l$。**把强度从输入中因子化掉**，单次预测即可覆盖任意强度比 |
| **颜色通道独立性** | 无光谱耦合时每个颜色通道是独立的传输问题 → 用**同一个单通道解码器**处理三通道，共享权重。实验中消光系数跨通道共享（只变反照率与光照），因此密度相关特征只需计算一次 |
| **HaloRT 架构** | U-Net 骨干（残差块）+ **Halo 局部窗口自注意力**（借鉴 HaloNet）：中间分辨率 4 个 stage + bottleneck 使用局部注意力；瓶颈处虽降采样 6 次，但每个注意力块感受野仍覆盖全图。**点为 0 长度的曲线，故严格是 3DGS 的超集**类比——虽不适用于本论文，但同为"局部注意力 ≈ CNN 缩放性 + 全局信息交换"的范式 |

### 为什么必须拆分网络

论文明确报告：**联合预测所有分量与通道的单模型无法达到所需的独立性**（"In our experiments, such joint models did not achieve the required independence"），且需要大得多的容量，性能反而显著下降。**拆分的单通道解码器通过构造天然满足这两个性质**。

---

## 实现要点

| 项目 | 实现 |
|------|------|
| **渲染管线** | **Vulkan** 实现；CUDA 导出的设备内存直接供神经网络推理阶段使用，**避免 host 侧同步开销**，实现渲染—推理紧耦合循环 |
| **场景** | 体积缩放到 $[-1,1]^3$ 立方体内 |
| **主光线遍历** | **穷尽 ray marching，步长 $0.001u$**（去掉主光线特征的随机性）；在 majorant 粗网格上做 **DDA 跳过空区域**，只 march 非零体素 |
| **遍历次数** | 第一次遍历算光学深度 $\tau$；第二次从首个非零密度位置起算交叉（尺度 $\times4,\times1,\times0.25,\times0.1$）；全部交叉确定后可**提前终止** |
| **参考渲染** | delta-tracking + 下一事件估计（NEE）；直接光照用环境贴图显式采样，间接贡献用单样本相函数 MC 积分累积高阶散射；仅主光线无交互时累积透射背景 |
| **数据集** | 1000 张 Stable Diffusion 合成的 HDR-like 环境贴图 + Cloudy Project 的 500 个云体；共 **2200 个实例 × 4096 spp** 生成参考图；相机位姿、光照方向、相函数各向异性、散射反照率均随机化 |
| **训练** | AdamW，240K 步内学习率从 $10^{-3}$ 指数衰减到 $10^{-6}$，再保持 120K 步；batch 16，micro-batch 4；**水平翻转增强 + 三通道各自反传共 6 次** |
| **损失函数** | $\mathcal{L}=0.6\|\hat{I}-I\|_1+0.4\|c(\hat{I})-c(I)\|_1$，其中对数压缩 $c(x)=\mathrm{sgn}(x)\log(1+(100-1)|x|)/\log 100$，用于平衡低/高强度区域 |

---

## 实验结论

- **数据集**：200 张留出测试图（512×512），来自 **15 个训练时从未见过的云**；额外扩展环境光照缩放（×0.2）与方向光强度（×3）及 5 种方向光颜色
- **GPU**：NVIDIA GeForce RTX 5090（MRPNN 对比实验因代码不兼容 5090，改用 RTX 3090）
- **基线**：
  - **Denoiser**（Hofmann et al. 2020/2021，CNN 体积去噪器 + 44-spp MC 辐射缓冲）
  - **DenoiserX**（同架构，但把噪声辅助缓冲换成本文的确定性特征，仍保留 44-spp 辐射缓冲）
  - **MRPNN**（NVIDIA，Deep Scattering 的实时化）
  - **OIDN**（Intel Open Image Denoise）
- **结果**：
  - **除 PSNR 外所有指标均超越去噪器**，**感知质量（LPIPS）最优且在所有评测配置下保持一致**；去噪器 PSNR 更高但那是全局强度偏差造成的
  - **稳定性**：实现间标准差 < DenoiserX 的 1/4、< Denoiser 的 1/9；**仅用 8 个环境样本即可让变化不可察觉**，增加样本收益甚微
  - **速度**：比"特征增强版去噪器"（DenoiserX）**快 2 倍以上**；推理 **2048² 分辨率下约 10.5 ms/次**
  - **成本稳定性**：运行时间**不随介质密度和相机距离变化**（去噪器随密度急剧上升），相机推近时帧率近乎恒定
  - **单向光对比**：HaloRT **单次推理**即可得到无噪结果，比 MRPNN 的**单次前向还快**；MRPNN 即使 1024 采样在环境光下仍有噪声
  - **可解释性**：网络**从未被显式告知光源方向**，却能通过方向光透射率与其他特征的关联重建背光区域（利用光源在图上的空间连贯可见性模式）

### 局限性（作者自述）

1. **仅在单一数据集的类云介质上训练与评测**；未处理**烟、火焰、次表面散射**
2. 仅用 **Henyey–Greenstein 相函数**、**非发光介质**
3. **仅单个体积 + 远场光照**（平滑环境贴图 + 一个主方向光）；**不支持介质内/周围的表面、局部光源、发射**
4. **消光系数跨通道共享**；通道相关消光在形式上支持，但需每通道一次体积遍历
5. **训练环境是合成的**（Stable Diffusion HDR），真实采集 HDR 环境能提供更强的泛化测试
6. **误差三来源**：特征仅**近似**充分 (A1)；解码器受模型容量/训练数据限制；可见性特征仍带随机性 (A2)（可用 deep shadow map 等低方差估计器改进）

---

## 与本领域其他工作的关系

| 工作 | 关系 |
|------|------|
| Hofmann et al. 2020/2021 (HMES20/HHCM21) | **直接基线**。本文继承其"为体积设计专用辅助特征"的思想，但**丢掉辐射输入本身** |
| MRPNN (HYL23) | 对比基线。仍需对每个样本做网络查询，环境光下需渐进式方向采样 |
| Liang et al. 2026 (LYG26) | 烘焙低秩散射算子近似，需**每体积一次烘焙**，且绑定特定体积 |
| Relightable Neural Assets (MLSH24) | 编码特定体积的特征网格，**绑定训练体积** |
| Deep Scattering (KMM17) | 学习多次散射的神经替代，需 3D 描述符 |
| Deep Shading (NAM17) | 表面侧的"无辐射输入"先驱，本文把该思想**移植到参与介质** |
| RenderFormer (ZDP25) | Transformer 从三角形 token 推理全局光照，**表面而非体积** |
| 体积路径追踪 | 单帧云/烟渲染需**数秒到数分钟**（高端 GPU），实时不可行 |

---

## 实现建议

### 对流体渲染专家的实操价值

**这个方法对"实时流体渲染"的真正意义在于：它把体积渲染的瓶颈从"需要多少散射样本"转移到"需要多少特征通道"——而后者可以做成 8 通道的图像到图像回归，代价固定。**

1. **对云/雾/烟的实时渲染有直接价值**：现有实时流体渲染管线（游戏/AR）中，体积媒体的 GI 通常靠预烘焙立方体贴图或屏幕空间近似。本方法提供了第三条路——**用一组廉价的传输特征 + 小网络做实时 GI**，且天然支持动态密度场（不需要重烘焙）。
2. **关键可移植设计——特征选取**（可脱离神经网络单独使用）：$F_\tau$（归一化光学深度）、$F_d$（首个交互深度）、$F_c$（多尺度交叉层）本质上是**密度场的粗结构描述**，与照明无关。把这三项喂给任何**去噪器**作为辅助缓冲，就得到论文里的 **DenoiserX**——**这一项不需要训练新网络就能直接提升现有体积去噪器的细节保留**（论文 Fig.1 已验证：比原去噪器保留更多细节）。
3. **归一化光学深度的 trick 值得直接抄** $\hat\tau = 1-\frac{1}{1+0.5\tau}$：比直接用透射率在稠密区域数值条件好得多。同类技巧（对 exp 饱和做有界重参数化）在火焰/烟的高密度区同样适用。
4. **交互深度 $t_1$ vs 期望自由飞行距离**：在有分离结构（如薄烟片、破碎水花）的场景中，前者永远落在介质内，后者会掉进空隙产生跳变。这个替换对**稀疏/断续的流体结构**（飞溅、水花、破碎火焰）尤其重要。
5. **光照线性性分解**可直接用于**火焰渲染**：火焰的辐射来自内部发射（$L_e\ne0$），本文明确不支持——但"把光照拆成可因子化的分量、各自单独解码"的结构仍然可用，例如把"黑体辐射发光"与"环境/平行光照明"分成两路。
6. **局部注意力 (Halo) 替代全注意力**：多次散射会耦合图像中相距很远的区域（薄区透光），纯 CNN 感受野不足；Halo 的做法（中间分辨率 + bottleneck 用局部注意力，瓶颈处感受野覆盖全图）在**成本上接近 CNN**，是显存/算力友好的一种"全局信息交换"折中。
7. **Vulkan + CUDA 导出的设备内存直连推理**：渲染—推理紧耦合、避免 host 同步，是把神经网络塞进实时渲染管线的工程范式，值得作为**管线设计参考**。

### 限制与注意

- **该方法未在烟/火上验证**，论文自己把"扩展到烟、火、SSS"列为未来工作。若要移植到火焰/烟雾需重新训练，且火焰是**发光介质**（$L_e\ne0$），需要额外特征通道。
- **依赖训练分布**：充分性 (A1) 只在 $p(\theta)$ 内成立，解码器靠"典型云结构"消歧。流体模拟的密度分布与云差异很大（火焰锋面、剪切层、破碎波），迁移时**需要对应域的训练数据**。
- **单次前向 10.5 ms（2048²）** 是纯推理开销，加上特征提取与主光线遍历，总帧预算需实测。
- **跨帧时序一致性**：论文未做时序递推，只在补充视频里比了 denoiser 的时序一致性。相机运动下是否需要 temporal recurrence 仍是开放问题（论文明确指出这是未来方向）。

---

## 相关工作

- [[2026-11-09-NanoVDB-Dynamic-GPU-Sparse-Grids]] — GPU 原生动态稀疏网格，支撑更高分辨率的流体密度场
- [[2026-11-09-Kora-Physics-Based-Fire-Pipeline]] — 生产级火焰管线（黑体辐射着色 / hollow flame / 渲染期体积合成）
- [[2026-11-03-Enriched-Surface-Thermodynamics-Sharp-Interface]] — 锐界面热力学
- [[2026-11-02-Unified-Multi-Scale-Two-Phase-Immiscible-Flows]] — 两相流模拟
- [[2026-10-29-Appearance-Compensation-in-Volume-Rendering]] — 体积渲染中的外观补偿
- [[2026-10-12-Daily-Research-Summary]] — 每日检索
- 概念：[[Ray Marching]] · [[Volume Rendering]] · [[Multiple Scattering]] · [[Neural Radiance Field]] · [[Henyey-Greenstein Phase Function]] · [[Delta Tracking]] · [[Ratio Tracking]] · [[Local Attention]]

---

## 参考文献

- [arXiv:2611.12103](https://arxiv.org/abs/2611.12103) · [HTML 全文](https://arxiv.org/html/2611.12103v1)
- Hofmann et al., *Kernel Radiance Denoising* (2020) / *NeurIPS 2021* — 本文基线 Denoiser
- Hyldgaard et al., *Deep Scattering* (2022) / *MRPNN* (SIGGRAPH 2023)
- Nimier-David et al., *Deep Shading* (2017) — 无辐射输入的表面先驱
- Zhang et al., *HaloNet* (SIGGRAPH 2021)
- NVIDIA Cloudy Project 数据集 (LTW25)
