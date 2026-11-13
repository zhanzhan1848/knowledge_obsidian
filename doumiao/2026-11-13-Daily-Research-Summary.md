---
type: summary
created: 2026-11-13
updated: 2026-11-13
tags: [summary, fluid-rendering, daily-search]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/list/cs.GR/recent
---

# 2026-11-13 每日流体渲染论文搜索报告

## 搜索配置

| 项 | 值 |
|---|---|
| **检索源** | arXiv API（cs.GR / cs.CV / cs.MM / physics.flu-dyn）+ SIGGRAPH/SIGGRAPH Asia 2026 元数据 |
| **关键词** | fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering + 扩展词（SPH, ray marching, free-surface, turbulence, splashing, foam, spray, mist, plume, SIGGRAPH Asia 2026） |
| **检索策略** | 6 组 API 查询：①cs.GR 最近 80 篇全量 ②abs 关键词 OR 组 ③(cat:cs.GR OR cs.CV) AND 流体词 ④标题词匹配 ⑤cs.GR AND rendering AND 介质词 ⑥cs.GR AND 渲染技术词；另加 SIGGRAPH 2026 元数据查询 |
| **去重** | `.scripts/dedup.py` 扫描知识库已入库 532 个 arXiv ID |
| **入库** | 候选 9 篇 → 去重后新增 **8 篇** |

---

## 24 小时窗口说明

本轮严格落在 **2026-11-12 15:06 ~ 2026-11-13 15:06 UTC** 窗口内的 cs.GR 新增论文共 5 篇（2611.17321 / 2611.17298 / 2611.17185 / 2611.16701 / 2611.16673），其中与流体渲染直接相关的仅 **2 篇**（NRP、ReCan-GS）。

其余 6 篇来自近两周窗口内的高相关补充（10-02 ~ 11-10），均为流体渲染核心主题但此前未入库。**arXiv 在 11-12/13 恰逢新批次发布前的空窗**，与 [[2026-11-11-Shu-Huang-Chen-Same-Physics-Different-Gradients]] 时期观察到的"周末不发布"规律一致。

---

## 本轮收录论文（8 篇）

| 日期 | arXiv | 标题 | 主题 | 优先级 |
|------|-------|------|------|--------|
| 11-12 | [2611.16259](https://arxiv.org/abs/2611.16259) | Reconstruct What You Can (ReCan-GS) | 烟雾移除 / 4DGS | ⭐⭐⭐⭐⭐ |
| 11-12 | [2611.17185](https://arxiv.org/abs/2611.17185) | Neural Render Proxies (NRP) | 神经渲染 / 可微重光照 | ⭐⭐⭐⭐⭐ |
| 11-12 | [2611.16673](https://arxiv.org/abs/2611.16673) | PIM: Physical Intuition Model | 网格物理 / 低延迟预测 | ⭐⭐⭐⭐ |
| 11-10 | [2611.14832](https://arxiv.org/abs/2611.14832) | Neural Compression for Scientific Particle Data | 粒子数据压缩 / 可视化 | ⭐⭐⭐⭐ |
| 10-30 | [2611.00227](https://arxiv.org/abs/2611.00227) | Piecewise CMC Segmentation for Fluidic Shaping | CMC 曲面 / 流体塑形 | ⭐⭐⭐⭐ |
| 10-30 | [2610.41304](https://arxiv.org/abs/2610.41304) | ART of PIV | PIV / 主动流控 | ⭐⭐⭐⭐ |
| 10-02 | [2610.04007](https://arxiv.org/abs/2610.04007) | VolS-GS | 体积次表面散射 / 可重光照 | ⭐⭐⭐⭐⭐ |
| 10-23 | [2610.32646](https://arxiv.org/abs/2610.32646) | Turbid, Bubbly and Flowing Water Imaging | 浑浊水体成像 | ⭐⭐⭐ |

---

## 核心发现

### 1. 「几何一致性」正在取代「运动量」成为流体干扰物判据

[[2026-11-13-Julin-Xie-Bal-Sakashita-Niinuma-Jeni-ReCan-GS-Distractor-Free-4DGS]] 是本轮最重要的一篇。它用变形场 Jacobian 的行协方差迹 `Tr(Cov(J))` 作为**运动不确定度**，据此把 4DGS 场景拆成 Core / Per-View Distractor 两层。

关键洞察：**烟雾/雾虽然在光度上稳定、运动很慢，但其拓扑持续演化会在 canonical 空间引入矛盾的几何约束**，因此同样得到高不确定度。这使得烟雾移除**不需要掩码、预训练分割器或介质专用监督**——一个统一的解析判据同时覆盖遮挡物、伪影和体积介质。

烟雾场景上比最强基线高 **5.7 dB / 6.2 dB**；Jeep 场景干扰物残留率从 DeformableGS 的 73–83% 降到 **0–11%**。

**对流体渲染的意义**：任何「从视频反推流体」的方法都要面对同样的问题——烟、雾、火、水沫在观测上高度相似。ReCan-GS 给出了一个可迁移的判据：**看几何是否在重建空间里自洽**，而不是看外观像不像。

### 2. 体积效应进入「可微输运」时代

[[2026-10-02-Ahn-VolS-GS-Relightable-GS-Volumetric-SSS]] 用**高斯场景的空间支撑**作为可微有限体积输运求解器的定义域，逐高斯预测散射/吸收系数，让光在物体内部传播。这是把 FVM 搬进 3DGS 的一次重要尝试，且明确声明「系数是拟合的不是测量的，求解器提供的是传输形状的路径」。

**对流体渲染的意义**：这是目前最接近「在 3DGS 框架内做真实参与介质」的路线。σ_s / σ_a 逐基元学习 + 有限体积输运 = 带自阴影和内散射的烟雾/牛奶/果冻。对比 [[2026-04-08-Real-time-Neural-Six-way-Lightmaps]] 的六向光照图，VolS-GS 是显式求解而非查表。

### 3. 流体渲染的「光照迭代」成本同样是瓶颈

[[2026-11-13-Sancho-Rath-Manzi-Chang-Bermano-Nowrouzezahrai-Gross-Papas-Neural-Render-Proxies]]（EGSR 2026）把渲染解耦为**路径采样 + 发射项计算**：一次 light-agnostic pass 收集路径样本，之后在线快速采样任意光照条件，训练场景专属代理网络。30–60 Hz 可微重光照。

**对流体渲染的意义**：体积/烟雾场景的光照迭代极贵，NRP 的「采样一次、光照条件重采样」思路非常契合；但它的**静态场景假设**是硬伤——流体几何每帧变化，路径样本就失效了。这是一个明确的开放缺口。

### 4. 「物理直觉」建模的边界：平衡态 ≠ 流体

[[2026-11-13-Luo-Zheng-Huo-PIM-Physical-Intuition-Model]]（浙大 CAD&CG）用顶点 token + 局部 KNN 注意力 + FPS 锚点跨物体注意力 + 双分支解码器，**一次前向直接预测平衡态网格**，跳过自回归 rollout。

架构上很漂亮，但**平衡态假设对流体根本不成立**——流体没有静态平衡。真正可迁移的是它的**分解范式**：
- 双分支解码 = **全局平流 + 零均值局部残差**，正好对应流体的「整体输运 + 局部涡旋」
- KNN 局部注意力 + FPS 锚点 = SPH/粒子渲染邻域搜索的深度学习版
- 锚点式跨物体注意力 = 流固耦合/多相流界面交互的建模候选

### 5. 粒子数据：不要盲信神经压缩

[[2026-11-13-Qiu-Di-Jeong-Neural-Compression-Particle-Data]]（PAI26）给出诊断：**CV 点云局部是平面的（分形维数≈2），科学粒子不是**。八叉树是绝大多数 PCC 方法的骨干，该假设一旦失效，神经编解码器相对 G-PCC 就只有边际收益。

这与 [[2026-11-05-Sifakis-Williams-Horvath-Dynamic-GPU-Voxel-Grids-NanoVDB]]（NanoVDB 动态 GPU 体素网格）的结论互相印证：**流体/粒子渲染若采用稀疏体素结构，同样受"非平面性"制约**。

### 6. 浑浊水体：散射出视场 = 对比度损失

[[2026-10-23-Menon-Turbid-Bubbly-Flowing-Water-Imaging]] 用实测数据给出了清晰物理解释：悬浮物把光散射到 1.3° 视场**之外**，所以浑浊度的主要后果是**对比度衰减**（Siemens 星降 4.4–4.8 倍），而非模糊。

**对体积渲染的直接影响**：体积渲染积分中"散射出视野"的能量应建模为对比度损失，而不是简单当作模糊/衰减处理——这会影响单次散射 vs 多次散射近似的取舍。

论文还有一个重要方法论警示：**用数字源或清水参考打分会反转原始帧与恢复图像的排序**。流体渲染的感知质量评估必须先明确"参考真值"的定义。

### 7. CMC 曲面：流体渲染的经典造型语言

[[2026-10-30-Sati-Piecewise-CMC-Segmentation-Fluidic-Shaping]] 揭示流体塑形的物理本质：界面张力使表面成为**常平均曲率曲面**（CMC），因此任意 3D 目标必须先分解为分段 CMC 才能物理制造。

**对流体渲染的意义**：水面张力边缘、液体-容器接触线、泡沫/薄膜、飞溅薄片都接近最小曲面（H=0）。CMC 演化算法可作为**自由表面流体渲染**生成"物理可信"液体边界形状的手段，比纯噪声位移更可控。

### 8. 预算约束下的 agent 调度 → 渲染管线的自适应架构

[[2026-10-30-Terpin-ART-of-PIV-Agentic-Real-Time-PIV]] 用学习到的 agent 在**速度预算约束下**逐图像对选择 PIV 配置（互相关/光流/学习型估计器），AEPE 降 12.2–22.4%，闭环代价降 13.24–13.59 个百分点。

**可迁移到渲染**：这是「**按帧时间预算自动在 MantaFlow / FLIP / 屏幕空间流体 / 粒子级数之间切换**」的可落地架构——不同于传统手工 LOD，agent 调度 + 预算约束是一个更优解。

---

## 交叉观察：三条正在汇合的线索

| 线索 | 代表论文 | 交汇点 |
|------|---------|--------|
| **4DGS + 流体干扰物** | ReCan-GS | 几何一致性判据可用于烟/雾/火/水沫的通用识别 |
| **3DGS + 输运求解** | VolS-GS | 高斯支撑作为体积输运网格 |
| **神经代理 + 路径采样** | NRP | 光照条件与几何解耦 |

三条线合起来指向一个尚未出现的组合：**在 4D 高斯表示上，用可微有限体积求解器处理参与介质输运，用 Jacobian 几何一致性剔除不可重建的流体伪影，用路径采样代理实现流体的交互式可微光照**。目前三部分各自成熟，组合尚无人做。

---

## 已知去重跳过（11 篇）

`2611.08665`(NanoVDB) · `2611.12103`(Real-Time Volumetric Light Transport) · `2611.12162`(Differentiable Physics Report) · `2611.12716`(Spaghetti Splatting) · `2611.13296`(3D CA in XR) · `2611.14136`(HaiRuo 海洋涡旋) · `2611.04492`(Hybrid Particle-Voxel) · `2610.13860`(Make It Flow 水流动画) · `2610.25660`(FluidGen) · `2610.10984`(Fluid-Gen-Zero) · `2609.20818`(SplashSplat) · `2607.22956`(ParticleGS)

---

## 下一步关注

- **ReCan-GS 是否会推广到专用烟雾移除基线对比**——目前仅与通用干扰物移除方法比较
- **NRP 的时变几何扩展**——静态场景假设是其在流体场景落地的关键障碍
- **SIGGRAPH Asia 2026 正式论文列表**——当前仅检索到 workshop 与 challenge 相关（Volumetric Video Challenge、3DGS Challenge），主会论文列表尚未在 arXiv 元数据中体现
- **VolS-GS 与屏幕空间次表面散射的定量对比**

---

*本报告由 doumiao 每日论文搜索任务生成于 2026-11-13 15:06 UTC*
