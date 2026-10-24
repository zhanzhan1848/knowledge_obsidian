---
type: paper
created: 2026-10-24
updated: 2026-10-24
tags: [paper, gaussian-splatting, power-diagram, volumetric-rendering, feature-lifting, open-vocabulary, scanet, ov-foam, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.28131
---

# OV-Foam: How 3D Representations Shape Semantic Feature Lifting

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | OV-Foam: How 3D Representations Shape Semantic Feature Lifting |
| **arXiv ID** | [2610.28131](https://arxiv.org/abs/2610.28131) (cs.CV) |
| **作者** | Yousef Rajeh*, Alejandra Esparza Pelcastre, Ivan Viola, Dominik Engel（\*通讯） |
| **单位** | King Abdullah University of Science and Technology (KAUST) + Universidad Panamericana |
| **发表** | arXiv 预印本，2026-10-20（v1） |
| **链接** | [原文](https://arxiv.org/abs/2610.28131) |
| **DOI** | https://doi.org/10.48550/arXiv.2610.28131 |
| **代码** | 未在摘要中给出；基座表示为 PowerFoam（Govindarajan et al., 2026） |

---

## 核心贡献

> 证明**特征提升（feature lifting）的歧义主要由底层 3D 表示决定**：3DGS 的高斯大量重叠导致"每条 ray 上过多 primitive"，而 **PowerFoam 的 power diagram 空间划分实现了零重叠**，使最小二乘提升退化为精确解，扫描网语义显著提升。

1. **受控研究框架**：把"上游 2D 语义误差"与"提升过程误差"**分离**——用 GT 分割 + 文本特征替代预测的 SAM/CLIP 特征，单独度量表示本身引入的语义混合。
2. **表示诱导的离散度（dispersion）分析**：提出 ray 级离散度 $\beta_i$ 作为"单次估计 vs 最小二乘解"的差距度量，PowerFoam 的 $\beta_i$ 比 3DGS **低约 195 倍**。
3. **实证结论**：**每条 ray 上的 contributor 数量**从 3DGS 的 33.63 降到 PowerFoam 的 2.32——这是"提升等价于最小二乘"成立的**充要条件**。

---

## 技术方案

### 核心思想

开放词汇 3D 分割的"特征提升"（feature lifting）把 2D 图像特征反投影到 3D primitive 上。形式化后是一个**线性逆问题**：

- 观测矩阵 $A \in \mathbb{R}^{R \times P}$：$A_{ij}$ = primitive $j$ 对 ray $i$ 的贡献权重
- 图像特征 $B \in \mathbb{R}^{R \times F}$，primitive 特征 $X \in \mathbb{R}^{P \times F}$
- 最小二乘解 $\hat{X} = A^\dagger B$（Moore–Penrose 伪逆）

**关键洞察**：最小二乘形式**只有在"没有两条 primitive 共享同一条 ray"时才精确**。3DGS 的高斯大量重叠，每条 ray 上有 **33.63** 个非零 contributor → 未知特征被**耦合**，最小二乘退化为病态问题。

**解法**：改用**空间划分型 primitive**。PowerFoam 用 power diagram 划分空间，cell 内部**互不重叠**，每条 ray 上的 contributor 数降到 2.32。

### 关键技术

| 技术 | 说明 |
|------|------|
| **PowerFoam power cell** | $V_j = \{x : \|x-p_j\|^2 - a_j^2 \le \|x-p_k\|^2 - a_k^2\ \forall k\}$；渲染支撑 $C_j = V_j \cap \text{Sphere}(p_j, a_j)$ |
| **Dipole 边界 + 位移场** | 每个 cell 内一个偶极子定义有向边界（占用区满足 $(x-p_j)\cdot n_j < 0$），位移场可形变该边界；密度在占用区恒定 |
| **体渲染积分** | 与 3DGS 同构的 front-to-back 合成：$A_{ij} = T_{ij}\alpha_{ij}$、$T_{ij} = \prod_{k\prec_j}(1-\alpha_{ik})$、$F_i = \sum_j A_{ij}x_j$、$s_i = \sum_j A_{ij} \le 1$ |
| **SFS 单次估计** | $x'_j = \frac{\sum_i A_{ij}B_i}{\sum_i A_{ij}}$，$X' = D^{-1}A^\top B$，$D = \text{diag}(A^\top \mathbf{1})$ |
| **离散度 $\beta_i$** | $\mu_i = \sum_j A_{ij}\Delta_{ij}$，$\beta_i = \frac{\sum_j A_{ij}(\Delta_{ij}-\mu_i)^2}{\mu_i^2}$，$\Delta_{ij} = \|\hat{x}_j - B_i\|_2$ |
| **Tile-based rasterization** | PowerFoam 的 bounded cell 天然支持 tile 光栅化（论文强调这是它适合作对比研究的原因） |

### 关键公式

```math
% PowerFoam 的 power cell 与渲染支撑
V_j = { x : ||x - p_j||_2^2 - a_j^2 <= ||x - p_k||_2^2 - a_k^2  for all k }
C_j = V_j ∩ Sphere(p_j, a_j)

% 体渲染（连续特征场 f : R^3 -> R^F）
F_i = ∫_{tn}^{tf} T_i(t) σ(r_i(t)) f(r_i(t)) dt
T_i(t) = exp( -∫_{tn}^{t} σ(r_i(s)) ds )

% 离散化：每 primitive 恒定密度 + 恒定特征
α_ij = 1 - exp(-σ_j ℓ_ij)          % ℓ_ij = 占用段长度
A_ij = T_ij α_ij
T_ij = ∏_{k≺ij} (1 - α_ik)
F_i = Σ_j A_ij x_j,   s_i = Σ_j A_ij <= 1
（等价：s_i = 1 - ∏_j (1 - α_ij)）

% 特征提升：最小二乘逆问题
X̂ = argmin_X L(X),  L(X) = (1/2)||AX - B||_2^2
X̂ = A† B

% SFS 单次估计（可分离目标的最小化）
x'_j = (Σ_i A_ij B_i) / (Σ_i A_ij),  X' = D^{-1} A^T B,  D = diag(A^T 1)
其分离目标: J(X) = (1/2) Σ_{i,j} A_ij ||x_j - B_i||_2^2

% ray 级离散度
Δ_ij = ||X̂_j - B_i||_2
μ_i = Σ_j A_ij Δ_ij
β_i = Σ_j A_ij (Δ_ij - μ_i)^2 / μ_i^2
```

> **重要理论细节**（论文明确指出）：SFS 单次估计**仅在"每条 ray 有一个完全吸收的 contributor"时**才是精确最小二乘解。即便单 contributor，弱 opacity 也不保证等价——因为 Eq.5 用 $\sum_i A_{ij}$ 归一化，而正规方程用 $\sum_i A_{ij}^2$，**两者仅在每个 $A_{ij} \in \{0,1\}$ 时一致**。

---

## 实验结论

- **数据集**: ScanNet 10 个场景（GT 顶点初始化，每顶点一个 primitive，遵循 OpenGaussian 协议）；LERF 4 场景（文本查询评测）
- **基线**: 3DGS（相同 lifting 过程、相同 SAM/CLIP 图像特征）、VALA、Occam's LGS、SFS、LUDVIG、LERF

### 表 1：离散度与 ray 贡献数（10 场景平均）

| 表示 | PSNR ↑ | contributor 数 $k_i$ ↓ | 离散度 $\beta_i$ ↓ |
|------|--------|------------------|-------------------|
| **PowerFoam** | **27.01** | **2.32** | **0.0080** |
| 3DGS | 25.22 | 33.63 | 1.5554 |

- **contributor 数减少 14.5×**，**离散度降低约 195×**，且 **PSNR 反而更高**（+1.79 dB）
- **拟合差距**（单次估计 vs 数值收敛的最小二乘参考，按 ray 平均）：3DGS **4.663×10⁻³** → PowerFoam **8.352×10⁻⁴**，**降低 82.1%**；10 个场景中 PowerFoam 的差距与单次损失均更小（但 3DGS 的最小二乘参考损失更低）

### 表 2：GT 图像语义提升（受控实验）

| 表示 | Point accuracy | mIoU | Geom UB mIoU |
|------|----------------|------|-------------|
| **PowerFoam** | **96.37** | **90.59** | 98.13 |
| 3DGS | 94.25 | 85.40 | 98.92 |

- PowerFoam 在**全部 10 个场景** mIoU 更高，且优势**不能用几何上界解释**（3DGS 的 Geom UB 甚至更高）→ 增益确实来自**提升/分配质量**而非几何差异

### 表 3：ScanNet 开放词汇分割（mIoU / mAcc %）

| 方法 | 19 类 mIoU | 19 类 mAcc | 15 类 mIoU | 15 类 mAcc | 10 类 mIoU | 10 类 mAcc |
|------|----------|----------|----------|----------|----------|----------|
| VALA (3DGS) | 30.08 | 47.57 | 32.70 | 52.00 | 39.56 | 60.35 |
| VALA (OV-Foam) | **33.68** | **51.18** | **37.15** | **56.08** | **45.68** | **65.39** |
| Δ | +3.60 | +3.61 | +4.45 | +4.08 | **+6.12** | +5.04 |
| Occam's LGS (3DGS) | 32.76 | 50.40 | 35.62 | 55.24 | 43.94 | 64.66 |
| Occam's LGS (OV-Foam) | 34.19 | 52.34 | 37.58 | 57.46 | 46.46 | 66.64 |
| Δ | +1.43 | +1.94 | +1.96 | +2.22 | +2.52 | +1.98 |
| SFS (3DGS) | 32.03 | 49.29 | 35.41 | 54.78 | 44.34 | 64.24 |
| SFS (OV-Foam) | 34.00 | 51.75 | 37.59 | 57.43 | 46.91 | 66.64 |
| Δ | +1.97 | +2.46 | +2.18 | +2.65 | +2.57 | +2.40 |
| LUDVIG (3DGS) | 32.94 | 50.36 | 36.58 | 56.22 | 45.64 | 65.43 |
| LUDVIG (OV-Foam) | **34.58** | **52.14** | **38.11** | **57.84** | **47.59** | **67.04** |
| Δ | +1.64 | +1.78 | +1.53 | +1.62 | +1.95 | +1.61 |

- **所有 4 种 lifting 方法换成 PowerFoam 后全部提升**，提升幅度 **+1.43 ~ +6.12 mIoU**
- **类数越少提升越大**（10 类时 +2.5 ~ +6.1，19 类时 +1.4 ~ +3.6）——类别少时单个 primitive 的语义纯度对分割质量更敏感

### 表 4：LERF 文本查询评测

- 4 场景上的 mean IoU / mean accuracy，PowerFoam 全面优于 3DGS（详见论文 Table 4）

---

## 局限性

- **依赖 PowerFoam**：全部增益均来自把底层表示换成 PowerFoam，**不是**改进 lifting 算法本身。PowerFoam 自身的重建质量、训练成本、以及与 3DGS 的等算力对比是前置条件（本文用相同 GT 顶点初始化 + 固定 primitive 数控制了这一点）
- **PowerFoam 的表达力限制**：power diagram + 偶极子边界 + 位移场的形变自由度，与 3DGS 各向异性高斯不同，非所有场景都适合
- **最小二乘参考本身在 3DGS 上更优**：论文明确 3DGS 达到更低的最小二乘参考损失（$L(\hat{X})$）——即 3DGS 的**潜在上限更高**，只是单次估计逼近不了。PowerFoam 的优势是**更容易被单次估计逼近**
- **上游特征仍是瓶颈**：即使换表示，若 SAM/CLIP 特征本身错误，提升也无从恢复（论文用 GT 特征做了隔离实验，但真实数据下仍有差距）
- **受控实验与真实数据的落差**：表 2 的 GT 特征 mIoU 90.59 vs 表 3 真实特征 34–47，差距巨大
- **评估规模有限**：ScanNet 10 场景 + LERF 4 场景，未覆盖大规模室内外场景

---

## 相关工作

- [[PowerFoam]] — Govindarajan et al., 2026：底层表示，bounded power diagram + dipole
- [[SFS-Feature-Solver]] — Xiong et al., 2026：把特征提升形式化为线性逆问题，本文直接引用并扩展
- [[OpenGaussian]] — Wu et al., 2024：ScanNet 10 场景评测协议来源
- [[Semantic-Foam]] — Sharafeldin et al., 2026：学习式语义 foam（场景身份而非文本对齐，不可直接比较）
- [[ValA]] — Wang et al., 2026
- [[LUDVIG]] — Marrie et al., 2025
- [[Occams-LGS]] — Cheng et al., 2025
- [[LERF]] — Kerr et al., 2023
- [[VisibilitySplat]] — 本库已有（ray-traced occlusion for relighting）
- [[H-2DGS]] — 本库已有（高度场 GS，同样是"3DGS → 显式几何表示"的转换路线）

---

## 实现建议

- **实现难度**: **中**（不需要新算法，主要是把现有 lifting 方法的底层表示从 3DGS 换成 PowerFoam；但需要先获得并跑通 PowerFoam）
- **预期性能**: ScanNet 开放词汇分割 **+1.4 ~ +6.1 mIoU**（视类集与 lifting 方法而定）；受控实验中 GT 特征 mIoU 85.40 → 90.59；重建 PSNR 25.22 → 27.01
- **适用场景**: 需要开放词汇语义 / 场景理解的下游任务（机器人操作、场景分割、3D 检索）；**同时受益于"零重叠"带来的可微性**
- **可直接借鉴的算法洞察**（**不依赖 PowerFoam 也成立**）：
  1. **"每条 ray 的 contributor 数"是提升质量的可诊断指标**——本库所有基于 3DGS 的工作（VisibilitySplat、H2-Ray、Cross-Ray NeRF 等）都可以用 $k_i$ 量化各自的"隐式重叠度"
  2. **最小二乘等价条件**：$\sum_i A_{ij}$ vs $\sum_i A_{ij}^2$ 的归一化差异，提示**任何加权反投影方法都应检查其归一化项是否与目标函数一致**——这是一个**低成本的可审计点**
  3. **零重叠表示对可微性友好**：本库若在做可微渲染/可微 lifting，power-diagram 型表示可能比 GS 更利于梯度传播（无重叠 → 无重复计数）
- **优先级**: **高**（对"3DGS 表示的表示层改进"这一路线有直接方法论价值；且与本库已有的 H-2DGS 形成互补——一个走"显式曲面"，一个走"空间划分"）
