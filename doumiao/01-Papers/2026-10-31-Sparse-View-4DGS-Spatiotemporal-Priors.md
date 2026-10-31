---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, fluid-rendering, benchmark, volume-rendering, 4d-gaussian, siggraph-asia, cs.CV]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2610.04606
---

# Sparse-View 4D Gaussian Splatting via Spatiotemporal Priors and Generative Assistance

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Sparse-View 4D Gaussian Splatting via Spatiotemporal Priors and Generative Assistance |
| **作者** | Shengqi Wang, Zhengxian Yang, Kaiwen Tian, Yang Liu, Bowen Liu, Hua Du, Taicheng Huang, Jiamin Wu, Tao Yu |
| **发表** | arXiv 2026-10-03 (v2) · **SIGGRAPH Asia 2026 Workshops (SA Workshops '26)** · cs.CV |
| **链接** | [原文](https://arxiv.org/abs/2610.04606) |

---

## 核心贡献

> 为 **SIGGRAPH Asia 2026 Volumetric Video Challenge 的 Sparse-View Track**（仅 6 个大基线相机）设计的 4DGS 框架，用"**区域自适应空间先验 + 运动一致时间先验 + 生成式补全**"三件套，把稀疏视角动态重建推到挑战赛**第一名**。

1. **区域自适应空间先验**：前景掩膜引导高斯初始化；用**掩膜投票**把致密化（densification）**分开控制**动态前景与静态背景；背景几何用**对齐到公制尺度的单目深度**正则化。
2. **运动一致时间先验**：通过**帧插值**在中间时刻提供监督；用**估计的光流**约束投影后的高斯运动。
3. **生成式辅助**：在**角度间隙最大**处放置虚拟相机，用**以相机位姿为条件**的扩散模型修复其渲染图像，并**迭代地**把修复图像作为伪监督并入训练。

---

## 技术方案

### 核心思想

稀疏视角 + 大基线 = 3DGS 训练的最大痛点。本文的解法是**三条互补的信息通道**：

| 通道 | 解决什么 | 手段 |
|------|---------|------|
| **空间先验** | 几何不可观测（尤其背景） | 前景/背景分离致密化 + 公制单目深度正则 |
| **时间先验** | 中间时刻无监督 | 帧插值 + 光流约束高斯运动 |
| **生成式补全** | 视角覆盖不足 | 虚拟相机 + 位姿条件扩散模型修复 |

> 💡 关键点在于**"迭代并入"**：修复图像不是一次性伪标签，而是**循环回训练集**，模型每轮训练后渲染更好，扩散修复的输入也随之更好 → 自我强化。

### 关键技术

| 技术 | 说明 |
|------|------|
| **掩膜投票致密化** | 按前景/背景分离控制高斯增删 → 防止动态区域被静态背景淹没 |
| **公制尺度单目深度** | 对齐到米制后作为背景几何正则 → 抑制深度歧义 |
| **帧插值中间监督** | 在稀疏时刻之间生成中间帧目标 → 提升时间连续性 |
| **光流运动约束** | 约束投影高斯的运动场 → 时间一致性 |
| **虚拟相机 + 位姿条件扩散** | 在覆盖最差的角度插桩 → 扩散模型补全渲染 |
| **迭代伪监督并入** | 修复图像循环回训练集，自我强化 |

---

## 公式

**损失构成（示意）**：

```math
\mathcal{L} = \underbrace{\mathcal{L}_{\text{render}}}_{\text{真实视角}}
+ \underbrace{\lambda_t \mathcal{L}_{\text{interp}}}_{\text{插值中间监督}}
+ \underbrace{\lambda_f \mathcal{L}_{\text{flow}}}_{\text{光流一致性}}
+ \underbrace{\lambda_d \mathcal{L}_{\text{depth}}}_{\text{公制深度正则}}
+ \underbrace{\lambda_g \mathcal{L}_{\text{diffusion-pseudo}}}_{\text{扩散修复伪监督}}
```

**掩膜投票的致密化门控**（示意）：

```math
\mathcal{D}(\mathbf{g}) = \begin{cases}
\text{前景致密化规则}, & \text{if } \sum \text{votes}(\mathbf{g}) > \theta_F \\
\text{背景致密化规则}, & \text{otherwise}
\end{cases}
```

---

## 实验结论

- **挑战赛设置**：SIGGRAPH Asia 2026 Volumetric Video Challenge，**Sparse-View Track**，**仅 6 个大基线相机**。
- **结果**：
  - 验证集全帧 PSNR：**25.60 dB（基线）→ 29.75 dB**（+4.15 dB）
  - 官方测试集：**全帧 30.04 dB / 前景 27.88 dB**，**Sparse-View Track 总排名第一**
- **组件**：4 页正文 + 5 图（挑战赛短论文体量）。

---

## 局限性

- **挑战赛短论文**，技术细节披露有限，ablation 不充分。
- 依赖**扩散模型**做修复 → 推理阶段引入生成模型开销与潜在伪影。
- 依赖**前景掩膜**（需预分割）。
- 面向**体积视频/动态场景重建**，非流体专用；流体场景需额外处理（无静态背景、严重遮挡）。

---

## 相关工作

- [[2026-10-31-RealMe-Immersive-Volumetric-Video]] — 同为 SIGGRAPH Asia 2026 的体积视频工作（生成式增强 + 4D 一致性）
- [[2026-08-CAGS-Volumetric-Video-Streaming-3DGS]] — 体积视频流式传输
- [[2026-10-13-Make-It-Flow-Water-3DGS]] — 3DGS 场景中的水流动画
- [[2026-10-20-FluidGen-Physics-Aware-Fluid-Video]] — 流体视频生成（生成方向对照）

---

## 实现建议

- **实现难度**：中（4DGS 主流框架可改，虚拟相机 + 扩散修复是主要工作量）
- **预期性能**：训练离线；推理为标准 3DGS 光栅化（实时）
- **适用场景**：**多机位体积视频采集**（体育赛事、演出、VR）、**动态场景稀疏视角重建**
- **推荐度**：✅
- **落地价值**：⭐⭐⭐⭐
- **可迁移到流体渲染的点**：
  1. **"掩膜投票分离致密化"** → 对流体/烟雾场景，等价于区分"**流体高斯 vs 背景高斯**"，让流体区域获得独立的增删预算，避免被背景淹没
  2. **"迭代伪监督"** → 流体场景可用**低成本模拟（如 2D 流体 / 粗网格模拟）生成伪监督**，迭代蒸馏到高保真 4DGS
  3. **虚拟相机补全** → 对"流体只有单一机位"的问题，虚拟相机 + 生成式补全是可行路线（需警惕伪影）
