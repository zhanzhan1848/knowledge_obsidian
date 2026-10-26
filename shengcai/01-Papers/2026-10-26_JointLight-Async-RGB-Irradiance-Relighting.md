---
type: paper
created: 2026-10-26
updated: 2026-10-26
tags: [paper, 渲染, 可重光照, 光照传输, Diffusion, SIGGRAPH-Asia-2026, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.29780
---

# JointLight: Human-Centric Video Relighting with Asynchronous RGB-Irradiance Joint Modeling

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | JointLight: Human-Centric Video Relighting with Asynchronous RGB-Irradiance Joint Modeling |
| **作者** | Henglei Lv¹, Bailin Deng², Xiaoqiang Liu³, Yichen Wang¹, Haoxian Zhang³, Pengfei Wan³, Lin Gao¹* （¹中科院计算所, ²Cardiff University, ³快手科技；*通讯 gaolin@ict.ac.cn） |
| **发表** | **SIGGRAPH Asia 2026 Conference Papers**（SA Conference Papers '26，2026-12-01–04，Kuala Lumpur, Malaysia），12 页 |
| **链接** | [原文](https://arxiv.org/abs/2610.29780) · [Project Page](http://www.geometrylearning.com/JointLight/) |
| **DOI** | 10.1145/3829340.3842252（ACM ISBN 979-8-4007-2842-6/2026/12） |
| **代码** | 未提供 |

---

## 核心贡献

> 核心洞察：**噪声腐蚀能抹掉高频伪影、保留低频光照传输** —— 于是把「path-traced irradiance cue」当作可加噪的显式光照传输蓝图，与 RGB 用**各自独立的 timestep 调度**做异步联合去噪，从而在扩散模型框架内实现细粒度光照控制。

1. **异步 RGB-irradiance 联合建模**：训练时用**分离的 timestep 调度** t_V 与 t_E，让模型学会「在不同噪声水平下联合去噪」，从而支持推理时输入带噪的 irradiance cue。
2. **Noise Corruption 机制**：对构造的 irradiance cue 加高斯噪声 E_cue_t = (1-t)E_cue + tε —— 抹除高频几何伪影、保留低频光照传输先验。
3. **Domain Matching 策略**：训练时随机迭代把 noisy GT irradiance 替换为 noisy cue（z_E^t → z_Ecue^t），弥合训练（只见 GT irradiance）与推理（只见 cue）之间的域差距。
4. **Hijacked Asynchronous Inference**：推理时在 hijack timestep t_h 之前只更新 RGB latent（irradiance latent 冻结在 E_cue_{t_h}），t_h 之后两模态一起去噪。实践上 **t_h = 0.6T**。
5. **多光照高质量合成视频数据集**：用游戏引擎生成带**配对 irradiance map** 的多光照合成视频数据。
6. **结果**：在光照保真度与生成质量两方面均优于先前方法；仅在该合成数据集上训练即可泛化到真实场景。

---

## 技术方案

### 核心思想

**问题**：端到端重光照方法用神经网络**隐式**建模光传输 ⇒ 可控性差。另一路（Erel et al. 2025；Zeng et al. 2024b）用 **path-traced irradiance cue** 作为显式光传输蓝图 ⇒ cue 本身带伪影（几何误差、边界缺面、时间不一致），直接当控制信号反而损害生成质量。

**破局点**：噪声腐蚀的物理直觉 —— 伪影是高频的，光照传输是低频的。所以：

```math
E^{\text{cue}}_t = (1-t)\,E^{\text{cue}} + t\,\varepsilon
```

加噪后高频伪影被破坏，低频全局光传输先验被保留。这比「简单补洞」或「空间模糊」更优 —— 后两者无法可靠重建未定义几何周围的光传输，且会抹掉有用的低频光照结构。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Irradiance cue 构造** | 用**单目点云估计**（Wang et al. 2025e,f）而非单目深度（Bhat et al. 2023）得到 metric-level 几何与更平滑的网格；逐帧转 mesh，用固定阈值 mask 移除跨越深度不连续处的三角形；赋**空间均匀白色漫反射 BRDF**，用目标环境图照明，经 **Mitsuba 3** 渲染 |
| **逐帧估计** | 避免全局重建漂移累积；但几何误差、被移除的边界三角形、时间不一致仍造成与 GT irradiance 的显著差距 |
| **模态拼接** | 将 noisy RGB video latent z_V^{t_V}、noisy irradiance latent z_E^{t_E}、输入视频 z_I^0 沿**帧维**拼接送入 transformer，使 3D 时空自注意力覆盖输入/辐照度/重光照三类帧，实现跨模态理解 |
| **RoPE 共享位置** | 三模态共享像素对齐，故施加**同一 RoPE** 分配共享时空位置 |
| **模态消歧** | 在 timestep embedding 之上引入**可学习模态 embedding**（而非注入 latent 特征）—— 因 timestep 的 gate modulation 已条件化特征，这种做法在本文设定下更好地避免模态混合 |
| **Domain Matching** | 随机训练迭代中以 noisy cue 替换 noisy GT irradiance，引导去噪路径更靠近高质量 manifold，同时改善 RGB 与 irradiance 生成 |
| **Hijacked 推理** | t_h 前只更新 RGB latent，irradiance latent 固定为 E_cue_{t_h}；t_h 后两模态联合去噪。t_h 控制噪声量，在生成质量与光照保真度间做权衡：cue 可靠时用较小 t_h 保留更多高频细节；cue 噪声大/错位时用较大 t_h 更激进地抑制伪影 |
| **时序分离** | 论文强调异步 timestep 调度此前已在多模态 diffusion 中被探索；本文贡献在于**应用于 RGB-irradiance 配对**，其辅助模态在推理时是**不完美的** —— 这正是 domain matching 与 hijacked pipeline 存在的理由 |

### 训练配置

| 项 | 值 |
|---|---|
| 基座模型 | Wan2.2-TI2V-5B（LoRA 微调） |
| 训练步数 | 12K steps |
| 分辨率 | 832 × 480 |
| 学习率 | 10⁻⁵ |
| Batch size | 16 |
| Domain Matching | 仅在**最后 4K 步**施加（第二阶段） |
| 数据 | 821 张 HDR 环境图（公开资源收集） |

---

## 实验结论

- **数据集**：自建「多光照高质量合成视频数据集」，用强力游戏引擎生成，**配对 irradiance map**；另在真实场景上验证泛化。
- **基线**：先前端到端重光照方法 + 使用 irradiance cue 的方法（Erel et al. 2025；Zeng et al. 2024b）。
- **结果**：
  - **光照保真度**与**生成质量**两方面均优于先前方法
  - 仅在合成数据集上训练 → 对**真实场景**具备稳健泛化
  - 可实现细粒度光照控制（通过 t_h 与目标环境图双重控制）

---

## 局限性

1. **Irradiance cue 质量是上限** —— 依赖单目点云估计。几何误差、深度不连续处被移除的三角形、时间不一致性都会传导进 cue，进而限制光照保真度上限。
2. **多光照数据是合成的** —— 用游戏引擎生成，真实场景的材质/几何分布与合成数据有域差距；论文称泛化良好，但未消除这一根本性依赖。
3. **t_h 需要按场景调参** —— cue 质量决定最佳 t_h；0.6T 是经验值，噪声场景需要更大值，损失细节。
4. **显存与算力成本高** —— 5B 参数视频 diffusion 模型 + 832×480 视频，训练与推理都远超实时渲染需求。
5. **只针对人像场景** —— 方法面向 human-centric 场景，泛化到通用场景未验证。
6. **依赖外部几何估计与渲染器** —— 需要点云估计模型 + Mitsuba 3 渲染管线，属多组件系统。
7. **代码未公开**。

---

## 相关工作

- [[Irradiance-Cue]] — path-traced 显式光传输蓝图路线
- [[Mitsuba-3]] — 构造 irradiance cue 的路径追踪渲染器
- [[Wan2.2-TI2V-5B]] — 微调基座模型
- [[2026-10-26_RxGS-Relightable-Gaussian-Stylization]] — 同批次，**几何/材质侧**的可重光照路线（BRDF 分解）—— 与本文**像素/生成侧**路线互补
- [[2026-10-26_RADIANT-Object-Centric-Feed-Forward-Global-Illumination]] — 同批次，feed-forward GI 路线
- [[2026-10-26_SpaRV-Sparse-Radiance-Voxel-LiDAR-Mapping]] — 同批次，ray marching 辐射场路线

---

## 实现建议

- **实现难度**：**高**（多组件：点云估计 + Mitsuba 渲染 + 5B 视频 diffusion 微调 + 三阶段推理调度）。
- **预期性能**：离线推理，非实时。光照保真度与生成质量优于基线。
- **适用场景**：
  - ✅ 人像视频重光照（影视后期、短视频、虚拟形象）
  - ✅ 需要**显式光照控制**的生成任务（可换环境图）
  - ✅ AR/虚拟试衣中的光照编辑
  - ⚠️ 实时/交互式渲染：不适合
  - ❌ 通用场景（非人像）
- **推荐度**：**⭐⭐⭐⭐ 值得关注** —— 对我们最大的价值是**「加噪抹高频伪影、保低频传输」这个可迁移的工程思想**，它适用于任何「用有缺陷的显式光传输近似作为生成控制信号」的场景，不限于人像重光照。我们自己的神经渲染管线若要引入 irradiance/light-transport 先验，可直接套用这个 noise corruption + domain matching + hijacked inference 三件套。

---

## 原始链接

- 论文：https://arxiv.org/abs/2610.29780
- PDF：https://arxiv.org/pdf/2610.29780
- Project Page：http://www.geometrylearning.com/JointLight/
- DOI：https://doi.org/10.1145/3829340.3842252
