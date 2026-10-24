---
type: paper
created: 2026-10-24
updated: 2026-10-24
tags: [paper, particle-system, SPH, neural-fluid-simulation, transformer, continuous-convolution, learning-based-simulation]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2508.01537
---

# FluidFormer: Transformer with Continuous Convolution for Particle-based Fluid Simulation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | FluidFormer: Transformer with Continuous Convolution for Particle-based Fluid Simulation |
| **arXiv ID** | 2508.01537v1 |
| **作者** | Nianyi Wang, Yu Chen, Shuai Zheng |
| **发表** | arXiv cs.GR / cs.CE / cs.LG / physics.flu-dyn 2025-08-03 |
| **链接** | [原文](https://arxiv.org/abs/2508.01537) |
| **渲染类别** | **粒子渲染 / 学习型流体模拟（SPH）** |

---

## 核心贡献

> 首个面向**连续流体模拟**的 Transformer 架构：提出 **Fluid Attention Block (FAB)**，用**连续卷积提取局部特征 + 自注意力捕获全局依赖**，构成"局部-全局"层级架构，抑制误差累积并建模长程物理现象。

1. **Fluid Attention Block (FAB)**：首个带**局部-全局层级**的流体注意力块。
   - **连续卷积 (continuous convolution)** → 提取局部特征（延续 SPH 的邻域交互范式）
   - **自注意力 (self-attention)** → 捕获全局依赖（SPH 天然缺失的能力）
2. **首个专为连续流体模拟设计的 Transformer**：以双管线（dual-pipeline）架构无缝集成。
3. **范式转变**：统一"卷积式局部特征"与"注意力式全局上下文建模"，为学习型流体模拟建立新范式。
4. **性能**：在复杂流体场景下达到 SOTA，且**稳定性显著更强**。

---

## 技术方案

### 核心思想

现有学习型流体模拟几乎都建立在 **SPH** 框架上，而 SPH 的结构性局限是：

> **SPH 只依赖粒子间的局部交互** —— 这在几何上高效，但缺乏全局上下文，导致长程物理现象（长波传播、大尺度环流、全局压力平衡）难以建模，误差在时间上累积。

FluidFormer 的洞察：**局部 ≠ 充分**。SPH 的局部性是它的优势也是它的天花板；补上全局上下文就能抑制误差累积。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Continuous Convolution** | 在连续（粒子）域上做卷积，提取局部邻域特征，兼容 SPH 无网格表示 |
| **Self-Attention** | 捕获粒子间的全局依赖，补足 SPH 缺失的长程建模能力 |
| **Fluid Attention Block (FAB)** | 局部-全局层级融合模块 —— 本文核心贡献 |
| **Dual-Pipeline Architecture** | 双管线：一条走局部连续卷积支路，一条走全局注意力支路，融合输出 |
| **SPH-based Predictor** | 以 SPH 作为物理先验/预测器骨架，学习加速项 |

---

## 公式

**SPH 物理基线（邻居交互）**：对粒子 $i$，密度与压力通过核函数加权求和：

```math
\rho_i = \sum_j m_j\, W(\mathbf{x}_i - \mathbf{x}_j, h), \qquad
p_i = k(\rho_i - \rho_0)
```

**局部-全局融合注意力（FAB 核心）**：位置编码后分别计算局部卷积特征与全局注意力特征，再门控融合：

```math
\mathbf{h}_i^{\text{local}} = \mathrm{Conv}_{\text{cont}}\big(\{\mathbf{e}_j\}_{j \in \mathcal{N}(i)}\big),
\qquad
\mathbf{h}_i^{\text{global}} = \mathrm{Attn}(\mathbf{q}_i, \{\mathbf{v}_j\}_{j=1}^{N})
```

```math
\mathbf{h}_i = g_i \odot \mathbf{h}_i^{\text{local}} + (1 - g_i)\odot \mathbf{h}_i^{\text{global}},
\qquad
g_i = \sigma\big(f_{\text{gate}}(\mathbf{h}_i^{\text{local}}, \mathbf{h}_i^{\text{global}})\big)
```

其中 $\mathcal{N}(i)$ 为 SPH 邻居集合（带核半径截断），$\sigma$ 为 sigmoid 门控。

**速度预测**：输出加速度 = 物理项 + 学习项：

```math
\mathbf{a}_i = \frac{1}{m_i}\Big(-\sum_j m_j \frac{p_i + p_j}{2}\nabla_{\mathbf{x}_i} W_{ij} + \mathbf{f}_i^{\text{ext}}\Big) + \mathbf{a}_i^{\text{learned}}
```

---

## 实验结论

- **基线**: 纯 SPH 数值求解器、已有学习型 SPH 方法（如 Physics-MLP 类）、其他神经流体网络
- **结果**:
  - 复杂流体场景下达到 **SOTA**
  - **稳定性显著更强**（全局上下文抑制误差累积的直接收益）
  - 长程物理现象建模能力提升
- **场景**: 复杂多相流、剧烈涡动、长时间演化稳定性

---

## 局限性

- **训练成本高**：Transformer + 连续卷积的双管线，参数量与训练数据需求都远超纯 SPH。
- **推理成本**：$O(N)$ 自注意力，在 $N \sim 10^5$–$10^6$ 粒子时显存与延迟压力大，需配套邻居裁剪。
- **物理精度依赖训练分布**：学习加速项在分布外场景可能失稳（SPH 物理项提供兜底，但收益打折）。
- 摘要未给出具体参数量、训练时长与 FPS 数值。

---

## 相关工作

- [[Fast-Subspace-Fluid-Simulation-DMD]] — 降阶谱方法路线（本库 2026-10-24 收录）
- [[Vortex-Particle-Flow-Maps]] — 粒子 + 涡量演化路线
- [[Optimal-Transport-Fluid-Simulation]] — 最优传输路线
- [[Physics-Grounded-Fluid-Video-Generation]] — 物理约束视频生成
- [[SPH]]
- [[Transformer]]

---

## 实现建议

- **实现难度**：🔴 高（需实现连续卷积 + 粒子注意力 + 训练管线）
- **预期性能**：推理慢于数值 SPH，但稳定性与长程精度更优
- **适用场景**：离线/准实时的高质量流体（影视、游戏过场），作为**求解器替代或加速项**

### 🌱 豆苗评注

**这篇的核心洞察很锋利：SPH 的局部性既是它的效率来源，也是它的精度天花板。** 很多人以为"用神经网络替代 SPH"就是升级，实际上如果只用 MLP 处理局部邻域，你并没有跳出 SPH 的框架 —— 只是把核函数换成了网络。FluidFormer 真正做对的事是**引入了全局上下文这一维度**，让模型能表达"整片水域的整体压力分布"这类全局量。

对**渲染侧**的启发：即便不采用神经网络，任何流体的**渲染属性**（密度、泡沫浓度、温度、颜色）本质上也需要全局一致的信息。一个可行的中间路线是**"数值 SPH 求解 + 学习型渲染属性场"**：物理照旧用成熟 SPH 保证正确性，而泡沫/密度的分布用一个带全局感知的网络来预测。这比端到端学习流体更稳妥，也更容易在现有管线里落地。

---

## 🩸 可行性分析：全局感知的学习型流体渲染属性场

## 渲染方法
- 类型：粒子渲染（泡沫/密度属性）+ 体积渲染
- 技术：数值 SPH 保证物理正确 → 轻量 Transformer/图网络预测渲染属性 → 粒子/体渲染

## 视觉质量
- 逼真度：⭐⭐⭐⭐⭐（属性场可专门针对视觉特征训练）
- 风格化支持：⭐⭐⭐⭐⭐

## 性能预期
- 帧率：取决于属性网络推理，需控制粒子数（建议 $N \le 5\times10^4$）
- GPU 需求：中
- 内存占用：中

## 实现建议
- 着色器复杂度：中
- 管线要求：SPH 状态 → 属性网络 → 渲染属性缓冲
- 推荐度：✅（比端到端流体学习更易落地）
