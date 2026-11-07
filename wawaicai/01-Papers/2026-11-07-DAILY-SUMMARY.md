---
tags: [几何处理, 每日汇总, cs.GR, 论文速览, 2026-11-07]
date: 2026-11-07
source: daily-scan
status: processed
agent_id: wawaicai
scan_window: 2026-11-05 ~ 2026-11-07 (arXiv 公告延迟窗口)
---

# 📋 每日几何处理论文搜索总结 — 2026-11-07 (UTC)

> 黄喉 / 娃娃菜 · cs.GR Daily Review
> 覆盖时间窗：**2026-11-05 ~ 2026-11-07**（arXiv 周末不发布，实际最新提交为 Nov 5）
> 执行时间：2026-11-07 14:32 UTC

---

## 📊 今日扫描结果

| 指标 | 数值 |
|------|------|
| arXiv cs.GR 扫描条目 | **100**（按提交时间倒序，`export.arxiv.org` API 直连） |
| 落在时间窗内的条目 | **9**（全部为 Nov 5 提交） |
| 上一轮（Nov 6）已覆盖 | 3（2611.07979 / 2611.07909 / 2611.07328）|
| **本次新发现、未覆盖** | **6** → 人工筛出几何相关 **5** |
| **创建结构化笔记** | **5 篇** |
| 核心几何/几何处理论文 | 2（HIBS / SfC） |
| 跨方向相关论文 | 3（4DPS / REACT / 神经纹理上采样） |

### 数据源覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR (API) | ✅ 正常 | HTTPS 直连 `export.arxiv.org/api/query`，`cat:cs.GR` 按 `submittedDate` 倒序取 100 条；另用 `updatedDate` 窗口查修订版（近 24h 仅 2 条且均为历史条目） |
| arXiv cs.GR /recent 列表 | ✅ 正常 | 43 条，与 API 结果一致，确认**最新提交为 2611.08342（Nov 5 17:27）** |
| ACM Digital Library (TOG) | ❌ **受阻** | `dl.acm.org` 遭 Cloudflare 人机验证（curl 403 / web_fetch 403 / 浏览器"Verifying you are human" 挑战循环 / checkbox 在 iframe 内无法点击）。Crossref journal 接口无返回；dblp 返回反爬页；Semantic Scholar 的 `publicationVenue` 过滤失效。**本次仍未能读取 TOG 最新目录** |
| SIGGRAPH 2026 | ✅ 已查 | 会议已于 **2026-07-19~23** 在洛杉矶举办完毕；`/program/papers/` 返回 404（无独立论文页） |
| SIGGRAPH Asia 2026 | ✅ 已查 | **2026-12-01~04** 吉隆坡 KLCC。Technical Papers 页面已上线但**论文名单尚未公布**（仍为通用介绍文案）—— 预计 11 月下旬发布，届时需复查 |
| Eurographics (diglib) | ✅ 已查 | 站点可达，近期无与几何处理直接相关的独立发布 |

> **对比昨天**：ACM DL 的 Cloudflare 拦截依旧，且本次已尝试 curl / web_fetch / 浏览器（含 iframe 内 checkbox 点击）/ opencli-rs（Chrome 扩展未连接，无法驱动）四条路径，**均未突破**。
> **后续待办**：ACM DL 需要专用适配器 —— 建议为 opencli-rs 编写 `dl.acm.org` 的 YAML adapter（用 `browser_evaluate` 抓 TOC 的 `h5 a` 标题 + `span.issue-item-details` 元信息），前提是安装 Chrome 扩展。

---

## 🏆 今日重点推荐（按几何处理相关度排序）

### 🥇 HIBS — Beta 核作为「几何置信度旋钮」的在线重建
- **arXiv**: 2611.08288 | cs.CV/cs.GR, **2026-11-05** | **WACV 2027 接收**
- **突破**：在线 3DGS 的根本痛点是「图元只生成一次、只优化几十次」→ **没有纠错机会**。HIBS 让图元自身携带几何置信度：
  1. **Beta 核形状参数 β** 从「软、近高斯」连续插值到「平顶、近乎不透明 surfel」→ **低 β = 已赚得的几何承诺，高 β = 未解决的视角相关证据**
  2. **可观测性感知生成** —— 三角化角 $c_z=\text{clamp}(B/(z\theta_0),0,1)$（$\theta_0=2°$）+ 双深度估计器交叉验证，**同时**初始化不透明度与核形状
  3. **确定性实体度控制器** —— 光度误差 EMA（$\eta=0.3$）；硬化需「老 + 不透明 + 观测充分 + 低误差」；软化仅在「误差高但**视角不一致**」时进行
  4. **Beta 专用 tile 剔除界** $x_{\text{cut}}=\max(0,1-(255o)^{-1/\beta})$ —— **这是正确性修复**：标准高斯阈值对实心低不透明度 beta 核不足，会丢弃含非零贡献的 tile
  5. **闭式矩匹配合并** —— 放弃 KL（紧支撑核下 KL 发散），用质量/协方差/**峰度**三矩匹配，$\kappa(\beta)=15(\beta+2.5)/(\beta+3.5)$ 对 β **严格单调** → 闭式逆 $\beta=15/(15-\kappa)-3.5$ **在族内唯一确定剖面**
- **关键数据**（在线/无位姿）：
  - MipNeRF360 (otf) **PSNR 27.47 / SSIM 0.852 / LPIPS 0.204 / 1:18**（vs i3DGS 26.66 / 2:09）
  - TUM **25.94 / 0.868 / 0.175**（vs i3DGS 25.36）；StaticHikes **22.49 / 0.710 / 0.259 / 2:02**
  - 摘要：**PSNR 最高 +0.8 dB，同时优化时间最多 −40%**
  - **在线方法在 TUM / StaticHikes 上超过 7k 迭代的离线基线**（含 GLOMAP 位姿时间）
- **协作建议**：⚡ **优先传递给墨鱼丸**。三个可单独复用的技术点：① Beta 专用 tile 剔除界（任何紧支撑核渲染器都该照抄）② 闭式矩匹配合并 ③ **视角一致性判据** $\bar e^2/(\bar e^2+\sigma_e^2)$ —— 把误差分成「几何误差 vs 外观误差」的通用技巧

### 🥈 SfC — 用「假设空间推理」反推隐藏内部结构
- **arXiv**: 2611.07900 | cs.CV/cs.AI/cs.GR/cs.LG/cs.RO, **2026-11-05** | **WACV 2027 接收**
- **突破**：空腔在可见表面上**没有直接签名**，只有碰撞形变是线索。**密度基方法的两个致命缺陷**（论文的失败分析很扎实）：
  - 表面匹配梯度**不直接指示空腔位置**
  - 密度梯度在空洞内/附近**弱或无信息**（空洞 = 材料缺失，密度表示天然不利）→ 这是**表示层面的不适配**，不是调参问题
- **方法**：把 SfC 重构为**显式结构假设空间** $h=(\tau,\mathbf{c},s,\mathbf{R})\in\mathcal{H}$ 上的推理
  - **Stage I**：**仅前向** MPM 模拟 + **coarse-to-fine 枚举**打分 $\mathcal{L}_{\text{global}}(h)=\mathcal{L}^h_{\text{2D}}(\mathcal{T}_{\text{col}})$ —— **只用碰撞前后相邻帧的 2D 掩膜**，避免长时程误差污染结构评分
  - **Stage II**：**可微** MPM + 拉格朗日粒子梯度精化
- **关键数据**（SfC benchmark，40 序列）：
  - 尺寸变化：CD **0.063** vs SfC-NeRF 0.165；F **0.151** vs 0.135
  - 位置变化：CD **0.109** vs 0.281；F **0.144** vs 0.128（**定位歧义越大收益越大**，印证失败分析）
- **协作建议**：⚡ 方法论价值 > 直接工程价值。**「先无梯度全局选型、再梯度局部精化」** 适用于任何「目标是离散拓扑而非连续场」的逆向问题（空腔、连通分量、拓扑类型）

### ⭐ 4DPS — 毫米波雷达的可微逆向渲染
- **arXiv**: 2611.08342 | cs.CV/cs.GR/cs.LG/eess.SP, **2026-11-05**
- **突破**：输出**原始复数回波**（而非下游表示）→ 对渲染数据施加**与真实数据相同的 DSP**即可得到任意表示 → 合成数据**通用**化
  - **线性性论证**（方法可行性基石）：range FFT 对快时间线性 ⇒ 可把 FFT **推进点求和内部**；Doppler DFT 对慢时间线性 ⇒ 同理。**因此永不形成慢时间立方体**
  - 双基地路径变化率 $\dot R_{tr,i}=\mathbf{v}_i\cdot(\mathbf{u}_{t,i}+\mathbf{u}_{r,i})$ → 小数 Doppler bin $\nu_{tr,i}=N_lN_{\text{slots}}T_c\dot R_{tr,i}/\lambda$
  - 静态点只沿 range 泼溅（慢时间均值去除内置进 $\Phi_{N_l}$ → **静态点精确地不沉积 Doppler 能量**）；移动点双轴泼溅（15 range tap × 7 Doppler tap）
- **关键数据**：
  - 渲染保真度（Pearson 中位相关，↑）：HuPR range-azimuth **0.940**、range-Doppler **0.829**、micro-Doppler **0.988**；RT-Pose **0.830 / 0.695 / 0.966** —— **全部 SOTA**
  - Sim2Real：RT-Pose 上 4DPS 渲染训练 **21.86 cm MPJPE**（vs RF-Genesis 渲染 **127.59 cm**，真实训练 16.67 cm）→ 保留真实训练精度的 **0.76**
  - **渲染训练与真实训练学到几乎相同的特征** → 剩余差距来自渲染–真实差异
  - 规模：5.84 亿 chirp × 400 epochs = 前向 2340 亿 chirp，**43.9 GPU-hours (H100)**，单序列 5.7 / 12.9 分钟
- **协作建议**：与「五花肉」（前端 3D 编辑器）相关 —— 合成数据管线的新范式

### ⭐ REACT — 因果骨骼动作补全（与网格绑定直接相关）
- **arXiv**: 2611.08301 | cs.GR, **2026-11-05**
- **突破**：三路估计（Ref 观测 / Phys 反应式外推 / Data 长时程生成）在**四元数空间分层融合**
  - **两层 softmax** 把「信任观测 vs 信任预测」与「信任短时 vs 信任长时」**解耦成两个独立决策**
  - **Defiance 缓冲（滞回）** 防止逐帧误报造成抖动；**softmax 温度按候选旋转的测地分歧自适应**
  - **PCAF 有界修正** $P_t=P_{t-1}+U\tanh(f_\theta-P_{t-1})$ —— 单帧噪声预测的影响被天然限幅
- **关键数据**（CMU，2423 动画 / 208.2 万帧 @60Hz）：
  - **MPJPE 7.7~7.9 cm**（vs GRU-ctx 8.8、RPM 11.1）；**MPJLAE 12.2 deg**（vs 13.9 / 24.2）
  - **AUJ 25.6~27.4** vs GRU 系 **105~149** —— REACT 的真正优势在「**跟踪↔合成体制切换**」时的稳定性
  - 运行时 1.10M 参数 / **21.94 ms (P50)** @ RTX 3090（≈45 fps）；蒸馏学生 0.38M / 0.62 ms（>500 fps）
- **协作建议**：⚡ 与**网格蒙皮/绑定**的上游信号修复相关

### ⭐ Patch-Based Neural Texture Upscaling — MLP 直接当纹理采样器
- **arXiv**: 2611.07289 | cs.GR, **2026-11-05**
- **突破**：**3×3 输入 → 2×2 输出**的微型 MLP，在**纹理采样时**按需上采样 → **不改动任何现有纹理资产**，可作为 **GPU 着色器**执行
  - **上下文边距 $m$** 解决贴片边界块状伪影；边界处**镜像填充**
  - **主指标用 LPIPS 而非 PSNR** —— 作者论证「模糊纹理 PSNR 反而更高但视觉更差」（方法论提醒）
- **关键数据**：$d=256$ 为甜点（隐藏维度 512→8 全表）；Hangar (D/N/A) LPIPS 0.075/0.023/0.039（vs bilinear 0.193/0.088/0.094）；**全面超越 bilinear/bicubic/Lanczos**，若干场景接近离线 SOTA 的 PFT
- **协作建议**：与「五花肉」（前端 3D 编辑器 / 引擎集成）方向相关

---

## 📌 未收录但已评估的论文（判定说明）

| arXiv ID | 标题 | 判定 |
|-----------|------|------|
| 2611.07979 | Perception Over Geometry (P-MGS) | ⏭️ 昨日已收录 |
| 2611.07328 | DC-SQEM | ⏭️ 昨日已收录 |
| 2611.07909 | EDGAR（扩散驱动头像精修） | ❌ 头像生成/纹理精修，非几何处理核心 |
| 2611.07730 | World-Model-Guided Navigation | ❌ 导航/智能体，非几何处理 |
| 2611.06974 / 2611.00721 / 2611.03033 / 2611.03775 等 | T²-Splat / 参数化 / GPU-Native / FlowRig | ⏭️ 昨日已收录 |

---

## 🔁 与前几日的关联观察

1. **「置信度 / 不确定性」正在成为独立的一等公民**
   - HIBS：β = 几何置信度旋钮，**图元级**置信度场
   - REACT：逐关节逐帧**可靠性**估计 + 滞回缓冲
   - SfC：**假设空间**显式表达结构不确定性
   - 三种不同的范式（核形状 / 融合权重 / 离散假设）都在回答同一个问题：**「什么时候不该相信当前的估计？」** —— 值得作为一条独立的技术脉络跟踪

2. **点泼溅（point splatting）正在跨模态扩张**
   - HIBS（可见光 beta 核）→ 4DPS（毫米波雷达 range–Doppler 双轴）→ 同一套「显式几何 + 闭式泼溅 + 可微」范式
   - 若把 4DPS 的**线性性论证**（FFT 可推进求和内部）迁移到可见光域的球面谐波/辐射度积分，可能得到类似的可微加速

3. **可微物理 + 几何的交叉在升温**
   - SfC（可微 MPM + 假设空间）
   - 此前：MG-CD-MPM（2610.39975）、Total Deformation MPM（2610.36945）
   - **「可微模拟器 + 几何推理」是一条正在成型的独立方向**

4. **ACM DL 的持续阻断需要工程解法**
   - 连续两日、四种路径全部失败。建议本周内落地 opencli-rs 的 `dl.acm.org` YAML adapter（需先装 Chrome 扩展），否则 TOG 每期将持续漏收

---

## 🗂 本次创建的笔记

| 文件 | 主题 |
|------|------|
| `2026-11-07-HIBS-Hierarchical-Incremental-Beta-Splatting.md` | Beta 核置信度旋钮 + 闭式矩匹配合并 |
| `2026-11-07-SfC-Structure-from-Collision-Hypothesis-Space.md` | 假设空间推理反推隐藏空腔 |
| `2026-11-07-4DPS-4D-Point-Splatting-mmWave-Radar.md` | 毫米波雷达可微逆向渲染 |
| `2026-11-07-REACT-Skeletal-Motion-Signal-Completion.md` | 因果骨骼动作补全 |
| `2026-11-07-Patch-Based-Neural-Texture-Upscaling.md` | 着色器级神经纹理上采样 |
| `2026-11-07-DAILY-SUMMARY.md` | 本文件 |

---

## 🎯 下次任务待办

- [ ] 复查 **SIGGRAPH Asia 2026** Technical Papers 名单是否公布（预计 11 月下旬）
- [ ] 为 **ACM DL** 编写 opencli-rs adapter（需装 Chrome 扩展）
- [ ] 跟踪「**置信度 / 不确定性显式建模**」这条技术脉络
- [ ] 跟踪「**可微物理 + 几何推理**」交叉方向

---

*Generated by 黄喉 (wawaicai) at 2026-11-07 · 已同步至 https://github.com/zhanzhan1848/knowledge_obsidian.git*
