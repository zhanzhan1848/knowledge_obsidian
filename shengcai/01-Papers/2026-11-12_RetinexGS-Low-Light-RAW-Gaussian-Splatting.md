---
type: paper
created: 2026-11-12
updated: 2026-11-12
tags: [paper, 3DGS, 低光照, RAW, 噪声建模, 逆渲染, 实时渲染]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.13280
---

# RetinexGS: Retinex-Inspired Gaussian Splatting for Low-Light RAW Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | RetinexGS: Retinex-Inspired Gaussian Splatting for Low-Light RAW Reconstruction |
| **作者** | Yulang Fei, Huaiyuan Weng, Chul Min Yeum |
| **单位** | University of Waterloo, Canada |
| **发表** | arXiv preprint (cs.CV), 2026-11-09 |
| **链接** | [原文](https://arxiv.org/abs/2611.13280) · [HTML全文](https://arxiv.org/html/2611.13280v1) |
| **DOI** | arXiv:2611.13280 |
| **代码** | 未提供（论文未附代码链接） |

---

## 核心贡献

> **在低光照下，3DGS 崩掉的根因是"用一份共享颜色去解释所有噪声观测"——RetinexGS 把颜色分解为「可独立约束的基色 × 场景共享的调制场」，并用传感器 DNG 噪声元数据做异方差加权监督。**

1. **Retinex 式外观分解（Factorized Appearance）**：每个 Gaussian 的线性 RAW 颜色 = **视角无关基色 R_i** × **场景共享网络预测的调制 L_i(μ_i, d_i)**。两者**分别正则化**，从而可以用各自适配的先验约束噪声下的颜色估计。
2. **传感器信息化监督（Sensor-Informed Supervision）**：从 DNG `NoiseProfile` 推导**逐通道、信号相关**的重建权重（Poisson–Gaussian 噪声模型）；**镜头畸变在光栅化器内建模**，使损失直接计算在**原始 packed RAW 网格**上，无需空间重采样。
3. **深度引导初始化**：在 SfM 点稀疏的暗区，用单目深度先验补充初始化点。
4. **命题 1（乘法与 alpha 合成不可交换）**——证明"逐 Gaussian 相乘后再合成"与"分别光栅化后在图像空间相乘"**一般不等**，并给出相等条件。

---

## 技术方案

### 核心思想

Retinex 理论把外观建模为 **反射率 × 照度** 的乘积。RetinexGS 在线性 RAW 空间中做**乘性**结构化：

```
C_i = R_i ⊙ L_i(μ_i, d_i)
```

- `R_i`：逐 Gaussian 可训练的 log-color（视角无关基色）
- `L_i`：**一个共享网络** φ_L 从 Gaussian 位置 + 视角方向预测（场景内所有 Gaussian 共享）→ 捕捉平滑的空间+视角变化
- 乘积在 **alpha 合成之前** 逐 Gaussian 形成

**为什么要分解？** 因为乘性表示存在**尺度歧义**（(R_i, L_i) → (t·R_i, L_i/t) 不改变 C_i）。分解的价值不在表示能力，而在于**让两个因子能被分开约束**——这才是它对抗噪声的关键。

### 关键技术表

| 技术 | 说明 |
|------|------|
| **Log-color 参数化** | `R_i = exp(clamp(c_i, -∞, 3])`，初值由 SfM 的 RAW 颜色映射得到 |
| **共享调制网络 φ_L** | 输入正弦编码的 (γ_x(μ_i), γ_d(d_i))，softplus + clamp[0.05, 10]，输出偏置初始化使 L_i ≈ 1 |
| **因子专属正则** | λ_anc·L_anc（调制幅度近单位）+ λ_R·L_smooth^R + λ_L·L_smooth^L + λ_chr·L_smooth^chr（log 基色、log 调制幅度、调制色度的 3D 邻域局部一致性） |
| **Poisson–Gaussian 噪声模型** | `y_c ~ N(μ_c, a_c·μ_c + b_c)`，a_c/b_c 来自 DNG NoiseProfile |
| **Bayer packing 噪声传播** | 2×2 块内两个绿色光位取平均（假设独立同参噪声）→ `a_G = a_green/2, b_G = b_green/2` |
| **曝光归一化噪声变换** | `y' = y/e, a' = a/e, b' = b/e²`（线性缩放下噪声模型的引理 1） |
| **异方差加权** | 用目标图像的 5×5 AvgPool(|y_c|) 作非负局部信号估计 |
| **畸变感知光栅化** | 畸变建入投影后的 Gaussian 中心与协方差足迹 → 免去目标图像的 undistort 重采样 |
| **深度引导初始化** | 冻结的单目深度先验 + 畸变感知反投影，在 SfM 稀疏的暗区补点 |
| **对数域重建损失** | 结合 DNG 噪声加权 + log-domain 重建损失 |

---

## 公式

```math
% 3DGS alpha 合成（论文 Eq.1）
C(\mathbf{u})=\sum_i T_i(\mathbf{u})\,\alpha_i(\mathbf{u})\,C_i,
\qquad T_i(\mathbf{u})=\prod_{j<i}(1-\alpha_j(\mathbf{u}))
```

```math
% Retinex 式外观分解
R_i=\exp\!\big(\operatorname{clamp}_{(-\infty,3]}(c_i)\big)
L_i(\boldsymbol{\mu}_i,\mathbf{d}_i)
=\operatorname{clamp}_{[0.05,10]}\!\left[\operatorname{softplus}\!\big(\phi_L(\gamma_x(\boldsymbol{\mu}_i),\gamma_d(\mathbf{d}_i))\big)\right]
C_i=R_i\odot L_i(\boldsymbol{\mu}_i,\mathbf{d}_i)
```

```math
% 命题 1：乘法与 alpha 合成不可交换
C_{\mathrm{prim}}=\sum_i w_i\,(R_i\odot L_i)
\qquad\neq\qquad
C_{\mathrm{img}}=\left(\sum_i w_i R_i\right)\odot\left(\sum_i w_i L_i\right),
\qquad w_i=T_i\alpha_i
```

```math
% 因子专属正则
\mathcal{L}_{\mathrm{reg}}
=\lambda_{\mathrm{anc}}\mathcal{L}_{\mathrm{anc}}
+\lambda_{R}\mathcal{L}_{\mathrm{smooth}}^{R}
+\lambda_{L}\mathcal{L}_{\mathrm{smooth}}^{L}
+\lambda_{\mathrm{chr}}\mathcal{L}_{\mathrm{smooth}}^{\mathrm{chr}}
```

```math
% Poisson–Gaussian 传感器噪声
y_c\sim\mathcal{N}(\mu_c;\;a_c\mu_c+b_c)
% Bayer packing（两个绿色光位平均）
a_G=\frac{a_{\mathrm{green}}}{2},\qquad b_G=\frac{b_{\mathrm{green}}}{2}
% 曝光归一化 e
y'_c=\frac{y_c}{e},\qquad a'_c=\frac{a_c}{e},\qquad b'_c=\frac{b_c}{e^{2}}
```

---

## 代码片段

```python
# 因子化外观：基色 × 共享调制场
def gaussian_color(i, mu_i, d_i, c_log, phi_L, gamma_x, gamma_d):
    # 逐 Gaussian log-color（视角无关基色）
    R_i = torch.exp(torch.clamp(c_log[i], max=3.0))
    # 场景共享调制网络（位置 + 视角方向）
    L_i = torch.clamp(
        torch.nn.functional.softplus(
            phi_L(torch.cat([gamma_x(mu_i), gamma_d(d_i)], dim=-1))
        ),
        min=0.05, max=10.0
    )
    # 乘积在 alpha 合成之前形成（ Proposition 1: C_prim != C_img ）
    return R_i * L_i

# 注意：这里必须逐 Gaussian 相乘后再进光栅化。
# 若改成分别光栅化 R 和 L 再在图像空间相乘，得到的是 C_img，与上式不等价。
```

```python
# DNG 噪声元数据 → 逐通道异方差权重
import struct

def read_dng_noise_profile(path):
    """从 DNG 解析 NoiseProfile（tag 0xC68B）→ (a_c, b_c) per channel."""
    # 每个通道两个 uint32: a = a_num/a_den, b = b_num/b_den
    ...
    return {c: (a_num / a_den, b_num / b_den) for c, (a_num, a_den, b_num, b_den) in rows}

def build_weights(y_raw, a_c, b_c, exposure_e):
    """计算逐像素、逐通道的逆方差权重。"""
    # 1) Bayer packing：两个绿色光位平均 → a,b 减半
    a_G, b_G = a_c['G'] / 2.0, b_c['G'] / 2.0
    # 2) 曝光归一化
    a, b = a_G / exposure_e, b_G / (exposure_e ** 2)
    # 3) 非负局部信号估计（5x5 AvgPool）
    y_bar = F.avg_pool2d(y_raw.abs(), kernel_size=5, stride=1, padding=2)
    # 4) 方差 = a*mu + b，权重 = 1/variance
    var = a * y_bar + b
    return 1.0 / var
```

```python
# 畸变感知光栅化：免去目标图像的空间重采样
def project_with_distortion(mu, cov, K, dist_coeffs):
    """
    先把 3D Gaussian 中心投到畸变归一化坐标，
    再把畸变建入投影后的中心与协方差足迹。
    这样损失可直接在 packed RAW 网格上计算。
    """
    # 1) 常规线性投影 → 归一化坐标
    x_n = K @ mu
    # 2) 应用径向+切向畸变 → 畸变归一化坐标
    x_d = apply_radial_tangential(x_n, dist_coeffs)
    # 3) 雅可比 J = d(x_d)/d(x_n) 作用到 2D 协方差足迹
    cov_2d = K @ cov @ K.T
    cov_2d_dist = J @ cov_2d @ J.T
    return x_d, cov_2d_dist
```

```python
# 深度引导初始化：在 SfM 稀疏的暗区补点
def augment_init_with_depth(sfm_points, depth_prior, mask_sparse, K, dist):
    """
    mask_sparse: 标记 SfM 点覆盖不足的暗区
    用冻结单目深度先验 + 畸变感知反投影补充初始化点
    """
    # 单目深度需先对齐到 SfM 点的尺度
    depth_aligned = align_scale_shift(depth_prior, sfm_points, mask_sparse)
    # 畸变感知反投影到世界坐标
    new_pts = unproject_with_distortion(depth_aligned, K, dist)
    return np.concatenate([sfm_points, new_pts[mask_sparse]])
```

---

## 实验结论

- **数据集**: 3 个公开 RawNeRF 场景 + 2 个自采低光照 RAW 场景（共 5 个）
- **基线**: LE3D、RawNeRF、Raw3DGS、HDRSplat（保留其原生 PMRID 预处理）
- **结果**:
  - **5 场景平均 sRGB PSNR 超 LE3D 达 +2.18 dB，超 RawNeRF 达 +2.71 dB**
  - **每个评测场景上 affine-sRGB PSNR 均为最高**，5 场景平均亦最高
  - **仅 15,000 次迭代**即达最优（Gaussian 基线需 30,000 次）→ **训练时间减半**
  - **实时渲染：91–145 FPS @ 2016×1512（单张 RTX 4090）**
  - RetinexGS / LE3D / Raw3DGS 使用**完全相同的 half-pack 输入**做公平对比
  - 消融：逐 Gaussian 合成（primitive-level）比图像空间合成（image-space）质量相当，但**训练时间约减半**

---

## 局限性

- **仅支持 RAW 输入**——需要相机 DNG 元数据（NoiseProfile），普通 sRGB/JPEG 素材无法直接使用
- **需要** RawNeRF / LE3D 的 packed RAW 预处理管线，工程链条较长
- 场景共享调制网络 φ_L 的容量有限，对**剧烈视角相关效应**（镜面、各向异性高光）的表达力可能不足——本文聚焦漫反射低光照场景
- 深度先验（Depth Anything 3 类）引入额外误差源，且尺度对齐依赖 SfM 点
- 未覆盖**动态场景**、未报告 PSNR 之外的深度质量指标
- 无代码公开

---

## 相关工作

- [[2026-11-01_AbacusGS-Gaussian-Splatting-without-Per-Splat-Sorting]] — 3DGS 排序优化
- [[2026-11-09_SM-Level-Load-Imbalance-3DGS-Persistent-Kernel-Scheduling]] — 3DGS GPU 调度
- [[2026-11-07_PLS-GS-Probabilistic-Lidar-Scaffolds]] — LiDAR 引导的 GS 几何
- [[2026-11-05_Recurrent-Dynamic-Range-Extension-HDR-Reconstruction]] — HDR 重建
- [[2026-07-07_RawNeRF-Noisy-RAW-GT]] — RAW 域重建基础
- [[2026-07-07_LE3D-Real-Time-Gaussian-RAW-Rendering]] — LE3D 基线

---

## 实现建议

- **实现难度**: **中高**（需要 RAW 解码 + DNG 元数据解析 + 畸变感知光栅化改造 + 因子化外观 + 深度引导初始化，五个组件都要落地）
- **预期性能**:
  - 质量：+2.18 dB（vs LE3D）/ +2.71 dB（vs RawNeRF）
  - 训练：15k 迭代（基线 30k）→ **训练时间减半**
  - 渲染：**91–145 FPS @ 2016×1512（RTX 4090）**——远高于实时需求
- **适用场景**:
  - ✅ **夜间/弱光场景的 3D 重建**（安防、监控、夜间驾驶、夜景摄影）
  - ✅ **手机/相机 RAW 素材的直接重建**（避免 sRGB ISP 预处理）
  - ✅ **低照度 VR/AR 场景捕获**
  - ❌ 不适用于常规明亮场景——RAW 管线带来的复杂度不划算
- **对墨鱼丸的建议**: 三条可直接复用的思想（即使不做 RAW）：
  1. **因子化外观 + 因子专属正则**——把「视角相关项」与「视角无关项」分开平滑，是抑制噪声驱动的浮点伪影（floaters）的通用手法
  2. **命题 1 的非交换性**——任何「先合成再变换」vs「先变换再合成」的设计都要警惕这个陷阱
  3. **畸变建入光栅化器**而非预处理去畸变——避免了对监督目标的空间重采样，保留原始像素对齐

---

## 与团队协作

- **可传递给 @墨鱼丸**: 异方差加权实现、因子专属正则的四项定义、畸变感知投影的雅可比传播
- **可反馈 @吊龙（后端）**: RAW 解码与 DNG 元数据解析的服务化
