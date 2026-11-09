---
tags: [几何处理, 网格分割, 几何纹理, 曲率渲染, SAM3, DINOv2, 多视图投票, PacificGraphics, 论文]
date: 2026-11-09
source: arXiv
arxiv_id: 2611.08897
venue: Pacific Graphics 2026 (Short Papers)
status: processed
agent_id: wawaicai
authors: Weidan Xiong, Kaijie Qu, Shihao Feng, Shunqi Fan, Rongyu Xiong, Hui Huang (深圳大学 / NetEase / NTU)
url: https://arxiv.org/abs/2611.08897
code: https://github.com/ALingll/GTSeg
pdf: https://arxiv.org/pdf/2611.08897
---

# Segmenting Geometric Textures of 3D Meshes

> 用**内禀曲率渲染**代替颜色渲染作为 SAM3 的输入，微调出 **GTSAM**；再以 **DINOv2 patch 特征互近邻聚类** + **多视图 3D 投票**把 2D 实例提升到 3D —— 在「几何纹理」这一**中粒度**层面对网格做免标签分割。3D 上 MUCoV **61.78%**（次优 ShapeDiameter 35.18%）。

---

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Segmenting Geometric Textures of 3D Meshes |
| **作者** | Weidan Xiong, Kaijie Qu, Shihao Feng, Shunqi Fan, Rongyu Xiong, Hui Huang†（深圳大学 CSSE / NetEase / 南洋理工） |
| **发表** | arXiv cs.GR+cs.CV, 2026-11-06，**Pacific Graphics 2026（Short Papers）** |
| **分类** | MSC 68U05 (主) / 68T45；ACM I.3.5, I.4.6；CCS: Shape analysis, Mesh models |
| **链接** | [原文](https://arxiv.org/abs/2611.08897) / [数据集仓库](https://github.com/ALingll/GTSeg) |

---

## 核心贡献

**填补「语义部件」与「纯几何属性」之间的中粒度空缺** —— 论文明确把既有工作切成两端：

| 层级 | 代表方法 | 失效模式 |
|------|---------|---------|
| 高层（语义） | MeshCNN、MET、PointNet/++/DGCNN | 只给粗粒度部件标签（"chair 腿 vs 座面"），认不出细粒度几何纹理 |
| 低层（几何） | PCPNet 曲率/法向、Shape Diameter、区域生长、图割、谱聚类、MRF/CRF | 在同质曲率区域稳定，但**分不开局部重复纹理** |
| **中层（几何纹理）** | **本文** | —— |

论文对「几何纹理」的定义（**重要，决定适用范围**）：
> "local, repetitive geometric variations across a 3D surface, remaining independent of the global model structure"，且明确**排除空腔结构（hollowing）与缠绕结构（winding）**。

### 三项技术贡献

1. **GTSAM**：以 **LoRA 微调 SAM3**，输入从 RGB 换成**内禀曲率灰度图** → 几何纹理分割模型
2. **GTSeg 基准**：TDSet（354 张几何高度图）+ 3D 基准（20 合成 + 10 实测手标）+ 2D 图像基准（11,200 对）
3. **免标签 2D→3D 提升**：DINOv2 特征聚类 + 多视图 3D 投票 + 3D IoU 部件合并

---

## 技术方案

### 管线总览

```
Mesh M
  → [A] 从 N=50 个相机位姿渲染灰度曲率图
  → [B] GTSAM (LoRA-SAM3) → 实例掩码 {M_t,m} + 置信度 c_t,m
  → [C] 8-连通域分析，丢弃面积 < A_min 的分量
  → [D] 掩码投影到网格 → 面集 P_a
  → [E] 区域重渲染：沿 n_a 向 o_a 的正交相机 → 局部曲率渲染 J_a
  → [F] DINOv2 patch token（4 旋转 + h-flip 增强）→ token 池 T_a，单位化
  → [G] 一致性过滤 Eq.(2)，阈值 τ_s = 0.65
  → [H] 双向 top-k token 相似度 Eq.(3) + 互 kNN 图 → 聚类 {Q_r}
  → [I] 簇支持度 ρ_a → 拆分低支持单例；置信度重加权 Eq.(4)
  → [J] 多视图 3D 投票 Eq.(5)-(6) → 逐面标签 → 连通域清理
  → [K] 3D IoU ≥ τ_iou=0.8 的区域邻接图合并重叠部件 → {P_k}
```

### 1. 灰度曲率表示（§4）

**为什么用曲率**：> "Surface curvature is an **intrinsic** geometric property that remains strictly invariant to lighting conditions and rigid transformations."

- 逐顶点**平均曲率** $s_i$
- **5% / 95% 分位裁剪**（抑制网格奇异点，保证图像对比度）
- min-max 归一化到 $[0,1]$

### 2. GTSAM 微调（§4）

- 基座：**SAM3** (Carion et al. 2025, arXiv:2511.16719)
- 方式：**LoRA** (Hu et al., ICLR 2022)，"efficiently bridge this domain gap **without catastrophic forgetting**"
- **语言编码器完全冻结** —— 论文理由：> "recognition of geometric textures relies heavily on mid-level patterns rather than high-level linguistic concepts. Hence, we freeze the entire language encoder to preserve general semantic priors and reduce computational overhead."
- LoRA 秩分解矩阵注入到 **Vision Encoder / Geometry Encoder / 解码模块**

> **值得借鉴的设计决策**：几何纹理识别是**中粒度模式识别**任务，与高层语义词表无关 —— 冻结语言塔、只调视觉塔，是任务特性驱动的正确选择。这条对任何"几何 + 预训练大模型"任务都可迁移。

### 3. 区域重渲染 + DINOv2 特征（§5.2）

**Eq.(1)** 区域中心与平均法向：
$$\mathbf{o}_{a}=\frac{1}{|\mathcal{V}(P_{a})|}\sum_{\mathbf{v}_{i}\in\mathcal{V}(P_{a})}\mathbf{v}_{i},\qquad \mathbf{n}_{a}=\frac{\sum_{\mathbf{v}_{i}\in\mathcal{V}(P_{a})}\mathbf{n}_{i}}{\left\|\sum_{\mathbf{v}_{i}\in\mathcal{V}(P_{a})}\mathbf{n}_{i}\right\|_{2}}.$$

沿 $\mathbf{n}_a$ 放置**正交相机**朝向 $\mathbf{o}_a$ → 局部曲率渲染 $J_a$（消除透视畸变，让同纹理的正交投影对齐）。

DINOv2 patch token 增强：**旋转 $0°/90°/180°/270°$ + 水平翻转**，token 归一化为单位向量：
$$\mathcal{T}_{a}=\{\hat{\mathbf{z}}_{a,1},\ldots,\hat{\mathbf{z}}_{a,K_{a}}\}.$$

### 4. 一致性过滤（Eq.2）

$$\gamma_{a}=\operatorname{median}_{i}\left(\frac{\hat{\mathbf{z}}_{a,i}^{\top}\sum_{j}\hat{\mathbf{z}}_{a,j}}{\left\|\sum_{j}\hat{\mathbf{z}}_{a,j}\right\|_{2}}\right).$$

$\gamma_a < \tau_s (0.65)$ 的掩码被剔除 —— 掩码若**混合了两种纹理**则内聚度低。

### 5. 双向 top-k 相似度（Eq.3）

$$\operatorname{sim}(a,b)=\frac{1}{2}\left[\operatorname{TopKMean}_{k}(\{u_{i}\})+\operatorname{TopKMean}_{k}(\{v_{j}\})\right],$$

其中 $\mathbf{S}^{ab}_{ij}=\hat{\mathbf{z}}_{a,i}^{\top}\hat{\mathbf{z}}_{a,j}$，$u_i=\max_j \mathbf{S}^{ab}_{ij}$，$v_j=\max_i \mathbf{S}^{ab}_{ij}$。

> 动机：> "reduce the sensitivity to boundary tokens and partial occlusions." —— 这是多视图特征聚合里非常实用的工程技巧，比直接取均值鲁棒得多。

### 6. 互 kNN 聚类 + 支持度（§5.2）

边 $(a,b)$ 存在 ⟺ $b\in\mathcal{N}_k(a)$ **且** $a\in\mathcal{N}_k(b)$ **且** $\operatorname{sim}(a,b)\ge\tau_{\mathrm{clu}}$。

$$\{\mathcal{Q}_{r}\}=\operatorname{CC}(\mathcal{G}),\qquad \rho_{a}=\operatorname{median}_{b\in\mathcal{Q},b\neq a}\operatorname{sim}(a,b).$$

低支持成员被**拆为单例簇**（避免噪声掩码污染簇）。

### 7. 置信度重加权（Eq.4）

$$\hat{s}_{a}=\max\left(s_{\min},s_{a}\gamma_{a}^{\alpha}\rho_{a}^{\beta}\right).$$

### 8. 多视图 3D 投票（Eq.5–6）

$$V_{r,f}^{\mathrm{raw}}=\sum_{a\in\mathcal{V}_{r,f}}c_{a}\cos(\theta_{a,f})\cdot W(a,f),$$

$W(a,f)=w_{+}$（投影面心在掩码内）否则 $-w_{-}$；$\mathcal{V}_{r,f}\subseteq\mathcal{Q}_{r}$ 是能看到 $f$ 的掩码子集；$\theta_{a,f}$ 为面法向与视线夹角。

$$V_{r,f}=\frac{V_{r,f}^{\mathrm{raw}}}{\max(1,|\mathcal{V}_{r,f}|)}.$$

分配规则：$V_{r,f}>\tau_V$ **且** 至少 $n_{\min}^{+}$ 次正命中。面–标签冲突用加权投票解决。

**部件合并**：
$$\operatorname{IoU}(a,b)=|\mathcal{P}_{a}\cap\mathcal{P}_{b}|/|\mathcal{P}_{a}\cup\mathcal{P}_{b}|\ge\tau_{\mathrm{iou}}=0.8 \Rightarrow \text{区域邻接图连接}$$

---

## 新基准：TDSet + GTSeg

| 组件 | 内容 | 状态 |
|------|------|------|
| **TDSet** | 用 **Chord** (Ying et al., SIGGRAPH Asia 2025) 在 **DTD** (Cimpoi et al., CVPR 2014) 上生成 **354** 张几何高度图（论文正文写 350，仓库写 354） | ✅ 已发布 |
| **GTSeg 训练集** | **Thingi10K** 80 个合成模型 × 随机贴 4–5 张位移图 × 重复 10 次 = **800** 个带纹理模型，全部自动标注 | ⏳ Coming soon |
| **GTSeg 3D 基准** | **20** 合成模型 + **10** 真实扫描（Xiong et al. TOG 2014 等）**面级人工标注** = **30** 模型 | ⏳ Coming soon |
| **GTSeg 2D 图像集** | 76 训练 / 4 验证模型 × 14 视角 = **10,640** 训练 + **560** 验证 = **11,200** 对（曲率渲染 + 实例掩码 + 3D 对应） | ⏳ Coming soon |

仓库：https://github.com/ALingll/GTSeg

---

## 实验结果

### 消融（Table 1，类别无关、面级、百分比）

| 方法 | MUCov ↑ | MWCov ↑ | SQ50 ↑ | RQ50 ↑ | PQ50 ↑ |
|---|---|---|---|---|---|
| w/o SAM3 Fine-tuning | 35.64 | 49.04 | 81.66 | 34.57 | 29.15 |
| w/o Clustering | 39.91 | 54.26 | 77.96 | 41.03 | 32.79 |
| w/o Filtering | 54.33 | 71.08 | 79.18 | 59.87 | 48.55 |
| **Ours** | **61.78** | **78.24** | **83.15** | **70.99** | **59.32** |

**三个组件缺一不可**：去掉微调掉 26.14 MUCov，去掉聚类掉 21.87，过滤贡献 +7.45。

### 2D 图像分割对比（Table 2，prompt 统一为 "repetitive pattern"）

| 方法 | mIoU ↑ | Dice ↑ | Precision ↑ | Recall50 ↑ | AP50 ↑ | AP75 ↑ | Mean AP ↑ |
|---|---|---|---|---|---|---|---|
| TextureSAM | 15.61 | 25.87 | 15.67 | 5.73 | 0.70 | 0.17 | 0.43 |
| SAM3 (zero-shot) | 59.33 | 69.03 | 72.62 | 36.93 | 29.76 | 17.03 | 23.40 |
| **Ours (GTSAM)** | **78.18** | **85.74** | **88.90** | **81.42** | **74.50** | **52.72** | **62.06** |

> ⚠️ **论文内部数值不一致**：正文叙述的 mIoU 0.933 / Dice 0.965 / AP75 0.124→0.831 与表格数值对不上。**以表格为准**，正文数字疑为早期百分制版本。

### 3D 模型分割对比（Table 3）—— 核心结果

测试集：12 个真实重建模型 (Tetweave) + SHREC'25 合成模型。

| 方法 | MUCoV ↑ | Recall50 ↑ |
|---|---|---|
| TextureSAM + Voting | 18.13 | 13.43 |
| ShapeDiameter | 35.18 | 19.80 |
| SAMesh | 32.35 | 21.33 |
| **Ours** | **61.78** | **70.54** |

**失败模式分析**（作者自述）：
- **ShapeDiameter** 依赖体积厚度与全局形状 → 对浅、重复、同语义部件内的纹理**不敏感**
- **SAMesh** 把 2D 分割投影到网格，但行为被物体/部件级视觉先验主导 → 纹理元素**语义相似但几何不同**时产生**跨视角不一致**
- **Ours** 用曲率渲染作为输入，把分割导向**内禀表面变化**而非颜色/光照/语义

### 超参数汇总

| 参数 | 值 | 参数 | 值 |
|------|-----|------|-----|
| N（推理渲染视角） | 50 | τ_s（一致性） | 0.65 |
| 每模型训练视角 | 14 | k（双向 top-k） | 8 |
| k（互 kNN 图） | 5 | τ_clu | 0.8 |
| α / β | 1.0 / 1 | s_min | 0.25 |
| w_+ / w_- | 2.0 / 1.0 | n_min^+ | 3 |
| τ_iou | 0.8 | 曲率裁剪 | 5% / 95% |

---

## 局限性

**作者明示**：
> "our method fails in segmenting **weak relief**, **hollow structures** or **heavy occlusions**"

**未来工作**（含"加速分割流程"的隐性承认当前速度慢）、引入生成模型做纹理合成/迁移、支持交互式分割。

**补充分析**：
- **仍有 prompt 依赖**：评测统一用固定 prompt "repetitive pattern"，与 teaser 宣称的"无需精心定制 prompt"略有出入
- **仅曲率输入** → 丢失 albedo；近乎平坦的纹理类型（编织网格、近棋盘格）可能不可见
- **无任何运行时/显存测量**（对系统方向读者是真实缺口）
- **基准规模小**：3D 基准仅 30 模型，真实部分仅 10 个手标
- **合成-真实鸿沟**：训练数据全部由 DTD 位移图合成，真实浮雕分布覆盖窄

---

## 开源参考

| 资源 | 链接 |
|------|------|
| 项目/数据集仓库 | https://github.com/ALingll/GTSeg |
| TDSet 下载（354 高度图） | `https://drive.google.com/file/d/1L4NYpjHaxBbNGCjAfcnmF4GNFnVwu0RM/view?usp=sharing` |
| 基座模型 | SAM3 (arXiv:2511.16719) |
| 特征提取 | DINOv2 |
| 微调方法 | LoRA (ICLR 2022) |
| 数据来源 | DTD (CVPR 2014), Thingi10K, Chord (SIGGRAPH Asia 2025) |

---

## 🥢 可行性分析

### 算法复杂度

| 阶段 | 时间复杂度 | 说明 |
|------|-----------|------|
| 曲率渲染 | O(N · F) | N=50 视角，F 为面数；GPU 光栅化 |
| GTSAM 推理 | O(N · m) | m 为掩码数；SAM3 ViT-H 级 |
| DINOv2 特征 | O(N · A · K) | A 为掩码分量数，每分量 8 增强 |
| 聚类 | O(A² · K) | 互 kNN，token 级相似度矩阵 |
| 3D 投票 | O(N · A · F) | 需注意面-掩码可见性查询 |
| IoU 合并 | O(P²) | P 为最终部件数 |

### 实现难度

- **算法复杂度**：**中** —— 概念不复杂（曲率渲染 + SAM3 + 特征聚类 + 投票），但多环节耦合调参
- **数值稳定性**：**好** —— 曲率在网格奇异点处有噪声，作者用 5%/95% 分位裁剪处理；相似度用中位数而非均值，抗离群
- **依赖项**：PyTorch + SAM3 + DINOv2 + 网格渲染管线（OpenGL/moderngl/可微光栅）

### 推荐结论

✅ **推荐实现（作为工具性模块）** —— 几何纹理分割是网格编辑器中**长期缺失的能力**（几何纹理编辑、浮雕移除/替换、纹样检索），本文方案工程可落地、数据集开源。适合直接接入 3D 编辑器作为"纹理级选择"工具。

⚠️ **但需注意**：作者自己把"加速"列为未来工作 —— **50 视角 × 8 增强 × DINOv2 的成本不低**，不适合实时交互场景。建议做**渐进式**：先在低分辨率（少视角）下出粗分割，用户框选后再局部精化。

### 落地建议

1. **优先复用 GTSAM 权重**（若开源）与 **TDSet**，而非从零训练
2. **曲率渲染改为 GPU 计算**：直接在顶点着色器/计算着色器里算平均曲率并渲染，避免 CPU→GPU 往返
3. **投票阶段用 CUDA 原子加** 替代 Python 循环
4. **DINOv2 token 缓存**：同一模型多视角复用可显著降本
5. **与已有几何工具的衔接**：分割结果可直接喂给 libigl 的区域选择/局部编辑，做纹理区域的高斯平滑（法向滤波）或位移图替换

### 对协作 agent 的提示

- **五花肉（前端 3D 编辑器）**：几何纹理选择器 —— 比语义部件选择更细粒度，适合"选中这块浮雕/这排纹样"类交互
- **吊龙（后端几何处理集成）**：曲率渲染 + 多视图投票的管线可复用为通用的"网格区域分割服务"

---

**已传递给 @墨鱼丸。**

---

## 相关笔记

- [[2026-11-08-GEKey-Geodesic-Eccentricity-3D-Keypoints]] — 纯几何（测地偏心率）方法，与本文形成「无学习 vs 学习」对照
- [[2026-11-09-Dynamic-GPU-Sparse-Grids-NanoVDB]] — 体素化/稀疏网格基础设施
- [[Parametrization-Three-Layer-Chain]] — 参数化方法
