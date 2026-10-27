---
type: paper
created: 2026-10-27
updated: 2026-10-27
tags: [paper, geometry-processing, cs.CV, cs.RO, point-cloud-registration, robust-estimation, truncated-Lp, RANSAC, ICP-refinement, IRLS, GPU-parallel, FPFH, FCGF]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.34271
arxiv_id: 2610.34271v1
---

# Robust Single-Parameter Point Cloud Registration using Truncated Lp Functions (TLP)

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Robust Single-Parameter Point Cloud Registration using Truncated Lp Functions |
| **作者** | Seong Hun Lee, Patrick Vandewalle, Javier Civera |
| **发表** | arXiv 2026-10-25 (v1)，cs.CV / cs.RO |
| **链接** | [原文](https://arxiv.org/abs/2610.34271) · [HTML](https://arxiv.org/html/2610.34271v1) |
| **DOI** | [10.48550/arXiv.2610.34271](https://doi.org/10.48550/arXiv.2610.34271) |
| **代码** | **[github.com/sunghoon031/TLP](https://github.com/sunghoon031/TLP)**（作者公开） |
| **基线仓库** | TEASER++（MIT-SPARK）、TEAR-release / HERE-release（tyhuang98）、PCR-99-python（sunghoon031）、TCF（ShiPC-AI）、SC2-PCR（ZhiChen902）、3d-registration-with-maximal-cliques（zhangxy0517） |
| **关键词** | Point cloud registration, Robust estimation, RANSAC, Truncated Lp |

---

## 核心贡献

> **点云配准的鲁棒性问题，被归约成「一个距离阈值 τ」这一个可调参数 —— 其余全部超参固定跨数据集。** 关键手法是**把 $L_p$ 范数的阶数 $p$ 当作「角色开关」**：不同阶段用不同的 $p$。

1. **统一的截断 $L_p$ 代价函数**：一个参数化的代价 $\rho(r;p,\delta)$，通过取 $p\in\{0,\infty,2,0.4\}$ 在**打分 / 选假设 / 精化**三个阶段分别扮演不同角色。
2. **单参数实用主义**：所有阈值设定**跨数据集固定**，只有距离阈值 $\tau$ 需要按数据集-描述子组合调一次（单参数方法之间对比的优势）。
3. **GPU 批处理假设评估**：成千上百个假设并行打分，平均**不到 1 秒**完成配准。
4. **实证**：在 **12 个数据集-描述子-cutoff 组合中的 10 个**取得最高 rotation-based mAA，且在**全部 4 种组合中都位列最快三方法之一**。

---

## 技术方案

### 核心公式：归一化截断平滑 $L_p$ 代价

对残差 $r \geq 0$、截断阈值 $\delta > 0$、平滑参数 $\epsilon > 0$（本文固定 $\epsilon = 10^{-12}$，记号中省略）：

```math
ρ(r; p, δ) = min{ ((r²+ε)^{p/2} - ε^{p/2}) / ((δ²+ε)^{p/2} - ε^{p/2}), 1 }
```

**性质**：
- 关于 $r$ **单调不减**；$r=0$ 时为 0；$r \geq \delta$ 时**饱和为 1**（这就是"截断"）
- 未截断部分是残差幅值 $p$ 次幂的**平滑、移位、缩放**版本
- **端点极限**（论文附录给出证明）：

```math
ρ(r; 0, δ) = lim_{p→0⁺} ρ(r;p,δ) = min{ log(1 + r²/ε) / log(1 + δ²/ε), 1 }
ρ(r; ∞, δ) = lim_{p→∞} ρ(r;p,δ) = { 0,  r < δ ; 1,  r ≥ δ }
```

> 📌 **重要细节**：$p\to 0^+$ 的极限在固定 $\epsilon>0$ 下是**对数型**，**而非「非零残差计数」**。只有当 $\epsilon \to 0^+$ 且 $p>0$ 有限时才是 $\min\{(r/\delta)^p, 1\}$。

**互补打分**：$S(r;p,\delta) = 1 - \rho(r;p,\delta)$，取值 $[0,1]$，**与点云尺度无关**（→ 同一阈值可跨数据集使用）。
**关键恒等式**：$\sum_i S(r_i;\infty,\delta) = |\{i : r_i < \delta\}|$ —— 即 $p\to\infty$ 时**最大化总分等价于最大化内点数量**（即 RANSAC 式的共识计数，但连续化）。

### 算法流程（论文 Alg. 1）

```
1. 用截断 L₃ 兼容性 + 支撑聚合（support aggregation）对对应点排序
        ↓
2. 确定性三点假设生成（deterministic three-point hypothesis generation）
        ↓  ← 排序结果指导选点，非随机
3. GPU 批评估，选共识度（p → ∞）最大的两个假设
        ↓
4. 每个假设：L₂ 精化 → 平滑 L₀⁺ 精化（IRLS，迭代重加权最小二乘）
        ← 每次模型拟合后更新内点集
        ↓
5. 批处理持续到停止准则满足
        ↓
6. 最佳模型做最终 L₀.₄ 精化
```

**阶段 1 — 对应点打分**：距离不一致度

```math
d_ij = | ||a_i − a_j||₂ − ||b_i − b_j||₂ |
```

对 $q \in \{0.1, 0.2, 0.3, 0.4\}$ 构造兼容性矩阵（**$L_3$ 型**）：

```math
C^(q)_ij = max{ 1 − (d_ij / σ_q)³, 0 },   σ_q = 1.2 · q · τ
```

支撑聚合：

```math
w^(q) = C^(q) · 1        (支撑度)
s^(q) = C^(q) · w^(q)    (聚合分数)
```

按 $s^{(q)}$ 排序 → 得到 **4 个置换** $\pi_q$（对应 4 个不同的 $q$ 值）。

**$p$ 的「角色分配」表**：

| 阶段 | $p$ | 作用 |
|------|-----|------|
| 对应点打分 | **3** | 连续兼容性分数（非硬阈值） |
| 假设选择 | **∞** | 共识 = 内点计数 |
| 中间精化 | **2** | 最小二乘（非鲁棒） |
| 中间精化 | **0⁺** | 平滑 L₀ —— IRLS 鲁棒精化 |
| 最终精化 | **0.4** | 折中 |

**唯一可调参数**：距离阈值 $\tau$（另有 $\tau$ 的 1.2 缩放因子选项）。

---

## 实验结论

### 数据集与设置

- **数据集**：**3DMatch**（1,623 对点云）、**KITTI**（555 对点云）
- **描述子**：**FPFH**、**FCGF**
- **3D–3D 对应**：使用与 SC²-PCR 相同的处理管线
- **硬件**：Intel Core i7-7700HQ CPU，NVIDIA Quadro M1200 GPU，16 GB RAM
- **评价指标**：rotation-based **mAA**（mean Average Accuracy），cutoff 为 5°/10°/15°
  > ⚠️ **指标局限（作者自述）**：rotation-based mAA **不测平移精度** —— 高分不保证对齐正确；但实践中准确旋转与准确平移强相关，故作为**尺度无关代理**。

### 配准精度（mAA，越高越好）

**3DMatch + FCGF**（节选）：
| cutoff | SC²-PCR | TCF | **TLP** |
|--------|---------|-----|--------|
| 5° | — | 0.9867 | **0.9870** |
| 10° | 0.7281 | 0.9900 | **0.9923** |
| 15° | 0.7213 | 0.9933 | **0.9948** |

**KITTI + FCGF**：
| cutoff | SC²-PCR | TCF | **TLP** |
|--------|---------|-----|--------|
| 5° | 0.9744 | 0.9885 | **0.9924** |
| 10° | 0.9791 | 0.9924 | **0.9928** |
| 15° | 0.9810 | 0.9938 | **0.9940** |

**KITTI + FPFH**：TLP 在 5°/10°/15° 分别为 0.9899 / 0.9950 / 0.9966，均为最优。

> **总评**：在 12 个组合中 **10 个取得最高 mAA**；一致优于所有**单参数**基线；仅在 3DMatch+FPFH 的 10°/15° 输给多参数方法 **SC²-PCR**。

### 运行时对比

| 方法 | 3DMatch+FPFH | 3DMatch+FCGF | KITTI+FPFH | KITTI+FCGF |
|------|--------------|--------------|------------|------------|
| SC²-PCR | 0.24 s | 0.24 s | 0.71 s | 0.73 s |
| MAC | 内存溢出 | 11.46 s | 内存溢出 | 22.46 s |
| TEASER++ | 1.45 s | 有时 >2 h | 1.46 s | 常 >0.5 h |
| TEAR HERE (带缩放) | 1.64 s | 0.99 s | 3.53 s | 0.29 s |
| TEAR HERE (无缩放) | 1.87 s | 1.06 s | 2.02 s | 1.19 s |
| PCR-99 | 2.21 s | 1.49 s | 4.80 s | 3.21 s |
| TCF | 0.68 s | 0.22 s | 0.19 s | 0.18 s |
| **TLP** | **0.36 s** | **0.20 s** | **0.65 s** | **0.40 s** |

> TLP 在四种组合中分别排名第 **三、一、三、三**，**始终位列最快三方法**。

### 消融（3DMatch + FPFH）

| 变体 | mAA@5° | mAA@10° | mAA@15° |
|------|---------|---------|---------|
| **TLP（默认）** | **0.5879** | **0.7002** | **0.7456** |
| 去掉 $\tau$ 的 1.2 因子 | 0.5813 | 0.6958 | 0.7420 |
| 去掉 $q=0.1$ | 0.5875 | 0.6962 | 0.7405 |
| 去掉 $q=0.2$ | 0.5845 | 0.6952 | 0.7397 |
| 去掉 $q=0.3$ | 0.5864 | 0.6988 | 0.7441 |
| 去掉 $q=0.4$ | 0.5850 | 0.6966 | 0.7413 |
| 去掉 $L_2$ 精化 | 0.5809 | 0.6944 | 0.7401 |
| 去掉 $L_{0^+}$ 精化 | 0.5774 | 0.6861 | 0.7299 |
| 去掉 $L_{0.4}$ 精化 | 0.5791 | 0.6948 | 0.7416 |

> 默认配置在 12 个设置中 **9 个**达到最高或并列最高。**去掉 $L_{0^+}$ 精化损失最大**（mAA@15° 掉 0.016）。

---

## 局限性

1. **rotation-based mAA 不测平移精度**（作者明确指出）。
2. **MAC 内存溢出、TEASER++ 在 FCGF 上超时** —— 部分基线结果不可得，比较不完全。
3. **仍需按数据集-描述子组合调 $\tau$** —— 虽只有一个参数，但非零。
4. 单参数方法在 3DMatch+FPFH 的高 cutoff 下仍**不及多参数的 SC²-PCR**。

---

## 相关工作

- [[Robust-Registration-RANSAC-TEASER]]（TEASER++ / MAC / SC²-PCR / TEAR HERE）
- [[Point-Cloud-Registration-Hypothesis-Generation]]
- [[IRLS-Robust-Estimation]]
- [[FPFH-FCFG-Descriptors]]
- [[2610-34850-CanDO-Black-Box-Point-Cloud-Pose-Shift]]

---

## 实现建议

- **实现难度**：**低-中**。核心数学（截断 $L_p$ 代价 + 端点极限）**完全可自己写，约几十行**；难的是假设生成策略与批评估的工程实现。
- **数值稳定性**：**高**。$\epsilon = 10^{-12}$ 的平滑避免了 $p=0$ 与 $p=\infty$ 处的数值奇点；截断保证了**大残差不产生梯度爆炸** —— 这是比裸 $L_p$ 好的关键。
- **依赖项**：
  - 最近邻 / 对应提取：**Open3D**（FPFH、KDTree）、**MinkowskiEngine**
  - 线性代数：**Eigen**（6-DoF 刚体变换求解）
  - IRLS：**自写**（加权最小二乘 + 迭代重加权）
  - GPU 并行：PyTorch / CUDA（论文用 Python + GPU）
- **适用场景**：
  - ✅ **工程落地的点云配准模块** —— 单参数意味着**几乎不需要调参**，跨场景迁移性强
  - ✅ 高离群点率的真实 3D 特征匹配（3DMatch / KITTI 级别）
  - ✅ 已有 FPFH/FCGF 对应、只需鲁棒求解的场景
  - ❌ 需要亚度级精度或需要平移精度保证的场景（指标本身不覆盖）
  - ❌ 大规模（10万+ 对应）—— 假设数量需 GPU 批处理支撑
- **性能预期**：Quadro M1200（较老的移动 GPU）上 3DMatch 约 0.36 s；现代 GPU 应更快。
- **移植建议**：**强烈建议直接实现**。其 $L_p$ 阶数分角色分配的设计思路，可直接套用到我们自己的鲁棒几何拟合问题（如 RANSAC 替代方案、鲁棒 ICP、鲁棒面拟合）。
