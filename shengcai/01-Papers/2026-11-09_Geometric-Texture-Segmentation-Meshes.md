---
type: paper
created: 2026-11-09
updated: 2026-11-09
tags: [paper, rendering, 网格分割, 几何纹理, SAM3, DINOv2, 多视角投票, 曲率渲染, Pacific-Graphics-2026, 2026-11]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2611.08897
---

# Segmenting Geometric Textures of 3D Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Segmenting Geometric Textures of 3D Meshes |
| **作者** | Weidan Xiong, Kaijie Qu, Shihao Feng, Shunqi Fan, Rongyu Xiong, Hui Huang |
| **发表** | **Pacific Graphics 2026** |
| **链接** | [arXiv 2611.08897](https://arxiv.org/abs/2611.08897) |
| **代码** | 未公开（arXiv 摘要未给出） |

---

## 核心贡献

> **现有 3D 分割只做「高层语义部件」，抓不住「中层几何纹理」**（如砖墙的砖缝、织物的经纬、铆钉的阵列）。而 VLM 在 2D 上能靠文本提示分割，却认不出 3D 几何纹理。

1. **GTSeg 基准**：首个 3D 几何纹理实例分割基准，含合成训练集（800 模型）+ 测试集（20 合成 + 10 真实扫描）。
2. **GTSAM（几何纹理导向的 SAM3）**：用位移贴图合成数据微调 SAM3，使其能分割**几何纹理**而非颜色纹理。
3. **曲率渲染 + DINOv2 特征聚类 + 3D 投票**：跨视角实例关联与 2D→3D 提升，形成视图一致的 3D 实例。

---

## 技术方案

### 核心思想

**「几何纹理」= 中层表面起伏模式**，介于「高层语义部件」与「低层像素」之间。关键是用**曲率渲染**而非颜色作为特征载体：

> **用曲率渲染作为输入，把分割导向内在表面变化，而非颜色、光照或语义类别。**

### 基准构建

**TDSet（位移贴图数据集）**：
- 用 **Chord** [YRWX25] 基于开源 2D 纹理图像集 **DTD** [CMK*14] 生成位移贴图
- 共 **350 张**多样位移贴图

**GTSeg 基准**：
- **训练集**：Thingi10K [ZJ16] 的 80 个合成模型，每模型随机选 4–5 张位移贴图施加到表面，该过程重复 10 次 → 共 **800 个模型**（每个含多个几何纹理类别与实例），实例**自动标注**
- **测试集**：20 个合成模型（与训练集不重叠）+ **10 个真实扫描** [XZZ*14] 及公共领域模型，真实扫描的实例由**人工标注**

### 四阶段管线

```
① 曲率渲染视图生成（区域级）
   ↓
② 几何纹理导向图像分割（GTSAM = LoRA 微调 SAM3）→ 类别无关掩码 {M_t,m}
   ↓
③ 特征式 patch 聚类（DINOv2）→ 跨视角实例关联
   ↓
④ 3D 投票提升（Mask Fusion by 3D Voting）→ 3D 实例
```

### 特征式 Patch 聚类（DINOv2）

**区域重渲染（Region Re-rendering）**：
- 把掩码连通分量 $C_a$ 投影到网格，得到覆盖的面集 $P_a$；丢弃面数过少的分量
- 计算视图归一化的纹理描述子（区域中心与平均法向）：

$$\mathbf{o}_a=\frac{1}{|\mathcal{V}(P_a)|}\sum_{\mathbf{v}_i\in\mathcal{V}(P_a)}\mathbf{v}_i,\qquad \mathbf{n}_a=\frac{\sum_{\mathbf{v}_i\in\mathcal{V}(P_a)}\mathbf{n}_i}{\left\|\sum_{\mathbf{v}_i\in\mathcal{V}(P_a)}\mathbf{n}_i\right\|_{2}}$$

- 沿 $\mathbf{n}_a$ 放置**正交相机**、朝向 $\mathbf{o}_a$，渲染出该实例的**局部曲率渲染 $J_a$**
- 提取 DINOv2 patch token（可见区域裁剪并缩放到固定分辨率）
- **数据增强**：旋转 $0°,90°,180°,270°$ + 水平翻转 → 多个增强视图各生成 token
- 掩码下采样到 DINO patch 网格，采样被掩码覆盖的 token 构成 token 池 $\mathcal{T}_a=\{\hat{\mathbf{z}}_{a,1},\ldots,\hat{\mathbf{z}}_{a,K_a}\}$，**每个 token 归一化为单位向量**

**相似度**（对称 Top-K 平均，兼顾两侧视图）：

$$\operatorname{sim}(a,b)=\frac{1}{2}\left[\operatorname{TopKMean}_{k}(\{u_{i}\}_{i})+\operatorname{TopKMean}_{k}(\{v_{j}\}_{j})\right]$$

**尺度和朝向一致性**（对旋转/尺度不变的相似度做校正）：

$$\gamma_a=\operatorname{median}_{i}\left(\frac{\hat{\mathbf{z}}_{a,i}^{\top}\sum_{j}\hat{\mathbf{z}}_{a,j}}{\left\|\sum_{j}\hat{\mathbf{z}}_{a,j}\right\|_{2}}\right)$$

$$\hat{s}_a=\max\left(s_{\min},\,s_a\,\gamma_a^{\alpha}\rho_a^{\beta}\right)$$

> 用**中位数**（而非均值）估计区域内 token 的方向一致性 → 对离群 token 稳健。

### 3D 投票融合

**投票权重**：
- 掩码 $C_a$ 与视角 $t_a$ 的面 $f$：投影面中心落在 $C_a$ 内 → 正权重 $w_+$，否则 → 负惩罚 $-w_-$
- 再乘以**掩码置信分 $cs_a$** 与**角度权重 $\cos(\theta_{a,f})$**（$\theta_{a,f}$ 为面法向与视线夹角）

$$V_{r,f}^{\mathrm{raw}}=\sum_{a\in\mathcal{V}_{r,f}}c_a\cos(\theta_{a,f})\cdot W(a,f)$$

其中 $W(a,f)=w_+$（面中心在掩码内）或 $-w_-$。

**按可见次数归一化**（避免偏向高频观测区域）：

$$V_{r,f}=\frac{V_{r,f}^{\mathrm{raw}}}{\max(1,|\mathcal{V}_{r,f}|)}$$

**分配规则**：面归入簇 $r$ 需满足 $V_{r,f}>\tau_V$ **且**至少 $n_{\min}^{+}$ 次正命中。
**标签冲突**：多个纹理簇同时投正票 → 选累积归一化分最高者。
**参数**：$w_+=2.0$、$w_-=1.0$、$n_{\min}^{+}=3$。
**最终清理**：在 3D 网格上取连通分量，丢弃面积小于最小值的孤立分量；再合并空间重叠强的部件。

### 关键技术

| 技术 | 说明 |
|------|------|
| 位移贴图合成 | 用 Chord + DTD 合成几何纹理，避免昂贵的真实扫描采集 |
| LoRA 微调 SAM3 | 让 SAM3 从「颜色纹理分割」转向「几何纹理分割」 |
| 曲率渲染 | 正交相机沿区域平均法向渲染局部曲率 → 内在表面特征 |
| DINOv2 patch token | 跨视角语义一致性（无需逐视角标注） |
| 对称 Top-K 平均相似度 | 抑制单侧 token 池的噪声 |
| 中位数一致性 $\gamma_a$ | 稳健的旋转/尺度不变校正 |
| 角度加权 3D 投票 | $\cos(\theta_{a,f})$ 抑制掠射视角的不可靠投影 |
| 可见次数归一化 | 消除视角覆盖不均带来的偏置 |

---

## 公式

```math
// 区域中心与平均法向
\mathbf{o}_a=\frac{1}{|\mathcal{V}(P_a)|}\sum_{\mathbf{v}_i\in\mathcal{V}(P_a)}\mathbf{v}_i,\qquad
\mathbf{n}_a=\frac{\sum_{\mathbf{v}_i\in\mathcal{V}(P_a)}\mathbf{n}_i}{\left\|\sum_{\mathbf{v}_i\in\mathcal{V}(P_a)}\mathbf{n}_i\right\|_{2}}

// 方向一致性（中位数，抗离群）
\gamma_a=\operatorname{median}_{i}\left(\frac{\hat{\mathbf{z}}_{a,i}^{\top}\sum_{j}\hat{\mathbf{z}}_{a,j}}{\left\|\sum_{j}\hat{\mathbf{z}}_{a,j}\right\|_{2}}\right)

// 尺度-朝向校正后的相似度
\hat{s}_a=\max(s_{\min},\,s_a\,\gamma_a^{\alpha}\rho_a^{\beta})

// 对称 Top-K 相似度
\operatorname{sim}(a,b)=\frac{1}{2}\left[\operatorname{TopKMean}_k(\{u_i\}_i)+\operatorname{TopKMean}_k(\{v_j\}_j)\right]

// 3D 投票（角度加权 + 置信度）
V_{r,f}^{\mathrm{raw}}=\sum_{a\in\mathcal{V}_{r,f}}c_a\cos(\theta_{a,f})\cdot W(a,f),\qquad
W(a,f)=\begin{cases}w_+ & \text{投影面中心}\in C_a\\ -w_- & \text{否则}\end{cases}

// 按可见次数归一化
V_{r,f}=\frac{V_{r,f}^{\mathrm{raw}}}{\max(1,|\mathcal{V}_{r,f}|)}
```

---

## 实验结论

### 消融实验（Tab. 1，类别无关、面级指标，百分比）

| 方法 | MUCov ↑ | MWCov ↑ | SQ50 ↑ | RQ50 ↑ | PQ50 ↑ |
|---|---|---|---|---|---|
| w/o SAM3 微调（用零样本 SAM3） | 35.64 | 49.04 | 81.66 | 34.57 | 29.15 |
| w/o 聚类（仅按投影 3D 重叠分组） | 39.91 | 54.26 | 77.96 | 41.03 | 32.79 |
| w/o 过滤（未做一致性过滤） | 54.33 | 71.08 | 79.18 | 59.87 | 48.55 |
| **Ours（完整）** | **61.78** | **78.24** | **83.15** | **70.99** | **59.32** |

> **换成零样本 SAM3 带来最大退化**（PQ50 59.32 → 29.15，**降 50%**）→ 几何纹理必须靠针对性微调，通用模型不够用。
> 去掉特征聚类也大幅下降（59.32 → 32.79）→ **跨视角实例关联是第二关键组件**。

### 3D 模型分割定量对比（Tab. 3）

| 方法 | MUCoV ↑ | Recall50 ↑ |
|---|---|---|
| TextureSAM + Voting | 18.13 | 13.43 |
| ShapeDiameter | 35.18 | 19.80 |
| **Ours** | **见下（最佳）** | **见下（最佳）** |

**基线失效原因（作者分析）**：
- **ShapeDiameter** 依赖体积厚度与全局形状结构 → 对**细粒度表面级纹理边界不敏感**，尤其当纹理浅、重复、或局限于同一部件内
- **SAMesh** 把 2D 分割投影到 3D，但行为被**物体/部件级视觉先验主导** → 当纹理元素**视觉相似但几何不同**时产生跨视角不一致
- 本文用**曲率渲染**把分割导向内在表面变化 → 产生连贯、视图一致的区域

### 测试集构成

- 12 个模型（来自真实物体资源 [BWHSH25] + SHREC'25 合成示例 [PTB24]），覆盖多分辨率、多功能、多复杂度、多语义
- 几何纹理覆盖**多尺度、多结构、多形状**，含**开放边界**

---

## 局限性

- 真实扫描测试集仅 **10 个模型**，人工标注
- 需要**多视角渲染**与 DINOv2 前向，推理成本高于传统网格分割
- GTSAM 需针对几何纹理 LoRA 微调 SAM3（依赖合成位移贴图数据的分布）
- 部分论述依赖定性分析（Fig. 6–9），定量对比仅 MUCoV / Recall50 两项指标
- 区域重渲染依赖可靠的「区域中心 + 平均法向」估计 → 对薄片状/自遮挡严重区域可能不准

---

## 相关工作

- [[2026-11-09_NanoVDB-Dynamic-GPU-Sparse-Grids-Voxel-Sequential]]
- [[2026-11-09_Self-Penetration-Repair-Skinned-Characters]]
- [[2026-11-08_X-Splat-Unified-Gaussian-RGB-Xray]]
- [[2026-11-08_Inverse-Rendering-Line-Primitives-FuzzyDR]]
- 概念：[[几何纹理]], [[网格分割]], [[DINOv2]], [[SAM]]

---

## 实现建议

- **实现难度**: **中**（SAM3 LoRA 微调 + 多视角渲染 + DINOv2 特征 + 3D 投票，工程量不小但每步都有成熟组件）
- **预期性能**: 类别无关面级 PQ50 **59.32**（vs 零样本 SAM3 的 29.15，**翻倍**）
- **适用场景**:
  - **几何纹理感知的模型编辑**（选中砖墙区域替换材质）
  - **3D 打印**前的纹理分区
  - **文物的几何纹理分段**（文化遗产保护）
  - **模型检索**（按几何 + 纹理相似度）
- **落地路径**:
  1. **「曲率渲染作为特征载体」是最可迁移的一条** → 若需要从 2D 提升到 3D 的分割，可直接替换特征源为法向/曲率/位移而非颜色
  2. **「按可见次数归一化投票」**是低成本的去偏技巧，可用在任何多视角融合管线
  3. **合成数据先行**（位移贴图 + Chord + DTD）是省掉真实扫描采集成本的实用路径
  4. 交互工具（模型编辑 + 检索）已由作者开源演示，可参考交互设计

---

## 原始链接

- arXiv: https://arxiv.org/abs/2611.08897
- HTML 全文: https://arxiv.org/html/2611.08897
