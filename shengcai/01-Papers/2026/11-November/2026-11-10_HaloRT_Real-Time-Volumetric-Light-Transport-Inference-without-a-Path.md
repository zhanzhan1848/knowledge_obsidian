---
type: paper
created: 2026-11-11
updated: 2026-11-11
tags: [paper, rendering, volumetric-rendering, real-time-rendering, path-tracing, neural-rendering, global-illumination, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.12103
arxiv_id: 2611.12103
---

# HaloRT: Real-Time Volumetric Light Transport Inference without a Path

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Real-Time Volumetric Light Transport Inference without a Path |
| **作者** | Ludwic Leonard, Ruediger Westermann (TUM, Technical University of Munich) |
| **发表** | arXiv cs.GR, 2026-11-09 (预印本) |
| **链接** | [原文](https://arxiv.org/abs/2611.12103) |
| **DOI** | - |
| **代码** | 论文未公开链接（项目页待发布） |

---

## 核心贡献

> 用一次廉价的主光线特征采样替代路径追踪，直接"解码"出体积介质中的完整像素辐照度。

1. **把体积渲染重述为"确定性解码"问题**：不再做路径采样 + 降噪，而是从廉价主光线/环境采样特征直接推断最终光传输解。
2. **紧凑的主光线特征集**：证明对云这类介质，一组主光线特征 + 环境样本构成"近充分"表示（near-sufficient representation），可支撑推断多次散射。
3. **带局部自注意力的图像到图像网络**：分别推断方向光散射项与环境光散射项，可扩展到高分辨率。
4. **实时云渲染器**：在训练未见过的新云/新环境下实时重建完整体积全局光照，**完全不需要路径追踪辐射样本**。

---

## 技术方案

### 核心思想

传统体积渲染：路径追踪 → MC 噪声 → 降噪网络。
本文：**主光线特征 → 神经网络解码 → 完整体积辐照度**（无路径样本）。

关键洞察是**光照的线性性**，把远场光照拆成平滑环境图 + 主方向光：

```math
I = e\,\bigl(T\,B + I_{e}\bigr) + l\,I_{l},
```

其中 $T B$ 是主光线沿途透射的环境光（已知，来自主光线遍历），$I_e$ / $I_l$ 分别是单位环境光与单位方向光散射回相机的辐照度（需推断）。用两个解码器 $S_e$、$S_l$ 分别学习，共享主光线特征。

### 关键技术

| 技术 | 说明 |
|------|------|
| **光学深度 $F_\tau$** | $\tau(d)=\int_0^d \sigma_t(x_t)\,dt$，描述主光线衰减 |
| **环境透射项 $T B$** | 沿主光线累积的环境光透射，已知量 |
| **可见性/光可见性特征** | 低样本 MC 估计（8 样本）积分 $\int L(x_i,\omega_i)L(x_i,\omega_i)d\omega_i$ |
| **介质属性 $F_m$** | 首次交互点的 Henyey–Greenstein 各向异性参数 $g$、单次散射反照率 $\varphi(x_{t_1})$ |
| **局部自注意力 U-Net** | 图像到图像映射 $S_\Psi:\mathbb{R}^{H\times W\times n}\rightarrow\mathbb{R}^{H\times W\times 3}$ |
| **光照线性分解** | 因子化出 $e$、$l$，单次预测覆盖任意强度比 |
| **通道独立解码** | 无光谱耦合时每色通道独立求解，共享权重 |

### 公式

```math
// 特征算子定义（主光线上的确定性投影）
\tau(d)=\int_{0}^{d}\sigma_{t}(x_{t})\,dt

// 解码器训练目标
\Psi^{\star}=\arg\min_{\Psi}\;\mathbb{E}_{\theta\sim p(\theta)}\,\mathbb{E}_{\xi\sim p(\xi)}
\Bigl[\ell\bigl(S_{\Psi}(\mathbf{F}(\theta;\xi)),\,R(\theta)\bigr)\Bigr]
```

其中 $\theta$ 为场景分布，$\xi$ 为特征的随机来源。

**两个假设**：
- **(A1) 特征充分性**：$\exists S$ 使得 $R(\theta)=S(\mathbf{F}(\theta;\xi))$，即特征集几乎无损携带完整传输信息。
- **(A2) 噪声不变性**：$\mathrm{Var}_\xi[S(\mathbf{F}(\theta;\xi))]\approx 0$，即解码器对特征噪声不敏感。

---

## 代码片段

```python
# 解码器结构（伪代码）
# 两个独立解码器，分别处理环境光与方向光
S_env = AttentionUNet(shared_primary_ray_features, F_e)   # → I_e (单通道)
S_dir = AttentionUNet(shared_primary_ray_features, F_l)   # → I_l (单通道)

# 合成最终像素辐照度（每个 RGB 通道独立）
I_channel = e * (T * B + S_env(features)[..., channel]) \
           + l * S_dir(features)[..., channel]
```

---

## 实验结论

- **数据集**: 15 个留出云（训练未见过），200 张测试图 512×512；RTX 5090（基线 MRPNN 因架构不兼容只能用 RTX 3090）
- **基线**: Denoiser（CNN 降噪器 + 4spp MC 辐射缓冲）、DenoiserX（同架构但换成本文确定性特征，保留 4spp 缓冲）、MRPNN、OIDN
- **结果**:
  - **HaloRT 从不观测任何路径追踪辐射样本**，却在感知质量上优于所有降噪基线
  - PSNR 略低于 DenoiserX，但 **LPIPS 一致更低**（更好的感知相似度）
  - **噪声不变性**：跨 10 次实现的像素标准差 < DenoiserX 的 1/4，< Denoiser 的 1/9
  - 仅用 **8 个环境样本**即可达到近乎零偏差
  - **成本稳定**：不依赖密度，相机推拉时性能稳定；网络推理 **2048² 下约 10.5 ms/次**，每个光照分量 × 颜色通道各需一次前向
  - 单方向光场景下，HaloRT 单次前向即可无噪推断，比 MRPNN 单次前向更快

---

## 局限性

- **场景范围**：仅在云类介质上训练评测（Henyey–Greenstein 相函数、非发光介质、单一远处光照 = 平滑环境图 + 一个主方向光）
- **不支持**：介质内/周围的表面、局部光源、自发光
- **共享消光系数**：公式支持通道相关消光，但需每通道单独体积遍历
- **依赖训练分布覆盖度**：在正常环境光（全局传输主导）+ 强方向光下，光传输依赖离开主光线邻近区域的路径结构，特征未显式捕获；解码器靠训练集学到的规律消解剩余歧义
- 训练环境为合成数据

---

## 相关工作

- [[Hofmann 2020 Volumetric Path Tracing Baseline]]
- [[2026-10-13_Sensitivity-AOV-Differentiable-Rendering]]
- [[2026-06-16_Neural-Dynamic-GI-Temporal-Lightmaps]]
- 概念：[[路径追踪]], [[全局光照]], [[体积渲染]], [[神经渲染]]

---

## 实现建议

- **实现难度**: 中（需要实现主光线特征提取管线 + 训练图像到图像网络；不需要路径追踪器）
- **预期性能**: RTX 5090 上 2048² 约 10.5 ms/通道/光照分量，实时可行
- **适用场景**: 实时云层/体积雾/烟尘渲染，尤其对路径追踪预算敏感的场景；也可用作路径追踪渲染器的**廉价先验/引导**
- **与团队的关系**: 可与 @墨鱼丸 讨论——用 HaloRT 特征替换现有路径追踪 denoiser 的辅助缓冲（DenoiserX 已证明可行），是一条低风险增量路径
- **优先级**: 高（省掉整条路径追踪管线，是本轮最有价值的降本方案）
