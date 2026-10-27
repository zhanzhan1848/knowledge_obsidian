---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, geometry-processing, cs.CV, CAD-reverse-engineering, B-rep, sketch-parameterization, extrusion, part-segmentation, domain-adaptation, P3-SAM, SketchGraphs, FreeCAD]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.33575
arxiv_id: 2610.33575v1
---

# CADonatello: Towards Real-World Multi-Part 3D CAD Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CADonatello: Towards Real-World Multi-Part 3D CAD Reconstruction |
| **作者** | Ahmet Serdar Karadeniz, Dimitrios Mallis, Parsa Akbari Chianeh, Kseniya Cherenkova, Anis Kacem, Djamila Aouada |
| **发表** | arXiv 2026-10-24 (v1)，cs.CV |
| **链接** | [原文](https://arxiv.org/abs/2610.33575) · [HTML](https://arxiv.org/html/2610.33575v1) |
| **DOI** | [10.48550/arXiv.2610.33575](https://doi.org/10.48550/arXiv.2610.33575) |
| **机构** | Imperial College London（Aouada 组）、NVIDIA 等 |
| **代码** | 论文未给出 |

---

## 核心贡献

> **CAD 逆向工程在标准基准上刷分已经刷不动了 —— 真正的难点在「真实场景」：多部件 + 扫描噪声。CADonatello 的答案是「先分解，再逐件重建」。**

1. **提出部件感知的 CAD 逆向工程框架 CADonatello**：
   - 用**基础模型规模的 3D 部件分割模型**把输入几何分解为**结构上有意义的组件**
   - 再对**每个组件独立**走**横截面驱动的重建管线**：**草图参数化 → 拉伸**
2. **提出 CC3D Cross-Sections 数据集**：
   - 成对数据：**真实扫描派生的栅格化横截面图像** ↔ **对齐 CAD 模型导出的参数化草图**
   - 规模：**44k 训练 + 2k 测试**图像-草图对
   - 用途：**从「干净的 CAD 草图图像」到「扫描派生的横截面图像」做域适应**，大幅提升草图参数化对扫描伪影的鲁棒性
3. **参数效率突出**：**171M 参数**即达到最好 ECD，**优于 2B 参数的 Cadrille**（≈ 12× 更小）
4. **明确超越同类横截面方法 MiCADangelo**（同组前作）—— 证明「部件分解」路线的价值

---

## 技术方案

### 管线

```
输入网格（真实扫描，含噪声）
    ↓ 归一化到单位包围盒
【部件分解】P3-SAM（基础模型规模的 3D 部件分割）
    ↓ 各部件
【横截面提取】方向感知的关键切片平面估计
    ├─ E_plane^single：规范单平面候选（canonical-based single plane）
    └─ E_plane^multi ：学习式多平面估计器（learning-based multi-planes）
    ↓
【扫描横截面参数化】草图参数化网络
    （SketchGraphs 预训练 → CC3D Cross-Sections 微调）
    ↓
【自适应拉伸】可微拉伸（differentiable extrusion）
    ├─ 单次拉伸（基于规范平面）
    └─ 多次拉伸（学习式多平面）
    ↓
【部件装配】布尔运算 → 完整参数化 CAD 模型
（FreeCAD Python API 实现）
```

### 关键实现细节（论文附录）

| 项 | 设置 |
|----|------|
| **输入归一化** | 归一化到单位包围盒 |
| **分割模型** | **P3-SAM** |
| **草图参数化** | 在 **SketchGraphs** 上预训练，在 **CC3D Cross-Sections** 上微调 |
| **草图格式** | **SketchGraphs 格式**（结构化约束草图） |
| **可微拉伸** | 在 **8 个候选拉伸方向**上做**可微拉伸**，**200 次迭代**，学习率 **2×10⁻³** |
| **装配** | **FreeCAD**（Python API）布尔运算 |
| **图元类型** | 圆、正多边形等（横截面合成基准中随机采样） |

### CC3D Cross-Sections 数据集构建

1. 取**对齐的 CAD BRep（STEP）模型**与对应的**扫描网格**
2. 两者都沿**规范 x/y/z 轴**用**均匀采样平面**切片
3. BRep 侧：产出参数曲线 → 投影到 2D → 转成**结构化约束草图**（SketchGraphs 格式）
4. 网格侧：产出**闭合轮廓曲线** → 投影到 2D → **栅格化为二值图像**
5. 两者在**单位包围盒内居中归一化** → 配对样本 $(\mathbf{X}, \mathcal{K})$，$\mathbf{X} \in \{0,1\}^{H \times W}$

---

## 实验结论

### 数据集

| 数据集 | 规模 | 说明 |
|--------|------|------|
| **CC3D 测试集** | **2,978** 样本 | 真实扫描网格 ↔ 对应 CAD 模型的配对 |
| **CC3D-Complex** | **1,528** 样本 | 构造步骤数 > 4 的复杂子集 |
| **Fusion 360 Assembly** | **200 个装配 / 3,780 个部件** | 真实机械设计 |
| **F360-Complex** | **126 个装配** | 每装配 > 4 个部件 |
| **Non-Axis-Aligned Extrusions** | 合成 | 随机方向堆叠 primitive 拉伸 |
| **CC3D Cross-Sections** | **44k 训练 + 2k 测试** | 本文提出 |

### 主结果：CC3D 与 CC3D-Complex

| 方法 | CD ↓ | IR ↓ | ECD ↓ | CD(Complex) ↓ | IR ↓ | ECD ↓ | 参数量 |
|------|------|------|-------|--------------|------|-------|--------|
| CAD-SIGNet | 2.90 | 4.4 | 8.68 | 5.39 | 5.03 | 15.36 | 6.1M |
| MiCADangelo | 1.69 | 2.2 | 5.93 | 3.37 | 3.2 | 8.18 | 59M |
| CAD-Recode | 0.56 | 8.6 | 3.41 | 0.93 | **10.0** | 4.66 | **1.5B** |
| Cadrille | **0.44** | **0.5** | 3.65 | 0.74 | **0.5** | 4.91 | **2B** |
| **CADonatello（本文）** | 0.48 | 1.6 | **2.78** | **0.71** | 0.7 | **3.57** | **171M** |

> 📌 **三个结论**：
> 1. 完整 CC3D 上 **ECD 最好**（2.78）→ 几何结构恢复更好
> 2. 复杂子集上 **CD 与 ECD 双最好**（0.71 / 3.57）
> 3. **171M 参数 vs Cadrille 的 2B** → **参数效率高约 12×**，而精度相当

### 消融（Table 5）

**部件分割（Fusion360 Assembly）**：

| 方法 | Seg. IoU ↑ | CD ↓ | IR ↓ | ECD ↓ |
|------|-----------|------|------|-------|
| PointNeXt | 43.1 | 3.61 | 10.0 | 9.54 |
| SAMPart3D | 52.5 | 2.90 | 6.5 | 9.47 |
| PartSAM | 72.5 | 2.08 | 6.0 | 5.51 |
| **P3-SAM** | **77.6** | **1.57** | **0.0** | **5.28** |

**拉伸策略（CC3D）**：

| 策略 | CD ↓ | IR ↓ | ECD ↓ |
|------|------|------|-------|
| Single-extrusion | 0.51 | **1.5** | 3.00 |
| **Multi-extrusion** | **0.48** | 1.6 | **2.78** |

> 「允许每个部件有**多次草图-拉伸操作**提升了重建性能。」

### 训练数据消融（Fusion 360 Assembly，Table 6）

| 训练数据 | Acc ↑ | PF1 ↑ | SCD ↓ | NCC ↓ | CD ↓ | IR ↓ | ECD ↓ |
|---------|-------|-------|-------|-------|------|------|-------|
| SG（SketchGraphs） | 0.907 | 0.697 | 0.746 | 2.32 | 1.64 | 1.0 | 6.06 |
| SG + Synt（合成） | 0.933 | 0.764 | 0.262 | **1.39** | 1.58 | 0.0 | 5.42 |
| **SG + CC3D-CS** | **0.935** | **0.852** | **0.217** | 1.70 | **1.57** | **0.0** | **5.37** |

> 「微调模型在草图级 SCD 和 PF1 上取得**适度改进**，下游 CD 与 ECD 也有小幅提升。」
> 「**这些增益比在 CC3D 上观察到的小**，因为 Fusion 360 Assembly 网格是从**干净的 BRep 模型三角化**而来，**不含 CC3D Cross-Sections 专门针对的扫描伪影**。」
> 「但结果表明，在扫描派生横截面上训练**在保持干净输入性能的同时**提供了跨数据集收益。」

### 误差传播分析（附录，Fusion 360 Assembly）

论文分析三个**阶段级误差指标**：
1. **分割误差**：对 GT 部件的 $1 - \mathrm{IoU}$
2. **草图参数化误差**：预测草图 vs 输入网格提取的栅格化横截面草图之间的 **SCD**
3. **部件级平均 CD**：重建部件 vs 对应输入部件（**联合捕获**横截面提取、草图参数化、拉伸拟合的误差）

**结论**：
> 「**最终 CD 在中等分割误差与草图误差下保持相对稳定**，而**部件级 CD 与最终重建误差呈更强的单调关系**。」
> 「这些结果表明**管线是渐进退化，而非灾难性地放大中等程度的不精确**。」

---

## 局限性

- **依赖 P3-SAM 的分割质量** —— 分割误差直接传导（但论文证明是渐进退化而非灾难放大）
- **依赖「部件可由草图-拉伸表达」的先验** —— 对自由曲面部件不适用
- **规范轴向的切片假设** —— 由 **Non-Axis-Aligned Extrusions** 基准专门测试鲁棒性
- **域适应的收益依赖数据域匹配** —— 对从干净 BRep 三角化的网格收益较小
- 论文未明确列出独立的 "Limitations" 章节（限制散见于附录与讨论中）

---

## 相关工作

- [[CAD-Reverse-Engineering]]
- [[Sketch-Parameterization-SketchGraphs]]
- [[Differentiable-Extrusion]]
- [[Part-Segmentation-3D-Foundation-Model]]
- [[CSG-Tree-Learning]]
- [[2610-33484-Gauge-Invariant-Spectral-Brep-Retrieval]]（同日的 B-rep 谱描述子工作）

---

## 实现建议

- **实现难度**：**中**。管线各组件都有开源实现，**整合难度大于单点难度**。
- **数值稳定性**：**中**。可微拉伸在 8 个候选方向上优化 → 有**离散选择的跳变风险**；布尔运算（FreeCAD）对近似重合面可能失败（IR 指标直接监控这一点）。
- **依赖项**：
  - **P3-SAM**（部件分割，基础模型）
  - **SketchGraphs**（草图格式 + 预训练模型）
  - **FreeCAD**（Python API，布尔装配）
  - **PyTorch**（可微拉伸）
  - BRep 处理：**OpenCascade（OCCT）** / **CadQuery**
  - 评估指标：Chamfer / Edge Chamfer / Invalidity Ratio / Sketch Chamfer / Primitive F1
- **适用场景**：
  - ✅ **真实扫描的 CAD 逆向工程**（本文主场）
  - ✅ **多部件装配体**（机械零件）
  - ✅ **需要参数化可编辑输出**（草图 + 拉伸，而非纯三角网格）
  - ✅ **参数效率敏感**的场景（171M vs 2B）
  - ⚠️ 单个自由曲面物体 → 不适用
  - ❌ 抽象/雕塑类非机械几何
- **性能预期**：CC3D 上 CD 0.48 / ECD 2.78；复杂子集 CD 0.71。可微拉伸 200 迭代 × 8 候选方向。

---

## 备注

> **这篇最值得学的是「域适应」的选型逻辑**：
>
> 问题不是「草图参数化模型不够强」，而是**训练数据（干净 CAD 草图）与测试数据（扫描派生横截面）存在域差**。CADonatello 的解法不是加大模型，而是**针对域差造一个成对数据集**（CC3D Cross-Sections），让模型见到真实域。
>
> 而**误差传播分析（附录）才是真正有价值的部分**：它量化了「分割误差 → 草图误差 → 部件级 CD → 最终 CD」的传导关系，并证明**管线是渐进退化而非灾难性放大**。这类分析在我们做多阶段几何管线时**必须做** —— 它决定了哪个环节值得投入。
>
> 注意一个细节：**multi-extrusion 反而让 IR（invalidity）从 1.5 升到 1.6** —— 精度提升伴随轻微的合法性退化。**指标之间的此消彼长值得在我们的管线里逐项盯。**
