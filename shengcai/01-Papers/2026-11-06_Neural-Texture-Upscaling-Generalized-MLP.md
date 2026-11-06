---
type: paper
created: 2026-11-06
updated: 2026-11-06
tags: [paper, 渲染, 纹理, 纹理压缩, 神经纹理, MLP, 实时渲染, PBR, LPIPS, FLIP, AMD, TOG, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.07289
---

# Patch-Based Generalized Neural Texture Upscaling（广义神经纹理上采样：把 MLP 塞进纹理采样器）

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Patch-Based Generalized Neural Texture Upscaling |
| **作者** | Shin Fujieda, Takahiro Harada（**Advanced Micro Devices, Inc.**） |
| **发表** | arXiv 2026-11-05（cs.GR），Journal: **TOG**（ACM Transactions on Graphics） |
| **链接** | [原文](https://arxiv.org/abs/2611.07289) · [HTML](https://arxiv.org/html/2611.07289v1) |
| **DOI** | — |
| **代码** | 论文未提供公开仓库；作者用 **HIP**（AMD GPU 后端）实现渲染器验证 |

---

## 核心贡献

> **离线神经上采样太贵、神经纹理压缩（NTC）要逐资产训练且导致 GPU 执行发散**。本文训练**一个泛化的 MLP**（跨纹理集训练，不针对具体内容），把它**集成进纹理采样阶段**，在**渲染时**按需上采样低分辨率纹理——**无需修改纹理数据、无需修改资产管线、无需逐资产训练**，且因为**所有纹理共享同一套权重**，GPU 执行**始终不发散**。

1. **局部 patch 执行**：模型只上采样一小块 patch（$n=1$ → $3\times3$ 输入，$2\times2$ 输出），参数与算术量小到**可以直接写在 GPU shader 里**。
2. **残差连接**：先做**解析双线性上采样**恢复低频，再由 MLP 预测**高频残差** → MLP 只需学双线性插值恢复不了的部分，**学习问题被简化、收敛更快**。
3. **通用模型 vs 过拟合模型**的权衡分析：泛化模型在多数场景下可用；需要时也可退化为 per-class 过拟合模型（作者明确给出两者的选择依据）。
4. **PBR 三类纹理（diffuse / normal / ARM）统一模型**：作者用 Poly Haven 全量 D+N+A 训练**单一模型**，在所有测试集上使用。

---

## 技术方案

### 核心思想

**问题的三个来源**：

| 方法 | 优势 | 痛点 |
|------|------|------|
| 离线神经上采样（SRCNN/SwinIR/PFT） | 泛化，无需改内容管线 | **不能实时运行**（算力重、缺随机访问）；作为预处理后**高分辨率纹理仍要存进 VRAM** |
| **NTC**（Neural Texture Compression） | 采样时解码，同时省磁盘 + 省显存，PBR 通道相关性能利用好 | **逐纹理集过拟合**（管线开销）；每个纹理集一套权重 → **GPU wavefront 内执行发散**，不利于矩阵核（尤其非主材质路径上多纹理集同时激活） |
| **NTBC**（Neural Texture Block Compression） | 用标准硬件纹理单元解码，无运行时推理成本、无发散 | 输出必须符合块压缩约束 → **质量提升有上限**；同样**逐资产**、不能用于未修改的存量内容 |

**本文的定位**：牺牲压缩率，换取 **①泛化 ②管线兼容 ③统一 GPU 执行**。

> **可以直接把本文方法集成进现有游戏**——只要**替换纹理采样器**，无需修改纹理资产，就能获得更高质量的渲染。

### 关键技术

| 技术 | 说明 |
|------|------|
| **局部 patch 执行** | 输入低分辨率 patch $n\times n$，输出 $2n\times 2n$。为避免**块边界伪影**（patch 外的纹理模式不可见），输入每侧**外扩 $m$ 个 texel** 作上下文，输出时丢弃外扩部分。实验用 $n=1,\ m=1,\ c=3$ → $3\times3\times3$ 输入、$2\times2\times3$ 输出 |
| **边界处理** | 靠近纹理边界时缺失的 padding texel **镜像边界值**（假设纹理在边界处平滑） |
| **残差连接** | 先解析双线性上采样到输出分辨率 → 恢复低频；MLP 预测残差；最终输出 = 双线性结果 + 残差。**双线性已提供合理近似，MLP 只需学高频细节** |
| **MLP 结构** | 输入 flatten 成 $(n+2m)^2 c$ 维向量 → 线性投影到隐藏维 $d$ → $L$ 个残差块（每块：两层线性 + 中间 ReLU，加回输入作跳连，最后再过一个 ReLU，**并把值钳制不超过 1**）→ 输出层投影回 $2n\times2n\times c$ |
| **配置** | $d=256$、$L=4$、$n=1$、$m=1$ |
| **训练** | Adam，lr $10^{-3}$，可选 cosine annealing 衰减到 $10^{-6}$。**用 L1 损失**（作者发现比 MSE 产生**更锐利**的纹理重建） |
| **统一模型** | 用 Poly Haven 的 diffuse + normal + ARM 训练**单一模型**，在全部实验中使用。作者实测：按类别分别训练并非每类都最优（如 Museum 的 normal 纹理用纯 normal 训练效果反而不好），**D+N+A 统一训练是最佳平衡** |
| **纹理尺寸** | 实验纹理降采样到最高 $2048\times2048$ |

### 论文里一个很实用的「免费午餐」

> **本文方法的输入是 texel 本身**，所以可以在**不需要高质量的地方直接省略 MLP 执行**——例如**漫反射反射后的顶点**只采样低分辨率纹理即可。
> **NTC 做不到这一点**，因为它的 latent grid 必须先解码才能用。

这是一个被作者「没有探索」但写进论文的工程优化点。

---

## 代码片段

```python
# 网络结构（GPU shader 可直接实现）
# 输入: (n+2m)^2 * c  ->  hidden d  ->  L residual blocks  ->  2n*2n*c
def residual_block(x, W1, b1, W2, b2):
    h = relu(x @ W1 + b1)
    h = relu(x + (h @ W2 + b2))   # 跳连后仍要过 ReLU
    return clamp(h, max=1.0)      # 残差块后把值钳制不超过 1

# 残差连接（渲染时）
upscaled_bilinear = bilinear_upsample(input_patch)  # 低频
residual          = mlp(input_patch_flat)           # 高频
output            = upscaled_bilinear + residual

# 关键工程优化：漫反射反射的顶点直接跳过 MLP
if shading_lobe == DIFFUSE:
    color = sample_low_res_texture(uv)   # 免费
else:
    color = sample_low_res_texture(uv) + mlp(patch)
```

---

## 实验结论

- **数据集**: Poly Haven（Diffuse 565 / Normal 565 / ARM 563）、Hangar（45/44/45）、Victorian（37/36/36）、Museum（56/29/30）。Poly Haven 用作测试时**整个数据集划分**，训练数据**不见测试数据**
- **基线**: bilinear、bicubic、Lanczos（解析上采样）、**PFT**（SOTA 离线 ML 上采样器，作者实现，用作**最好情况参照**，因其复杂度与本文完全不同）

**关键方法论判断（值得抄）**：
> **PSNR/SSIM 不适合评价纹理上采样**。因为上采样结果**不保证逐像素准确**，而 PSNR 只看逐像素误差。论文明确指出：**很多情况下模糊纹理的 PSNR 高于锐利纹理，但视觉上前者质量更差**。
> 因此**以 LPIPS 为主指标**。这也解释了为什么下面 PSNR 差距不大而 LPIPS 差距很大。

**LPIPS 对比（越低越好，测试集平均）**：

| 数据集 / 类别 | 本文 | bilinear | bicubic | Lanczos | PFT |
|--------------|------|----------|---------|---------|-----|
| Poly Haven / Diffuse | **0.239** | 0.396 | 0.369 | 0.383 | 0.224 |
| Hangar / Diffuse | **0.075** | 0.193 | 0.156 | 0.157 | 0.043 |
| Hangar / Normal | **0.023** | 0.088 | 0.067 | 0.065 | 0.014 |
| Hangar / ARM | **0.041** | 0.094 | 0.068 | 0.065 | 0.024 |
| Victorian / Diffuse | **0.1026** | 0.2254 | 0.1895 | 0.1918 | 0.091 |
| Museum / Diffuse | **0.052** | 0.142 | 0.107 | 0.107 | 0.048 |
| Museum / Normal | **0.020** | 0.064 | 0.044 | 0.042 | 0.012 |

- **相对所有解析方法大幅领先**（通常 2–3× 更低 LPIPS）；**接近但不及 PFT**
- 部分纹理（Hangar normal、Victorian normal、Museum diffuse）**追平 PFT**

**PSNR / SSIM**：差距不大。例如 Hangar/Diffuse PSNR：本文 36.86 / bilinear 34.31 / bicubic 35.42 / Lanczos 35.64 / PFT 39.38；SSIM：0.954 / 0.929 / 0.942 / 0.944 / 0.969

**渲染端 FLIP 误差**（用不同纹理集渲染真实场景，AMD HIP 渲染器）：

| 场景 | 本文 | bicubic | bilinear |
|------|------|---------|----------|
| Hanger (Cam 1) | **0.0519** | 0.0573 | 0.0626 |
| Hangar (Cam 2) | **0.0415** | 0.0441 | 0.0473 |
| Hanger (Cam 3) | **0.0441** | 0.0470 | 0.0495 |

- 差异在**光泽反射**处最明显；**相机越靠近物体、纹理越清晰，差距越大**

**泛化 vs 过拟合（Tab. 4，LPIPS）**：

| 训练/测试 | D+N+A（泛化） | 过拟合 |
|-----------|---------------|--------|
| Hangar (D) | 0.076 | **0.059** |
| Hangar (N) | 0.023 | **0.020** |
| Victorian (D) | 0.103 | **0.091** |
| Museum (N) | **0.020** | 0.021 |
| Museum (A) | 0.032 | **0.026** |

- 过拟合**一致地带来提升**（少数例外如 Museum normal），但**增加内容管线开销** → 开发者可按场景**逐案选择**

**隐藏维消融（Tab. 5）**：

| 隐藏维 | 512 | 256 | 128 | 64 | 32 | 16 | 8 |
|--------|-----|-----|-----|----|----|----|---|
| Hangar (D) LPIPS | 0.075 | 0.075 | 0.078 | 0.083 | 0.090 | 0.086 | 0.079 |
| Hangar (N) LPIPS | 0.023 | 0.023 | 0.025 | 0.033 | 0.039 | 0.040 | 0.040 |

- **$d=64$ 之后收益就很小了** → 论文选 $d=256$ 留有余量
- 注意 $d=8$ 反而优于 $d=32/64$（Hangar D：0.079 vs 0.090/0.083）→ **该任务对模型容量不敏感，存在明显过拟合**

**与 NTC 对比**：NTC（PEPS，4 频率，11 维输入，64 隐层，4 隐藏层，$512\times512\times3$ latent grid）**仍优于本文与 PFT** —— 因为 NTC 是**直接对 GT 纹理做拟合压缩**，而本文只存低分辨率纹理。

---

## 局限性

- **压缩率不匹配 NTC**（作者主动承认的取舍）
- **亚像素尺度的细节无法凭空恢复**——源纹理里不存在的信息，任何上采样方法（包括 PFT）都恢复不出来
- 泛化模型在个别类别上过拟合不足（如 Museum normal）
- 未做 per-asset 过拟合时，质量低于 NTC
- 未报告显式的**运行时开销测量**（shader 内的 MLP 推理成本）—— 只有渲染端 FLIP 指标，没有 FPS/带宽数字

---

## 相关工作

- [[2026-11-06_HIBS-Hierarchical-Incremental-Beta-Splatting]]
- [[2026-11-06_T2-Splat-Adaptive-Topology-Mesh-Splatting]]
- NTC（Neural Texture Compression, Vaidyanathan et al. 2023）
- NTBC（Neural Texture Block Compression, Fujieda & Harada 2024）— **同一作者的前作**
- MATUP（Gauthier et al. 2024）、PBR-SR（Chen et al. 2025）— 均为 per-asset 优化
- PFT / SwinIR / SRCNN — 通用图像上采样

---

## 实现建议

- **实现难度**: **中**。数学很简单（残差 MLP），但要变成 GPU shader 需要处理：随机访问的 patch 取样、边界镜像、纹理格式（BC 压缩格式下的 texel 访问）、与 mipmap 链的协同
- **预期性能**: 感知质量（LPIPS）**大幅超越所有解析上采样**（2–3× 更低 LPIPS），接近 SOTA 离线模型 PFT；渲染端 FLIP 一致更优
- **适用场景**:
  - **游戏/实时渲染的纹理内存与带宽优化**（省磁盘 + 省 VRAM，无需改动资产管线）
  - 存量项目（无法重新烘焙纹理）的质量提升
  - 移动端 / 主机端纹理流式加载
- **可借鉴的通用技巧**:
  1. **解析基线 + 学习残差** — 当解析方法已给出合理低频近似时，学习部分只需预测残差，**学习问题被简化、收敛更快**。这个模式可迁移到任何「解析近似 + 学习增强」的场景（降噪、超分、材质合成）
  2. **局部 patch 执行** — 让神经网络小到能塞进 shader，是「神经方法进实时管线」的关键工程约束
  3. **泛化模型避免 GPU 发散** — 共享权重 → 无分支 → 矩阵核友好。**这是「神经纹理进游戏」的真正拦路虎，本文给出了一个绕开而非解决的方案**
  4. **L1 优于 MSE 用于纹理重建**（更锐利）
  5. **LPIPS 而非 PSNR** 评价纹理/图像增强 — 重要的评测方法论
  6. **按需跳过神经推理**（漫反射顶点不跑 MLP）— 免费优化
- **优先级建议**: 🟡 **P1** — 对做实时渲染引擎的团队价值高（尤其做纹理压缩/VRAM 优化的）；AMD 背景意味着方案偏 CUDA/HIP 风格，移植到其他后端需自行改写 shader
