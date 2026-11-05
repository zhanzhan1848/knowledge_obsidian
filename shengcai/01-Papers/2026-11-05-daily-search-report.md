---
type: report
created: 2026-11-05
updated: 2026-11-05
tags: [report, daily-search, rendering, 2026-11]
agent: shengcai
---

# 每日渲染论文搜索报告 — 2026 年 11 月 5 日

## 搜索概况

- **搜索时间**: 2026-11-05 14:32 UTC
- **主窗口**: 2026-11-04 ~ 11-05（严格 24h）
- **扩展窗口**: 回溯至 2026-09-07，补充 **SIGGRAPH Asia 2026 / ACM TOG 集中上载**批次（该批次论文带 TOG DOI）
- **主数据源**: arXiv API（`cat:cs.GR` + 关键词组合）、arXiv `/list/cs.GR/new` 页面（11-05 批次 11 条）
- **论文总数**: cs.GR 新批次 11 条（含交叉列表）；扩展窗口内 SIGGRAPH Asia 2026 批次 50+ 条
- **本轮收录**: **9 篇渲染相关论文**（全部新建笔记）
- **来源可用性**:
  - ✅ arXiv API / HTML 全文（全部成功，`r.jina.ai` 代理可用）
  - ✅ SIGGRAPH Asia 2026 TOG 论文可通过 arXiv `journal_ref` + DOI 检索确认
  - ⚠️ **ACM Digital Library 仍被 Cloudflare 拦截**（403 / "Performing security verification"）；CDP 代理需 Chrome 远程调试授权，**本轮未能建立 CDP 连接**（连接超时）。已用 arXiv 上的 TOG 版本替代，覆盖 SA 2026 论文
  - ⚠️ SIGGRAPH 2026（北美）技术论文列表**仍未公布**

---

## 一、本轮核心发现（按价值排序）

### 🥇 1. Gaussian Light Transport — 13D 高斯直接求解光传输方程
**[[2026-11-05_Gaussian-Light-Transport-13D-Gaussian-GI]]** · arXiv 2609.11430 · **SA 2026 / TOG**

> 把全局光照解表示为**位置×方向×法线×材质**的 **13 维高斯混合**，**直接最小化渲染方程残差**（绕过 Neumann 级数），用 Morton tile 剔除实现分钟级优化 + 实时渲染。

| 亮点 | 数据 |
|------|------|
| 训练时间 | **7–12 分钟**（30K iter）vs 基线 1.5–4.5 小时 → **10.0–23.4× 提速** |
| 渲染速度 | 1920×1080 @ 1 spp **63 fps**，比 NR(VertexFeatures) **快 3.7×** |
| 模型体积 | **1–5.9 MB**（基线 hash grid 35.7 MB / VF 0.9–26.4 MB） |
| 剔除效率 | Bedroom 场景**平均每像素仅评估 76 个核**（共 22K） |
| FLIP 误差 | 6 场景中 **5 个更低** |

**技术亮点**：① 13D 高斯（材质/法线入空间 → 附近异面可共享核）② 半梯度（丢内积分梯度）降方差 ③ 逐子空间 Mahalanobis 早退剔除 ④ 各向异性惩罚防高斯被拉成细条
**相关性**: ⭐⭐⭐⭐⭐ 全局光照 / 光线追踪 / 实时渲染 核心命中

---

### 🥈 2. ResLRB — 常量内存的可微光线追踪
**[[2026-11-05_ResLRB-Constant-Memory-Differentiable-Light-Tracing]]** · arXiv 2610.10847 · **SA 2026 / TOG** · DOI 10.1145/3829339.3847837

> 光线追踪中每条路径有 $k$ 个传感器连接 → 伴随图是**分支**的，PRB 的非分支结构失效。**用加权蓄水池采样随机保留 1 个连接**，配 PRNG 重放 + 逐顶点局部 AD 作用域 → **显存与路径长度、连接数完全无关**。

| 指标 | naive AD (ptracer) | **ResLRB** |
|------|-------------------|-----------|
| 峰值显存 | 线性增长，**深度 16 后 OOM** | **恒定 142 MB** |
| 时间 @depth 4 | 63 ms | 93 ms（1.5× 慢） |
| 时间 @depth 8 | — | **追平** |
| 时间 @depth 16 | 260 ms | **132 ms（快 2×）** |
| depth 4→128 | — | 仅 93 → 197 ms |

**梯度正确性**：与 naive AD **符号与空间结构一致**，仅差 MC 噪声（证实无偏）；玻璃板焦散 **1024 spp** 仍可跑（naive AD 32 spp 即 OOM）
**可借鉴**：① 蓄水池权重用**亮度**（零成本）② 对数导数恒等式 $\nabla\log f=\nabla f/f$ 让每顶点独立贡献 ③ Attached 扩展用前向 Jacobian 链处理「参数扰动移动光路」
**相关性**: ⭐⭐⭐⭐⭐ 可微渲染 / 光线追踪 核心命中

---

### 🥉 3. Sensitivity AOV — 把导数当作一等渲染输出
**[[2026-11-05_Sensitivity-AOV-Differentiable-Rendering-Derivatives]]** · arXiv 2610.10852 · **SA 2026 / TOG** · DOI 10.1145/3829339.3847832

> 可微渲染每次优化都算出了 $\partial M/\partial\theta$（「场景哪部分对这个目标重要」），但**它没有像 AOV 那样成为可分解、可检查的一等输出**。本文提出「敏感性 AOV」+ 四级管线：**选择 → 聚合 → 绑定 → 编码**。

- **敏感性缓冲区**：一次反向模式传播填满整个**参数层级**（对象 → 参数类型 → 单参数），成本几乎与参数数无关
- **延迟着色类比**：adjoint sweep 只做一次，所有视图都是**重投影**（与 G-buffer 之于延迟着色同理）
- **自由检视相机**：定义目标的相机固定，查看结果的相机自由 → 移动相机不需新的 adjoint pass
- **反向/正向对偶**：反向答「哪些参数重要」（归因），正向答「单参数对图像做了什么」（预测），**后者无法由前者组装**
- **未实现的 transport view**（把参数画在它**影响落地**的位置）是最有价值的开放方向

**可借鉴**：编码选择（$\theta\partial M/\partial\theta$ 绝对 vs 等比例）会**颠覆**跨参数类型的比较结论，必须随通道显式记录
**相关性**: ⭐⭐⭐⭐ 可微渲染 / 调试工具

---

### 4. GRTMesh — GPU 原生实时纹理网格重建 + 辐射度接缝校正
**[[2026-11-05_GRTMesh-GPU-Native-Real-Time-Textured-Mesh]]** · arXiv 2611.03033 · 代码开源

> TSDF 融合 → Marching Cubes → 噪声移除 → 纹理映射 → 修补 → 辐射度接缝校正，**全部常驻 GPU**，中间数据不回传主机。

| 对比项 | nvblox | Open3D(CPU) | Open3D(CUDA) | **本文** |
|--------|--------|------------|--------------|----------|
| 总耗时 (0.02m) | 208.2 ms | 1359.4 ms | 20.1 ms | **13.1 ms** |
| 加速比 | — | — | 1.5× | **15.9×** |
| 0.005m 体素加速 | — | — | — | **29.4× / 89.7×** |
| GPU→CPU 传输 | 86.3 ms | — | 1.8 ms | **2.9 ms** |
| 其他开销 | 54.2 ms | 7.2 ms | 0.0 ms | **0.2 ms** |

- **辐射度接缝校正**：把相邻面的相机 ID 差异当**稀疏亮度失配**，在每相机 **24×16 对数增益场**上扩散（平滑项 + 锚定项），12 次无矩阵加权 Jacobi 求解，双线性烘焙进图集
- 接缝处对数亮度失配降低 **27.3–33.3%**；**单相机单增益只拿到 30–72% 的收益** → 空间变化增益场确有必要
- 诚实呈现**感知-失真权衡**：离线基线 PSNR 最低但 LPIPS 第二好
- 峰值显存：0.005m 体素 **24.1 GB**（16.6 GB 是静态网格缓冲）
**相关性**: ⭐⭐⭐⭐ 实时渲染 / 纹理映射

---

### 5. GaussianRenderFormer — 用 Transformer 替代光栅器渲染 3D 高斯
**[[2026-11-05_GaussianRenderFormer-Transformer-Rendering-3DGS]]** · arXiv 2611.05593 · **TMLR 审稿中** · 代码已开源

> 能否让 Transformer 在**完全没有光栅化器**的情况下直接渲染 3D 高斯？结论：**可以，但低 ~6 dB、慢 ~275×**。

- 主结果：300 个全新留出对象、28 视角 → **38.08 dB**，光栅化同一剪枝输入 **44.02 dB** → 差距 **5.94 dB**
- **诚实的诊断框架**（值得抄）：分别排除「泛化」（训练集上同样差 5.9 dB）、「输入信息损失」（对自身输入重打分仅高 0.3 dB）、「欠训练」（每翻倍步数 +0.9 dB，未排除）→ 结论是**视图解码器的表达瓶颈**
- **消融**：去掉**投影足迹** −1.7 dB；去掉 2D 嵌入 −5.2 dB；8×8 patch 代替 4×4 −3.0 dB
- **最高性价比技巧**：**显式告知几何足迹**（23,040 参数、零初始化）→ +1.4~1.7 dB；「网络自己能推出来的低阶量，直接喂给它」
- 第一阶段**只训新输入层**比从头训全模型高 **3.1 dB**
- 成本：195M 参数、1327 GPU-hours；单视角 275 ms（L40S）

**相关性**: ⭐⭐⭐⭐ 学习式渲染器 / 神经渲染

---

### 6. RelightFormer — 渲染方程 = Cross-Attention
**[[2026-11-05_RelightFormer-Feedforward-Multiview-Relighting]]** · arXiv 2609.07414 · **SA 2026** · 代码已开源

> **本文最漂亮的一点**：渲染方程的积分与 Transformer cross-attention 在**结构上高度相似**（都是「query 对带权 value 求加权和」）。于是把照明 token 做成 key/value、图像 token 做成 query → **注意力权重隐式学到 $f(\omega_i,\omega_o)(\omega_i\cdot n)$**，BSDF 与余弦项无需显式建模。

- **完全绕过逆向渲染**（不做 albedo/normal/roughness 估计）
- **PRope 置换不变位置编码**：旋转角来自**物理相机配置**而非帧索引 → 多视图输入顺序天然不变
- **LOD 数据集**：**90,545 个 Objaverse 对象 × 39,008 个 Laval HDRIs**
- 多视图重光照**性能随参考视图数单调提升** → 确实提取了 3D 几何
- 真实 OLATverse：环境光重光照各指标具竞争力；**旋转点光源**下 PSNR/SSIM 最佳，但 sPSNR/LPIPS 略输 Neural Gaffer（快速变化镜面光照的感知细节仍是弱项）
- **sPSNR** 指标（消除曝光失配）值得纳入自建评测

**相关性**: ⭐⭐⭐⭐ 重光照 / 光照建模

---

### 7. TailorRig — 可控的结构化服装感知绑定
**[[2026-11-05_TailorRig-Garment-Aware-Controllable-Rigging]]** · arXiv 2611.02902 · **SA 2026 / TOG** · DOI 10.1145/3829340.3842223

> 把「服装感知绑定」从**几何→绑定的自动恢复**重述为**结构化、可控的完整绑定生成**。

| 指标 | TailorRig | 最强基线 |
|------|-----------|----------|
| Body J2J | **0.023** | TARig 0.061（UniRig 0.040 → 降 42.5%） |
| Auxiliary J2J | **0.068** | UniRig 0.191 |
| Skinning L₁ (×10³) | **7.70** | — |
| Skinning Def-L₁ (×10³) | **0.60** | — |

- **两个显式控制轴**：用户指定身体骨架模板（保动画兼容）+ 艺术家语义标签（驱动自回归生成辅助骨链）
- **层级 chain-to-bone 蒙皮**：顶点先定运动链、再在链内细分骨骼 → 消除跨链权重渗漏（裙子跟随手臂）
- **Human-Mix 数据集**：**38,088 个绑定角色**，21 类骨骼分类法（11 身体 + 10 辅助），7,824 个含辅助类
- 消融：层级编码器对蒙皮贡献最大（18.60 → 7.70，**2.4×**）；Chain-to-Bone 约 **1.46×**

**相关性**: ⭐⭐⭐⭐ 角色绑定 / 蒙皮（渲染管线下游，但直接影响变形质量）

---

### 8. Recurrent Dynamic Range Extension — 递归式 HDR 高光重建
**[[2026-11-05_Recurrent-Dynamic-Range-Extension-HDR-Reconstruction]]** · arXiv 2609.13135 · **SA 2026 / TOG** · DOI 10.1145/3842579

> 先学简单任务——**把裁剪图扩展 1 档曝光**，再**递归执行**恢复完整 HDR。任务**曝光不变**、**输出域有界** → 可用**海量 RAW 数据**训练（而非稀缺 bracketing HDR）。

- **单 EV 扩展**：$I_L\in[0,1]\to I_E\in[0,2]$，**与输入名义曝光无关**
- **Memory Replay 从 NLP 迁移到图像** → 全 ResNet 跨多阶段反传可行（此前计算摄影的循环方法因反传负担只能低分辨率浅循环）
- 推理步数自适应（输出最大值 < 1.8 停止），**平均 5 步，动态范围档数翻倍以上**
- **4K 图像高光重建半秒**，保持对原图的忠实
- 与多曝光生成路线（DrTMO/CEVR/GaSLight/LEDiff）对比：后者会**主动移除有效内容**去造新的欠曝/过曝区，本文渐进扩展不损失信息
- 评测用 **PU21 空间 PSNR/VSI + P-H（高光专属）**

**相关性**: ⭐⭐⭐⭐ HDR / 计算摄影（光传输下游）

---

### 9. PIE-PS — 事件相机光度立体
**[[2026-11-05_PIE-PS-Photometric-Stereo-Event-Streams]]** · arXiv 2610.08188 · **SA 2026**

> 把**同像素两个相邻事件 + 对应光照方向**配对成 PIE，特征 **PIEF = 事件极性/事件间隔 = 有符号事件率** → **不需要未知的对比度阈值**。

| 数据集 | PIE-PS MAE | 对比 |
|--------|-----------|------|
| DiLiGenT-Sim | **8.70°** | 比 EventUPS 低 5.44°，比 direct solver 低 6.90° |
| PIE-Sim | **10.66°** | 比 direct solver 低 11.22°，比 EventPS-FCN 低 15.18° |
| 真实场景（6 个） | **10.38°** | **全部最优**，比 EventPS-FCN 低 10.53° |

- **PIE-GNN**（跨时空共享上下文）+ **RGA 可靠性加权**（软权重而非硬剔除）
- 消融：去 PIEF → 14.52°；去 RGA → 11.99°
- **有符号事件率是传感器无关的阈值规避技巧**，可迁移到任何事件相机应用

**相关性**: ⭐⭐⭐ 传感器 / 几何恢复（与渲染间接相关）

---

### 10. SketchForge — 免训练的场景到矢量素描
**[[2026-11-05_SketchForge-Training-Free-Scene-to-Vector-Sketching]]** · arXiv 2611.00253 · **SA 2026**

> **结构/纹理解耦**：轮廓要精确几何对齐、纹理要灵活笔画承载色调——统一目标互相牵制 → 两分支 + 专属目标 + multiply 融合。

- **轮廓 + DINO 注意力引导初始化**（结构分支 SSIM **0.112 → 0.807**）
- 结构多尺度损失（fine 提供边缘梯度 + coarse 锚定低频）；纹理全画布 L2
- 指标最优：**Aesthetic 4.8407 / DINO 0.4507 / Edge F1 0.9780**
- **DiffVG 免训练**，逐实例测试时优化

**相关性**: ⭐⭐⭐ 可微矢量图形

---

## 二、来源可用性说明（重要）

| 来源 | 状态 | 说明 |
|------|------|------|
| arXiv API (`export.arxiv.org`) | ✅ 可用（**必须用 HTTPS**） | HTTP 会 301/空响应；`r.jina.ai` 代理取 HTML 全文也稳定 |
| arXiv `/list/cs.GR/new` | ✅ 可用 | 11-05 批次共 **11 条**（1 新投稿 + 6 交叉列表 + 4 替换） |
| **ACM Digital Library** | ⚠️ **仍被 Cloudflare 拦截** | 403 + "Performing security verification"；Jina 代理同样被拦 |
| **CDP 浏览器** | ⚠️ **本轮连接超时** | Chrome 9222 端口在，但**远程调试授权未完成**（需用户在 Chrome `chrome://inspect/#remote-debugging` 勾选允许）。**下次 cron 前若能完成授权，可恢复 ACM DL 直采** |
| SIGGRAPH 2026（北美）技术论文列表 | ⚠️ 仍未公布 | 持续跟踪 |
| SIGGRAPH Asia 2026 | ✅ 通过 arXiv `journal_ref` + TOG DOI 覆盖 | 本轮 5 篇 TOG 论文确认 DOI |

**11-05 cs.GR 新批次构成**（共 11 条）：
- 1 条新投稿：Towards Insight-Centric Data Spaces（视觉分析 + 去中心化数据空间，**与渲染无关**）
- 6 条交叉列表（cs.CV → cs.GR）：MvBody、**GaussianRenderFormer** ✅、CtrlFlow、GREP、**CLEAR**、GPUMAP
- 4 条替换版本

→ **严格 24h 窗口内渲染核心命中 1 篇**（GaussianRenderFormer）；其余高价值论文来自 **SIGGRAPH Asia 2026 的 TOG 上载批次**（9 月起陆续上传，本轮补齐此前遗漏）

---

## 三、本轮未收录但已确认的渲染相关论文（备查）

| 论文 | arXiv | 状态 |
|------|-------|------|
| TailorRig | 2611.02902 | ✅ 已收录 |
| SketchForge | 2611.00253 | ✅ 已收录 |
| GRTMesh (GPU-Native Textured Mesh) | 2611.03033 | ✅ 已收录 |
| GaussianRenderFormer | 2611.05593 | ✅ 已收录 |
| Phase-DGS | 2611.04666 | 11-04 已收录 |
| Gaussian Light Transport | 2609.11430 | ✅ 本轮收录 |
| ResLRB | 2610.10847 | ✅ 本轮收录 |
| Sensitivity AOV | 2610.10852 | ✅ 本轮收录 |
| RelightFormer | 2609.07414 | ✅ 本轮收录 |
| Recurrent Dynamic Range Extension | 2609.13135 | ✅ 本轮收录 |
| Shedding Light（光照理解基准） | 2609.10787 | ✅ 本轮收录 |
| PIE-PS | 2610.08188 | ✅ 本轮收录 |
| CVQPG（全息二次相位高斯） | 2609.11434 | 薄笔记，本轮未展开 |
| Hologram / QPG 系列 | 2609.11434 | 全息渲染方向 |

**重复确认**（已在库，本轮仅核对）：Phase-DGS(11-04)、GraftRay(10-29)、Honeycomb-Surfels(10-29)、RADIANT(10-26)、VisibilitySplat(10-14)、CTBakeGS(10-29)、DomeGS(10-29)、AbacusGS(11-03)

---

## 四、技术趋势观察

### 趋势 1：**「把物理方程映射到网络算子」成为显式设计手法**
- **RelightFormer**：渲染方程积分 → **cross-attention**（注意力权重隐式学 BSDF×余弦）
- **ResLRB**：对数导数恒等式 $\nabla\log f=\nabla f/f$ → 局部作用域反传
- **Gaussian Light Transport**：渲染方程残差 → **直接优化目标**
共同点：不是「用网络逼近物理」，而是**找到物理公式与网络原语的结构同构**，让网络算子承担物理语义。这是今天最值得内化的方法论。

### 趋势 2：**可微渲染从「能不能算」转向「输出什么、怎么给人和工具看」**
- **Sensitivity AOV**：导数成为一等输出 + 完整的可视化管线（选择/聚合/绑定/编码）
- **ResLRB**：让梯度计算在物理上可行的深度下可跑
两者合起来：**可微渲染的工程瓶颈（显存）与表达瓶颈（如何解读）被同时正面处理**。

### 趋势 3：**「显式告知可解析计算的低阶量」反复验证为高性价比技巧**
- GaussianRenderFormer：**投影足迹**（23K 参数、零初始化）→ +1.4~1.7 dB
- Gaussian Light Transport：**法线/材质进入高斯空间** → 核数大幅减少
- PIE-PS：**有符号事件率** → 免对比度阈值
共性：**凡是能闭式算出来的几何/物理量，直接喂给网络，不要让网络去猜**。这是最值得立刻应用到自研管线的一条。

### 趋势 4：**静态场景的「预计算 + 视图无关」路线在成熟**
- Gaussian Light Transport（13D 高斯 GI，7–12 分钟训练、63 fps、1–5.9 MB）
- RelightFormer（大规模数据 + 前馈生成）
两者代表**物理求解**与**学习拟合**两条互补路径：前者给物理解，后者给快速生成。

### 趋势 5：**GPU 原生化（中间不回传主机）的收益大于单点 kernel 优化**
GRTMesh 的 Table 1 显示：nvblox 的时间大头是 **CPU→GPU 传输（86.3 ms）+ 容器开销（54.2 ms）**，而本文对应项仅 2.9 ms + 0.2 ms。**架构层面的数据流决策 > 局部 kernel 优化**。

### 趋势 6：**评测协议本身成为贡献**
- **Shedding Light**：把「生成模型懂不懂光照」转成可量化的光照参数匹配
- **RelightFormer**：引入 sPSNR 消除曝光失配
- **GaussianRenderFormer**：给出分离「泛化 / 输入信息损失 / 欠训练」三种解释的诊断框架
共同趋势：**严谨的评测设计正在和算法本身同等重要**。

---

## 五、给 @墨鱼丸（算法 agent）的方案清单

| 优先级 | 方案 | 一句话 | 建议动作 |
|--------|------|--------|----------|
| 🔴 **P0** | **ResLRB** | 常量内存可微光线追踪 | 若现有管线用 naive AD 且路径深度 >16，**优先替换**；蓄水池权重用亮度（零成本） |
| 🔴 **P0** | **显式几何量注入** | 把可解析计算的低阶量直接喂给网络 | 通用技巧，**立刻可用**（GaussianRenderFormer 的 +1.4 dB 证据） |
| 🟡 **P1** | **Sensitivity AOV** | 导数可视化 | 可微渲染调试/归因，投入产出比极高（一次 backward + 主可见性 pass） |
| 🟡 **P1** | **Morton tile + 逐子空间 Mahalanobis 剔除** | 高斯辐射场加速 | 可独立移植到任何高斯辐射场实现 |
| 🟡 **P1** | **GPU 原生化重构** | 中间数据不回传主机 | 若有 CPU-GPU 往返，先做架构级数据流重构 |
| 🟢 **P2** | **半梯度优化** | 丢内积分梯度降方差 | 廉价高收益，适用于任何嵌套积分的残差最小化 |
| 🟢 **P2** | **sPSNR / PU21 / P-H 指标** | 消除曝光失配的评测 | 纳入自建评测 |
| 🟢 **P2** | **chain-to-bone 两级蒙皮** | 先定运动链再细分骨骼 | 直接推广到头发/装备/道具蒙皮（消融 1.46×） |
| ⚪ **观察** | Gaussian Light Transport | 13D 高斯 GI | 静态场景飞行浏览值得跟进；剔除策略可先借用 |
| ⚪ **观察** | RelightFormer | 渲染方程 = cross-attention | 思路可迁移，但训练成本高 |

---

## 六、备注与待办

- **ACM DL 采集通道仍未打通**：需用户在 Chrome 打开 `chrome://inspect/#remote-debugging` 并勾选「Allow remote debugging for this browser instance」，CDP 代理即可连接（`~/.openclaw/skills/web-access/scripts/check-deps.sh` 验证）。在此之前，ACM DL 相关的 TOG/SIGGRAPH 论文通过 **arXiv 上的 TOG 版本**覆盖
- **SIGGRAPH 2026（北美，7 月举办）技术论文列表仍未公布**，预计在会议前后放出 → 后续持续跟踪
- **SIGGRAPH Asia 2026 批次仍在陆续上传**（9 月起至 11 月初），本轮补齐的 9 篇中有 7 篇属该批次 → 建议在未来 1–2 周再做一次回溯扫描
- **arXiv API 必须用 HTTPS**（`https://export.arxiv.org/...`），HTTP 会返回空响应
- 已创建 9 篇新笔记 + 本报告，MOC 已更新

---

*生菜 🥬 · 渲染研究 agent · 2026-11-05 14:32 UTC*
