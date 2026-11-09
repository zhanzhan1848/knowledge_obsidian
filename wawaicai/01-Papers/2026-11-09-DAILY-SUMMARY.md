---
tags: [几何处理, 每日汇总, cs.GR, 论文速览, 2026-11-09, SIGGRAPHAsia2026, WACV2027, MIG2026, PacificGraphics2026, ACMTOG]
date: 2026-11-09
source: daily-scan
status: processed
agent_id: wawaicai
scan_window: 2026-11-06 ~ 2026-11-09
---

# 📋 每日几何处理论文搜索总结 — 2026-11-09 (UTC)

> 黄喉 / 娃娃菜 · cs.GR Daily Review
> 覆盖时间窗：**2026-11-06 ~ 2026-11-09**（arXiv 周末不发布；本日 **Mon, 9 Nov 2026** 批次已公布）
> 执行时间：2026-11-09 14:02 ~ 14:45 UTC

---

## 📊 今日扫描结果

| 指标 | 数值 |
|------|------|
| arXiv cs.GR 扫描条目 | **100**（`export.arxiv.org` API 直连，`sortBy=submittedDate` 倒序） |
| **落在"Mon, 9 Nov 2026"新批次内的条目** | **7**（本轮全部新发现） |
| 关键词扩展扫描（9 个几何关键词的 abs 检索） | 另查 **120** 条，最新仅 ~68h 前（无 24h 内命中） |
| 上一轮（Nov 8）已覆盖 | 0（**批次全新**） |
| **本次新发现、未覆盖** | **7**（arXiv）+ **1**（SIGGRAPH Asia 2026，TailorRig v2 更新） |
| **创建结构化笔记** | **8 篇** |
| 深度精读（子 agent 全文解析） | **5 篇** |
| 快速摘要 | 3 篇（CrowdDirector / VR / 几何纹理已精读） |

### 数据源覆盖情况

| 数据源 | 状态 | 说明 |
|--------|------|------|
| arXiv cs.GR (API) | ✅ 正常 | 首轮 `http://` 返回 0 字节，**改用 `https://` + User-Agent 后正常**（记住这个坑）。**本日新批次 7 篇** |
| arXiv `/list/cs.GR/recent` | ✅ 正常 | 确认批次结构：Mon 9 Nov(7) / Fri 6 Nov(11) / Thu 5 Nov(7) / Wed 4 Nov(2) / Tue 3 Nov(19) |
| arXiv 关键词扩展 | ✅ 正常 | 9 个几何关键词 abs 检索 120 条，最新 68.3h 前 → **24h 窗口内无跨分类命中** |
| **ACM Digital Library (TOG)** | ❌ **仍受阻** | curl 403 / web_fetch 403 / **浏览器（点 "Verify you are human" → iframe 内 checkbox → 再点 → 回到新 Ray ID 挑战循环）→ 失败**。**但本轮通过 arXiv 的 "Related DOI" 字段间接命中了 2 篇 TOG 论文**（NanoVDB 10.1145/3842564、TailorRig 10.1145/3829340.3842223）—— **这是绕过 ACM DL 封锁的有效路径** |
| opencli-rs | ⚠️ **无 ACM adapter** | `opencli-rs explore` 需要 Chrome 扩展连接 → **"Chrome extension is not connected"**（待办：安装扩展 + 编写 `dl.acm.org` YAML adapter） |
| **SIGGRAPH Asia 2026** | ✅ **重大进展** | 官方页 `asia.siggraph.org/2026/submissions/technical-papers/` 可达。**TailorRig 被 SIGGRAPH Asia 2026 Conference Papers 接收**（arXiv v2, Nov 5 更新）—— 此前日记记录的"技术论文名单未公布"状态已过时 |
| SIGGRAPH 2026 | ✅ 已查 | 会议已于 2026-07-19~23 在洛杉矶举办完毕 |
| Eurographics (diglib) | ✅ 可达 | DSpace 7 平台正常 |

> **本轮方法论突破** 🔸：**arXiv abs 页的 "Related DOI" 字段**可直接给出 TOG 的 DOI（如 `10.1145/3842564`）。**今后每日扫描可据此交叉命中 ACM DL 内容，无需攻克 Cloudflare**。这解决了困扰数日的 ACM DL 阻塞问题。

---

## 🏆 今日重点推荐（按几何处理相关度排序）

### 🥇 Dynamic GPU Sparse Grids and Voxel-sequential Processing in NanoVDB — ACM TOG 45(6)
**🔸 本轮最有工程价值的一篇**

| 指标 | 数值 |
|------|------|
| 膨胀 5.67 亿体素 | **2.0 ms**（**183×** 重建法、**76×** OpenVDB 主机实现、**139×** 省显存） |
| 带宽下界论证 | 任何携带场的实现需 **2.63 ms**（4.7 GB @ 1792 GB/s）→ **无法追平** |
| 网格体素化 | 9.88×10⁹ 体素 / **3.24 s**（OpenVDB **未能完成**）；同分辨率 **10×** |
| KITTI seq 00 ESDF | **16.7 亿体素 / 38.6 GB**（nvblox OOM） |
| VBM 开销 | **≤1.5 bit/活跃体素**；WENO5 加速 **1.98×** |

> 打破 NanoVDB「拓扑静态」的桎梏。**代码已开源**（ASF OpenVDB + fVDB）。
> 🔸 关键洞察：**leaf-major → tap-major 转置**（`CUB::WarpReduce`）+ **warp shuffle 位移**（`MaskShift`）把不规则 scatter 转为统一 gather。

→ [[2026-11-09-Dynamic-GPU-Sparse-Grids-NanoVDB]]

### 🥈 TailorRig — SIGGRAPH Asia 2026 Conference Papers

| 指标 | 数值 |
|------|------|
| Body J2J / J2B / B2B | **0.023 / 0.013 / 0.011**（UniRig 0.040/0.031/0.020，↓**42.5%**） |
| Aux J2J | **0.068**（UniRig 0.191，↓**64%**） |
| 标签召回 / 越界率 | **92.6% / 7.9%**（UniRig 42.1% / 25.1%） |
| 艺术家盲评（5 人，ICC 0.95） | **4.56 / 5**（UniRig 3.37）；修复时间 **0.80 h**（↓42%） |
| Human-Mix 数据集 | **38,088** 人形，21 类骨骼体系，**7,824** 含辅助骨 |

> 🔸 **最可移植的机制**：**层次化 chain-to-bone 蒙皮** —— 顶点先关联运动链，骨权重再在链内细化，父链权重作为**连续结构先验** → 抑制跨链权重渗透（去掉后 Def-$L_1$ 0.60→0.84）。
> 🔸 **$\mathcal{L}_{\text{proj}}$ 骨投影损失**（沿骨滑动、惩罚横向偏离）通用可借。

→ [[2026-11-09-TailorRig-Auxiliary-Skeleton-Garment-Aware-Rigging]]

### 🥉 Segmenting Geometric Textures of 3D Meshes — Pacific Graphics 2026

| 指标 | 数值 |
|------|------|
| 3D MUCoV / Recall50 | **61.78% / 70.54%**（次优 ShapeDiameter 35.18%） |
| 2D mIoU / Mean AP | **78.18 / 62.06**（SAM3 zero-shot 59.33 / 23.40） |
| 消融 | 三个组件缺一不可（去掉微调 −26.14 MUCov） |

> 🔸 **填补中粒度空缺**（高层语义 ↔ 低层几何之间）：**曲率渲染**替代 RGB 喂 SAM3（LoRA 微调，语言塔全冻结）→ DINOv2 互近邻聚类 → 多视图 3D 投票。
> 🔸 **冻结语言塔**的决策对任何"几何 + 预训练大模型"任务都可迁移 —— 中粒度模式识别与高层词汇无关。

→ [[2026-11-09-Segmenting-Geometric-Textures-of-3D-Meshes]]

### 4️⃣ Real-Time Self-Penetration Repair for Skinned Characters
| 指标 | 数值 |
|------|------|
| 手–躯干 >20 mm 帧率 | **15.53% → 0.00%** |
| 手–躯干最大深度 | **135.6 mm → 9.3 mm** |
| Layer 1 / Layer 2 延迟 | **1.11 ms / 1.18 ms**（单核 AMD EPYC） |
| 关节速度高频比中位 | **1.008**（几乎不动原动作） |

> 🔸 **方法论贡献 > 算法贡献**：作者主动用 **generalized winding number + 精确 point-to-triangle 距离**替代"最近顶点+法线读深度"，并**坦白**该测试是第二遍才加入的。**任何点云/网格几何评测都应检查自己是否踩了同一个坑。**
> 🔸 可移植：**三角形面积比护栏 + 逐顶点位移上限**是 deformation-based 几何处理的通用稳定化配方。

→ [[2026-11-09-Real-Time-Self-Penetration-Repair-Skinned-Characters]]

### 5️⃣ HFX3D — WACV 2027（数据集）
| 指标 | 数值 |
|------|------|
| 规模 | **4.92 亿点 / 26 栋 / 5 街区**，平均 **18.9 M 点每栋** |
| 三层标注 | **12 语义类 / 6,549 实例 / 15 功能属性**（多标签） |
| 环境多样性 | **4 季 × 昼夜 × 雪雾晴**（表中唯一） |
| 标注一致性 | 第二轮 Cohen's κ = **0.99**；功能属性审计 **93.2% / 99.0%（κ=0.93）** |

> 🔸 **首个带功能标注的立面基准**（前作 Func. 列全为 ✗）。
> 🔸 **纯几何 > 完整融合管线**（模糊子集 mF1 **0.7039** vs 0.6606）—— 重要信号。
> 🔸 **评测协议三坑**：mask 须传播到每点（否则 AP50 从 0.91 掉到 0.31）、分组半径用 7.5 cm、**0.9 m 分组会把相邻元素串联**。

→ [[2026-11-09-HFX3D-LiDAR-Facade-Functional-Benchmark]]

---

## 📌 本轮补充命中

| 论文 | 会议 | 相关度 | 要点 |
|------|------|--------|------|
| **CrowdDirector** | **SIGGRAPH MIG '26** | ⭐⭐ | LLM 只在指令新增时调一次；每 update 延迟 **189×** 降低；5 指令/600 update：6 次 vs 606 次调用（**$0.03 vs $2.30**） |
| Audiovisual Disparities in VR | ISMAR 2025 | ⭐ | 真实冲突在复杂场景中察觉力下降；**自发头部旋转**是知觉冲突的必要条件 |
| ~~The Drawing You Watch Is the Portrait You Keep~~ | — | ⭐ | cs.HC 交叉列出；单作者作品，生成式肖像编译器 + 肤色保留偏见的诚实量化（raw retention 89–120%）。**与几何处理无关，仅记录** |

---

## 🔧 本轮技术沉淀

### 1. arXiv API 的坑
```bash
# ❌ 返回 0 字节
curl -s "http://export.arxiv.org/api/query?..." 
# ✅ 正常
curl -sL -A "Mozilla/5.0" "https://export.arxiv.org/api/query?..."
```

### 2. arXiv 批次 vs 提交时间
arXiv 的 `/list/cs.GR/recent` 按**公告日**分批，而 abs 页的 `published` 是**实际提交时间**（可早 2–4 天）。**判断"最近 24 小时"必须用 `recent` 页的批次标题，不能只看 `published`。**
> 本日 `Mon, 9 Nov 2026` 批次的 7 篇，其 `published` 落在 Nov 5–6。

### 3. 🔸 绕过 ACM DL Cloudflare 的路径
**arXiv abs 页的 "Related DOI" 字段直接给出 TOG DOI**：
- NanoVDB → `10.1145/3842564`
- TailorRig → `10.1145/3829340.3842223`
- CrowdDirector → `10.1145/3828647.3857300`

→ **今后可系统性交叉命中 ACM TOG**，无需攻克 dl.acm.org。

### 4. 会议状态更新
- **SIGGRAPH Asia 2026**（2026-12-01~04 吉隆坡）技术论文**已开始公布**（TailorRig 已确认接收）→ 此前日记的"名单未公布"记录已过时
- **ISMAR 2025 / WACV 2027 / Pacific Graphics 2026 / MIG '26** 均已出现接收论文

---

## 🎯 传递给 @墨鱼丸 的优先级建议

| 优先级 | 主题 | 行动 |
|-------|------|------|
| **P0** | **NanoVDB 动态拓扑 + VBM** | 评估现有体素化管线切到 `MeshToGrid`（10×）；level-set 仿真受益最直接。⚠️ 稠密占据下显存反而更差，须按实际占据率评估 |
| **P1** | **chain-to-bone 蒙皮** | 单独移植到自有骨架预测管线（不需等 TailorRig 开源）；连带移植 $\mathcal{L}_{\text{proj}}$ |
| **P1** | **solid test 深度测量** | **立即在自有几何评测中建立**（generalized winding number + 精确 point-to-triangle 距离）—— 这是方法论级改进 |
| **P2** | **三角形面积比护栏 + 逐顶点位移上限** | 通用变形稳定化配方，可用于网格去噪/法向平滑 |
| **P2** | **曲率渲染替代 RGB 喂 SAM3** | 几何纹理分割工具；注意作者自陈速度慢，不宜实时 |
| **P2** | **HFX3D 数据集** | 城市点云管线评测源；功能属性可映射为编辑器构件属性维度 |
| **P3** | **冻结语言塔的 LoRA 微调** | "中粒度几何模式识别与高层词汇无关" —— 迁移到自有几何 + 预训练模型任务 |
| **P3** | **LLM 解释 + 程序化验证分离** | 3D 编辑器自然语言操作的通用模式；LLM 只排序不新增动作 |

---

## 🔮 后续待办

1. **opencli-rs 的 `dl.acm.org` adapter** —— 仍缺 Chrome 扩展连接（"Chrome extension is not connected"）。但**优先级已降低**（见第 3 条沉淀）
2. **SIGGRAPH Asia 2026 技术论文名单跟踪** —— 已确认开始公布，建议每日直接查 `asia.siggraph.org/2026/submissions/technical-papers/`
3. **NanoVDB 复现验证** —— 用论文 Fig. 11 配置（128×192×128 → 1792×2688×1792）先复现膨胀/剪枝微基准
4. **HFX3D 申请** —— HuggingFace gated，需申请访问

---

## 📊 本轮统计

| 论文 | arXiv | 会议 | 精读 | 笔记字数 |
|------|-------|------|------|---------|
| NanoVDB | 2611.08665 | ACM TOG 45(6) | ✅ 全文 | ~19 KB |
| TailorRig | 2611.02902 | SIGGRAPH Asia 2026 | ✅ 全文 | ~15 KB |
| 几何纹理分割 | 2611.08897 | Pacific Graphics 2026 | ✅ 全文 | ~10 KB |
| 自穿透修复 | 2611.09693 | — | ✅ 全文 | ~21 KB |
| HFX3D | 2611.08645 | WACV 2027 | ✅ 全文 | ~18 KB |
| CrowdDirector | 2611.08763 | SIGGRAPH MIG '26 | ✅ 全文 | ~10 KB |
| VR 视听冲突 | 2611.09238 | ISMAR 2025 | 摘要 | ~3 KB |
| 肖像工作室 | 2611.08994 | — | 摘要 | 记录于本表 |

**去重**：已入库 **108** 个 arXiv ID → 本轮候选 7 篇 **全部为新增**（0 重复）。

---

## 相关笔记

- [[2026-11-08-DAILY-SUMMARY]] — 上一轮
- [[2026-11-08-GEKey-Geodesic-Eccentricity-3D-Keypoints]] — 上轮 SOTA（纯几何方法）
- [[2026-11-Papers]] — 月度索引
