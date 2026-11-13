---
type: paper
created: 2026-11-13
updated: 2026-11-13
tags: [paper, fluidic-shaping, constant-mean-curvature, mesh-processing, fabrication, cs.GR]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://arxiv.org/abs/2611.00227
---

# Piecewise CMC Segmentation for Fluidic Shaping

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Piecewise CMC Segmentation for Fluidic Shaping |
| **作者** | Abhinit Sati 等 |
| **发表** | arXiv 2026-10-30（43.3 MB），cs.GR |
| **链接** | [原文](https://arxiv.org/abs/2611.00227) |
| **DOI** | [10.48550/arXiv.2611.00227](https://doi.org/10.48550/arXiv.2611.00227) |
| **代码** | 未公开 |

---

## 核心贡献

> 流体塑形（fluidic shaping）的界面张力使成型表面天然是**常平均曲率（Constant Mean Curvature, CMC）曲面**；本文提出网格分割算法，把目标网格划分为分段 CMC 曲面，使每段在用户指定容差内都是目标 CMC 的近似，且每段都是**物理上稳定、可可靠制造**的 CMC 面。

1. **分段 CMC 分割算法**：网格被划分为 piecewise CMC surface，每段满足容差约束。
2. **分割过程中内嵌 CMC 演化过程**（in the loop），以找到物理稳定、可制造的 CMC 曲面，而非仅几何近似。
3. **骨架线框提取 + 聚合物注入固化**：从分割缝中提取线框支架，注入聚合物流体固化。
4. **无需后处理**：固化后结构成为单一连续各向同性体，内部表面达到**纳米级粗糙度**，省去传统方法昂贵的后处理与平滑。

---

## 技术方案

### 核心思想

**流体塑形（Fluidic Shaping）** 是一种增材制造工艺：用聚合物流体（polymer fluid）在等密度浸没流体（immersion fluid）中成型 3D 结构。关键物理事实是：

- 聚合物与浸没流体之间的**界面张力**使成型表面趋向 **CMC 曲面**；
- CMC 曲面即 $H = (k_1 + k_2)/2$ 为常量的曲面——球面是最简单的例子。

因此，若要把一个任意 3D 目标网格"物理地"造出来，就必须先把它**分解为可制造的分段 CMC 曲面**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **分段 CMC 分割** | 把网格分割为 piecewise CMC surface，每段是目标 CMC 的容差内近似 |
| **CMC 演化内嵌于分割循环** | 在分割过程中同步运行 CMC 演化过程，确保各段是**物理稳定**的 CMC 面（而非仅几何拟合） |
| **缝线框支架提取** | 从分割缝中提取 wireframe scaffold，作为成型骨架 |
| **聚合物注入固化** | 向线框注入聚合物流体并固化；结构成为单一连续各向同性体 |
| **纳米级内部粗糙度** | 由于是界面张力自然成型，内部表面达到纳米级粗糙度，省去后处理/平滑 |

---

## 公式

```math
% CMC 曲面条件：平均曲率恒定
H=\frac{k_1+k_2}{2}=\text{const}

% 最小曲面（常平均曲率的特例）
H=0 \;\Rightarrow\; \text{minimal surface (soap film)}

% 分割目标：每段 i 的 CMC 近似误差在容差 τ 内
\|H_i - H_{\text{target}}\|_{\infty} \le \tau
```

### 代码片段

```python
# CMC 演化 + 分割（概念伪代码）
def piecewise_cmc_segmentation(mesh, tolerance=1e-3):
    seams = []
    regions = []
    while not converged(mesh, tolerance):
        # 1) 在当前分割边界上运行 CMC 演化，求物理稳定 CMC 面
        cmc_surface = evolve_cmc(mesh, boundary=current_boundary)
        # 2) 检查 CMC 残差是否满足容差
        if max_cmc_residual(cmc_surface) <= tolerance:
            regions.append(cmc_surface)
            seams.append(current_boundary)
            current_boundary = pick_next_seam(mesh)   # 选下一条分割缝
        else:
            current_boundary = refine_seam(mesh, cmc_surface)
    return regions, seams

# 线框支架提取
def extract_scaffold(seams):
    return [seam.as_wireframe() for seam in seams]
```

---

## 实验结论

- **数据集**: 3D 目标几何（用于流体塑形制造的模型）
- **基线**: 传统 SOTA 流体塑形方法（依赖后处理/平滑达到相近表面质量）
- **结果**:
  - 每段为 CMC 的容差内近似，且**均为物理稳定、可可靠制造**的 CMC 面
  - 固化后为**单一连续各向同性体**
  - 内部表面达到**纳米级粗糙度**
  - **省去**传统方法所需的昂贵后处理与平滑步骤

---

## 局限性

- 制造导向，非渲染导向；对实时渲染无直接贡献
- 依赖真实/等密度浸没流体环境（受限于实验室条件与材料选择）
- CMC 演化过程在分割循环内运行，**计算成本高**（43 MB 论文体量暗示模型/数据量大）
- 只保证分段 CMC 近似，全局形状仍受目标网格约束
- 未公开代码

---

## 相关工作

- [[2026-11-13-Luo-Zheng-Huo-PIM-Physical-Intuition-Model]]
- [[2026-11-11-Shu-Huang-Chen-Same-Physics-Different-Gradients]]
- [[Constant-Mean-Curvature]]
- [[Free-Surface]]
- [[Isosurface]]

---

## 实现建议

- **实现难度**: 高（CMC 演化 + 拓扑自适应的分割 + 线框提取）
- **预期性能**: 离线计算（制造级）
- **适用场景**: 自由曲面（雕塑感、工业设计）**实体成型**的工艺规划
- **对流体渲染的启示**:
  - **CMC/最小曲面是流体渲染的经典造型语言**：水面张力边缘、液体与容器接触线、泡沫/薄膜、飞溅薄片都接近最小曲面
  - CMC 演化算法可迁移为**自由表面流体渲染**中生成"物理可信"的液体边界形状（如水膜、拉伸水片），比纯噪声位移更可控
  - "**分割成物理稳定片段**"的思路对应到渲染：把大尺度流体形状分解为可解析、可控的 CMC 片段组合，便于美术调控
  - 与 [[2026-11-07-Ma-High-Order-Structure-Preserving-ALE-SAV-Moving-Contact-Line]] 的移动接触线主题相呼应——CMC 正是接触线处的局部平衡解
