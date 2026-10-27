---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, geometry-processing, cs.CV, WACV-2027, test-time-adaptation, canonicalization, derivative-free-optimization, CMA-ES, black-box-model, point-cloud-segmentation, rotation-robustness]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.34850
arxiv_id: 2610.34850v1
---

# Recovering Black-Box Point Cloud Models from Pose Shifts via Derivative-Free Optimization (CanDO)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Recovering Black-Box Point Cloud Models from Pose Shifts via Derivative-Free Optimization |
| **作者** | Seonghwan Park, Min-Gyu Park |
| **发表** | arXiv 2026-10-26 (v1)，cs.CV / cs.AI / cs.LG，**已被 WACV 2027 接收** |
| **链接** | [原文](https://arxiv.org/abs/2610.34850) · [HTML](https://arxiv.org/html/2610.34850v1) |
| **DOI** | [10.48550/arXiv.2610.34850](https://doi.org/10.48550/arXiv.2610.34850) |
| **机构** | **Korea Electronics Technology Institute (KETI)** |
| **许可** | **CC BY 4.0** |
| **硬件** | 单张 **RTX A6000** |
| **代码** | **[github.com/shpark97/CanDO](https://github.com/shpark97/CanDO)** |

---

## 核心贡献

> **模型只给「打分、不给梯度」时，怎么修好它因位姿漂移而掉掉的精度？答案是：在输入端做「规范化（canonicalization）」，并用无导数优化去搜那个最优姿态。**

1. **提出 CanDO**：**测试时规范化（test-time canonicalization）**方法，**仅靠前向查询**（forward queries）恢复性能
   - 搜索一个**最大化模型置信度**的输入变换 $\mathbf{T}$
   - 用**无导数优化**完成该搜索（不需要梯度）
2. **识别出成功恢复的三个必要条件**（这是本文最有价值的方法论贡献）：
   - **① 训练增强缺口（training augmentation gap）** —— 模型训练时没见过这种位姿
   - **② 与精度对齐的置信度代理（accuracy-aligned confidence surrogate）** —— 置信度必须与任务性能正相关
   - **③ 在多模态目标上做全局搜索** —— 局部搜索会陷在错误盆地
3. **量化效果**：
   - **方位角错位（azimuthal misorientation）下恢复 oracle 差距的 76%**
   - **任意 $SO(3)$ 旋转下恢复 51%**（对象部件分割任务）

---

## 技术方案

### 问题设定（论文 §3.1）

设 $g$ 为**冻结的**点云模型，**仅通过基于打分的正向查询暴露**（每次查询返回类别概率或 logits）。

给定输入点云 $\mathbf{P} = \{\bm{p}_i\}_{i=1}^N$，$\bm{p}_i \in \mathbb{R}^3$，目标是在输入端**前置一个变换 $\mathbf{T}$** 以最大化下游任务性能。

理想目标（若损失 $\ell$ 与真值 $y$ 可得）：

```math
T*(P) = argmin_T  ℓ( g(T(P)), y )            (1)
```

**黑盒约束**：
1. 无权重访问 → **无梯度可穿过 $g$ 回传**
2. 需仅用查询信号构造替代目标

### 搜索目标与恒等先验

论文构造了三个组件：

| 组件 | 公式 | 作用 |
|------|------|------|
| **置信度代理（confidence surrogate）** | Eq. (4) | 用模型自身置信度代替任务损失 |
| **恒等先验（identity prior）** | Eq. (5) | 惩罚偏离恒等变换太远的解（**防止"自信地错"**） |
| **变换参数化** | Eq. (2) | 前端旋转变换 |

**恒等先验权重 $\lambda$**：在小的有标签验证集上**选一次后固定**。

### 优化器

- 主优化器：**CMA-ES（协方差矩阵自适应进化策略）** —— §3.4
- 对比的无导数优化基线：**坐标有限差分、SPSA、自然进化策略（NES）、score-function 估计器、随机搜索、贝叶斯优化**

### 实现细节（论文附录 B.3）

| 场景 | 优化器配置 |
|------|-----------|
| **完整 $SO(3)$ 搜索 · PointNet++ 部件分割** | CMA-ES，2 次重启，population **12**，$\sigma_0 = 1.0$，**300 次查询** |
| **完整 $SO(3)$ 搜索 · PointNeXt-S 部件分割** | CMA-ES，2 次重启，population **10**，$\sigma_0 = 1.2$，**300 次查询** |
| **完整 $SO(3)$ 搜索 · 分类** | CMA-ES，population **10**（Table 2 中为 12），$\sigma_0 = 1.2$，**240 次查询** |
| **方位角恢复** | 扫描 **16 个角度** → 用 **15 步 SPSA** 精化最优者 |
| **S3DIS 倾斜恢复（Table 1）** | 确定性 **13×13 网格**搜索两个倾斜参数（**169 次查询**） |
| **S3DIS 倾斜恢复（Table 2）** | CMA-ES，population **8**，$\sigma_0 = 0.5$，**160 次查询** |

其他：
- **每个输入一个随机种子**初始化每个估计器
- 变换族候选通过**采集函数（acquisition function）** $\alpha$ 平衡探索与利用：
  ```math
  θ_{t+1} = argmax_θ α(θ; D_t)          (19)
  ```

### 数据集与预处理（附录 B.4）

| 数据集 | 设置 |
|--------|------|
| **ShapeNetPart** | 每个形状归一化到**单位球**，采样为**带表面法向**的点云；坐标与法向作为输入；**变换点的预测通过三近邻投票传播回原始点云**；报告**类别掩码 instance mIoU** |
| **S3DIS** | 评测 **Area 5**，标准 block 预处理，**4096 点 9 通道**输入；倾斜破坏与恢复**旋转输入坐标并从变换后几何重算所有几何通道**，颜色通道保持不变 |
| **ModelNet40** | 标准重采样基准，**每形状 1024 点**，仅点坐标 |
| **破坏（Corruptions）** | 位姿破坏：独立采样**均匀方位角 / 随机轴 $SO(3)$ 旋转 / 水平轴倾斜**；$SO(3)$ 旋转角从**一个小最小值以上均匀采样**（非 Haar 测度）；**Haar 均匀旋转的实验得出相同结论** |
| **非位姿研究（§5.3）** | 官方 **PointCloud-C** 生成器，**7 种破坏 × 5 个严重级别** |

### 基线

- **无导数**：Principal-Axis Canonicalization（PCA + 置信度消歧的逐轴符号变体）、Normalization-Statistic Adaptation（DUA）、External-Prior Canonicalization（外部冻结分类器打分）
- **有导数（仅作参照）**：Parameter-Space TTA（TENT、MEMO）、Gradient-based Canonicalization、**Oracle**

---

## 实验结论

| 场景 | 恢复的 oracle 差距 |
|------|------------------|
| **方位角错位** | **76%** |
| **任意 $SO(3)$ 旋转** | **51%** |

> 「这表明**冻结的、仅打分的点云模型，可以通过部署后规范化单独恢复旋转引起的分布漂移**。」

---

## 局限性（论文附录 C 明确）

1. **只针对旋转引起的漂移**；**不处理噪声或密度破坏**（在置信度与任务性能失配时）。
2. **分类的恢复率低于分割** —— 因为**单个 softmax 提供的优化信号比稠密的逐点置信度弱**。
3. **方法假设**：
   - 输入变换是**低维**的
   - 可访问**概率或 logits**
   - **适中的前向查询预算**
4. **评估仅覆盖合成的位姿漂移** —— **真实传感器倾斜与户外 LiDAR 数据上的验证留待未来工作**。

### 未来工作

- 把变换族从旋转扩展到**更丰富的参数化（如仿射变换）**
- **自动推断变换族**，而非先验指定
- 把前向查询的位姿恢复与**外部生成式/基础模型先验**结合 → 处理**无法由纯置信度目标解决的分布漂移**

---

## 相关工作

- [[Test-Time-Adaptation]]
- [[Rotation-Equivariance-Point-Cloud]]
- [[CMA-ES-Evolution-Strategy]]
- [[PCA-Canonicalization]]
- [[Point-Cloud-Part-Segmentation]]
- [[2610-34271-TLP-Single-Parameter-Point-Cloud-Registration]]

---

## 实现建议

- **实现难度**：**中**。核心是 CMA-ES + 置信度代理 + 恒等先验，**无导数**，实现直接。
- **数值稳定性**：**中**。风险点：
  - **置信度与精度的失配** → 论文明确指出这是失败主因，恒等先验是主要缓解手段
  - **多模态目标** → 必须全局搜索（这正是条件 ③）
  - 分类任务信号弱（softmax 单点）
- **依赖项**：
  - 优化：**cma**（Python CMA-ES 库）或自写；**SPSA**（自写简单）
  - 点云模型：**PointNet++** / **PointNeXt**（PyTorch）
  - 数据集：**ShapeNetPart** / **S3DIS** / **ModelNet40** / **PointCloud-C**
  - 硬件：单张 RTX A6000 即可
- **适用场景**：
  - ✅ **第三方点云模型的黑盒部署**（拿不到权重/梯度时的救命手段）
  - ✅ **输入位姿不可控**的场景（传感器安装偏差、用户手动摆放）
  - ✅ **单样本 / 少样本的姿态规范化**
  - ✅ 快速验证「我的模型是否缺训练增强」
  - ❌ 高频实时调用（300 次前向查询**开销不小**）→ 需先验初始化
  - ❌ 噪声/密度破坏（不适用）
  - ❌ 真实户外 LiDAR（未验证）
- **性能预期**：300 次前向查询/输入（完整 $SO(3)$）；方位角仅需 16 + 15 次。

---

## 备注

> **论文最有价值的不是方法，是那三个「必要条件」。**
>
> 这三条其实是一份**诊断清单**：
> 1. 训练时有没有覆盖这种位姿？（→ 补数据增强，最直接）
> 2. 模型的置信度可不可信？（→ 置信度校准，论文附录 A.3 专门有 "Surrogate Reliability" 一节）
> 3. 目标函数是不是多模态的？（→ 别用局部搜索）
>
> **按这个清单检查，往往能发现「模型其实没那么糟，只是输入没对齐」。** 这对我们判断「某个下游几何模型效果差」的归因很有帮助 —— 先排除位姿问题，再谈模型问题。
>
> 与今日另一篇 [[2610-33943-Extrinsic-Curvature-Estimation-Projected-Rays]] 有个共同点：**两者都用「最近点/前向查询」这种最朴素的原语，而不是设计更复杂的模型。** 「用最小的接口撬动最大的收益」——这个取向值得注意。
