---
type: report
created: 2026-11-11
updated: 2026-11-11
tags: [daily-report, fluid-rendering, arxiv, cs.GR, literature-review]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/list/cs.GR/recent
---

# 📚 豆苗每日研究汇总 — 2026-11-11

> **本期关键词**：**空窗终结 · 基础设施解锁 · 方法论转向 · 物理锚点下沉**
> 采集窗口：2026-11-10 15:00 UTC → 2026-11-11 15:00 UTC（24h）+ 48h 缓冲
> 候选池：arXiv `cs.GR` + `physics.flu-dyn` + `cs.CV` + `cs.LG`；SIGGRAPH / SIGGRAPH Asia 会议清单
> **入库：23 篇全部新增**（去重后 0 重复）｜ 知识库已有 ID：502

---

## 🎯 本期总览

**11-06 ~ 11-08 连续三轮"cs.GR 零流体新论文"的空窗被打破**。本期不只是数量回升（23 篇 vs 前期 5 篇），更出现了**三处结构性变化**：

### 变化一：稀疏网格从"只读格式"变成"可模拟基础设施"

[[2026-11-11-Sifakis-Williams-Horvath-Dynamic-GPU-Voxel-Grids-NanoVDB]]（NVIDIA）给 NanoVDB 装上**动态 GPU 原生拓扑**（位并行的膨胀/合并/剪枝/跨分辨率粗化细化，**数亿体素数毫秒重建**）与 **voxel-sequential 流式访问**（活跃体素 → 扁平线性序列，**免树遍历**，让复杂 stencil **逼近峰值显存带宽**）。

> **为什么重要**：NanoVDB / fVDB 长期以来的"静态拓扑"假设，**正是稀疏网格在 CFD 与烟雾模拟中落地的最大结构性障碍**——模拟每帧都要改密度场拓扑。这项工作的价值不在渲染本身，而在**它解锁了整个稀疏网格流体模拟路线**。

### 变化二：可微模拟进入"分类学 + 按需定制"阶段

两篇互为表里：
- [[2026-11-11-Shu-Huang-Chen-Same-Physics-Different-Gradients]]（**35 页 / 9 表综述**）：把文献混谈的两个问题彻底分开——**referent**（导数指向有限计算 / 收敛方程 / 连续动力学）× **realization**（自动微分 / 方程级伴随 / 自定义伴随）。**证明"精确性 ↔ 内存"的表观权衡源自方法的构建方式，而非物理约束**。更狠的是它追问"**正确的梯度真的有用吗**"，归纳并实测 **4 种梯度丢失机制**，结论是**零阶方法在这些区间可优于模拟器梯度**。
- [[2026-11-11-Liu-Hydrograd-Shallow-Water-Differentiable-Model]]：**教科书式示范**——稳态走**牛顿法 + 隐函数定理**（梯度成本 = 一次线性解），非稳态走反向模式 + checkpointing（≈ 两次前向）；**稳态闭合学习快 96×** 且损失更低；并用 **SVD 可辨识性分析**证明"总阻力敏感度比其分布高 70–160×"，从而解释**为什么只有每个分区都布站的方案才能恢复全部 5 个糙率值**。

### 变化三：物理约束持续下沉，且开始提供"可直接查表"的特效锚点

- [[2026-11-11-Mishra-Pal-Singular-Jet-Drop-Impact-Crater-Collapse]]：**奇异射流**——撞击凹坑塌陷绕过夹断奇点，AMR 轴对称 DNS 给出**夹带气泡 ~210 μm**、**射流 61.7 m/s**、**侧壁-底部临界夹角 109.2°**（射流区形态判据），以及 **We=45.5·Fr^0.237 / 53.5·Fr^0.251** 的卷吸区相图边界。
- [[2026-11-11-Lewin-Jones-Harris-Cimpeanu-Bouncing-Merging-Drop-Bath-Impacts]]：**弹开 vs 合并**的临界撞击速度，**仅用独立测量的材料参数**首次与实验**定量吻合**（薄膜润滑含显著曲率 + 范德华分离压 + 气体动理学平均自由程）；浅池/薄膜出现 **bounce-merge-bounce-merge 转变**。
- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]]：**Q–R 图三区域物理分区**——head(拉伸) / body(螺旋涡臂) / tail(耗散)，且**三个旋钮可控**：应变率↑ → head 变宽；截止年龄↑ → body 倾角增大；黏性因子↓ → tail 延伸。
- [[2026-11-11-Rosti-Mazzino-Elastic-Frontogenesis-Smooth-Turbulence]]：**弹性锋生**——无涡层级的平滑流靠"应力薄片 + 放大-变薄律"也能产出宽带幂律谱，是**涡拉伸的黏弹性对应物**。

---

## 🔥 本期最贴近渲染的三篇

| 排名 | 论文 | 为什么 |
|------|------|--------|
| ⭐1 | [[2026-11-11-Sifakis-Williams-Horvath-Dynamic-GPU-Voxel-Grids-NanoVDB]] | 解锁**稀疏网格 + 动态拓扑 + 峰值带宽 stencil** → 实时稀疏网格烟雾模拟从此可行 |
| ⭐2 | [[2026-11-11-Shramko-Govindarajan-Spaghetti-Splatting]] | **3DGS 的严格超集**，曲线基元 + 折线卷积 + 接头不重复计数 + 逐段线性化投影；产出**长连通细丝直接接入物理模拟** |
| ⭐3 | [[2026-11-11-Leonard-Westermann-Real-Time-Volumetric-Light-Transport-Inference]] | **跳过路径追踪**，廉价特征 → 注意力 I2I 网络直接回归像素辐亮度；**相机推拉成本稳定**、对密度依赖低 → 实时体积云 |

---

## 📂 按主题归类（23 篇）

### 🌊 体积渲染 / 神经表示（2）
- [[2026-11-11-Leonard-Westermann-Real-Time-Volumetric-Light-Transport-Inference]] — 免路径追踪的实时光照传输推断
- [[2026-11-11-Sifakis-Williams-Horvath-Dynamic-GPU-Voxel-Grids-NanoVDB]] — NanoVDB 动态 GPU 拓扑

### ⚛️ 粒子 / 降阶 / 代理模型（6）
- [[2026-11-11-Shramko-Govindarajan-Spaghetti-Splatting]] — 曲线基元卷积渲染
- [[2026-11-11-Platenburg-Koupai-Cinnella-TurtLES-Turbulent-Neural-PDE-Surrogate-Benchmark]] — 14 TB 湍流神经代理基准（三大失效模式）
- [[2026-11-11-Barman-Ray-Hankel-Neural-Operator]] — Hankel 神经算子（FNO 是特例）
- [[2026-11-11-Sakib-Mychkovsky-Babaee-Low-Rank-Tensor-Manifolds-Turbulence]] — MANTRA 低秩张量流形重建
- [[2026-11-11-Rezaei-Bastanfard-3D-Cellular-Automata-XR]] — 3D CA 进 XR 的五层架构
- [[2026-11-11-Sun-Radovanovic-CrowdDirector-Natural-Language-Crowd-Control]] — LLM 只在指令变化时调用

### 💧 水 / 液体 / 海洋（4）
- [[2026-11-11-Mishra-Pal-Singular-Jet-Drop-Impact-Crater-Collapse]] — 奇异射流
- [[2026-11-11-Lewin-Jones-Harris-Cimpeanu-Bouncing-Merging-Drop-Bath-Impacts]] — 弹跳 vs 合并
- [[2026-11-11-Qin-Sun-Tian-HaiRuo-Ocean-Eddy-Forecasting]] — 海洋涡旋基础模型
- [[2026-11-11-Modesti-Ceci-Variable-Property-Water-Turbulent-Heat-Transfer]] — 变物性水湍流换热

### ⚙️ 求解器 / 可微物理 / 数值格式（4）
- [[2026-11-11-Shu-Huang-Chen-Same-Physics-Different-Gradients]] — 可微模拟双轴分类法
- [[2026-11-11-Liu-Hydrograd-Shallow-Water-Differentiable-Model]] — 定制梯度的可微浅水模型
- [[2026-11-11-Stewart-Menke-Egya-Conservative-Darcy-Brinkman-Stokes-DBS2]] — DBS2 守恒形式
- [[2026-11-11-Zhang-Su-Li-Xu-CLUGKS-Hypersonic-Receptivity]] — 复线性化 UGKS

### 🌬️ 湍流物理 / 统计（3）
- [[2026-11-11-Zheng-Shen-Xie-Velocity-Gradient-Invariants-Lundgren]] — Q–R 图三区域
- [[2026-11-11-Wang-Bao-Wang-Cardiac-Cycle-Pulsatile-Pipe-Flow]] — 心脏周期脉动管流相分辨
- [[2026-11-11-Rosti-Mazzino-Elastic-Frontogenesis-Smooth-Turbulence]] — 弹性锋生

### 📐 数据 / 逆问题 / 变分原理（3）
- [[2026-11-11-Zhang-Kaufer-Ronglan-Triantafyllou-Bluff-Body-Wakes-Dataset]] — 九钝体尾迹 DNS+PIV 交叉验证数据集
- [[2026-11-11-Bonart-Amortized-Transport-Map-Wetting-Inverse-Problem]] — 摊销传输映射（润湿反演）
- [[2026-11-11-Flachberger-Einkemmer-Variational-Principles-Dissipative-Continua]] — 耗散变分原理的最小-最大对偶
- [[2026-11-11-Chamala-Balasubramaniam-Coutier-Delgosha-RAFT-CloudCavitation]] — RAFT-CloudCav 免示踪两相测速

---

## 🧭 值得关注的方法论信号

1. **"在图像空间推理"正在成为实时候选的默认选择**。[[2026-11-11-Leonard-Westermann-Real-Time-Volumetric-Light-Transport-Inference]] 的成本优势来自一个反直觉的洞察：**推理在 2D 图像空间做 → 成本与体积复杂度、相机距离解耦**。这比"把路径追踪做快"更容易兑现成实时。

2. **可微模拟正在从"能不能做"走向"该怎么做"**。综述 + 定制梯度实现 + 守恒形式白送项，三篇合看是一条清晰的方法论主线：**先确定 referent（你要对谁求导），再选 realization（怎么求导）**。

3. **物理论文开始主动提供"查表式"特效参数**。奇异射流的 61.7 m/s 与 109.2° 夹角、弹跳-合并的临界速度、We-Fr 相图边界——这类量**可以直接作为风格化特效的触发条件与幅度锚点**，省掉大量试错。

4. **数据集正在向"暴露失效模式"而非"展示 SOTA"转型**。TurtLES 的价值在于**把神经算子在长时程 rollout 中的三大失效模式说清楚**（时间不稳定 / 小尺度能量丢失 / 大不规则域学习困难）——这三条几乎逐字对应渲染中"烟流逐渐糊掉/闪烁/细节丢失"的症状，是极好的**问题定义源**。

---

## 🛠️ 工具与流程备注

- **arXiv API 修正**：本轮发现 Web Search provider 对 arXiv cs.GR 检索质量极差（只返回 Wikipedia 之类），**必须直接走 `export.arxiv.org` API**。且需注意：① 必须用 `https://`（`http://` 返回空）；② 复杂布尔查询中的**带引号短语会被静默忽略**，应改用不带引号的词项组合 + `date_after` 过滤。已在流程中固定使用 `--data-urlencode` + `sortBy=submittedDate`。
- **去重脚本**：本轮跑 `dedup.py` 得"候选 23 → 新增 23 / 重复 0"，与 `grep` 独立核对的已知 ID 集合一致（502 个），**未复现上一轮记录的递归扫描 bug**（本轮 papers 目录内无 `2026/11/` 子目录结构，所有笔记均平铺于 `01-Papers/`）。
- **SIGGRAPH/SIGGRAPH Asia**：本轮 API 检索未发现新的 2026-11 会议投稿；SA2026（12/01–04 吉隆坡）清单按上轮结论仍视为**已 100% 覆盖入库**，无需重复审计。

---

## 📌 下期关注

1. **NanoVDB 动态拓扑的实测落地** —— 是否有实时稀疏网格烟雾模拟的 demo（这将是本库长期关注的"实时流体降本"主线的关键一环）。
2. **TurtLES 是否成为神经代理的新事实基准** —— 关注有无新工作在其上给出通过长时程 rollout 的结果。
3. **Spaghetti Splatting 的代码发布** —— 若开源，曲线基元 3DGS 可直接用于流体细丝/水柱重建。
4. **HaiRuo 与海洋渲染的接口** —— 涡心误差 25 km 量级适合驱动洋流贴图与涡旋泡沫拖尾；关注有无下游渲染工作。
5. **SIGGRAPH Asia 2026 会议列表页** —— 开幕前 3 周，若仍无新增清单则维持"已覆盖"结论。

---

🩸 **本期可行性结论**

| 方向 | 判断 |
|------|------|
| **稀疏网格实时流体** | ✅ **强烈推荐跟进**（NanoVDB 动态拓扑已铺好基础设施） |
| **实时间体渲染** | ✅ **推荐跟进**（免路径追踪路线已成立，需评估训练成本） |
| **可微流体求解器** | ✅ **推荐跟进**（分类法 + 定制梯度已成体系） |
| **粒子/曲线基元渲染** | ✅ **推荐跟进**（Spaghetti Splatting 是 3DGS 的严格超集） |
| **海洋涡旋驱动渲染** | ✅ **可考虑**（HaiRuo 代码开源，先验证成本） |
| **DNS 级湍流直接实时化** | ❌ **不推荐**（仅适合作为参数锚点与离线真值） |

已传递给 @墨鱼丸。
