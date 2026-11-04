---
type: paper
created: 2026-11-04
updated: 2026-11-04
tags: [paper, 渲染, Gaussian-Splatting, 压缩, 视频编解码, HEVC, VVC, PLAS, MiniPLAS, Spherical-Harmonics, PCA, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.05359
---

# GSCV++: Lightweight 3D Gaussian Splatting Sequence Compression via Standard Video Codecs

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GSCV++: Lightweight 3D Gaussian Splatting Sequence Compression via Standard Video Codecs |
| **作者** | Qi Yang, Yingzhan Xu, Kai Zhang, Li Zhang |
| **发表** | arXiv 2026-11-03（cs.CV） |
| **链接** | [原文](https://arxiv.org/abs/2611.05359) |
| **DOI** | — |
| **代码** | 论文未声明开源；引用了 Fraunhofer HHI 的 [PLAS](https://github.com/fraunhoferhhi/PLAS) 仓库 |

---

## 核心贡献

> 把 **3DGS 序列压缩**整条流水线（预处理 → 3D-2D 映射 → 编码）全部对齐到**标准视频编解码器**（HEVC/H.265、VVC/H.266、H.264），相对 GSCV 取得 **帧内 −24.5% ~ −39.6%**、**帧间 −68.7% ~ −109.9%** 的 BD-rate 增益，同时 2D 映射生成快 **5.1–5.4×**。

1. **EA-SHDR**（Energy-Adaptive inter-frame SH AC Dim. Reduction）：用 **I 帧单一 PCA 基** 对 45 通道球谐 AC 系数降维，全 GOP 复用同一基 → 压缩后 latent 空间时序稳定、可被视频编码器帧间预测。
2. **P-MiniPLAS**（Prior-based Inter-MiniPLAS）：基于「数据量 + QP」先验的**通道加权** PLAS + **局部 4 像素组**的 24 排列搜索，替代全局 Inter-PLAS → 2D 映射更快、更平滑。
3. **CA-GC**（Content-Aware Generalized Compression）：坐标**非均匀位深拆分**（默认 16:4）+ 编码单元（CU）尺寸与 MBS 联动 → 在不改动视频标准的前提下榨取编解码器性能。

---

## 技术方案

### 核心思想

GSCV++ 是对既有 GS 序列的**免训练**压缩流水线：**不重训、不优化** GS 表示，而是把 GS 属性转成 2D 特征图，再交给标准视频编解码器压缩。

三大模块对应流水线的三个阶段：

```text
3DGS 序列
   │
   ├─ [1] 预处理：EA-SHDR ──────► 紧凑稳定的时序 SH AC latent 空间
   │                                  (A=0.99 累计方差, k=3⌈k*/3⌉)
   ├─ [2] 3D→2D 映射：P-MiniPLAS ─► 平滑、编解码友好的 2D 特征图
   │                                  (先验加权 + 局部 4! 排列搜索)
   └─ [3] 压缩：CA-GC ──────────► 视频码流 (HEVC / VVC / H.264)
                                          (非均匀位深拆分 + CU 控制)
```

### EA-SHDR：能量自适应的帧间 SH AC 降维

**动机**：45 通道颜色 SH AC 系数占 GS 数据大头且高度冗余。但若对每个 P 帧**独立**做 PCA，各帧主方向不一致，会同时损害 (a) Inter-MiniPLAS 的 P↔I 属性匹配、(b) 视频编解码器的帧间预测。因此**只在 I 帧估计 PCA 基**，全 GOP 复用。

**步骤 1 — I 帧基估计**（$N$ = I 帧 primitive 数，$G_{\mathrm{AC}}^{I}\in\mathbb{R}^{N\times45}$）：

```math
G_{\mathrm{AC}}^{I} - \mathbf{1}_N\mu_I = U_I\Sigma_I V_I^{T}
```

$V_I\in\mathbb{R}^{45\times45}$ 的列 $v_i$ 为主方向，奇异值 $\sigma_i^I$ 降序。

**步骤 2 — 能量自适应选维**（目标保留方差比例 $A\in(0,1]$）：

```math
\lambda_i = \frac{(\sigma_i^I)^2}{N-1}
```

```math
k^* = \min\Big\{ d\in\{1,\dots,45\} : \frac{\sum_{i=1}^{d}\lambda_i}{\sum_{i=1}^{45}\lambda_i} \ge A \Big\}
```

**步骤 3 — 三通道打包**：$k = 3\lceil k^*/3\rceil$（凑满 3 的倍数，无需 padding 即可打包成三通道图）。

**投影与重建**（P 帧用同一基）：

```math
z_{\mathrm{AC}}^{I} = G_{\mathrm{AC}}^{I}V_{I,k} \in \mathbb{R}^{N\times k}
```

```math
z_{\mathrm{AC}}^{P} = (G_{\mathrm{AC}}^{P} - \mathbf{1}_N\mu_I)V_{I,k}
```

```math
G_{\mathrm{AC}}^{b} = z_{\mathrm{AC}}^{b}(V_{I,k})^{T} + \mathbf{1}_N\mu_I
```

**默认** $A=0.99$。

### P-MiniPLAS：先验加权的 3D→2D 映射

**两阶段 Morton 初始化**：先算 3D Morton 码（$x,y,z$ 二进制交织）排序 primitive，再按 2D Morton 扫描序排布 → 得到块状空间结构、块内内容平滑。

**先验加权**：vanilla PLAS 对所有属性通道等权；GSCV++ 按属性组分配缩放因子：

```math
W_a = f_1(D_a)\,f_2(QP_a)
```

```math
f_1(D_a) = BD_a \cdot CH_a \quad (\text{bit depth} \times \text{channel count})
```

```math
f_2(QP_a) = \frac{1}{Q_{\mathrm{step}}^a} = 2^{\frac{4-QP_a}{6}}
```

近似码率模型：

```math
R_a \approx K_a f_2(QP_a)^{\beta_a} = K_a 2^{\frac{\beta_a(4-QP_a)}{6}}
$$

归一化属性值乘 $W_a$ 后再算平方距离置换代价 → 该属性对 PLAS 代价的贡献正比于 $W_a^2$。

**加权先验原则**：数据量大的属性 → 更平滑的映射（省更多比特）；QP 小 → 对渲染质量更重要；几何坐标最重要；scale/opacity 比颜色 SH 更敏感。默认坐标取 $QP=QP_{\mathrm{DC}}$ 后再乘 **1.25**。若映射阶段尚无 QP，用通道数比：

```text
coordinate : DC : AC : opacity : scale : rotation = 3 : 3 : 45 : 1 : 3 : 4
```

**I 帧 MiniPLAS**：渐进方形置换块 $4^n\times4^n$（$n=1,2,4,\dots$），默认 **8×8 块、2 次迭代**。

**Inter-MiniPLAS（P 帧）**：以 I 帧映射为固定锚，对局部 4 个选定位置 $p_1,\dots,p_4$ 在 24 种排列中选最优：

```math
\pi^* = \arg\min_{\pi\in S_4} \sum_{j=1}^{4} \left\| g_P^e(p_{\pi(j)}) - g_I^e(p_j) \right\|_2^2
```

（$S_4$ = 全部 4! = 24 种排列；所选排列**同时应用于所有属性通道**）

**渐进块尺寸**：

```math
B_i = \frac{B_{\mathrm{MBS}}}{2^i}, \qquad i=0,\dots,7
```

默认 $B_{\mathrm{MBS}}=64$ → 序列 **64 → 32 → 16 → 8 → 4**（最小 4×4）。

**复杂度**（$M\times M$ 为映射分辨率）：

```math
O\Big(\big\lfloor M/B_i \big\rfloor^2 \big( B_i^2/4 \times 24 \big)\Big)
```

```math
O\Big(\sum_{l=0}^{\lfloor\log_2 B_{\mathrm{MBS}}\rfloor-2} \big\lfloor M/B_l \big\rfloor^2 \big( B_l^2/4 \times 24 \big)\Big) \;\xrightarrow{B_{\mathrm{MBS}}\ll M}\; O(M^2\log B_{\mathrm{MBS}})
```

```math
O\Big(C M^2 \sum_{i=0}^{l} s_i\Big)
```

### CA-GC：内容感知的广义压缩

**非均匀坐标位深拆分**：坐标 20-bit 量化（默认拆 **16:4** = 16-bit MSB + 4-bit LSB），非坐标属性 10-bit。MSB 走 HM18.0，LSB 可选 HM18.0 或 LZMA。

**CU 尺寸与 MBS 联动**：HM 最大 CU = 64、partition depth = 4，与 Inter-MiniPLAS 的 MBS 解耦但可调。

**编解码器位深约束**：libx265 最高 12-bit → 拆 12:8；libx264 最高 10-bit → 拆 10:10；HM18.0 / VTM23.11 用 16:4。

---

## 代码片段

```python
import torch, torch.nn.functional as F

def ea_shdr(G_ac_I, G_ac_P, mu_I, A=0.99):
    """EA-SHDR: I 帧定基, 全 GOP 复用。G_ac: (N,45)"""
    N = G_ac_I.shape[0]
    U, S, Vh = torch.linalg.svd(G_ac_I - mu_I, full_matrices=False)   # (45,45)
    lam = (S ** 2) / (N - 1)                                          # 方差
    cum = torch.cumsum(lam, 0) / lam.sum()
    k_star = int((cum < A).sum().item()) + 1                          # 最小保留维数
    k = 3 * ((k_star + 2) // 3)                                       # 凑 3 的倍数
    Vk = Vh[:k].T                                                     # (45,k)
    z_I = G_ac_I @ Vk                                                 # (N,k)
    z_P = (G_ac_P - mu_I) @ Vk                                        # 同一基投影
    return z_I, z_P, Vk, mu_I

def prior_weight(BD_a, CH_a, QP_a, scale=1.0):
    """先验加权 W_a = f1(D_a) * f2(QP_a)"""
    f1 = BD_a * CH_a
    f2 = 2.0 ** ((4 - QP_a) / 6.0)
    return scale * f1 * f2

def inter_miniplas_local(gI, gP, block):
    """局部 4 位置 24 排列搜索 (S4)。gI/gP: (M,M,C) 加权归一化特征"""
    import itertools
    best, best_perm = None, None
    for perm in itertools.permutations(range(4)):
        idx = block[list(perm)]                       # (4, C)
        cost = ((idx - gI[block]).pow(2).sum(-1)).sum()
        if best is None or cost < best:
            best, best_perm = cost, perm
    return best_perm                                    # 同一排列应用到所有通道

def progressive_block_sizes(MBS=64, levels=8):
    """64 -> 32 -> 16 -> 8 -> 4 (最小 4x4)"""
    sizes = []
    for i in range(levels):
        b = MBS >> i
        if b >= 4:
            sizes.append(b)
    return sizes
```

---

## 实验结论

- **数据集**：
  - **MPEG GSC**：bartender / breakfast / cinema（各 32 帧）；两种源条件 —— **Tracked**（共享 canonical GS，无增密，帧间 primitive 数相同）、**Semi-tracked**（允许增密，帧间 primitive 数不同）
  - **AVS**：dance（PKU-DyMVHumans）、basketball（AVS-VRU）
  - **No-tracking 条件**：目标场景缺乏帧间 primitive 对应 → 压缩前**独立打乱每帧**（"tracked" 指源数据而非保留输入顺序）；semi-tracked 用 LightGaussian 剪枝统一 primitive 数
- **基线**：GSCV（主基线，Inter-PLAS）、GSCodec Studio（MPEG 锚点，PLAS + FFMPEG libx265）、GPCC v1（仅 all-intra）；**未与 HAC/HAC++/CompGS/Scaffold-GS/LightGaussian/EAGLES/HybridGS 等原生重建压缩法比较**
- **编解码器**：HM 18.0（HEVC，主要）、VTM 23.11（VVC）、FFmpeg libx265 / libx264；**无 AV1 实验**

### 主结果：相对 GSCV 的 BD-rate 降低

| 数据集 | 帧内预测 | 帧间预测 |
|---|---|---|
| MPEG | **−39.61%** | **−68.70%** |
| AVS | **−24.50%** | **−109.93%** |

（AVS 帧间 −109.93% 意味着在同等质量下码率**不足 GSCV 的一半**）

### 2D 映射生成耗时（bartender）

| 方法 | I 帧 | P 帧 |
|---|---|---|
| **GSCV++**（EA-SHDR + Morton + P-MiniPLAS） | 0.54 + 0.075 + 3.96 = **4.575 s** | 0.05 + 0.075 + 14.54 = **14.665 s** |
| GSCV（SSI + Inter-PLAS） | 0.07 + 24.71 = **24.78 s** | 0.09 + 74.51 = **74.60 s** |

→ I 帧 **5.4×**、P 帧 **5.1×** 更快。

### 编解码耗时（tracked bartender，秒/帧）

| 码点 | GSCV++ HM18.0 | GSCV++ libx265 | GSCV HM18.0 | GSCV libx265 | GSCodec Studio libx265 | GPCC v1 |
|---|---|---|---|---|---|---|
| R05 | 397.8 / 1.4 | **2.4 / 0.5** | 1183.5 / 3.9 | 4.6 / 1.2 | 8.9 / 1.4 | 304.1 / 86.0 |
| R03 | 246.6 / 1.0 | **2.2 / 0.4** | 540.3 / 2.1 | 2.8 / 0.7 | 7.3 / 1.3 | 291.7 / 86.7 |
| R01 | 187.3 / 0.8 | **2.1 / 0.3** | 301.5 / 1.3 | 1.9 / 0.5 | 5.2 / 1.1 | 293.2 / 85.4 |

- **GSCV++ libx265 是所有码点中最快的实用配置**；R05 下 2.4 s / 14 图 ≈ **0.171 s/图** 编码、**0.035 s/图** 解码
- 论文估计多线程并行解码独立属性视频可达约 **30 FPS**

### P-MiniPLAS vs 完整 Inter-PLAS（固定 EA-SHDR 与编码设置）

| 方法 | 平均 ΔR | I 帧排序耗时 | P 帧排序耗时 |
|---|---|---|---|
| Inter-PLAS | 0.00% | 25.61 s | 63.04 s/帧 |
| **P-MiniPLAS** | **−24.49%** | **2.10 s** | **16.43 s/帧** |

P 帧加速 **3.84×**；逐序列 −24.11%(bartender) / −28.87%(breakfast) / −20.50%(cinema)。

### 编解码器 RD 增益（以 libx264 为基准）

| 编解码器 | RD 增益 |
|---|---|
| libx265 | **12.01%** |
| VTM 23.11 | **23.27%** |
| HM 18.0 | **23.91%** |

> VTM（更新）未优于 HM —— 论文归因于 **GS 属性图的重尾分布** 且生成图**缺乏显式运动信息**。

### 消融

| EA-SHDR | P-MiniPLAS | 平均增益 |
|---|---|---|
| ✗ | ✗ | 0.00% |
| ✓ | ✗ | **21.92%** |
| ✗ | ✓ | **32.43%** |
| ✓ | ✓ | **41.79%** |

（三个 MPEG semi-tracked 序列平均；两模块互补，联用最优且每个序列均为最大增益）

**坐标位深拆分（bartender，压缩后坐标大小）**：

| 模式 | 拆分 | Total HM18.0 | Total + LZMA |
|---|---|---|---|
| All-intra | 10:10 | 30.05 | 32.86 |
| All-intra | 12:08 | 29.96 | 28.92 |
| All-intra | **16:04** | 29.25 | **28.10** |
| Inter | 10:10 | 30.42 | 31.22 |
| Inter | 12:08 | 30.45 | 31.15 |
| Inter | **16:04** | **30.03** | 30.73 |

→ **帧内用 LZMA 编 LSB 更优（12:08 / 16:04）；帧间一律 HM18.0 编 LSB 更优**（9 组组合全部如此）。主配置用 16:04。

**CU 尺寸 / partition depth**（以 CU16/PD2 为基准）：CU32/PD3 → **0.33%** RD 增益；CU64/PD4 → **0.41%**。RD 几乎无差别，但 **cinema 帧间最高码率下编码耗时差异明显**：CU16/PD2 **16.39 s** vs CU32/PD3 18.85 s vs CU64/PD4 **22.45 s** → 小 CU 显著降复杂度。

**MBS 影响**：8 → 64 RD 持续提升，**128 反而下降**（过大局部搜索陷入局部最优）。bartender P-MiniPLAS 耗时：MBS 128 → 17.27 s，64 → 13.70 s，32 → 6.24 s，16 → 5.76 s，**8 → 1.40 s**。

### GoP 尺寸消融

| 指标 | GoP8 | GoP16 | GoP32 |
|---|---|---|---|
| 帧 0–15 平均 PSNR | **34.70 dB** | 34.35 dB | 34.37 dB |
| 帧 16–31 平均 PSNR | **35.04 dB** | 34.87 dB | **32.66 dB** |

R03 处：GoP8 **34.87 dB** vs GoP32 **33.51 dB**；单帧大小从 **3.557 MB → 4.362 MB**。→ **GoP 从 8 增到 32 使后半段 PSNR 降约 2.21 dB**，推荐 GoP8。

---

## 局限性

- 几何坐标的 **LSB 图难以被标准视频编解码器压缩**
- **仅用能量决定颜色 SH AC 的 latent 维数**，对每个 GS 序列并非总是最优的率-失真平衡
- **PLAS 生成图像与自然图像特性不同**，即便轻微粗糙也会限制编码器性能
- 未与原生重建压缩方法（HAC/CompGS/Scaffold-GS 等）比较

## 未来工作

> 学习类方法（如 **Sandwich Network**）或可进一步提升与标准视频编解码器的配合效果。

---

## 相关工作

- [[GSCV]]
- [[GSCodec-Studio]]
- [[GPCC]]
- [[PLAS]]
- [[MiniPLAS]]
- [[LightGaussian]]
- [[Gaussian-Splatting]]
- [[Spherical-Harmonics]]
- [[HEVC]]
- [[VVC]]
- [[2026-11-04_Phase-DGS-Phase-Guided-Dynamic-Gaussian-Splatting]]

---

## 实现建议

- **实现难度**：中偏高（三个模块均为已有技术的工程化组合，但 PLAS/MiniPLAS 置换搜索与 SH PCA 流水线需仔细对齐 MPEG 参考实现）
- **预期性能**：相对 GSCV **帧内 −24.5%~−39.6%**、**帧间 −68.7%~−109.9%** BD-rate；2D 映射生成 **5.1–5.4×** 更快；libx265 配置下编码 0.171 s/图、解码 0.035 s/图（≈30 FPS 并行解码）；消融显示两模块联用增益 **+41.79%**
- **适用场景**：
  - 3DGS **动态序列**资产的存储与传输（视频流媒体、VR/AR 资产分发）
  - 需**兼容现成硬件编解码器**的工业场景（低复杂度、硬件友好）
  - 缺少帧间 primitive 对应信息（no-tracking）时的稳健压缩
- **推荐度**：✅ **推荐（高优先级，工程价值明确）** — 三个模块均可独立裁剪落地；坐标 LSB 的可压缩性是最主要的剩余瓶颈
