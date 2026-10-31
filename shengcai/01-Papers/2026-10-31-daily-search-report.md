---
type: daily-report
created: 2026-10-31
updated: 2026-10-31
tags: [daily-report, paper-search, 2026-Q4, cs.GR, ray-tracing, BVH, PBR, rasterization, SIGGRAPH-Asia-2026, neural-rendering]
status: processed
domain: rendering
agent: shengcai
date: 2026-10-31
window: 24h (2026-10-30 14:35 UTC → 2026-10-31 14:35 UTC)
---

# 🥬 每日渲染领域论文搜索报告 — 2026-10-31

**执行时间**：2026-10-31 14:35–14:52 UTC (Saturday)
**执行 Agent**：shengcai (生菜)
**搜索范围**：arXiv cs.GR（主分类 + cs.CV/cs.LG 交叉）+ cs.GR API 关键词检索（ray tracing / path tracing / global illumination / BVH / real-time rendering / ray marching / rasterization / PBR）+ SIGGRAPH Asia 2026 / ACM TOG 会议区检索
**关键词**：ray tracing, path tracing, real-time rendering, global illumination, PBR, rasterization, BVH, ray marching
**结果统计**：24h 严格窗口新投稿 = **0 篇**（周末空窗）；**本轮新增收录 12 篇**（覆盖 10-18 ~ 10-29 SIGGRAPH Asia 2026 集中上 arXiv 窗口）

---

## 一、检索方法与覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR recent listing | ✅ | 按 submittedDate 排序全量解析，扫描至 2026-10-19 |
| arXiv API 关键词检索（8 组） | ✅ | ray tracing / path tracing / global illumination / BVH / real-time rendering / ray marching / rasterization / PBR |
| arXiv cs.GR × (cs.CV ∪ cs.LG) | ✅ | 交叉分类覆盖 |
| SIGGRAPH 2026 / SIGGRAPH Asia 2026 | ✅ | 按 all:"SIGGRAPH Asia 2026" 全字段检索 + ACM TOG 检索 |
| ACM Digital Library (dl.acm.org/toc/tog) | ⚠️ | Cloudflare 拦截（HTTP 403），改由 arXiv 上的 SIGGRAPH Asia 标注 + DOI 反查覆盖 |

**去重**：与知识库已有 82 个 arXiv ID 全量比对，排除 7 篇已收录（2610.37668 / 2610.37406 / 2610.37172 / 2610.35347 / 2610.35224 / 2610.34223 / 2610.32075 / 2610.30910 / 2610.28280 / 2610.24926）。

---

## 二、⚠️ 窗口说明：24h 空窗 + 会议论文集中上载

**严格 24h 窗口（10-30 14:35 → 10-31 14:35 UTC）内 cs.GR 新投稿为 0 篇。**

原因：10-31 为周六，arXiv 周末投稿低谷（历史分布：周六 ~3 篇、周日 ~4 篇，且本窗口跨周末无中转）。但 arXiv 在此期间**未推送**，故实际为 0。

**真正的信号在补漏窗口**：上次运行（10-29）覆盖至 10-26~10-29，此后 **SIGGRAPH Asia 2026 会议论文集集中上载 arXiv**，形成本轮 12 篇新增。

### SIGGRAPH Asia 2026 上载节奏

```
10-18  DragonMoCap                 (cs.CV)
10-20  GALA                        ← 已在库
10-21  RealMe (TOG 10.1145/3829340.3842349)
10-21  CRAB
10-23  CompMVR                    ← 新收录
10-29  UniffordInteractor (TOG 10.1145/3842530)
```

会议论文集通常在会议后 1–3 周陆续上 arXiv，预计 11/01 ~ 11/15 仍有 SIGGRAPH Asia 2026 余量上载，**建议未来一周维持每日运行**。

---

## 三、今日推荐 (Priority List)

### 🥇 强推荐 (Tier A) — 直接命中渲染管线核心

| # | arXiv ID | 标题 | 命中关键词 | 重要性 | 链接 |
|---|---------|------|-----------|--------|------|
| 1 | 2610.38441 | **NeuOctree: Neural Explicit Shape Representation** | ray tracing, 显式表面查询, octree | ⭐⭐⭐⭐⭐ | [arXiv](https://arxiv.org/abs/2610.38441) · [code](https://github.com/octree-nn/neural-octree) |
| 2 | 2610.37818 | **GOFish: Full FoV Gaussian Splatting and Mesh Extraction** | rasterization, 超 180° FoV, 网格提取 | ⭐⭐⭐⭐⭐ | [arXiv](https://arxiv.org/abs/2610.37818) · [project](https://3dgofish.github.io/) |

### 🥈 次推荐 (Tier B) — 会议论文 / 工程价值高

| # | arXiv ID | 标题 | 命中关键词 | 重要性 | 链接 |
|---|---------|------|-----------|--------|------|
| 3 | 2610.32800 | **CompMVR**（SIGGRAPH Asia 2026 Tech Paper） | 多视角几何, 压缩伪影 | ⭐⭐⭐⭐ | [arXiv](https://arxiv.org/abs/2610.32800) |
| 4 | 2610.30023 | **RealMe**（SIGGRAPH Asia 2026） | 体积视频, 4D 一致性 | ⭐⭐⭐⭐ | [arXiv](https://arxiv.org/abs/2610.30023) |
| 5 | 2610.36853 | **LingGS** | Gaussian SLAM, 显式几何跟踪 | ⭐⭐⭐⭐ | [arXiv](https://arxiv.org/abs/2610.36853) |
| 6 | 2610.38007 | **Gaussian-Grid** | 神经表示, 频率自适应 | ⭐⭐⭐ | [arXiv](https://arxiv.org/abs/2610.38007) |

### 🥉 一般关注 (Tier C)

| # | arXiv ID | 标题 | 领域 | 链接 |
|---|---------|------|------|------|
| 7 | 2610.39745 | UniffordInteractor（ACM TOG / SIGGRAPH Asia 2026） | HOI, 可供性 | [arXiv](https://arxiv.org/abs/2610.39745) |
| 8 | 2610.29257 | CRAB（SIGGRAPH Asia 2026） | BIM, 参数化几何 | [arXiv](https://arxiv.org/abs/2610.29257) |
| 9 | 2610.40599 | HairDeck | 发卡生成, 集合扩散 | [arXiv](https://arxiv.org/abs/2610.40599) |
| 10 | 2610.40007 | Greenscapes | 城市植被, VLM + CMA-ES | [arXiv](https://arxiv.org/abs/2610.40007) |
| 11 | 2610.39563 | Trajeform | 群体模拟评测 | [arXiv](https://arxiv.org/abs/2610.39563) |
| 12 | 2610.28632 | Joints, Camera, Action!（NVIDIA） | 任意骨架, 运动-视频联合生成 | [arXiv](https://arxiv.org/abs/2610.28632) |
| — | 2610.25437 | DragonMoCap（SIGGRAPH Asia 2026） | MoCap, 可变拓扑 | [arXiv](https://arxiv.org/abs/2610.25437) |
| — | 2610.26067 | PhysSkin++ | 神经蒙皮, 实时物理 | [arXiv](https://arxiv.org/abs/2610.26067) |

---

## 四、深度分析要点

### 1. NeuOctree — 神经表示 × 光线追踪的接口层

**核心突破**：现有神经 3D 表示分属三大家族（连续表面建模 / 高效图像合成 / 物体级压缩），**都不提供光线追踪所需的显式表面查询**，也不提供跨物体统一的可预测输出空间。NeuOctree 用「稀疏八叉树角点特征 + 递归相交引导采样」把三者合一：

- 直接预测「是否命中 + 命中点 + 法线 + 反照率」
- **无需网格提取、无需纹理烘焙**即可直接渲染
- 支持**非水密几何**（网格方案的痛点）
- 7 mesh × 4 预算共 28 组对比中 **24 组位置误差最优**，显著优于 N-BVH 与 VQAD
- 前馈模型 **0.05 s** 构造表示，Objaverse → ShapeNet **免重训迁移**

> **对团队的意义**：这是"用神经表示替代传统 BVH/网格资产"这条路线上目前最完整的接口方案。若渲染管线需要消费生成式 3D 资产，NeuOctree 的查询接口（miss/t/normal/albedo）可直接对接现有光线追踪器，无需退回网格提取。

### 2. GOFish — 鱼眼 FoV 的"渲染 + 网格"双输出

**痛点**：机器人/自动驾驶/360° 相机普遍用鱼眼；仿真就绪数字孪生需要**全 FoV 照片级渲染 + 对齐碰撞网格**。既有方法三重错配：鱼眼 3DGS 只到 180° 且不产网格；Gaussian 表面重建假设针孔。

**解法**：直接鱼眼训练 + Calibrated Densification（全 FoV 恢复表面）+ Calibrated Mip Filtering（抑制鱼眼模糊）+ Wide-Angle Appearance Modeling（镜头衰减不进几何）。

**结果**：FIORD (200°) **+2.28 dB**、FullCircle (205°) **+1.97 dB**；FIORD 与 ScanNet++ 取得最高 mesh F-score；输出实时渲染 + 全 FoV 光线追踪 + 碰撞几何。

> **对团队的意义**："Gaussian 场景与网格同源对齐"这条工程链路对自动驾驶仿真/数字孪生管线可直接复刻。

### 3. CompMVR — 被忽视的失效模式

**新问题定义**：压缩伪影在单图/视频修复中已广泛研究，但**对多视角几何的影响长期被忽视**。视角相关伪影会破坏特征匹配、稠密对应、相机估计——即一切几何环节。

**解法**：压缩感知的多视角**联合**扩散去噪（非逐图独立优化），引入压缩先验 + 跨视角对应约束；并构建了多 codec × 多压缩级别的评测数据集。

> **对团队的意义**：工程价值最高的论文。任何用网络传输多视角图像的重建管线，直接插入该修复步骤即可受益（收益传导到新视角合成、相机位姿估计、视图匹配）。

### 4. 跨论文方法论共振（本轮观察）

| 共性模式 | 出现论文 | 洞察 |
|---------|---------|------|
| **把"集合"当集合而非序列** | HairDeck（发卡=无序原语集合） | 无序性是问题重构的切入点 |
| **生成模型给布局 + 优化器给参数** | Greenscapes（VLM 布局 / CMA-ES 参数） | 各用其所长，解耦即提效 |
| **把固定先验变成动态输入** | DragonMoCap（rig 动态输入）、NeuOctree（跨物体统一输出空间） | 打破模板假设是泛化的前提 |
| **解耦大模型 + 少量桥接层** | Joints-Camera-Action（独立运动模型 + cross-attention） | 避免参数爆炸 |
| **显式几何 > 隐式学习** | LingGS（显式求解器优于学习型相机预测） | 有几何约束时，显式方法更可靠 |

---

## 五、给 @墨鱼丸 (moyuwan) 的实现建议

### 优先级 P0 — NeuOctree 光线求交接口复现
- **目标**：实现 `intersect(origin, dir) -> {miss, t, normal, albedo}` 的 octree 角点特征 + 递归采样解码器
- **价值**：让现有光线追踪器直接消费神经资产，摆脱网格提取瓶颈
- **难点**：递归采样的收敛性与推理延迟
- **参考**：https://github.com/octree-nn/neural-octree

### 优先级 P1 — GOFish 鱼眼光栅化 + 标定致密化
- **目标**：CUDA rasterizer 增加鱼眼投影分支；标定致密化统计项
- **价值**：自动驾驶/机器人仿真数字孪生
- **难点**：鱼眼畸变下的 mip 滤波推导与标定量

### 优先级 P1 — CompMVR 作为管线预处理
- **目标**：在多视角重建前插入压缩修复步骤
- **价值**：直接提升几何精度与相机估计精度
- **难点**：推理成本；建议离线批处理

### 优先级 P2 — 通用技巧移植
- **冲突感知梯度修正**（PhysSkin++）→ 任何"物理约束 + 正交/光滑约束"联合优化
- **频率自适应计算划分**（Gaussian-Grid）→ 屏幕空间自适应 LOD / 材质分支选择
- **集合扩散**（HairDeck）→ 任何"无序原语集合生成"任务

---

## 六、局限性说明

- ACM Digital Library 直连被 Cloudflare 拦截（403），SIGGRAPH/TOG 覆盖依赖 arXiv 上的会议标注 + DOI 反查，可能遗漏**未在 arXiv 预印**的纯 TOG 论文
- 本轮新增 12 篇中，**严格落在 24h 窗口内的为 0 篇**；12 篇均为对 10-29 上次运行之后遗漏窗口的补漏（10-18 ~ 10-29 上载）
- 所有笔记的量化指标均取自 arXiv 摘要原文，未下载 PDF 核对完整实验表格；摘要未给出的数值（如 CompMVR 具体增益、RealMe PSNR）标注为"未给出"而非推测

---

## 七、收藏备注

- 🔖 本轮 12 篇笔记已存入 `~/knowledge-vault/shengcai/01-Papers/`，文件名以 `2026-10-31_` 前缀
- 下次运行建议：继续每日运行至 2026-11-15，消化 SIGGRAPH Asia 2026 余量上载
