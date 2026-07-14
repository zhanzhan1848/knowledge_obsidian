---
tags: [渲染, 3DGS, 屏幕空间伪影, 神经渲染, 去噪, 2026]
date: 2026-07-14
status: 已读
review: 待深入
---

# SSA-3DGS: Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting

## 元信息

| 标题 | SSA-3DGS: Unsupervised Removal of Screen-Space Artifacts for 3D Gaussian Splatting |
|------|------|
| 作者 | Kristof Overdulve, Lode Jorissen, Nick Michiels |
| 机构 | Digital Future Lab, Flanders Make, Hasselt University |
| 链接 | [arXiv:2607.05598](https://arxiv.org/abs/2607.05598) |
| 领域 | cs.GR, cs.CV |
| 日期 | 2026-07-06 |

## 核心贡献

1. **无监督屏幕空间伪影去除**：无需监督或手动输入即可分离 3D 场景与 2D 屏幕空间伪影
2. **联合优化框架**：同时优化 3D 场景和高斯 + 可学习的 2D 覆盖层（共享所有训练视图）
3. **正则化方案**：稀疏性 + Total Variation 约束，防止覆盖层吸收有效场景细节
4. **自采集真实数据集**：提供含真实物理伪影的真实世界数据集

## 问题定义

**屏幕空间伪影**：固定在 2D 图像平面而非 3D 世界坐标系的静态遮挡物
- 物理传感器缺陷（坏点、灰尘）
- 环境遮挡（镜头上的雨/泥）
- 采集遮挡（手指、仪表盘）
- 数字覆盖（水印、时间戳、UI）

关键问题：标准 3DGS 将伪影错误地 baked 进入 3D 几何，产生"浮子"(floaters) 或近相机伪影

## 技术方案

### 3D Gaussian Splatting 基础

每个 3D 高斯 $G_k$ 定义为：
- 中心位置 $\mu_k \in \mathbb{R}^3$
- 协方差矩阵 $\Sigma_k$
- 不透明度 $\alpha_k \in [0,1]$
- 视角相关颜色 $c_k$（球谐函数）

渲染公式（alpha-blending）：
```math
\hat{C}_{3D}(\mathbf{u}) = \sum_{i \in \mathcal{N}} c_i \alpha_i \prod_{j=1}^{i-1}(1 - \alpha_j)
```

### 屏幕空间伪影建模

引入两层覆盖模型：
- **Artifact Color Map** $W \in \mathbb{R}^{H \times W \times 3}$：伪影 RGB 颜色
- **Artifact Alpha Matte** $A \in \mathbb{R}^{H \times W \times 1}$：逐像素不透明度

最终像素颜色（alpha-blend）：
```math
\hat{C}(\mathbf{u}) = A(\mathbf{u}) \cdot W(\mathbf{u}) + (1 - A(\mathbf{u})) \cdot \hat{C}_{3D}(\mathbf{u})
```

### 损失函数

```math
\mathcal{L} = \mathcal{L}_{rgb} + \lambda_{sparse}\mathcal{L}_{sparse} + \lambda_{tv}\mathcal{L}_{TV}
```

- **光度损失** $\mathcal{L}_{rgb}$：L1 + SSIM
- **稀疏性正则** $\mathcal{L}_{sparse} = \text{mean}_{\mathbf{u}}|A(\mathbf{u})|$：鼓励伪影密度稀疏
- **TV 正则** $\mathcal{L}_{TV} = \sum_{d \in \{x,y\}} \text{mean}_{\mathbf{u},c}|M_c(\mathbf{u}+\mathbf{e}_d) - M_c(\mathbf{u})|$：促进覆盖层空间平滑

## 实验结果

- 在合成 corruption 和真实数据集上，PSNR 提升最高 **9 dB**
- 成功保留伪影的同时恢复干净 3D 场景
- 支持 ADC 和 MCMC 两种 densification 策略

## 局限性

- TV 正则假设低空间频率：高频率伪影（如坏点）与此假设不一致
- 需要多视角输入，单一视角不足以区分伪影和场景

## 评估

- **创新性**：⭐⭐⭐⭐（问题定义独特，无监督解耦思路清晰）
- **实用性**：⭐⭐⭐⭐⭐（直接改善 3DGS 实用性的问题）
- **难度**：中（基于 3DGS 扩展，优化目标明确）

## 链接

- PDF： https://arxiv.org/pdf/2607.05598
