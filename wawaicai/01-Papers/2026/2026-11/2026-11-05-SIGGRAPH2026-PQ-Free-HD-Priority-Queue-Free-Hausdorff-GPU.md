---
type: paper
created: 2026-11-05
updated: 2026-11-05
tags: [paper, 几何, Hausdorff距离, GPU, 优先队列, 误差有界, 高吞吐, SIGGRAPH2026, ACM-TOG]
status: processed
domain: geometry
agent: wawaicai
source: https://doi.org/10.1145/3811324
---

# PQ-Free HD: Priority-Queue-Free Hausdorff Distance for Triangle Meshes on GPU

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | PQ-Free HD: Priority-Queue-Free Hausdorff Distance for Triangle Meshes on GPU |
| **作者** | Zhihao Hu (中科大), Renjie Chen (中科大) |
| **发表** | ACM Transactions on Graphics, Vol. 45, No. 4 (SIGGRAPH 2026), pp. 1-14 |
| **在线发表** | 2026-07-03 |
| **链接** | [ACM DL](https://doi.org/10.1145/3811324) · [日程页](https://s2026.conference-schedule.org/?post_type=page&p=15&id=papers_586&sess=sess122) |
| **DOI** | 10.1145/3811324 |
| **会话** | Monday, 20 July 2026 2:30pm PDT, Room 403 B · Keywords: Geometry Modeling / Registration |

---

## 核心贡献

> 消除传统 branch-and-bound 算法中的**串行瓶颈**（优先队列），实现 GPU 上的**误差有界（error-bounded）** Hausdorff 距离计算，高吞吐，且**保持保证误差控制**的能力。

1. **无优先队列（priority-queue-free）**：直接消除 branch-and-bound 算法的串行瓶颈
2. **误差有界**：不是启发式近似，而是带**保证误差界**
3. **高吞吐**：面向大批量几何比较任务
4. **解锁需要保证误差控制的几何处理应用** —— 明确的应用价值主张

---

## 技术方案

### 核心思想

```
CPU branch-and-bound (libigl exact_HD)：
   优先级队列驱动的递归展开 → 串行，队列操作是瓶颈
        ↓
本文（PQ-Free）：
   并行候选展开 + 容差剪枝，无优先队列调度
        ↓
   误差有界 + 高吞吐
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **Priority-queue elimination** | 移除堆/优先队列这一串行调度点 ⟹ 可完全并行 |
| **误差有界（error-bounded）** | 保证结果落在真实值的区间内 |
| **并行候选展开** | 所有候选三角形同时推进 |
| **高吞吐设计** | 面向"大量小模型比较"这类批处理场景 |

---

## 算法复杂度

- **时间复杂度**：并行化后接近 $O(n \log n)$；移除优先队列消除了 $O(n \log n)$ 的堆操作常数
- **空间复杂度**：$O(n)$
- **实测**：显著快于 CPU branch-and-bound

---

## 实现难度

- **算法复杂度**：**中高** — 移除优先队列需要重新组织搜索策略以保持误差界
- **数值稳定性**：**高** — 误差界机制保证结果可信
- **依赖项**：CUDA；层次 AABB 结构；参考实现 libigl `exact_HD`
- **硬件**：需 GPU

---

## 实验结论

- 高吞吐性能
- 保持**保证的误差控制**
- 使"需要保证误差控制的几何处理应用"成为可能

---

## 局限性

- 需 GPU
- 精度受容差设定影响（但有界）
- 未明确是否支持无向（双向）距离

---

## 可行性评估

✅ **推荐实现（与 GPU-Certified-HD 对照择优）**

### 推荐理由
1. **同 session 并列**（2:20 / 2:30pm，与 GPU-Certified-HD 相邻）—— 两条独立技术路线解决同一问题，**对照阅读价值极高**
2. **移除优先队列**是干净的 GPU 化思路，工程上比"并行化递归"更直接
3. **误差有界**保证生产可用

### 实现建议
- **优先级**：**中高**
- **两篇对比矩阵**：

| 维度 | GPU-Certified-HD | PQ-Free HD |
|------|-----------------|-----------|
| 改造对象 | 递归 branch-and-bound → wavefront | 优先队列调度 → 无队列并行 |
| 组织方式 | 波前分层推进 | 无堆的并行候选展开 |
| 强调点 | 毫秒级、认证、紧贴 CPU 精度 | 高吞吐、误差有界 |

- **实施路径**：两篇都有理论支撑但未开源（未检索到公开代码）⟹ **建议先实现 PQ-Free 路线**（结构更简单），用 libigl `exact_HD` 对拍验证误差界

---

## 相关工作

- [[2026-11-05-SIGGRAPH2026-GPU-Certified-Hausdorff-Distance-Triangle-Meshes]] — **同 session 并列**：波前流水线路线
- [[2026-11-05-SIGGRAPH2026-Manifold-kNN-Manifold-Point-Clouds]] — 同 session 相邻
- [[2026-11-05-SIGGRAPH2026-Locality-Aware-AD-GPU-Mesh-Computations]] — 同 session 相邻
- [[Hausdorff Distance]]
- [[libigl]]

---

**推荐度**：⭐⭐⭐⭐
