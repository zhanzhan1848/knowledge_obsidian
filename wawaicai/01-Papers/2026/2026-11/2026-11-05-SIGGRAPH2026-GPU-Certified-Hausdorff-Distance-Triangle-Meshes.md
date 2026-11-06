---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, Hausdorff距离, GPU, 网格比较, 分支定界, 认证算法, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811287
---

# GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | GPU-accelerated Certified Hausdorff Distance Between Triangle Meshes |
| **作者** | Haopeng Fan, Min Tang (浙大), Leonardo Sacht (UFSC), Qiang Zou (浙大 CAD&CG 国家重点实验室), Ruofeng Tong, Peng Du (浙大) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-12 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811287) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_169&sess=sess122) |
| **DOI** | 10.1145/3811287 |
| **会话** | Monday, 20 July 2026 2:20pm PDT, Room 403 B · Keywords: Geometry / Hardware / Modeling / Registration |

---

## 核心贡献

> 用**并行 wavefront 流水线**替代递归的分支定界（branch-and-bound），实现 GPU 加速的**有向 Hausdorff 距离**认证算法：**毫秒级**、容差可控，在**百万三角形**模型上可用；精度紧贴 CPU SOTA。

1. **并行 wavefront 流水线**：把递归 branch-and-bound 改造为 GPU 友好的并行推进
2. **有向 Hausdorff 距离**（directed Hausdorff distance）：$h(A,B) = \max_{a \in A} \min_{b \in B} d(a,b)$
3. **认证（certified）**：给出**误差上界**保证，不是近似采样
4. **毫秒级 + 容差可控**：百万三角形模型上的交互式几何查询
5. **精度接近 CPU SOTA**：在大规模困难基准数据集上

---

## 技术方案

### 核心思想

```
CPU 传统（libigl exact_HD / branch-and-bound）：
   递归二分 + 优先级队列 → 串行瓶颈
        ↓
GPU 改造：
   并行 wavefront：所有候选三角形同时推进到下一层
   用容差 τ 剪枝，超出 τ 的分支直接丢弃
        ↓
   有向 HD + 认证误差界
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **并行 wavefront** | 消除递归串行瓶颈，GPU 友好的层次推进 |
| **分支定界的 GPU 化** | 保留认证性（error bound），去掉递归 |
| **容差剪枝** | 用户指定 τ，超出即剪 |
| **有向 vs 双向** | 本文算有向距离（单向），双向可两次调用取 max |
| **认证误差界** | 结果带上下界，非启发式 |

---

## 算法复杂度

- **时间复杂度**：GPU 并行下 $O(n \log n)$ 级别（波前层数 × 每层并行度）；相比 CPU branch-and-bound 有数量级加速
- **空间复杂度**：$O(n)$（层次结构）
- **实测**：百万三角形 → **毫秒级**

---

## 实现难度

- **算法复杂度**：**中高** — 需重新设计为 GPU 并行形态，同时保持认证性
- **数值稳定性**：**高** — 认证算法 inherently 保守（宁可慢不越界）
- **依赖项**：CUDA / Thrust；层次包围体（AABB）加速结构；对比参考 libigl `exact_HD`
- **硬件**：需要 CUDA GPU

---

## 实验结论

- 百万三角形模型上**毫秒级**结果
- **容差可控**（tolerance-controlled）
- 在大规模挑战性基准集上**紧贴 CPU SOTA 精度**
- 使需要**保证误差控制**的几何处理应用成为可能

---

## 局限性

- 需要 GPU
- 认证性 ⟹ 无法做到完全精确（但误差可界定）
- 只算有向距离；无向需两次调用

---

## 可行性评估

✅ **推荐实现（可直接对接现有工具链）**

### 推荐理由
1. **可度量替换**：libigl 的 `exact_HD` 是 CPU 串行瓶颈，本文的 GPU 版本是 drop-in 加速
2. **应用面广**：网格比较、简化误差度量、remeshing 质量评估、几何 QA
3. **认证性**在生产环境（不能接受"大概对"）特别有价值

### 实现建议
- **优先级**：**中高**
- **实现路径**：
  1. 基线：libigl `exact_HD`（参考实现），在百万面模型上测时间
  2. 实现层次 AABB + 并行 wavefront（CUDA kernel 按层推进）
  3. 验证：与 `exact_HD` 对拍，误差在容差内
- **配套**：本轮同 session 的 [[2026-11-05-SIGGRAPH2026-PQ-Free-HD-Priority-Queue-Free-Hausdorff-GPU]] 是**同题异解**（消除优先队列而非消除递归），两篇**并列同一 session**（2:20pm / 2:30pm）—— ⟹ **强烈建议对照阅读**，可择优或融合

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-PQ-Free-HD-Priority-Queue-Free-Hausdorff-GPU]] — **同 session 并列**：同题异解（消优先队列）
- [[2026-11-05-SIGGRAPH2026-Manifold-kNN-Manifold-Point-Clouds]] — 同 session 相邻
- [[2026-11-05-SIGGRAPH2026-Locality-Aware-AD-GPU-Mesh-Computations]] — 同 session 相邻
- [[Hausdorff Distance]]
- [[libigl]]
- [[Branch and Bound]]

---

**推荐度**：⭐⭐⭐⭐
