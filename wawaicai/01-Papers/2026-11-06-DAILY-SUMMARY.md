# 📋 每日几何处理论文搜索总结 — 2026-11-06 (UTC)

> 黄喉 / 娃娃菜 · cs.GR Daily Review
> 覆盖时间窗：2026-11-02 ~ 2026-11-05 arXiv cs.GR（含 arXiv 公告延迟窗口）+ SIGGRAPH Asia 2026 / ACM TOG 检索
> 执行时间：2026-11-06 14:10 UTC

---

## 📊 今日扫描结果

| 指标 | 数值 |
|------|------|
| arXiv cs.GR 扫描条目 | **150**（按提交时间倒序） |
| 落在时间窗内的条目 | 14（Nov 4 ~ Nov 5） |
| 扩展扫描（Nov 2 ~ Nov 5，含公告延迟） | 30 |
| 关键词命中 + 人工筛出的几何相关论文 | 10 |
| **创建结构化笔记** | **7 篇** |
| 核心几何处理论文 | 3（DC-SQEM / 参数化敏感性 / T²-Splat） |
| 跨方向相关论文 | 4（FlowRig / P-MGS / GPU-Native / CAD Bench v3） |

### 数据源覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR (API) | ✅ 正常 | 经 HTTPS 直连 `export.arxiv.org/api/query`，取最新 150 条，按 `submittedDate` 倒序 |
| ACM Digital Library | ⚠️ 受阻 | `dl.acm.org` 处于 Cloudflare 挑战，浏览器与 web_fetch 均被拦截；Crossref journal 接口返回 "Resource not found"，Semantic Scholar bulk 接口报 ID 解析错误 → **本次未能直接读取 TOG 最新一期目录** |
| SIGGRAPH Asia 2026 | ✅ 已查 | 会议将于 2026-12-01~04 在吉隆坡举行；**Technical Papers 完整名单尚未公布**（官网仍为占位内容），预计后续发布 |
| Eurographics | ✅ 已查 | 近期无与几何处理直接相关的独立发布 |

> 后续待办：ACM DL 的 Cloudflare 拦截需要换用带登录态的浏览器 profile 或自建适配器（opencli-rs 的 `explore` / `generate` 可尝试生成 dl.acm.org 适配器）。

---

## 🏆 今日重点推荐（按几何处理相关度排序）

### 🥇 DC-SQEM — 点云直接提取特征保持的中轴网格
- **arXiv**: 2611.07328 | cs.GR, 2026-11-05 | 21 页
- **突破**：双轮廓（Dual Contouring）框架内做 SQEM 拟合，**直接从定向点云**提取完整中轴结构（片/曲线/缝/结），**不需要水密流形表面或体网格**
- **三项关键创新**：① **虚拟节点**机制处理 out-of-cell 解（避免孔洞）② **类型降级**（Corner→Line→Plane）用投影聚类约束 SQEM 解空间 ③ 几何驱动 + 拓扑感知的 Euler 特征监控清理
- **关键数据**（93 个 ABC CAD 模型）：
  - MSER **3.0874%**（基线 Power Crust 94.0% / NSK 98.4%）
  - **TER（拓扑错误率）2.1505%**（所有基线均为 **100%**）
  - HD **0.4203%**、SITR（自相交率）**4.0711%**
  - 运行时 **数秒 ~ 20 秒**（MATTopo 需 50~265 秒，**快一个数量级以上**）
- **意义**：RPD 系中轴方法（MATTopo/MATFP/MATStruct）是当前 SOTA，但**卡在「需要水密网格」**上；DC-SQEM 把输入假设放宽到点云，直接打开**扫描数据逆向工程**场景
- **协作建议**：⚡ **优先传递给墨鱼丸** —— 中轴片是六面体网格生成、形状分割、结构化编辑的优质输入

### 🥈 Representation-Aware Closed-Surface Parameterization — 把「表示」当作参数化的设计变量
- **arXiv**: 2611.00721 | cs.GR/cs.CG/math.NA, 2026-10-31 (v2) | 39 页
- **突破**：证明 FLASH 球面共形参数化的**南极点 Beltrami 修正精确等价于源网格上的调和延拓**（`K_LBS = K_V`），从而把修正后的映射分解为「chart 变换 → 调和传播 → 逆立体投影」三段，给出**显式敏感性 Jacobian**
- **关键数据**（30 个 genus-0 曲面）：
  - 极区 log-condition 上尾中位数 **−10.17%**、弦角失真 **−10.97%**，且**每个网格都改善**
  - 下游 SDEM 的**残余翻转从 10 降到 5**
  - 固定模板重网格的收益随模板分辨率提高而**更一致**（10,242 顶点时 24/30 网格改善）
- **额外洞察（工程价值高）**：cMCF / SDEM 中**终端衰减与轨迹级瞬态放大并存** —— 中位终端放大 0.35，但中位峰值放大 **1.37**（上四分位 >2.1）。**单看终端指标会严重低估数值敏感性**
- **协作建议**：⚡ 建议作为参数化流水线的 **QA 指标**（记录 A_term + max_k A_k + 停止索引稳定性）

### 🥉 T²-Splat — 拓扑自适应与外观精修解耦
- **arXiv**: 2611.06974 | cs.GR, **NeurIPS 2026 接收** | 2026-11-04
- **突破**：Safe RDT 初始化 → **DTE**（QEM 边折叠 + 梯度驱动顶点分裂）→ **逐面残差 Mip-纹理**（冻结网格上精修外观）
- **关键数据**：
  - Mip-NeRF 360 PSNR **25.49**（vs MeshSplatting 24.78，**+0.71 dB**），LPIPS **0.234**
  - OpenGL **236 FPS**（vs 126），存储 **62 MB**（vs 152 MB，**−59%**），面数 **2.7M**（vs 7.3M）
  - 极端简化到 **10% 面预算（0.3M 面）** 仍达 23.93 dB
  - DTU Chamfer 均值 **0.68**（与 RaDe-GS/MiLo 并列第二）
- **最值得复用的单一技术点**：**优化器状态缝合**（边折叠用关联面积加权迁移 Adam 动量；分裂用一阶矩反向扰动 `Δm = 10⁻³√v ⊙ z`）—— 这是同类工作最容易不稳定的环节
- **协作建议**：⚡ 面向**游戏引擎兼容资产压缩**，与「五花肉」（前端 3D 编辑器）方向相关

### ⭐ P-MGS — Perception Over Geometry：高斯分配应看外观而非网格密度
- **arXiv**: 2611.07979 | cs.GR, 2026-11-05
- **突破**：**网格管拓扑，外观复杂度管表示容量**。多视角感知复杂度估计 + 拉格朗日工作量定价的分配；**后验绑定**（先无约束 3DGS 优化再绑网格）+ **局部仿射形变传递**
- **关键数据**：
  - NeRF-Synthetic 平均 PSNR **34.00 dB**（最高）+ 高斯数 **545K**（最少）；vs Mani-GS **+0.75 dB / −79.7% 高斯**
  - DTU：**32.36 dB / 191K**（全指标最优）
  - 消融：感知分配 **+0.71~1.26 dB**，后验绑定 **+2.64~3.19 dB**（**解耦的贡献更大**）
- **最有说服力的反例**：Lego 上 GaMeS 用 10,176K 高斯（3DGS 的 8.5×）PSNR 反而低 2.58 dB —— **堆容量无法弥补分配错配**
- **协作建议**：任何「网格 + 高斯」混合表示项目都应参考这条原则

### ⭐ GPU-Native Real-Time Textured Mesh Reconstruction — 全管线常驻 GPU
- **arXiv**: 2611.03033 | cs.CV, **WACV 2027 接收**
- **突破**：TSDF 融合 / Marching Cubes / 去噪 / 纹理映射 / inpainting / 接缝校正全部留在 GPU，阶段间**零中间数据回传**
- **可复用的单一技术点**：**固定大小数组的网格邻接** —— 边键打包 64-bit + 基数排序 → O(\|F\|) 构建邻接，替代 O(\|F\|) 线性搜索；长度 3 的定长数组带来 GPU 上规整的合并访问
- **关键数据**：0.005 m 体素下比 Open3D(CPU) 快 **89.7×**、比 nvblox 快 **29.4×**；0.02 m 下 **13.1 ms/帧**（30 fps 预算内）

### ⭐ FlowRig — 统一 3D/4D 网格的骨骼生成
- **arXiv**: 2611.03775 | cs.GR/cs.CV, 2026-11-02 (v2)
- **突破**：流匹配（最优传输直线路径）单次前馈生成整段时序对齐骨架；CFG 骨骼数控制 + 图头（父节点预测）+ 不确定性头
- **关键数据**：Articulation-XL 2.0 J2J **0.0259**（用不确定性从 5 个采样择优，超越所有基线）；ModelsResource 上 zero-shot 接近专训的 RigAnything
- **关键工程点**：**序列级共享的 Hungarian 匹配**（锚帧统一为 i=1）是时序一致性的关键

### ⭐ Parametric CAD Bench v3 — Agentic CAD 评估
- **arXiv**: 2611.02659 | cs.GR, 2026-11-02 | 31 页
- **突破**：「生成了可执行 CAD 脚本」不等于满足工程需求 → 纳入**结果几何 + 指定尺寸 + 原生建模历史**；主指标改为**连续任务奖励**
- **快照**（2026-09-24，13 个模型-智能体系统）：Claude Code + Claude Opus 5.5 总体 **61.03%**，image-to-CAD **84.66%**
- **协作建议**：可直接用作自建 CAD agent 流水线的**回归测试套件**（任务版本化 + 验证器开源）

---

## 📂 关键词分类命中情况

| 关键词 | 命中论文 |
|--------|---------|
| mesh processing | DC-SQEM, T²-Splat, GPU-Native, P-MGS |
| geometry processing | DC-SQEM（中轴）, Representation-Aware（参数化）, P-MGS（混合表示） |
| point cloud | DC-SQEM（定向点云输入）, FlowRig（带法线点云） |
| subdivision surface | （今日无直接命中；FlowRig 的骨骼拓扑最接近） |
| **parametrization** | **Representation-Aware（球面参数化，核心命中）** |
| **remeshing** | **Representation-Aware（固定模板重网格为下游实验）** |
| **simplification** | **T²-Splat（QEM 边折叠）**, DC-SQEM（八叉树自适应） |
| curvature estimation | （今日无命中） |
| mesh generation | T²-Splat (Safe RDT), DC-SQEM (dual mesh), GPU-Native (MC) |
| CAD | Parametric CAD Bench v3 |

---

## 🚀 传递给墨鱼丸 (moyuwan) 的优先级建议

### 高优先级（本周可启动）
1. **DC-SQEM** —— 评估集成可行性。重点：点云 → 中轴片的完整链路；作者已开源 C++ 实现（`Jiafeimaochuanqi/dc_sqem`）；**扫描数据逆向工程**是直接受益场景
2. **Representation-Aware 参数化敏感性框架** —— 把「极区 log-condition 上尾」「峰值放大」作为现有参数化模块的**回归测试指标**；若自研球面参数化，Theorem 3.4 的调和等价可作为优化器替换依据（**注意**：需满足「未修改装配」前提，裁剪/平滑系数会使等式失效）
3. **T²-Splat 的优化器状态缝合** —— 若已有 QEM 简化管线，这是最容易不稳定的环节，可直接照搬公式

### 中优先级（持续关注）
4. **T²-Splat 整体** —— 游戏引擎兼容资产压缩（2.7M 面 / 62 MB / 236 FPS），与「五花肉」前端方向相关
5. **GPU-Native 的定长数组邻接** —— 独立的 GPU 网格处理组件，可复用
6. **P-MGS 的「感知复杂度 vs 网格密度」原则** —— 若项目用网格绑定高斯，这是必须修正的设计假设

### 长期观察
7. **Parametric CAD Bench v3** —— 待自身 CAD agent 管线成熟后接入回归测试
8. **FlowRig** —— 动态资产自动绑定；关注长序列显存问题（全局注意力 O(N²)）
9. **ACM DL 抓取通路** —— Cloudflare 拦截待解决；可尝试用 opencli-rs `generate` 为 dl.acm.org 生成适配器

---

## 🔗 与近期高相关论文交叉

| 论文 | 交叉相关性 |
|------|-----------|
| 2026-11-05 — EDGAR (2611.07909, **ACM TOG 接收**) | Gaussian avatar 精修，与 P-MGS 同属 Gaussian 系 |
| 2026-10-31 — Representation-Aware (2611.00721, v2) | 本日核心论文之一 |
| 2026-11-03 — Mesh2Shell Neural Operator | 网格到壳层的算子反演；与 DC-SQEM 的「结构化内部表示」思路可对比 |
| 2026-11-03 — Piecewise CMC Segmentation | 流体成形；参数化与分段主题相关 |
| 2026-10-28 — NeuOctree (2610.38441) | **神经八叉树显式表示**，与 DC-SQEM 的自适应八叉树 + 表面查询可对比；代码 https://github.com/octree-nn/neural-octree |
| 2026-10-27 — GOFish (2610.37818) | 鱼眼 3DGS 表面重建 + 网格提取，与 GPU-Native 的「网格输出」目标一致 |

---

## 🗓️ 后续工作安排

- 🔄 **解决 ACM DL 抓取通路** —— 尝试 opencli-rs `generate https://dl.acm.org` 生成适配器，或使用带登录态的 Chrome profile
- ⏳ 等待 **SIGGRAPH Asia 2026**（12/01–04 吉隆坡）Technical Papers 完整名单公布
- ⏳ 等待 **DC-SQEM** 代码实机验证（github.com/Jiafeimaochuanqi/dc_sqem，尚未确认 commit 状态）
- 🔄 跟踪 **T²-Splat** 项目页 t2-splat.github.io 的代码发布
- 🔄 关注 **GPU-Native** (WACV 2027) 与 **Parametric CAD Bench v3** 的复现

---

## 📌 知识库同步状态

- ✅ **7 篇结构化笔记**已写入 `~/knowledge-vault/wawaicai/01-Papers/2026-11-06-*.md`
  - `2026-11-06-DC-SQEM-Medial-Mesh-Dual-Contouring.md`
  - `2026-11-06-Representation-Aware-Closed-Surface-Parameterization.md`
  - `2026-11-06-T2-Splat-Adaptive-Topology-Mesh-Splatting.md`
  - `2026-11-06-P-MGS-Perception-Over-Geometry-Gaussian-Allocation.md`
  - `2026-11-06-GPU-Native-Real-Time-Textured-Mesh-Reconstruction.md`
  - `2026-11-06-FlowRig-Unified-Skeleton-3D-4D-Flow-Matching.md`
  - `2026-11-06-Parametric-CAD-Bench-v3.md`
- ✅ 本总结：`2026-11-06-DAILY-SUMMARY.md`
- 🔄 Git 同步待执行（git-sync.sh 调用后完成）
- 📁 Obsidian vault 同步至 GitHub: zhanzhan1848/knowledge_obsidian

---

## 💭 心跳检查（每日）

- [x] arXiv cs.GR API 直连扫描（最新 150 条，按提交时间倒序）
- [x] ACM Digital Library 检索（**受 Cloudflare 拦截，已记录为待办**）
- [x] SIGGRAPH Asia 2026 / Eurographics 检索（SA 名单未公布）
- [x] 关键词过滤 + 人工甄别（10 篇候选 → 7 篇成稿）
- [x] 解析高优论文 abstract + **全文 PDF 深度提取**（6 篇下载 PDF 并抽取方法/实验/局限章节）
- [x] 创建结构化笔记（Obsidian 格式，含公式、复杂度、数值稳定性、实现建议）
- [x] 标注与黄喉研究领域的相关性
- [ ] git-sync.sh 同步到 GitHub（下一步执行）
- [ ] 传递给墨鱼丸（已生成优先级建议，待发出）

---
*Generated by 黄喉 (wawaicai) at 2026-11-06 14:10 UTC*
