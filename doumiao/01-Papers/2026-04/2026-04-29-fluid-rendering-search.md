# 流体渲染论文搜索报告

**搜索日期**: 2026-04-29  
**搜索范围**: arXiv cs.GR (最近24小时) + 近月流体渲染相关论文  
**关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering  

---

## 📋 24小时内 cs.GR 新增论文 (2026-04-29)

最近24小时 arXiv cs.GR 分类下无流体渲染直接相关的新增论文。

**注**: SIGGRAPH 2026 论文尚未在 arXiv 发布（预计2026年7-8月会议前陆续公开）。

---

## 🔥 近月流体渲染相关论文

### 1. Real-time Neural Six-way Lightmaps

| 属性 | 内容 |
|------|------|
| **arXiv** | [2604.03748](https://arxiv.org/abs/2604.03748) |
| **日期** | 2026-04-04 |
| **分类** | cs.GR, cs.CV |
| **作者** | Tao Huang et al. |
| **PDF** | [arxiv.org/pdf/2604.03748](https://arxiv.org/pdf/2604.03748) |

**核心贡献**:
- 提出神经六向光照贴图方法，用于实时烟雾渲染
- 使用 GPU 流体求解器支持动态烟雾-障碍物交互
- 通过光线步进 (Ray Marching) 生成引导图近似烟雾散射和轮廓
- 可集成到现有游戏引擎管线，支持相机移动和光照变化

**技术要点**:
- 烟雾参与介质 (Participating Media) 实时渲染
- 六向光照贴图 (Six-way Lightmaps) 神经网络预测
- 大步长光线步进近似体积散射
- 实时性能：游戏和 VR/AR 应用

**渲染方法**: 体积渲染 (Ray Marching) + 神经网络  

**关键词**: smoke rendering, volume rendering, ray marching, real-time, lightmap  

---

### 2. Physics-Informed Video Diffusion For Shallow Water Equations

| 属性 | 内容 |
|------|------|
| **arXiv** | [2603.15627](https://arxiv.org/abs/2603.15627) |
| **日期** | 2026-02-24 |
| **分类** | cs.GR, cs.CE, physics.comp-ph, physics.flu-dyn |
| **会议** | ICASSP 2026 |
| **作者** | Yang Bai et al. |
| **PDF** | [arxiv.org/pdf/2603.15627](https://arxiv.org/pdf/2603.15627) |

**核心贡献**:
- 提出物理信息视频扩散框架，联合生成视觉输出和物理状态
- 直接将物理约束集成到生成过程中，无需单独渲染步骤
- 基于二维浅水方程和地形拓扑生成时间一致的水流
- 生成速度显著快于传统模拟+渲染管线

**技术要点**:
- 浅水方程 (Shallow Water Equations) 物理约束
- 扩散模型 (Diffusion Model) 视频生成
- 物理保真度与真实感平衡
- 端到端生成而非两阶段模拟+渲染

**渲染方法**: 基于物理的视觉生成（非传统渲染管线）  

**关键词**: water rendering, shallow water, physics-informed, diffusion model  

---

### 3. Real-Time 3D Simulation of Heat-Induced Air Turbulence

| 属性 | 内容 |
|------|------|
| **arXiv** | [2603.02048](https://arxiv.org/abs/2603.02048) |
| **日期** | 2026-03-02 |
| **分类** | cs.GR |
| **作者** | Wanqi Yuan et al. |
| **PDF** | [arxiv.org/pdf/2603.02048](https://arxiv.org/pdf/2603.02048) |

**核心贡献**:
- 首个实时全3D拉格朗日框架，模拟热致空气湍流
- 将可压缩 SPH 与温度传输、浮力和压力驱动运动结合
- 通过弯曲光线追踪渲染连续折射率场
- 自适应步长积分：强梯度区域细化，平稳区域放宽

**技术要点**:
- 可压缩 SPH (Smoothed Particle Hydrodynamics)
- 温度传输与浮力
- 弯曲光线追踪 (Curved Ray Tracing) 建模3D折射
- 空间自适应步长光线积分
- 实时性能：约 40 fps

**渲染方法**: 体积渲染 (折射率场弯曲光线追踪)  

**关键词**: turbulence, SPH, volume rendering, ray tracing, refractive, real-time  

---

### 4. Learning Underwater Active Perception in Simulation

| 属性 | 内容 |
|------|------|
| **arXiv** | [2504.17817](https://arxiv.org/abs/2504.17817) |
| **日期** | 2025-04-23 (v2: 2026-03-28) |
| **分类** | cs.CV, cs.RO |
| **作者** | Alexandre Cardaillac et al. |
| **项目** | [roboticimaging.org/Projects/ActiveUW](https://roboticimaging.org/Projects/ActiveUW/) |

**核心贡献**:
- 基于深度学习的水下图像质量预测 (MLP)
- 生成大规模合成数据集，包含10种不同浊度和后向散射的水体类型
- 修改 Blender 以更好地模拟水下光照传播特性
- 在仿真中验证，显著提升视觉覆盖和图像质量

**技术要点**:
- 水体渲染：浊度 (turbidity) 和后向散射 (backscattering)
- Blender 修改用于水下光学建模
- 主动感知框架预测图像质量
- 多种水体类型 Jerlov IB 等

**渲染方法**: 基于物理的水下渲染  

**关键词**: underwater rendering, turbidity, backscattering, Blender, water rendering  

---

## 📊 技术分类汇总

| 论文 | 渲染类型 | 技术方法 | 实时性 | 应用场景 |
|------|----------|----------|--------|----------|
| Neural Six-way Lightmaps | 体积渲染 | Ray Marching + Neural Net | ✅ 实时 | 游戏/VR烟雾 |
| Shallow Water Diffusion | 生成式 | Diffusion Model | ✅ 快速生成 | 浅水水流 |
| Heat-Induced Turbulence | 体积渲染 | SPH + Curved Ray Tracing | ✅ ~40fps | 热气流/畸变 |
| Underwater Perception | 水下渲染 | 物理建模 | ✅ 实时 | 水下机器人 |

---

## 🔍 趋势分析

1. **实时体积渲染 + 神经网络**: Neural Six-way Lightmaps 展示将传统体积渲染技术与神经网络结合的趋势
2. **生成式流体**: 扩散模型开始应用于流体动画，如 Shallow Water Diffusion
3. **物理信息方法**: 强调物理约束与视觉真实感的结合
4. **GPU 并行计算**: SPH 和光线追踪的 GPU 加速实现实时性能

---

## 📚 待跟进

- [ ] SIGGRAPH 2026 论文（预计2026年5-6月陆续公开）
- [ ] arXiv 新增流体渲染论文
- [ ] Eurographics 2026 论文

---

*由 Doumiao (豆苗) 自动生成 - 2026-04-29*
