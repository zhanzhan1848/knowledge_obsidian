---
type: paper
created: 2026-10-31
updated: 2026-10-31
tags: [paper, ray-tracing, neural-rendering, octree, explicit-representation, BVH, surface-rendering, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2610.38441
---

# Neural Explicit Shape Representation (NeuOctree)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Explicit Shape Representation |
| **作者** | Jun-Hao Wang, Changan Lu, Baoquan Chen, Peng-Shuai Wang |
| **发表** | arXiv preprint (cs.GR), 2026-10-28 |
| **链接** | [原文](https://arxiv.org/abs/2610.38441) |
| **DOI** | - |
| **代码** | https://github.com/octree-nn/neural-octree |

---

## 核心贡献

> NeuOctree — 神经显式形状表示：直接预测"光线是否命中表面 + 命中何处 + 法线 + 反照率"，用稀疏八叉树角点特征 + 递归相交引导采样，绕开网格提取与纹理烘焙，直接支持光线追踪渲染。

1. **显式表面查询接口** — 现有神经 3D 表示要么只做连续表面建模、要么只做高效图像合成、要么只做物体级压缩，无法同时提供光线追踪所需的显式表面查询与跨物体可预测的结构化输出空间。NeuOctree 把二者统一。
2. **八叉树角点特征 + 递归相交引导采样** — 稀疏八叉树体素角点存储共享特征，插值为连续局部场；轻量解码器在预测表面附近做递归细化采样。
3. **同一结构支持两条路径** — 逐物体紧凑优化，以及共享 octree CNN 从彩色点云前馈构造可渲染资产（无需逐物体拟合）。

---

## 技术方案

### 核心思想

神经隐式表示（如 NeRF 类）无法直接被光线追踪器消费，因为光线求交需要显式的"命中/未命中 + 位置"查询，且需要跨物体统一的可预测输出空间（便于做物体级压缩或生成）。

NeuOctree 的做法是**混合表示**：稀疏八叉树划分空间 → 角点特征（八叉树天然共享，相邻体素共用角点，内存高效）→ 插值成连续局部场 → 轻量解码器输出命中概率、命中点、法线、反照率。递归相交引导采样（recurrent intersection-guided sampling）在预测表面附近迭代细化查询位置，从而达到高精度。

关键在于**非水密（open, non-watertight）几何**也能处理——这正是网格方案的痛点。

### 关键技术

| 技术 | 说明 |
|------|------|
| 稀疏八叉树角点特征 | 特征存于体素角点，相邻体素共享 → 内存高效 |
| 连续局部场插值 | 角点特征插值得到连续场，非离散查表 |
| 递归相交引导采样 | 在预测表面附近迭代细化命中查询位置 |
| 光线求交直接渲染 | 无需网格提取、无需纹理烘焙即可直接渲染 |
| Octree CNN 前馈模型 | 从彩色点云直接构造可渲染资产，0.05 s 完成 |
| 对比 N-BVH / VQAD | 联合几何-外观重建的显著改进 |

---

## 公式

### 三线性插值特征场

```math
\boldsymbol{\phi}_{v}(\mathbf{q})=\sum_{i,j,k\in\{0,1\}}w_{ijk}(\mathbf{q})\,\mathbf{f}_{v,ijk}
```

其中 $\mathbf{q}\in[0,1]^3$ 为体素内局部坐标，$w_{ijk}$ 为标准三线性权重。相邻体素共享的角点被识别为**同一个顶点特征**，因此插值在体素边界保持连续。

### 双分支共享解码器

```math
(\mathbf{a},\mathbf{z},s_{h})=G_{\theta}\big(\boldsymbol{\phi}_{v}(\mathbf{q}),\mathbf{q},\mathbf{d},\text{state}\big),
\qquad
\mathbf{c}=\sigma\!\left(M_{\theta}\big(\boldsymbol{\phi}_{v}(\mathbf{q}),\mathbf{q},\mathbf{d},\text{state}\big)\right)
```

- $\mathbf{a}\in\mathbb{R}^3$ 参数化位置，$\mathbf{z}\in\mathbb{R}^3$ 归一化为法线，$s_h$ 为 hit logit，$h=\sigma(s_h)$
- 预测 albedo $\mathbf{c}\in[0,1]^3$
- 几何分支 $G_\theta$ 与材质分支 $M_\theta$ 均为**跨所有体素与所有光线共享权重的轻量残差 MLP**

### 射线局部位置参数化

```math
\alpha=\sigma(\mathbf{a})_1,\qquad
\widehat{\mathbf{p}}=\mathbf{p}_{\mathrm{in}}+\alpha(\mathbf{p}_{\mathrm{out}}-\mathbf{p}_{\mathrm{in}})
```

（逐物体压缩协议使用等价的 ray-projection 参数化，把预测局部点投影到当前射线直线；启用 segment-bounded 选项时投影限制在当前段内。）

### 递归交点精化

```math
\mathbf{q}_{k+1}=\Pi_{\mathrm{ray}}(\widehat{\mathbf{p}}_k)
```

- 首次查询置于线段中点，3 次自适应迭代 = 每体素段 **5 次特征读取**（entry + exit + 3 次自适应查询）
- 可选链式隐藏状态：逐查询增量平均后由共享输出头预测最终属性；推理时使用最终阶段
- 消融显示：相比"仅端点采样"与"均匀采样"，交点精度与法线精度均提升

### 训练目标

```math
\mathcal{L}_{\mathrm{PNCH}}=\mathcal{L}_{p}(\mathcal{P})+\mathcal{L}_{n}(\mathcal{P})
+\lambda_{h}\mathcal{L}_{\mathrm{hit}}(h,m)
+\lambda_{c}\mathcal{L}_{\mathrm{color}}(\mathbf{c},\mathbf{c}^{*};\mathcal{P})
```

几何项被 GT hit label 掩码；**前馈配置下归一化仅在正样本对 $\mathcal{P}$ 上计算**，避免空射线-体素段稀释表面信号。

多阶段总损失：

```math
\mathcal{L}=\sum_{k}w_{k}\left(\mathcal{L}_{\mathrm{PNCH}}^{(k)}
+\lambda_{\mathrm{img}}\mathcal{L}_{\mathrm{img}}^{(k)}
+\lambda_{\mathrm{topo}}\mathcal{L}_{\mathrm{topo}}^{(k)}\right),
\qquad \sum_{k}w_{k}=1
```

### 光线求交查询（概念式）

```math
\text{hit}(x, \omega) = \big( \mathbb{1}[\text{miss}], \ t,\ n,\ \rho \big)
// 八叉树角点特征插值到查询点
f(x) = \sum_{v \in N(x)} w_v(x) \cdot \phi_v, \quad \sum_{v} w_v(x) = 1
```

---

## 代码片段

```cpp
// 概念伪代码：Octree CNN 前馈构造 + 光线查询
auto repr = octree_cnn.forward(colored_point_cloud);   // 0.05s, 无需逐物体拟合
// 渲染循环中
RayHit h = repr.intersect(ray_origin, ray_dir);        // 返回 miss/t/normal/albedo
if (!h.miss) {
    shade(h.position, h.normal, h.albedo);
}
```

---

## 实验结论

- **数据集**: 7 个 mesh × 4 个存储预算（共 28 组对比）+ Objaverse / ShapeNet 跨域迁移
- **基线**: N-BVH, VQAD（物体级压缩/神经表示）
- **结果**:
  - 28 组对比中 **24 组取得最低位置误差**
  - **几何压缩具体数值**（位置误差 $d_{pm}$，越低越好）：
    - 81 KiB：Ours **9.616**（Armadillo） vs N-BVH 80.580 vs VQAD 111.632 vs QNDF 33.591 vs NGF 28.161
    - 122 KiB：Ours **6.963** vs N-BVH 79.107 vs VQAD 98.542
    - 244 KiB：Ours **4.363** vs N-BVH 73.780 vs VQAD 70.747
    - 823 KiB：Ours **2.316** vs QNDF 2.969 vs N-BVH 77.783
  - 法线精度保持竞争力（几何专用方法 QNDF 在大预算下法线仍更好）
  - 联合几何-外观重建显著优于 N-BVH 与 VQAD（两者几何误差高一个数量级以上）
  - 前馈模型 0.05 s 构造表示（对比 N-BVH 拟合约 **3.5 分钟**）；Objaverse → ShapeNet **无需重训**即可迁移
  - 演示了光线追踪渲染（重着色 / 反射 / 折射 / 鱼眼投影）与图像条件生成

---

## 局限性

- 摘要未给出具体渲染帧率（推理成本与八叉树深度耦合）
- 依赖神经解码器，实时性相比传统 BVH 可能不足
- 非水密支持是优势，但对抗遮挡/薄壁几何的能力需要进一步验证
- 几何误差在 244/823 KiB 大预算下仍落后于几何专用的 QNDF（联合表示在"极致几何精度"上有代价）
- 未使用 Fourier 位置特征；链式解码器变体在推理时存在串行依赖
- 未报告与传统光栅化器 / Embree 的绝对渲染性能对比

---

## 与团队相关

- 与墨鱼丸 (moyuwan): 这是**当前最值得深入跟进的论文**——它直接命中"神经表示 + 光线追踪"的交叉点
- 实现建议：可先复现其光线求交查询接口，替换掉生产管线中神经资产的网格提取步骤
  - **分步落地**：① 先只提取"递归交点精化"这一个增量，移植到已有的体素/稀疏结构管线（$\mathbf{q}_{k+1}=\Pi_{\mathrm{ray}}(\widehat{\mathbf{p}}_k)$，3 次迭代 = 5 次特征读取）；② 若已有 BVH / 光追框架，可把"体素段 → 交点/法线/材质"作为一种新自定义图元类型接入 OptiX / Embree；③ 前馈版本的顶点槽位平均聚合是确定性操作，工程实现简单
  - 训练技巧可复用：**几何损失只在正样本对上归一化**，避免空射线段稀释信号
- 关联：[[2026-10-31_GOFish-Fisheye-Gaussian-Splatting-Mesh-Extraction]]、[[2026-04-20_OctaOctree-Neural-Radiosity-Real-time-Glossy-Rendering]]

---

## 实现建议

- **实现难度**: 高（八叉树角点特征编码 + 递归采样解码器 + 训练管线）
- **预期性能**: 质量高（24/28 位置误差最优）；速度未知，推理需 GPU
- **适用场景**: 神经资产库、跨物体泛化的生成式 3D、光线追踪前端的显式表面替代
- **优先级**: **高**（Tier A）
