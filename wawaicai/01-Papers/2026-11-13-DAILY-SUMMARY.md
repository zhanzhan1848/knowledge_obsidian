---
type: summary
created: 2026-11-13
updated: 2026-11-13
tags: [daily-summary, 几何处理, 每日论文, 2026-11-13, 最近邻搜索, UV展开, 装配重建, 交互物理]
status: processed
domain: 计算机图形学几何处理
agent: wawaicai
source: https://arxiv.org/list/cs.GR/recent
---

# 🥬 每日几何处理论文摘要 — 2026-11-13

> **搜索窗口**：2026-11-12 14:37 UTC → 2026-11-13 14:37 UTC（最近 24 小时）
> **搜索源**：arXiv cs.GR（主，含 API submittedDate 精确窗口查询 + 10 组关键词扫描）+ cs.GR RSS + ACM DL + SIGGRAPH/SIGGRAPH Asia/Eurographics
> **命中**：**6 篇新增候选 → 4 篇几何相关**（全部完成精读与结构化笔记；2 篇判定为非几何处理主题，未建笔记）

---

## 📌 本批次说明

**arXiv 批次已正常公布**（对比昨天 arXiv 批次延迟的情况，本次无延迟）。2026-11-13 批次共 9 篇 cs.GR 论文，其中 6 篇在 24h 窗口内。

**检索方法**：
1. arXiv API `submittedDate:[202611102200 TO 202611142359]` 精确窗口查询 → 6 篇
2. 10 组关键词扫描（mesh processing / geometry processing / point cloud / parametrization / remeshing / subdivision surface / mesh simplification / mesh generation / surface reconstruction / triangulation）→ 交叉验证
3. cs.GR RSS feed → 9 篇（含 3 篇旧论文修订版，已排除）
4. `dedup.py` 与知识库比对：候选 6 → **新增 6 / 重复 0**（库内已有 142 个 arXiv ID）

**会议源状态**：
- **ACM Digital Library**：仍被 Cloudflare 拦截（403 "Just a moment..." 挑战页），本次**未能获取内容**。这是连续第 2 天失败。
- **SIGGRAPH Asia 2026**（2026-12-01~04, 吉隆坡）：官网已上线，但**论文列表尚未发布**，暂无可收录论文。
- **Eurographics / diglib**：2026 年论文集页面未找到（404）。

---

## 📚 今日新增（4 篇几何相关）

### 1. Delaunay-Based Nearest Neighbor Search with Grid-Accelerated Queries and Parallel Construction ⭐⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.15320](https://arxiv.org/abs/2611.15320)（2026-11-11, cs.GR; cs.CG） |
| **单位** | 厦门大学 |
| **核心** | 加速 **DP-NNS**（基于增量 Delaunay 构建历史的 successor DAG 最近邻搜索）：① 网格化查询初始化（借 Voronoi 凸性引理预计算共享起始点，跳过搜索路径前缀，**保持精确性**）；② **层级一致并行构建**（证明保持 $O(\log n)$ 期望查询代价）；③ Morton 曲线查询重排 |
| **结果** | 查询 **2× 加速**（0.144 vs 最快基线 0.817 μs @Sponza）；构建 **~10×** 加速（499 ms vs 6390 ms @Sponza）；距离评估降低 35–40%；作为 drop-in 后端集成 point-to-plane ICP 获端到端加速 |
| **意义** | **几何处理最底层的距离查询原语**。隐式曲面重建 / SDF 计算 / 神经隐式训练期体素查询 / 点云配准——全是"表面数据 + 体空间查询"这一 k-d tree / uniform grid 性能崩塌的病态分布 |
| **结论** | ✅ **推荐实现** — CGAL + oneTBB 即可复现，理论有保障，数值稳定性好（CGAL 精确谓词） |
| 笔记 | [[2026-11-13-Delaunay-Based-Nearest-Neighbor-Search-Grid-Accelerated]] |

---

### 2. Sprint3D: Accelerating End-to-End 3D Asset Generation through Pipeline Optimization ⭐ 重点
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.16701](https://arxiv.org/abs/2611.16701)（2026-11-12, cs.CV; cs.GR）｜ [代码](https://github.com/AlayaLab/sprint3d) |
| **单位** | Alaya Lab / U Tokyo / UC Merced / IST / NYCU |
| **核心** | **几何处理含量被摘要严重低估**——本质是 GPU 网格后处理管线报告。剖析发现：四个 rectified flow 只占 **14%** 墙钟时间，**网格后处理占 85%**，其中大头是 **CPU 端 UV 展开** |
| **几何技术** | ① **单遍 GPU 图表分割**（取代 CPU xatlas，-30.5 s）② 16-tile 图集并行展开 ③ **自适应半分辨率重网格化**（narrow-band dual contouring）④ GPU 简化（并行边折叠 + QEM）⑤ GPU 线性 BVH |
| **结果** | **133 s → 4.05 s（33×）**，网络评估 76 → 8 次；**TRELLIS.2 单独受益 6.7×**；Toys4K 2,653 对象上**输入视角法线指标全部 10 列显著优于**发布管线，但轮廓 IoU 略低、point-cloud 对齐下降、精细纹理减少 |
| **结论** | ⚠️ **谨慎评估（但 profiling 结论必读）** — 「85% 时间在网络之后」会改变很多团队的资源分配判断；单遍 GPU 图表分割可直接独立使用（算法均有现成参考：SF3D 投影 / FastAtlas chart / TABI packer） |
| 笔记 | [[2026-11-13-Sprint3D-Accelerating-3D-Asset-Generation-Pipeline-Optimization]] |

---

### 3. PIM: A Physical Intuition Model for Low-Latency Prediction of Object Interaction Outcomes
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.16673](https://arxiv.org/abs/2611.16673)（2026-11-12, cs.GR） |
| **核心** | **一次前向直接预测交互后的平衡态网格**，取代自回归 rollout。局部 KNN 注意力（初始空间固定图）编码物体内部几何 + **锚点式跨物体注意力**（确定性 FPS）建模交互 + **双分支解码**（物体级平移 + 逐顶点残差） |
| **结果** | 四个 MuJoCo 场景**全部**取得最低顶点/质心误差；相对 HOPNet-Adapt 顶点误差 −20.5%；**相对 MeshGraphNet 延迟低 53.4×**、吞吐高 32.8×；Deformable 场景比 MuJoCo rollout **快 9,692×**；OOD（位置/速度/力/形状）全部最优，Shape OOD 上超最强基线 10.9%/9.7% |
| **亮点** | **边长保真损失（edge loss）**——去掉后顶点误差仅 +4.2%，但边长误差涨 **3.27×**，局部形状严重畸变而位置指标几乎掩盖 |
| **结论** | ⚠️ **谨慎评估** — 严重依赖固定拓扑与固定物体顺序，几何管线中往往是硬约束；但「局部 KNN + 锚点跨物体 + 平移/残差双分支」是可迁移的网格建模模板，**edge loss 值得引入任何顶点级预测任务** |
| 笔记 | [[2026-11-13-PIM-Physical-Intuition-Model-Equilibrium-Prediction]] |

---

### 4. BrickFlow: Connectivity-Guided Brick Reconstruction
| 项 | 内容 |
|---|---|
| **arXiv** | [2611.17321](https://arxiv.org/abs/2611.17321)（2026-11-12, cs.CV; cs.GR）｜ [项目页](https://kulits.github.io/BrickFlow/) |
| **单位** | Inria / ENS（Peter Kulits, Cordelia Schmid） |
| **核心** | 集合条件 **SE(3) 流模型**（DiT，无等变层，无位置编码）+ **解析连通性场**：把装配看作**电网络**，用**有效电阻**定义能量 $E(X)$——**当且仅当装配真正连通且坐到位时 $E$ 与梯度精确为零**（1,000 个 held-out 装配验证）。测试时用 $\nabla E$ 引导采样（DPS 框架），**无需重训或辅助网络** |
| **结果** | 连通性引导在**全部 12 个配置上单调提升 Valid**，最高 +7.2 个百分点（BrickNet / IC DiT-L：30.5 → 35.1），同时碰撞数下降；超参鲁棒（$\gamma$ 1→4 等变化 Valid 波动 ≤2.1 点） |
| **亮点** | ① **能量在合法解处精确为零**（而非近似）——极难得的强性质 ② 惯性加权损失 + 二阶矩统一量纲的位姿距离 ③ 旋转采样用 $\kappa\Delta t$ 替代发散的 $\Delta t/(1-t)$（流匹配通用陷阱） |
| **结论** | ⚠️ **谨慎评估** — 「离散约束 → 连续可微能量 → 测试时引导」是**装配/拓扑约束重建的通用范式**，值得记入技术备忘；但连接器族需手写解析定义，有效电阻计算成本随 $N^2$ 增长 |
| 笔记 | [[2026-11-13-BrickFlow-Connectivity-Guided-Brick-Reconstruction]] |

---

## 🚫 未建笔记（判定为非几何处理主题）

| arXiv | 标题 | 判定理由 |
|--------|------|---------|
| 2611.17185 | Neural Render Proxies for Interactive and Differentiable Lighting | 渲染/光照代理，无几何处理内容（属生菜渲染域） |
| 2611.17298 | Consistent Video-to-Video Translation via Explicit Correspondences | 视频翻译/对应，属视觉域非几何处理 |

---

## 🧭 今日技术备忘（可迁移模式）

| 模式 | 出处 | 可迁移场景 |
|------|------|-----------|
| **网格化共享起始点跳过 DAG 搜索前缀** | Delaunay NNS | 任何"表面数据 + 体空间查询"管线；Voronoi 凸性引理 |
| **层级一致插入序保持 $\log n$ 查询代价** | Delaunay NNS | 并行构建设计（顺序敏感性的一般性结论） |
| **剖析先于优化——瓶颈常在网络之外** | Sprint3D | 任何生成式管线；85% vs 14% 的分配是通用警示 |
| **单遍 GPU 图表分割取代 CPU 展开** | Sprint3D | 任何批量 UV 展开（可独立于生成模型使用） |
| **自适应半分辨率重网格化的厚度副作用** | Sprint3D | dual contouring 双壁壳体；降分辨率会加倍内壁厚度 → 污染 point-cloud 指标 |
| **边长保真损失暴露被位置指标掩盖的畸变** | PIM | 任何顶点级预测任务 |
| **锚点 FPS 压缩跨物体交互** | PIM | 物体数量多时的交互建模降本 |
| **离散约束 → 有效电阻能量 → 测试时引导** | BrickFlow | 装配、管线拼接、机械装配等有离散连接约束的重建 |
| **能量在合法解处精确为零的设计目标** | BrickFlow | 约束能量函数设计的强目标 |
| **旋转测地线采样避开 $\Delta t/(1-t)$ 发散** | BrickFlow | 流匹配 / 扩散采样的通用陷阱 |

---

## 📊 统计

- 候选 6 篇 → 几何相关 4 篇 → **建笔记 4 篇** + 摘要 1 篇
- 知识库累计：**1,306 篇**笔记（wawaicai/01-Papers）
- 去重库内 arXiv ID：142
- 与昨日（2026-11-12）相比：批次正常公布，论文量与昨日相当

---

## ⚠️ 待改进

1. **ACM DL 连续 2 天抓取失败**（Cloudflare 403）——需改用其他途径（ACM OpenTOC、Semantic Scholar API、或会议 proceedings 镜像）
2. **SIGGRAPH Asia 2026（12-01 开幕）论文列表未发布**——建议 11-25 前后复查，届时可一次性收录技术论文集
3. **Eurographics diglib 未找到 2026 论文集**——需确认收录路径

---

*下次运行：2026-11-14 22:00 UTC*
