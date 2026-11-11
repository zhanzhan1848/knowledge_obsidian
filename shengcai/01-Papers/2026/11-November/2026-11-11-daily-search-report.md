---
type: report
created: 2026-11-11
updated: 2026-11-11
tags: [daily-report, rendering, 2026, 11]
status: processed
domain: rendering
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026-11-11

## 搜索范围

| 项 | 内容 |
|----|------|
| **执行时间** | 2026-11-11 15:15 UTC |
| **数据源** | arXiv cs.GR（Atom API, 按 submittedDate 降序）、arXiv HTML 全文、SIGGRAPH Asia 2026 官网、Ke-Sen Huang 论文页 |
| **关键词** | ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching, neural texture, 3DGS |
| **抓取窗口** | arXiv cs.GR 最近 80 条（2026-10-27 → 2026-11-10） |
| **ACM DL** | ⚠️ 403（Cloudflare 拦截）——本期无法抓取 |
| **SIGGRAPH Asia 2026** | 会议进行中（12月），技术论文日程尚未完整公布；本期无新收录条目 |

---

## 本期新增笔记（11 篇）

| 日期 | 论文 | 方向 | 推荐度 |
|------|------|------|--------|
| 11-10 | **HaloRT** — Real-Time Volumetric Light Transport Inference without a Path | 体积渲染 / 无路径光传输 | ⭐⭐⭐⭐⭐ |
| 11-10 | **Deformable Texture Maps (DTM)** | 神经纹理 / 形变微几何 | ⭐⭐⭐⭐ |
| 11-10 | **Differentiable SSSS for Real-Time Skin** | 逆渲染 / 次表面散射 | ⭐⭐⭐⭐ |
| 11-09 | **AF-NTC** — LOD-Conditioned Anisotropic Filtering for NTC | 神经纹理压缩 / 各向异性过滤 | ⭐⭐⭐⭐⭐ |
| 11-09 | **SM-Level Load Imbalance in 3DGS** | 3DGS / GPU 调度 | ⭐⭐⭐⭐⭐ |
| 11-05 | **NanoVDB Dynamic GPU Voxel Grids** | 稀疏体素 / GPU 数据结构 | ⭐⭐⭐ |
| 11-05 | **HIBS** — Hierarchical Incremental Beta Splatting | 3DGS / 在线重建 | ⭐⭐⭐ |
| 11-05 | **P-MGS** — Perception Over Geometry | 3DGS / 网格分配 | ⭐⭐⭐ |
| 11-05 | **Patch-Based Generalized Neural Texture Upscaling** | 神经纹理 / 上采样 | ⭐⭐⭐⭐ |
| 11-04 | **T²-Splat** — Adaptive Topology Mesh Splatting | 3DGS / 网格拓扑 | ⭐⭐⭐ |
| 11-03 | **GaussianRenderFormer** | Transformer 渲染 3DGS | ⭐⭐ |
| 11-02 | **GPU-Native Real-Time Textured Mesh Reconstruction** | 重建 / GPU 原生管线 | ⭐⭐⭐ |
| 11-01 | **AbacusGS** — 3DGS without Per-Splat Sorting | 3DGS / 排序优化 | ⭐⭐⭐⭐ |

> 实际创建 12 篇 + 本报告。所有条目均经全文核对（arXiv HTML），非仅摘要。

---

## 🥩 本期技术趋势解读

### 主题 1：「渲染管线的负载与排序」成为 3DGS 优化的主战场

两篇独立工作从不同角度攻击同一个瓶颈：

| 论文 | 攻击的瓶颈 | 解法 | 收益 |
|------|-----------|------|------|
| **AbacusGS** | 每帧 per-splat 深度排序（CPU 端查看器的大头） | 排序存进场景布局（八叉树 box，每 box ≤128 splat，写入时选轴） | CPU 排序查看器 **4.5×** 帧率，PSNR 仅 −0.13 dB，17 B/splat |
| **SM-Level Imbalance** | 屏幕 tile 间 SM 级负载不均衡 → 执行尾部 | Persistent kernel + LPT 调度 + 深度分块（饱和信号） | 城市场景 alpha blending **2.93×**，最不均衡帧 **5.6×** |

**关键洞察**：两者**正交可叠加**。AbacusGS 省掉排序成本，本篇优化排序之后的 alpha blending 阶段。都不需要重训练、不改场景表示、不改 over 算子——**零风险正交优化**。

### 主题 2：神经纹理正在走向"管线级组件"

AMD（Fujieda & Harada）同组两篇构成了完整拼图：

```
低分辨率基纹理
    ↓  Patch-Based Generalized Neural Texture Upscaling（通用 MLP，采样阶段上采样）
高分辨率纹理
    ↓  AF-NTC（显式 (rot, stretch, LOD) 各向异性过滤条件）
渲染空间正确的高频材质
```

AF-NTC 的数字很有说服力：**只用 BC7 mip 链 25% 的体积**，在全部 10 个材质-场景组合上超越 trilinear-BC7 **+1.31 ~ +7.63 dB**。而 Patch-Based 上采样强调**无需逐资产训练**、**无需改资产管线**、**GPU 执行不分叉**——这是真正能进生产管线的形态。

### 主题 3：「绕过路径追踪」成为新路线

**HaloRT** 是本期最有分量的工作：它**完全不产生路径追踪辐射样本**，只靠廉价的主光线特征 + 8 个环境样本，就用神经网络直接解码出完整体积全局光照。

其数学框架值得单独记下——**光照线性性**分解：

$$I = e\,(T B + I_e) + l\,I_l$$

把环境光与方向光解耦成两个独立解码器，配合两个假设：
- **(A1) 特征充分性**：特征集几乎无损携带完整传输信息
- **(A2) 噪声不变性**：解码器对特征噪声不敏感 → 实现极高稳定性（跨实现标准差 < DenoiserX 的 1/4）

这不是"更好的降噪器"，而是**把体积渲染从随机估计问题改写为确定性解码问题**。

### 主题 4：「角色材质生产线」正在成形

两篇来自 URJC / Adobe / CMCC 团队的工作可以拼成一条完整管线：

| 环节 | 论文 | 关键点 |
|------|------|--------|
| 皮肤 | Differentiable SSSS | 直接为**实时**着色器反推 SSS 参数，而非离线路径追踪；分区 profile map；45 人 Monk 全色调验证 |
| 服装 | Deformable Texture Maps | 形变驱动的微几何编译进神经纹理；编码**几何属性而非辐照度** → 换光/改材质**无需重训** |

DTM 的设计选择特别聪明：**把几何和光照解耦**是让神经纹理能被生产管线接受的关键。

---

## 🥩 值得关注的技术细节（可直接复用的经验）

1. **误差驱动重定位 vs 不透明度加权**（HIBS 消融）：把误差加权替换为 3DGS-MCMC 的不透明度采样，**比完全禁用重定位更差**（27.89 dB vs 28.21 dB）。不透明度采样主要在**强化本就强的区域**，而非修复弱区域。

2. **诊断范式**（GaussianRenderFormer）：给视图解码器喂它"本可自己推断"的投影足迹 → +1.4 dB。这个"信息瓶颈诊断"技巧可直接用于团队自己的可微渲染实验。

3. **AF 的必要条件**（AF-NTC）：单一输入无法同时携带 footprint 的**形状**与**尺寸**——只用宽高比设定滤波器，图像在近处会跟远处一样糊。有界三元组 $(\texttt{rot}, \texttt{stretch}, \texttt{LOD})$ 才完整。

4. **稀疏网格的访存规律**（NanoVDB）：树遍历的 branchy 访存是瓶颈；把活跃体素流式化为扁平线性序列后，模板算子可逼近**峰值内存带宽**。

---

## 🥩 行动建议

### 立即可做（高优先级）

| # | 方案 | 论文 | 预期收益 | 难度 |
|---|------|------|----------|------|
| 1 | 神经纹理解码器加 $(rot, stretch, LOD)$ 三元条件 | AF-NTC | 1/4 存储超越 trilinear-BC7 +1.3~7.6 dB | **低-中** |
| 2 | Web/移动端 3DGS 查看器改用 box 级排序 | AbacusGS | CPU 排序查看器 4.5× 帧率，−0.13 dB | 中 |
| 3 | 3DGS 光栅化器改 persistent kernel + LPT + 深度分块 | SM-Level Imbalance | 城市场景 2.93×（最不均衡帧 5.6×） | 中 |
| 4 | 体积渲染评估"无路径"路线：HaloRT 特征替换 denoiser 辅助缓冲 | HaloRT | 已有 DenoiserX 验证：换成确定性特征后降噪器大幅改善 | 中 |

### 传递给 @墨鱼丸（算法实现）

- **优先级最高**：#4 HaloRT。理由——这是本轮唯一能**砍掉整条路径追踪管线**的方案。其 DenoiserX 变体（用确定性特征替换原辅助缓冲）已证明即使在降噪器框架内也能大幅改善，是低风险增量路径。
- **优先级次高**：#3 SM-Level Load Imbalance + #2 AbacusGS，两者正交可叠加。
- **可组合管线**：#1 AF-NTC + Patch-Based 上采样。
- **经验传递**：HIBS 的"不透明度加权强化强区域"消融结论。

### 传递给其他 agent

- **@鸭血 / @菜心（流体）**：NanoVDB 动态拓扑 + voxel-sequential 访问——稀疏网格 GPU 算子全面提速 3.5–11.5×，体素分辨率可细 1.5–5×。
- **@黄喉（几何）**：GPU-Native 重建论文的**定长数组网格拓扑**（O(1) 邻居访问，数据并行化）；以及 T²-Splat 的拓扑演化算子。
- **@五花肉（前端）**：AbacusGS 的紧凑格式 17 B/splat + CUDA tile renderer，适合 Web 端 3DGS 查看器。

---

## 数据源状态

| 源 | 状态 | 说明 |
|----|------|------|
| arXiv cs.GR (Atom API) | ✅ 正常 | 本期取回最近 80 条，12 篇渲染相关 |
| arXiv HTML 全文 | ✅ 正常 | 用于深度提炼（方法/公式/数值） |
| arXiv RSS (cs.GR) | ✅ 正常 | 仅 9 条当日条目 |
| ACM Digital Library | ❌ 403 | Cloudflare 拦截，需要后续换用其他访问路径 |
| SIGGRAPH Asia 2026 | ⏳ 待定 | 会议 12 月举行，论文日程陆续公布中 |
| Ke-Sen Huang 论文索引 | ✅ 可访问 | SIGGRAPH/SIGGRAPH Asia 论文汇总 |

---

*生成时间：2026-11-11 15:15 UTC · 🥬 生菜 (shengcai) · 计算机图形学渲染专家*
