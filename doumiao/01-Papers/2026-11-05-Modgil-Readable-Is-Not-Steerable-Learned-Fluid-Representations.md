---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, fluid-rendering, learned-representation, navier-stokes, world-model, jepa, autoencoder, vicreg, interpretability, pre-registration]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.05577
---

# Readable Is Not Steerable: Pre-Registered Tests of Physical Structure in Learned Fluid Representations

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Readable Is Not Steerable: Pre-Registered Tests of Physical Structure in Learned Fluid Representations |
| **作者** | Manvendra Modgil |
| **发表** | arXiv preprint (physics.flu-dyn / cs.LG) 2026-11-03, 30 页, 9 图 |
| **链接** | [原文](https://arxiv.org/abs/2611.05577) · [代码/预注册/检查点](https://github.com/2025eb1100268-tech/readable-not-steerable) |
| **分类** | 学习型流体表示 / 可解释性 / 预注册研究方法论 |

---

## 核心贡献

> **用严格的"预注册 (pre-registered)"实验范式检验"自监督世界模型的隐空间围绕物理量组织"这一流行论断**，得出一个反直觉但极其重要的结论：**"可读 (readable)" ≠ "可操控 (steerable)"** —— 隐空间里**包含**某个物理量，与能**通过它控制**输出，是两回事。

1. **研究背景**：自监督世界模型常被宣称"其隐空间围绕物理量组织"。本文在 **2D 衰减 Navier–Stokes 流**上，用**三个预注册研究**、每个**只测一次**、在**留出数据**上严格检验这一论断。
2. **核心方法论创新：预注册 (pre-registration)**
   - 所有假设、判据、偏离项**在实验前登记**；
   - 全部预注册、偏离记录、代码与输出**公开**；
   - 只在一块消费级 GPU 上约 **70 个记录小时 (logged hours)** 完成整个项目。
3. **三项研究的关键发现**

| 研究 | 设置 | 预注册判据 | 结果 |
|------|------|-----------|------|
| **Study 1** | JEPA (联合嵌入预测架构) 预测流场 | 隐空间围绕流体物理量的组织程度**优于同架构未训练网络** | ❌ **不成立 (not supported)** —— 在**非物理线性动力学**上训练的 JEPA、以及**完全不看时间的静态不变性模型**，表现**一样好或更好** |
| **Study 2** | 普通自编码器渲染流场 | 无监督隐方向中**涡量 (enstrophy)** 的显著性与线性可解码性 | ⚠️ **部分成立** —— 涡量在**最慢的无监督隐方向**中突出（**r 0.80–0.86** vs 未训练 **0.38**）；加入 **VICReg 反而在每个对比中都降低**了该显著性（但未达涡量的预注册门槛），同时**提高**了线性可解码性 |
| **Study 3** | 构造可操控方向 ("dials") | 形状 dial 在 **5 个新种子中至少 4 个**出现 | ⚠️ **部分成立** —— **8 个模型全部**发现响度 (loudness) dial，形状 (shape) dial 只在 **5 个种子的 3 个**中出现（低于预注册门槛 4）；两个对照模型**均未**出现形状 dial |

4. **最具启发性的观察**
   - **"隐空间里有什么"与"能通过它控制什么"是脱节的 (come apart)**；
   - 探索阶段：一个**监督方向**几乎完美地读取了谱形状，但**推动它时什么也没动**；
   - 构建阶段：**响度 dial 只能靠它对输出的作用找到**（最接近纯缩放），而不是靠数据方差；
   - 形状 dial：方差规则与**效应约束规则**各在 **5 个种子中的 3 个**成功。

---

## 技术方案

### 为什么这篇对"神经流体渲染"重要

当前大量神经流体工作（含本库收录的 FluidGen 等）都隐含假设：
> "如果模型隐空间编码了物理量，我们就能通过操纵隐变量来控制流体。"

本文用**预注册实验**表明这个链条**不成立**：
```
常见假设:  隐空间 ⊃ 物理量  ──(操纵隐变量)──→  有效控制
                ↑ Study 2 支持              ↑ Study 3 不支持
```
**实践含义**：
1. 设计"可控流体生成模型"时，**不能只检查"能读出物理量"**；
2. 必须**直接检验"推动这个方向是否产生期望的物理变化"**；
3. **对照实验是关键**：必须包含**非物理数据训练的对照组**（如本文的线性动力学 JEPA、静态不变性模型），否则会高估模型的物理性；
4. 正则化（如 VICReg）**可能以牺牲物理结构显著性为代价换取线性可解码性** —— 二者需权衡。

### 值得借鉴的研究方法论
- **预注册 + 单次检验 + 留出数据 + 封存种子 (sealed seeds)**；
- **效应约束的 dial 发现规则**（找 dial 要看它对输出的作用，而非数据方差）—— 这个技巧可直接用于任何"可控生成模型"的评估；
- 对照组设计（线性动力学、静态模型）—— **基线对齐**的必要性。

---

## 摘要原文

> Self-supervised world models are often said to organize their latents around physical quantities. We test this on 2D decaying Navier-Stokes flow in three pre-registered studies, each tested once on held-out data. In Study 1, a joint-embedding predictive architecture (JEPA) trained to predict the flow fails the pre-registered criteria for organizing its latent around fluid quantities better than an untrained network of the same architecture (not supported); a JEPA trained on non-physical linear dynamics and a static invariance model that never sees time do as well or better. In Study 2, plain autoencoders that render the field make enstrophy prominent in their slowest unsupervised latent directions (best r 0.80-0.86 vs 0.38 untrained; fresh seeds, sealed data). Adding VICReg lowers this prominence in every comparison, though not by the pre-registered margin for vorticity, while raising the autoencoders' linear decodability (partially supported). In Study 3, we build steerable directions ("dials") by routing: the decoder gets overall scale only through a small conditioning code, while its other pathway carries a degraded copy of spectral shape. Label-free rules find a loudness dial in all 8 trained models and a shape dial in 3 of 5 fresh seeds on sealed data, against a pre-registered bar of 4; neither control shows a shape dial (partially supported). Across the studies, what a latent contains and what can be controlled through it come apart. In exploration, a supervised direction reading spectral shape almost perfectly moved nothing when steered. During the build, the loudness dial had to be found by its effect on the output (closest to a pure rescaling), not by data variance; for shape, a variance rule and an effect-constrained rule each worked in 3 of 5 seeds. The program used about 70 logged hours on one consumer GPU; all pre-registrations, deviations, code and outputs are public.

---

## 关联笔记
- [[2026-11-04-Zheng-FluidGen-Physics-Aware-Fluid-Video-Generation]] — FluidGen 正是"速度场作为可操控奖励"的实践，本文对其前提提出警示
- [[2026-10-07-fluid-gen-zero]] — Fluid-Gen-Zero（物理锚定路线）
- 技术笔记：[[体积渲染]]

## 资源链接
- 代码 / 预注册 / 检查点：https://github.com/2025eb1100268-tech/readable-not-steerable

## 备注
- 本文不是渲染方法论文，而是**方法论/评测论文**，但对"可控神经流体"的评估标准有直接影响，建议在设计可控流体模型时优先阅读。
