---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, fluid-rendering, volume-rendering, neural-rendering, light-transport, clouds, denoising, real-time, cs.GR]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.12103
---

# Real-Time Volumetric Light Transport Inference without a Path

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Volumetric Light Transport Inference without a Path |
| **作者** | Ludwic Leonard, Ruediger Westermann — **TU Munich / LMU** |
| **发表** | arXiv preprint (cs.GR, cs.CV), 2026-11-09 |
| **链接** | [arXiv:2611.12103](https://arxiv.org/abs/2611.12103) |
| **DOI** | — |
| **代码** | 未在摘要中声明 |
| **分类** | 体积渲染 / 烟雾与云 / 神经渲染 / 实时光照传输 |

---

## 核心贡献

> **不用路径追踪，直接从"一次主光线 + 环境采样"的廉价特征**回归出体积介质中的**完整像素辐亮度**（fully integrated pixel radiance），实现**实时**云/烟雾渲染——用**图像空间**推理换取**计算成本稳定**（zoom in/out 几乎不影响开销）。

1. **问题：体积渲染的光照传输代价高昂**
   - 蒙特卡洛路径追踪（path tracing）能得到高质量体积渲染，但**代价昂贵**，难以实时；
   - 基于蒙特卡洛的**去噪管线**仍**依赖路径追踪产生的辐亮度估计**——即"贵的那一步"没省掉。

2. **核心思路：直接推断最终解，而不是去噪估计**
   - 从**廉价的 primary-ray 采样 + 环境采样**构成的紧凑场景特征与统计量出发，**直接推断**完整的光照传输解；
   - 证明这些特征构成**近充分的场景表示 (near-sufficient representation)**，因此能以显著更低的算力做准确重建。

3. **网络：attention-augmented image-to-image 网络**
   - 在**图像空间**中完成推理，**完全不需要原始辐亮度信号**作为输入。

4. **关键工程优势：计算成本稳定**
   - 图像空间推理 → 相机**推近/拉远**时成本基本不变；
   - 相比显式多次散射模拟，**对体积密度 (density) 的依赖大幅降低**。

5. **演示场景**：具有挑战性的**体积云 (volumetric cloud)** 场景，实时性能 + 高重建精度。

---

## 技术方案

### 核心思想

传统体积渲染链路的成本结构：

```
传统：路径追踪(贵) → 辐亮度图 → MC 降噪(仍需路径追踪结果)
本文：廉价特征(主光线+环境采样) → 网络直接推断 → 像素辐亮度
      ↑ 跳过整条路径追踪链路
```

"近充分表示"的含义：给定主光线采样与环境采样所提取的特征，**积分后的辐亮度在统计上几乎被完全确定**（相对于目标），因此可以用一个学到的映射直接替代数值积分。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Primary-ray sample features** | 主光线沿视线在介质中的采样，提取廉价特征（透过率、深度分布、密度统计） |
| **Environment sample statistics** | 对环境光照做廉价采样，提取方向性统计特征 |
| **Attention-augmented I2I network** | 带注意力的 image-to-image 网络，直接回归像素辐亮度 |
| **Near-sufficient representation** | 理论论证：上述特征近似充分支撑辐亮度重建 |
| **Image-space inference** | 推理在 2D 图像空间进行 → 成本与体积密度、相机距离解耦 |
| **No radiance input** | 训练/推理均不需要路径追踪辐亮度图作为输入 |

---

## 公式

```math
% 传统体积渲染积分（需路径追踪/多次散射）
L_{\text{pixel}} = \int_{t_n}^{t_f} T(t)\; \sigma_t(\mathbf{x}(t))\; L_{\text{scat}}(\mathbf{x}(t),\, \omega)\; dt

% 本文：学到的直接映射
\hat{L}_{\text{pixel}} = f_{\theta}\!\big(\phi_{\text{primary}}(\mathbf{p}),\;\phi_{\text{env}}\big)
\quad\text{with}\quad
\phi_{\text{primary}} \approx \text{near-sufficient for } L_{\text{pixel}}
```

---

## 代码片段

```python
# 概念伪代码：廉价特征 → 注意力 I2I 网络 → 像素辐亮度
feat_ray = sample_primary_ray(scene, camera)      # 透过率/深度分布/密度统计
feat_env = sample_environment(scene, num_dirs=8)   # 廉价环境采样统计
img_feat = torch.cat([feat_ray, feat_env], dim=-1)

# attention-augmented image-to-image network
out = net(img_feat)                                # 直接输出像素辐亮度，无需路径追踪
```

---

## 实验结论

- **数据集/场景**：挑战性的**体积云**场景（volumetric clouds）；
- **基线**：蒙特卡洛路径追踪 + MC 降噪管线；显式多次散射模拟；
- **结果**：
  - **实时性能** + 高重建精度；
  - 相机推近/拉远时**计算成本稳定**；
  - 对体积密度的依赖显著低于多次散射方法。

---

## 局限性

- 需要**训练数据**（离线渲染的路径追踪结果作为监督），依赖特定场景分布的泛化能力；
- "近充分"是**统计意义**上的论证，对极端光照/极稀疏介质可能失效；
- 抽象中**未给出与路径追踪的定量 PSNR/SSIM 对比细节**，需查阅正文；
- 未声明开源代码。

---

## 相关工作

- [[2026-09-25-DiffusionShadow]] — 基于扩散的神经体积渲染阴影缓存
- [[2026-07-13-Volumetric-Inverse-Rendering-Neural-Radiative-Transfer]] — 体积逆渲染
- [[2026-07-20-Lossless-INR]] — 无损体积隐式神经表示
- [[2026-11-05-Zhang-Cai-Huang-Ren-GauSmoke-Hybrid-Physics-Optical-Gaussian-Splatting]] — 烟雾体积密度场渲染

---

## 实现建议

- **实现难度**：🟡 中（需构建训练管线 + 渲染目标 + 注意力 I2I 网络）
- **预期性能**：**实时**（成本随分辨率而非体积复杂度/散射次数增长）
- **适用场景**：
  - ✅ **实时云层/烟雾渲染**（游戏/AR 天气系统）
  - ✅ 只需"看起来对"、不需要物理正确光传输的场景
  - ⚠️ 需要严格物理正确性（离线影视渲染）时仍需路径追踪
  - ⚠️ 高度依赖训练数据分布；换介质类型（云→火焰）需重训
