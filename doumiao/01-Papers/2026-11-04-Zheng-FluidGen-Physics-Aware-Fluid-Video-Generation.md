---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, fluid-rendering, fluid-video-generation, smoke, fire, velocity-field, diffusion, houdini, dpo]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.25660
---

# FluidGen: Physics-Aware Fluid Video Generation (Injecting a Data-Driven Fluid Prior into Pre-Trained Video Models)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FluidGen: Physics-Aware Fluid Video Generation *(in-the-wild fluid video generation with a data-driven fluid prior; dual-stream velocity + RGB diffusion)* |
| **作者** | Yang Zheng, Zizhang Li, Boyang Deng, Jan Ackermann, Lei Shu, Yinghao Xu, Jiajun Wu, Gordon Wetzstein, Leonidas Guibas |
| **发表** | arXiv preprint (cs.GR) 2026-10-19 |
| **链接** | [原文](https://arxiv.org/abs/2610.25660) · [项目页](https://y-zheng18.github.io/FluidGen/) |
| **DOI** | — |
| **代码** | 项目页：https://y-zheng18.github.io/FluidGen/（代码/权重以官方发布为准） |

---

## 核心贡献

> **把"数据驱动的流体先验"注入预训练视频扩散模型** —— 用 Houdini 高保真仿真提供的**配对速度场作为辅助监督信号**，让生成的烟雾/火焰/爆炸碎屑具备**真实涡旋结构**，并让生成的**速度场可直接反哺 Houdini 求解器**驱动真实流体模拟。这是当前"扩散模型 + 物理先验"做流体渲染的 SOTA 范式。

1. **问题诊断：视频生成模型在流体上系统性失败**。当前视频生成模型能产出**视觉上吸引人的运动**，但在流体现象（**烟雾、火焰、爆炸碎屑**）上**系统性失败**：输出**缺乏连贯的涡旋结构 (coherent vortical structure)**，并**塌缩为平淡的动态 (collapse to bland dynamics)**，违反真实流体的物理。
2. **经典求解器的两难**：物理求解器（如 Houdini）保真度高，但需要**精细的 3D 场景**与**精心调校的参数**，对**野外实拍图像与视频生成**不实用。
3. **核心方案：注入数据驱动的流体先验**。在**预训练视频模型**中额外开一路**速度场预测流**，并用**高保真 Houdini 仿真数据（含配对速度场真值）** 与**精选的野外流体视频数据（用于外观多样性）** 的混合语料训练。
4. **Dual-stream 架构**：一个**共享的 Wan2.1 denoiser** 同时预测 **RGB** 与**速度场**，速度通道**零初始化**。
5. **"速度即视频"的编码技巧**：把逐像素的 3D 速度用**球坐标编码为颜色**，从而**复用预训练 VAE**，无需新架构。
6. **速度场作为可解释的物理量 → 转化为奖励**：这个辅助信号不仅是正则化项，更是**可解释的物理量**，被进一步用作 **velocity-aware 直接偏好优化 (DPO)** 的**奖励 (reward)**。
7. **两阶段后训练 (Two-stage post-training)**：(1) 在仿真 + 实拍流体视频上**联合监督微调**；(2) 用**物理奖励**做 **velocity-aware DPO**。
8. **三大应用与范式突破**：
   - **(a) Shape Transitions**：在**关键帧引导**下把烟塑造成**动物/飞龙等形状**，且运动保持物理合理；
   - **(b) Velocity estimation from real videos**：给真实视频作 **RGB 流**，用 **RePaint 风格的条件采样**推断匹配的 **3D 速度场**，恢复出与烟一致的**连贯平流 (coherent advection)**；
   - **(c) Driving fluid simulation**：生成的 velocity field **物理意义足够**，可直接**导入 Houdini** 模拟新的流体源 —— 形成 **AI → 物理求解 → 高质量渲染** 的混合管线。
9. **效果**：相比强视频基线与基于优化的方法，生成出**显著更真实的流体动力学序列**。

---

## 技术方案

### 核心思想

**问题的本质**：视频扩散模型（Video Diffusion Model）学的是**自然图像/视频的统计分布**，而流体运动的统计结构（涡旋、剪切层、上升羽流、湍流级联）与自然视频的统计结构**不同**。因此模型在流体上会"生成看起来像烟的东西"，但其运动是**无结构的漂移**——这正是摘要所说的 "collapse to bland dynamics"。

**本文的解法不是"更用力地拟合流体视频"，而是"把物理监督显式注入"**。核心洞察是：**速度场是流体的"第一性变量"**——只要知道速度场，整个运动就被确定了；反之，只看 RGB 生成的模型无从判断涡旋是否存在。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Dual-head joint diffusion** | 一个**共享的 Wan2.1 denoiser** 同时预测 **RGB** 与**速度场**；速度通道**零初始化**（不破坏预训练 RGB 权重） |
| **Velocity as a video（速度场颜色编码）** | 把逐像素 3D 速度用**球坐标 (spherical coordinates)** 编码为 **RGB 颜色**，使速度场变成一段"伪视频"，从而**直接复用预训练视频 VAE 的 latent space**，无需新架构、新 VAE |
| **混合训练语料** | **高保真 Houdini 仿真数据（配对 RGB + 速度场真值）** + **精选的野外流体视频（提供外观多样性）**；前者提供物理监督，后者提供真实外观分布 |
| **辅助速度监督 (auxiliary velocity supervision)** | 速度场损失作为**正则化项**，把生成推向**物理一致的运动**（尤其强化涡旋结构） |
| **速度场作为奖励** | 速度场是**可解释物理量**，可直接构成 **velocity-aware DPO** 的奖励信号 |
| **Two-stage post-training** | 阶段 1：**联合监督微调**（仿真 + 实拍）；阶段 2：**物理奖励驱动的 velocity-aware DPO** |
| **关键帧引导的形状变形** | 用关键帧条件把流体塑造成目标形状，同时保持物理合理的运动 |
| **RePaint 风格条件采样** | 给定真实视频的 RGB 流作为条件，采样出匹配的 3D 速度场（用于从实拍视频反推速度） |
| **速度场回灌 Houdini** | 生成的 3D 速度场导入 Houdini，驱动真实的流体模拟（AI 生成 → 物理求解） |

### 方法流程（两阶段）

**阶段 1：联合监督微调 (Joint supervised fine-tuning)**
- 基座：**预训练视频扩散模型**（Wan2.1 denoiser）
- 改造：共享 denoiser 增加一路**速度场预测头**（零初始化 → 初始时不影响 RGB 生成）
- 数据：**Houdini 仿真（RGB, velocity）配对** + **野外流体视频（仅 RGB）**
- 损失：RGB 扩散损失 + 速度场扩散损失（辅助项）
- 目标：让模型既要生成真实外观，又能生成物理一致的速度场

**阶段 2：Velocity-aware DPO**
- 动机：阶段 1 的监督只能"模仿"，不能"偏好物理更优的样本"。
- 做法：把**预测的速度场**当作奖励来源（速度场的物理合理性指标，如涡旋强度、平流一致性、无源性/无穿透性等），构造偏好对，对模型做 **DPO**。
- 收益：进一步拉大"物理合理"与"平淡漂移"之间的差距

### 三大应用

**(a) Shape Transitions（形状过渡）**
在**关键帧引导**下，把烟的形状从一种形态过渡到另一种（例如变成动物、飞龙的轮廓），且**运动保持物理合理**。这意味着"造型"与"物理"解耦——可以自由指定目标形状，模型负责让烟以可信的方式"长成"那个样子。
*渲染价值*：这是**可控资产生成**的强力形态，广告/影视特效中"烟变成龙"这类镜头不需要手工流体模拟。

**(b) Velocity estimation from real videos（从真实视频估计速度场）**
给一张**真实流体视频**，用其 **RGB 流 (optical flow)** 作为条件，通过 **RePaint 风格的条件采样** 推断出与之匹配的 **3D 速度场**。结果是**与真实烟雾一致的连贯平流 (coherent advection)**。
*渲染价值*：这是"**实拍 → 物理量**"的桥梁——把一段 2D 实拍烟的镜头，变成可以真正驱动 3D 流体模拟的 3D 速度场。

**(c) Driving fluid simulation（驱动流体模拟）**
生成的 velocity field **物理意义足够**，可以**直接导入 Houdini**，作为新流体源的驱动条件，模拟出新的流体。
*渲染价值*：这是全论文**最关键的闭环**——它打通了 **"生成模型 → 物理求解器"** 的通路，使得"AI 生成"与"物理求解"不再是二选一，而是可以串联成混合管线。

### 关键技术表（补充：物理先验的注入层次）

| 层次 | 做法 | 效果 |
|------|------|------|
| **表征层** | 速度用球坐标编码为颜色 → 复用视频 VAE | 零架构改动、零初始化新通道 |
| **监督层** | 速度场辅助损失 + 混合仿真/实拍语料 | 生成从"平淡漂移"转向"有涡旋结构" |
| **偏好层** | 速度场 → 物理奖励 → velocity-aware DPO | 进一步偏向物理合理样本 |
| **推理层** | 关键帧引导 / RePaint 条件采样 | 可控形状与实拍速度反演 |
| **管线层** | 生成速度 → Houdini → 高保真渲染 | AI 与物理求解器混合管线 |

---

## 公式

```math
% —— 速度场的球坐标颜色编码 ("Velocity as a video") ——
\mathbf{u}(x) \in \mathbb{R}^3,\quad
\|\mathbf{u}\| = \sqrt{u_x^2+u_y^2+u_z^2},
\qquad
\theta = \arccos\!\left(\frac{u_z}{\|\mathbf{u}\|}\right),\quad
\phi = \operatorname{atan2}(u_y, u_x)
%  编码: 亮度 \propto \|\mathbf{u}\|, 色相 \propto \phi, 通道混合 \propto \theta
\mathbf{c}_{\text{enc}}(x) = \mathrm{Encode}_{\text{sph}}\!\big(\mathbf{u}(x)\big) \in [0,1]^3

% —— Dual-head 联合扩散 (共享 denoiser, 速度头零初始化) ——
\epsilon_{\text{RGB}}, \epsilon_{\text{vel}}
= \epsilon_{\theta}\!\left(\mathbf{z}^{\text{RGB}}_t,\; \mathbf{z}^{\text{vel}}_t,\; t,\; c \right),
\qquad
\theta_{\text{vel}}^{(0)} \equiv 0 \;\; (\text{零初始化})

% —— 阶段 1: 联合监督损失 (仿真配对 + 实拍仅 RGB) ——
\mathcal{L}_{\text{joint}}
= \underbrace{\mathcal{L}_{\text{diff}}^{\text{RGB}}\!\left(\mathcal{D}_{\text{Houdini}}\cup\mathcal{D}_{\text{real}}^{\text{RGB}}\right)}_{\text{外观}}
+ \lambda_{\text{vel}}\,
  \underbrace{\mathcal{L}_{\text{diff}}^{\text{vel}}\!\left(\mathcal{D}_{\text{Houdini}}\right)}_{\text{速度辅助监督}}
%  其中 Houdini 数据提供 (RGB, velocity) 配对真值

% —— 阶段 2: velocity-aware DPO (速度场作为奖励) ——
\mathcal{L}_{\text{DPO}}
= -\,\mathbb{E}\!\left[
\log\sigma\!\left(
\beta\left[
\log\frac{\pi_\theta(y_w|x)}{\pi_{\text{ref}}(y_w|x)}
-\log\frac{\pi_\theta(y_l|x)}{\pi_{\text{ref}}(y_l|x)}
\right]\right)\right],
\qquad
y_w: \text{物理奖励高}, \;\; y_l: \text{物理奖励低}

% —— 物理奖励: 由预测速度场计算 ——
R_{\text{phys}}(\mathbf{u}) =
\underbrace{w_1\,\Omega(\mathbf{u})}_{\text{涡旋强度}}
+ \underbrace{w_2\,\mathcal{A}(\mathbf{u})}_{\text{平流一致性}}
+ \underbrace{w_3\,\mathcal{C}(\mathbf{u})}_{\text{可压缩性/无源性}}
+ \underbrace{w_4\,\mathcal{N}(\mathbf{u})}_{\text{时序平滑}}

% —— 涡旋强度 (如涡量加权) ——
\boldsymbol{\omega} = \nabla\times\mathbf{u},
\qquad
\Omega(\mathbf{u}) = \big\|\boldsymbol{\omega}\big\|_{L^2}

% —— 回灌 Houdini: 生成速度场作为求解器驱动源 ——
\underbrace{\mathbf{u}_{\text{gen}}(x,t)}_{\text{FluidGen 输出}}
\;\longrightarrow\;
\underbrace{\text{Houdini fluid solve}}_{\text{真实物理}}
\;\longrightarrow\;
\underbrace{I_{\text{hi-fidelity}}}_{\text{高保真渲染}}
\end{math}
```

---

## 实验结论

- **训练数据**:
  - **高保真 Houdini 仿真数据**，含**配对的 RGB 与速度场真值 (velocity-field ground truth)**
  - **精选的野外流体视频 (curated in-the-wild fluid video data)**，提供**外观多样性**
- **基线**: 强视频生成基线（预训练视频扩散模型）；**基于优化的方法 (optimization-based methods)**
- **结果**:
  - 相比强视频基线与优化方法，产生**显著更真实的流体动力学序列**
  - 生成的运动具备**连贯的涡旋结构**，不再塌缩为平淡动态
  - **Shape Transitions**：关键帧引导下可把烟塑造成动物/飞龙等形状，运动保持物理合理
  - **Velocity estimation from real videos**：从真实视频 RGB 流经 RePaint 风格条件采样，得到与烟一致的**连贯平流**的 3D 速度场
  - **Driving fluid simulation**：生成的 velocity field 物理意义足够，**可直接导入 Houdini** 驱动新的流体模拟
  - 速度场作为奖励的 **velocity-aware DPO** 进一步提升了物理一致性

---

## 局限性

- **速度场的维度与获取**：3D 速度场需要 **Houdini 仿真**生成，配对数据成本高（每个场景都要烘焙）；数据规模与场景多样性受限。
- **VAE 的表达瓶颈**：速度场被编码成颜色后**必须落在预训练 RGB VAE 的 latent 空间内**；极端速度值或与自然图像统计差异大的编码可能被 VAE 压缩失真。
- **"物理合理"的度量依赖奖励设计**：velocity-aware DPO 的质量上限由**奖励函数**决定；奖励若设计不当会被 reward hacking（例如模型学会生成"看起来有涡旋但无真实动量守恒"的速度场）。
- **生成速度场的物理精度未量化**：摘要强调"物理意义足够"，但**缺乏对生成速度场的定量保真度评估**（如与真实 Houdini 速度场的 RMSE、谱能量通量对比）——这是最需要补的评测。
- **2D/3D 与相机一致性**：视频模型本质是 2D 视图生成，**多视角一致性**与"速度场是真正的 3D 量"之间存在概念张力（RePaint 风格推断出的 3D 速度场本质是基于单目 RGB 流的推断，天然多义）。
- **与真实求解器的差距**：生成速度场**不能替代** Houdini 求解，只能作为**驱动源/初值/边界条件**；真正的物理保真度仍由求解器保证（这既是优点也是局限）。
- **数据集许可与许可限制**：Houdini 商业许可与仿真数据分发是实际落地障碍。
- **长时程一致性**：视频扩散模型的时长限制（通常秒级）依然存在，长时间流体演化的漂移问题未解决。
- **论文的验证范围**：摘要层面信息丰富，但**具体的定量指标、对比表、消融实验细节需查阅全文**。

---

## 相关工作

- [[paper-2026-10-07-fluid-gen-zero]]
- [[2026-10-09-Fluid-Gen-Zero-Physics-Aware-Video-Generation]]
- [[2026-03-19-physics-informed-video-diffusion-swe]]
- [[2026-03-20-Physics-Informed-Video-Diffusion-SWE]]
- [[2026-11-01-NEOPIC-Neural-Operator-Particle-Kinetic-Plasma]]
- [[2026-08-13-WildFireGS-Wildfire-Simulation-Gaussian-Splatting]]

---

## 实现建议

- **实现难度**: 🔴 高（需要 Houdini 批量仿真数据管线 + 双头扩散微调 + 自定义 DPO 奖励 + RePaint 条件采样）
- **预期性能**: 视频扩散推理成本与基座模型同量级（Wan2.1 级别，通常需多卡）；**速度场输出不增加架构成本**（共享 denoiser + 零初始化头）；离线渲染质量最高
- **适用场景**: 影视/广告级烟雾、火焰、爆炸碎屑生成；可控形状的特效资产；从实拍视频提取 3D 速度场驱动真实模拟

---

## 渲染价值评估

**⭐⭐⭐⭐⭐（5/5）—— 本期最重要：当前"扩散模型 + 物理先验"做烟雾/火焰渲染的 SOTA 范式**

1. **核心思想落地：速度场作为辅助监督信号** ⭐⭐⭐⭐⭐
   **这是全文最可迁移、也最重要的一条。** 问题在于：只用 RGB 监督训练的视频模型，产生的是"**看起来像烟的运动**"，其涡旋结构是虚的；加入**配对速度场监督**后，模型被"正则化"向物理一致的运动，**烟才真正有涡旋结构而不是平淡漂移**。
   *落地路径*：**用 Houdini（或任何求解器）批量生成配对 (RGB, velocity) 数据 → 微调视频扩散模型的双头版本**。这是当前**性价比最高的烟雾/火焰生成路线**：相比"直接调求解器参数"更省人力，相比"纯视频生成"物理可信度高得多。
   *关键工程点*：**速度头零初始化**，保证微调起点不破坏预训练的 RGB 生成能力——这是能否顺利微调成功的关键技巧。

2. **核心技巧落地：速度编码为颜色（球坐标）** ⭐⭐⭐⭐⭐
   把逐像素 3D 速度用**球坐标编码成 RGB 颜色**，使其变成一段"伪视频"，从而**复用预训练视频 VAE 的 latent**。
   *价值*：这是整个方案能够落地的原因——**零新架构、零新 VAE、零额外参数量级**。任何做"多模态/多通道扩散"的工作都应先问"能不能把新通道塞进已有 VAE 的空间"。
   *可迁移*：同一思路适用于任何需要在视频扩散模型中引入**标量场**（温度、密度、压力、湿度、燃料浓度）的场景——用不同的球坐标/极坐标编码塞进 RGB 三通道。
   *注意*：编码是**有损的**，且受 VAE latent 分布约束；设计编码时尽量让数值分布落在自然图像统计内（例如对速度做合适的归一化与 gamma 编码）。

3. **核心闭环落地：生成速度可反哺传统求解器** ⭐⭐⭐⭐⭐
   这是全论文**最有工程价值**的一条，也是最容易被忽略的一条。
   *管线*：**AI 生成速度场 → 导入 Houdini → 真实物理求解 → 高保真渲染**。
   *意义*：把"AI 生成"与"物理求解"从**二选一**变成**可串联**。AI 负责提供"**有创意、有结构的初始条件与驱动**"（比如"烟从龙形雕塑中涌出"这种难以手工设定的初值），求解器负责保证"**物理正确的后续演化**"。
   *给算法 agent 的具体建议*：**把这条闭环作为目标架构**——不要试图让生成模型端到端产出最终像素，而是让它产出**求解器的输入**。这样既拿到了生成模型的创意与多样性，又拿到了物理求解器的正确性。这是目前"AI for Fluid Rendering"最务实的技术路线。

4. **DPO 阶段的价值与风险** ⭐⭐⭐⭐
   **velocity-aware DPO** 让"物理"从**模仿目标**升级为**偏好目标**——这是从"有监督"到"有偏好"的升级，能进一步拉开"有涡旋"与"平淡"之间的差距。
   *落地建议*：先做阶段 1（联合监督微调），**确认速度场质量后**再上阶段 2。DPO 需要构造偏好对，是额外的工程量与调参量。
   *风险*：**reward hacking**——奖励函数若只看涡旋强度，模型可能生成"涡旋很大但动量不守恒"的速度场。因此奖励函数必须包含**多个物理维度**（涡旋、平流一致性、无源性/不可压缩性、时序平滑），并**人工抽查生成速度场的物理合理性**（例如直接导入 Houdini 看是否稳定）。

5. **应用 (b) 的渲染价值：从实拍视频反推 3D 速度场** ⭐⭐⭐⭐
   **RePaint 风格条件采样**从真实视频的 RGB 流推断匹配的 3D 速度场，恢复出与烟一致的连贯平流。
   *渲染价值*：这解决了"**我只有一段实拍烟，怎么让它在 3D 里继续动**"的实际问题——实拍素材的 2D 运动可以升维成 3D 速度场，进而驱动 3D 粒子/体积模拟或 Houdini。这对"**把 2D 特效素材升级为 3D 资产**"的管线极有价值。
   *注意*：单目推断本质**多义**（同一个 2D 流对应多个 3D 场），结果需要人工筛选与约束。

6. **应用 (a) 的渲染价值：可控形状 = 可控资产** ⭐⭐⭐⭐
   **Shape Transitions** 让烟在关键帧引导下变成动物/飞龙等形状且运动物理合理。
   *渲染价值*：这是**"造型自由度"与"物理保真度"的解耦**——美术只需指定目标形状（甚至一张草图/几个关键帧），模型负责生成可信的运动路径。对广告、品牌特效、游戏过场动画极为实用。
   *建议*：把"关键帧引导"扩展到"**轮廓/深度引导**"，可进一步提升可控性（这是显然的自然扩展方向）。

7. **与既有知识库资产的关系** ⭐⭐⭐⭐
   - 与 [[paper-2026-10-07-fluid-gen-zero]] / [[2026-10-09-Fluid-Gen-Zero-Physics-Aware-Video-Generation]]：FluidGen 是该路线的**深化**——从"物理感知的视频生成"走向"**显式速度场监督 + 速度场回灌求解器**"。FluidGen 应当作为该主题的**主笔记**，旧笔记作为前序工作链接。
   - 与 [[2026-03-19-physics-informed-video-diffusion-swe]]：同属"物理注入扩散模型"家族，FluidGen 的**速度场辅助监督**是更具体、更可操作的机制。
   - 与 [[2026-08-13-WildFireGS-Wildfire-Simulation-Gaussian-Splatting]]：互补——WildFireGS 解决"火焰如何被渲染"，FluidGen 解决"火焰运动如何生成"。

8. **与本批次其他论文的组合** ⭐⭐⭐⭐
   - 与 [[2026-11-04-Tuteri-Freitas-Designing-Turbulence-Through-Hierarchies]]：FluidGen 生成的运动在**统计上**（涡旋结构、间歇性）是否符合层级级联，可以用 Turtori & Freitas 的**间歇性 + 自相似性 + 反常耗散**作为**零成本的统计检验**——不必比对像素，只要比对涡量分布、能量谱斜率、事件统计，就能判断生成的流体"像不像湍流"。这是一个非常实用的**评测协议**建议。
   - 与 [[2026-11-04-Chekroun-Koren-Twilight-Clouds-Hovering-Dynamics-Inertia]]：Chekroun 的**鞍结分岔 → 间歇性 hovering** 与 Turtori 的**间歇性涨落**共同给出"好的流体生成应有间歇性爆发"的审美标准。
   - 与 [[2026-11-04-Yaradoddi-Wang-Serghine-Sea-Surface-Height-to-Velocity-ML]]：那篇是"**从标量场回归导数量**"（SSH → 涡量/散度），FluidGen 是"**从 RGB 场直接生成速度场**"。二者合起来是完整的"**场 → 导数量 → 驱动渲染**"链条。

**实时 vs 离线**：
- **FluidGen 本体**：视频扩散推理，**离线级**（Wan2.1 级别，多卡，秒级/帧级），属于影视/广告/离线渲染管线。
- **回灌 Houdini**：Houdini 求解本身可在 GPU 上实时（工业级 FLIP/BPyrosolver 已可实时），所以"**FluidGen 生成速度（离线一次）+ Houdini 实时求解（在线）**"可以形成**准实时**的混合管线——这是最实用的部署形态。
- **游戏/交互场景**：直接用 FluidGen 不现实；可蒸馏其速度头为**轻量涡旋/平流场预测器**，或仅借用其"速度辅助监督"思想去训练小模型。

**给算法 agent 的具体建议（可执行清单）**：
1. **建数据管线**（最重要、也最花时间）：Houdini Python 批量生成场景 → 输出 (RGB 序列, 3D 速度场序列) 配对；覆盖烟雾（上升羽流、层积烟）、火焰（扩散羽流）、碎屑（粒子弹道）三类。注意**速度场必须逐像素对齐 RGB 的相机视角**（即要把 3D 速度投影到相机平面），否则配对无效——这是最容易出错的一步。
2. **编码器**：实现球坐标 → RGB 的编码器/解码器（球坐标编码 → 存成"速度视频" → 用现成 VAE encode/decode）。编码/解码误差要单独测量，因为它决定整条管线的精度上限。
3. **模型改造**：在预训练视频扩散基座上加**零初始化的速度预测头**；RGB 与速度**共享 denoiser**（不要用两个独立模型，否则显存与算力翻倍且难以联合训练）。
4. **阶段 1**：混合语料联合微调——仿真数据**双监督**，实拍数据**仅 RGB**（或用低权重）；监控 RGB FID/CLIP 分数**与**速度场的涡量统计/谱误差两组指标。
5. **阶段 2（可选）**：velocity-aware DPO。奖励函数**必须多维**（涡旋、平流一致性、无源性、时序平滑），并**人工抽查 + 导入 Houdini 验证稳定性**，防止 reward hacking。
6. **评测协议**（这是本文的空白，需自己补）：生成速度场的**定量保真度**（与 Houdini 真值的 RMSE、涡量/散度相关、谱能量通量对比）+ **统计湍流特征**（间歇性、自相似、耗散饱和，用 Turtori & Freitas 的指标）+ **下游视觉质量**（foam/破碎是否出现在正确位置）。**不要只看 RGB 指标**——这正是 [[2026-11-04-Torralba-Ruiz-Vertical-Continuity-Fuel-Strata-TLS]] 那条"低 MSE 不足以作为唯一性能指标"的告警在流体生成领域的对应版本。
7. **最终架构选择**：若目标是**生产级最终像素**，走"**FluidGen 生成速度 → Houdini 求解 → 离线渲染**"的闭环；不要试图让扩散模型直接出最终帧（会牺牲物理保真度且难做交互控制）。
8. **工程替代方案**：若算力/时间受限，可先做**"Houdini 求解 + 关键帧/曲线驱动初值"**的轻量版本，只借用 FluidGen 的**形状过渡**思想（手工指定形状 → 求解器给出物理正确的演化），这已经能覆盖大量实际镜头需求。
