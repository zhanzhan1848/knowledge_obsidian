---
tags: [几何, 点泼溅, 毫米波雷达, 微多普勒, 可微渲染, 合成数据, sim2real, 点云, point-splatting, differentiable-rendering, inverse-rendering]
date: 2026-11-07
source: arXiv
arxiv_id: 2611.08342
venue: Under Review (cs.CV/cs.GR/cs.LG/eess.SP)
status: processed
agent_id: wawaicai
authors: Adnan Armouti, Guanyue Qian, Rajalakshmi Nandakumar
url: https://arxiv.org/abs/2611.08342
pdf: https://arxiv.org/pdf/2611.08342
---

# 4DPS: 4D Point Splatting for mmWave Radar Micro-Doppler Differentiable Rendering

> 把**显式运动场景**拟合到**真实毫米波雷达采集**上：输出雷达**原始复数回波**，因此可以经同一套 DSP 处理转成任意下游表示用于训练。首次实现**数据集规模的毫米波逆向渲染**。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | 4D Point Splatting for mmWave Radar Micro-Doppler Differentiable Rendering |
| **作者** | Adnan Armouti, Guanyue Qian, Rajalakshmi Nandakumar |
| **发表** | arXiv cs.CV/cs.GR/cs.LG/eess.SP, 2026-11-05（Under Review） |
| **链接** | [原文](https://arxiv.org/abs/2611.08342) |

---

## 核心贡献

> 毫米波雷达数据集比视觉/语言**落后几个数量级**，暴力采集补不上差距；而现有合成方法（仅前向模拟器、学习式生成器、静态场景逆向渲染器）**无法拟合一次真实运动身体的采集**。本文把「显式运动场景」拟合到真实雷达采集上。

1. **物理可微的 4D 雷达渲染器** —— 场景表示为**带朝向的点**，携带材质、法向、速度；泼溅进 **range 和 Doppler** 二值 bin，输出真实雷达记录的**原始复数回波**
2. **静态点只沿 range 泼溅，移动点沿 range+Doppler 双轴泼溅** —— 因为**慢时间 DFT 对路径的慢时间采样是线性的**（如同距离 FFT 对快时间采样线性），因此**无需形成慢时间立方体**
3. **闭式 Doppler 泼溅** —— 双基地路径长度变化率 $\dot R_{tr,i} = \mathbf{v}_i \cdot (\mathbf{u}_{t,i} + \mathbf{u}_{r,i})$ 直接给出小数 Doppler bin
4. **输出原始复数回波** —— 对渲染数据施加**与真实数据完全相同的信号处理**，即可得到任何表示，用来训练任何 SOTA 下游模型
5. **首次实现数据集规模逆向渲染** —— HuPR 235 序列 + RT-Pose 100 序列，单 H100 上 5.7 / 12.9 分钟/序列

---

## 技术方案

### 核心思想

**微多普勒（micro-Doppler）** 基础：毫米波雷达能分辨运动身体的**微米级位移**，因此可用于步态、手势、活动、姿态与生命体征感知。但每项任务都依赖真实数据训练的下游模型，而雷达数据集严重匮乏。

**关键认识**：没有公开模拟器能以真实采集为输入。所以本文做的是**逆向渲染** —— 把显式场景拟合到真实回波上。

### 关键技术

| 技术 | 说明 |
|------|------|
| **初始化** | 两个相机初始化的点集：**静态场景** + **运动人体**（RT-Pose 的场景另用其 LiDAR）。每个场景点携带自己的 **ITU-R P.2040 材质**与法向；每个人体点携带法向，**全身共享一种材质**，其点由 **14 个关节速度**蒙皮驱动 |
| **雷达前向模型** | TDM MIMO FMCW 雷达，$N_{\text{TX}}$ 发射、$N_{\text{RX}}$ 接收、载波波长 $\lambda$、距离 bin 宽 $\Delta R$、$K=256$ 距离 bin、$N_l=64$ 每帧 loop。每 loop 每发射器在自己的时隙打一个 chirp，loop 周期 $N_{\text{slots}}T_c$（HuPR 216 μs，cascade 780 μs） |
| **渲染方程** | 由**双基地雷达方程**（Skolnik 1980）出发，把截面替换为空间变化 BSDF $f$，在接收端半球 $\Omega_{rx}$ 上积分 |
| **静态点：range 泼溅** | 单 chirp 渲染器可把 **range FFT 推进点求和内部** —— 每个点成为 Hann 窗在分数距离 bin 处的**已知响应**，即**泼溅距离剖面**而非模拟距离剖面。静态点在每个 chirp 返回相同样本；真实前端在 Doppler 变换前**去除慢时间均值**，故静态回波**不落在任何 Doppler 平面**内，由每帧的**首个 chirp** 监督 |
| **运动点：range–Doppler 泼溅** | 每路径的慢时间采样是**单音**。路径长度变化率 $\dot R_{tr,i}=\mathbf{v}_i\cdot(\mathbf{u}_{t,i}+\mathbf{u}_{r,i})$ → 小数 Doppler bin $\nu_{tr,i} = N_l N_{\text{slots}} T_c \dot R_{tr,i}/\lambda$ |
| **截断** | $\Phi_K$ 截断到 $L=15$ 个 range tap，$\Phi_{N_l}$ 截断到 7 个 Doppler tap |
| **目标函数** | $\mathcal{L} = \underbrace{\mathcal{L}_{\mathrm{RAE},0}+\mathcal{L}_{\mathrm{RAE,pl}}}_{\text{global}} + \underbrace{\mathcal{L}^{\mathrm{win}}_{\mathrm{RAE},0}+\mathcal{L}^{\mathrm{win}}_{\mathrm{RAE,pl}}}_{\text{windowed on person}}$。$|\mathrm{RAE}|$ 上的归一化 $L_2$，取两个慢时间视角与两个作用域。**首个 chirp 项** $\mathcal{L}_{\mathrm{RAE},0}$ 保留静态杂波回波，是唯一触及整个静态场景的项；**平面项**监督 63 个非 DC Doppler 平面（只有运动人体到达），因此**即使距离剖面完整，速度误差仍会在平面间移动能量**；**窗口对**把两者限制在人体的空间窗口并在其上归一化（帧级除数会让人的大相对误差藏在场景能量背后） |
| **优化对象** | 静态场景：逐点材质与法向。人体：逐点法向、**一个 6 维材质向量**、**14 个关节速度**（= 视频运动学速度 × 学习的逐关节缩放 + **有界带限残差**），蒙皮到点上，因此视频判定为静止的关节保持静止。雷达：增益与噪声底 |
| **自定义 CUDA kernel** | 每个物理收发对渲染一个 chirp |

### 关键公式

**双基地路径长度变化率与 Doppler bin**

$$
\dot{R}_{tr,i} = \mathbf{v}_i \cdot (\mathbf{u}_{t,i} + \mathbf{u}_{r,i}), \qquad
\nu_{tr,i} = N_l\,N_{\text{slots}}\,T_c\,\dot{R}_{tr,i}/\lambda
$$

**双轴泼溅（式 3）**

$$
\mathrm{RD}_{tr}[d,k] = g \sum_{i=1}^{N} b_i\, V_i\, S_{tr}(\mathbf{x}_i)\, e^{j\phi_{t,i}}\,
\Phi_K(k - k_{tr,i})\,\Phi_{N_l}(d - \nu_{tr,i})
$$

- $g$ = 每雷达学习的接收增益；$b_i$ = 人体**逐关节学习散射增益**（蒙皮到点 $i$；场景点为 1）；$V_i$ = 点在该帧的可见性
- $k_{tr,i} = (R_{t,i}+R_{r,i})/(2\Delta R)$ 分数距离 bin；$\phi_{t,i}$ = 发射器自身时隙贡献的相位
- $\Phi_K,\Phi_{N_l}$ = Hann 窗在两轴上的**精确响应**；$\Phi_{N_l}$ **包含慢时间均值去除**，故静态点在此处不沉积任何能量

**目标函数（式 4）**

$$
\mathcal{L} = \underbrace{\mathcal{L}_{\mathrm{RAE},0}+\mathcal{L}_{\mathrm{RAE,pl}}}_{\text{global}} + \underbrace{\mathcal{L}^{\mathrm{win}}_{\mathrm{RAE},0}+\mathcal{L}^{\mathrm{win}}_{\mathrm{RAE,pl}}}_{\text{windowed on the person}}
$$

---

## 实验结论

### 数据集

- **HuPR**（Lee et al. 2023）：两个正交单芯片雷达的**原始 ADC**，235 序列
- **RT-Pose**（Ho et al. 2025）：一个 cascade 雷达，100 序列
- 两个数据集**雷达不同**（8 个方位单元、约 14.3° 方位分辨率 vs 86 槽、约 1.3°）

### 渲染保真度（与真实记录的中位数 Pearson 相关，↑）

| 数据集 | 方法 | ρ(range–angle) | ρ_c(杂波消除) | ρ_M(range–Doppler) | L_U→1 | ρ_μ(质心) | ρ_σ(展宽) | ρ_S(频谱) |
|--------|------|------|------|------|------|------|------|------|
| HuPR | RF-Genesis | 0.134 | 0.339 | 0.518 | 0.05 | 0.820 | 0.063 | 0.671 |
| HuPR | 4DPS (unfit) | 0.878 | 0.270 | 0.537 | 0.57 | 0.930 | 0.283 | 0.754 |
| HuPR | **4DPS (Ours)** | **0.940** | **0.666** | **0.829** | 0.92 | **0.993** | **0.966** | **0.988** |
| RT-Pose | RF-Genesis | 0.119 | 0.221 | 0.324 | 0.09 | 0.750 | 0.042 | 0.394 |
| RT-Pose | 4DPS (unfit) | 0.648 | 0.181 | 0.291 | 0.58 | 0.803 | 0.185 | 0.515 |
| RT-Pose | **4DPS (Ours)** | **0.830** | **0.470** | **0.695** | 0.96 | **0.973** | 0.704 | **0.966** |

> **全部指标 SOTA**。摘要给出：range-azimuth 中位相关 0.940 / 0.830，range-Doppler 0.829 / 0.695，micro-Doppler 0.988 / 0.966。

### Sim2Real（下游姿态模型）

| 训练数据 | HuPR (AP) | RT-Pose (MPJPE cm) |
|----------|-----------|---------------------|
| 真实数据 | 65.6 (1.7) | 16.67 (0.42) |
| **4DPS 渲染** | 38.4 (2.9) | **21.86 (1.33)** |
| RF-Genesis 渲染 | 1.8 (3.5) | 127.59 (48.32) |
| RF-Genesis (unfit render) | — | 127.6（基线 floor） |

- 4DPS 渲染训练保留真实训练精度的 **0.59 (HuPR)** / **0.76 (RT-Pose)**
- **渲染训练与真实训练的模型学到几乎相同的特征** → 剩余差距来自**渲染–真实差异**，而非表示缺失
- 逐关键点下降集中在**手臂**：HuPR 腕部从 22.2 / 25.1 AP 掉到 **8.0 / 4.7**，而髋/膝/头保持真实训练的 0.73~0.80

### 计算规模（工程量级参考）

| 项 | 数值 |
|----|------|
| 拟合 chirp 总数 | HuPR 235×600×64×24 + RT-Pose 100×299×64×192 = **5.84 亿 chirp** |
| 每 chirp 优化轮数 | **400 epochs** |
| 实际渲染量 | 前向 **2340 亿** chirp + 同量反向，**且从不形成慢时间立方体** |
| 相对 3DPS | **63,000 倍**的数据 |
| GPU 时间 | **43.9 GPU-hours (H100)** |
| 单序列拟合 | HuPR **5.7 分钟**，RT-Pose **12.9 分钟**（单 H100） |

---

## 复杂度分析

- **每次 chirp 渲染**：O(#points) —— 静态点沿 range 单轴，移动点沿 range+Doppler 双轴
- **双轴截断**：15 range taps × 7 Doppler taps = **105 累加**，每点每 chirp
- **总代价**：$O(N_{\text{chirp}} \times N_{\text{epochs}} \times N_{\text{points}} \times 105)$
- **显存**：**不需要慢时间立方体**（RAED 张量按需生成）—— 这是能跑到数据集规模的关键
- 空间复杂度：O(N_{\text{points}}) + 小量 FFT 工作缓冲

---

## 数值稳定性

- **慢时间均值去除内置进 $\Phi_{N_l}$**：静态点因此在 Doppler 维**精确地不沉积能量** —— 这避免了「静态杂波污染 Doppler 平面」的经典数值问题
- **窗口归一化**：帧级除数会让人的大相对误差藏在场景能量后面，窗口归一化**防止这种掩盖**
- **首 chirp 项用幅值而非绝对相位**：监督 ADC 幅度与单元间相位，但**不拟合绝对相位噪声** —— 这是刻意的鲁棒性设计
- **速度残差有界带限**：14 个关节速度 = 运动学速度 × 学习缩放 + 有界残差 → 防止逆渲染把速度推到物理不可能的范围
- **雷达增益与噪声底作为可优化量**：把设备校准误差吸收进模型，避免污染几何参数

---

## 局限性

1. **速度被限制在视频运动学的有界残差内** —— 不是自由运动
2. **背景是静态的**，且只建模**单次散射**路径
3. **每序列一个人**
4. **RT-Pose 的标签来自驱动渲染的身体网格** —— 存在一定的循环性
5. **没有公开模拟器能以采集为输入** → 基线只能前向运行（RF-Genesis 从同一注册运动前向驱动），**对比不完全公平**
6. 下一步是**用编辑后的场景对抗真实记录评分**（附录 G）

---

## 相关工作

- [[3DPS]] — 3D Point Splatting（静态雷达，本文作者 Armouti et al. 2026a）
- [[RF-Genesis]] — 雷达数据生成的 SOTA 基线（Chen & Zhang 2024）
- [[HybridSim]] — 端到端训练渲染器 + 下游 beamformer（Xiong et al. 2026）
- [[ITU-R-P2040]] — 雷达散射材质模型
- [[MicroDoppler]] / [[FMCW-Radar]] / [[TDM-MIMO]]
- [[PointSplatting]] · [[DifferentiableRendering]] · [[InverseRendering]]

---

## 实现建议

- **实现难度**: **高**（自定义 CUDA kernel、双轴闭式泼溅、可微雷达前向模型）
- **适用场景**:
  - **合成数据生成** —— 为任何以人体为中心的雷达下游任务造数据（步态/手势/活动/姿态/生命体征）
  - **场景编辑用于数据增强**
  - **跨模态合成数据**：输出原始复数回波 → 同一 DSP → 任意表示
- **最值得复用的技术点**:
  1. **「输出原始信号、而非下游表示」** —— 这是让合成数据**通用**的关键设计决策。若直接输出下游特征（如波束图），就无法适配不同下游模型
  2. **双轴泼溅的线性性论证** —— range FFT 对快时间线性 ⇒ 可把 FFT 推进点求和内部；Doppler DFT 对慢时间线性 ⇒ 同理。**这两条论证让「不形成立方体」成为可能**，是整个方法可行性的基石
  3. **幅值而非相位监督** —— 不拟合绝对相位噪声，鲁棒性显著提升
  4. **窗口归一化防掩盖** —— 「人的误差藏在场景能量后面」是所有「小目标 + 大背景」重建问题的通用陷阱
- **依赖项**: 自实现 CUDA + PyTorch；无现成库

---

## 🔗 相关笔记

- [[2026-11-07-HIBS-Hierarchical-Incremental-Beta-Splatting]] — 同日论文（点泼溅在可见光域的对应物）
- [[2026-11-07-SfC-Structure-from-Collision-Hypothesis-Space]] — 同日论文
- [[2026-11-07-REACT-Skeletal-Motion-Signal-Completion]] — 同日论文
- [[PointCloudProcessing]] · [[DifferentiableRendering]] · [[InverseRendering]]

---

*Generated by 黄喉 (wawaicai) at 2026-11-07*
