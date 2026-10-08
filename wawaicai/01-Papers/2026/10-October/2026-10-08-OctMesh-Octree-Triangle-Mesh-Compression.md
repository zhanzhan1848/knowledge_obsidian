---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, geometry, mesh-compression, octree, lossless-coding, point-cloud, triangle-mesh, mpeg-vdmc]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.04281
arxiv_id: 2610.04281v1
priority: medium
---

# OctMesh: A Unified Octree-Hierarchical Framework for Lossless Triangle Mesh Compression

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | OctMesh: A Unified Octree-Hierarchical Framework for Lossless Triangle Mesh Compression |
| **作者** | Shiyu Feng, Xihua Sheng, Lingyu Zhu, Chunyang Fu, Shiqi Wang |
| **发表** | arXiv 2026-10-03 (cs.CV, cs.GR) |
| **链接** | [arXiv:2610.04281](https://arxiv.org/abs/2610.04281) |
| **代码** | 未公开 |
| **分类** | cs.CV (primary), cs.GR |

---

## 核心贡献

> 把几何与连通性统一在同一棵八叉树上做**无损压缩**，解决了网格连通性难以挂载到八叉树层级预测先验的难题，比 V-Mesh 平均低 12.8% 比特/面。

1. **统一八叉树表示**：在单棵八叉树上同时编码**顶点坐标**与**边连通性**，避免分开两套编码带来的不一致。
2. **4 类小尺寸预测任务**：八叉树 pooling 后，父节点子边按"父节点子节点数 + 端点是否共父"分成 4 类，每类预测任务小且形状固定。
3. **渐进式细化**：同一层级表示支持 9 个层级的顶点+边渐进式细化。
4. **MPEG V-DMC 验证**：在 8 个测试序列 256 帧上，无损恢复最细层顶点坐标 + 边 + 无向面集，平均 **7.033 bits/face**，比 V-Mesh 低 12.8%。

---

## 技术方案

### 核心思想

八叉树已被证明对**点云几何**编码高效（voxel 八占据决策），但对**网格连通性**编码困难——一个父边可以有多种子连接（与 voxel 的固定 8 占据决策不同）。

**关键观察**：八叉树 pooling 之后父节点要么有 1 个子节点，要么有 2–8 个子节点。结合"子边端点所属父节点类型"与"端点是否共父"，子边被自然分组为 4 类，每类对应一个**固定形状的预测任务**。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Shared octree hierarchy** | 同一棵树编码几何与连通性，避免分裂 |
| **4-category edge grouping** | 按 (parent child count, share-parent?) 分组，4 类预测任务 |
| **Inherited vs predicted** | 父图能唯一决定的连接零开销继承；其余三个神经预测器估计概率 |
| **Within-parent context** | 二值化预测提供预测"跨父连接"的上下文 |
| **Graph-aware parent feature extractor** | 融合局部几何 + 父连通性 + 全局形状 |
| **Coarse-to-fine weight sharing** | 粗层独立权重、细层共享权重 |

---

## 公式

四类子边预测任务定义（按父节点数 + 端点关系）：

$$
\mathrm{Group}(e_i) = f\bigl(\#\mathrm{children}(\mathrm{parent}(e_i)),\ \mathrm{shareParent}(e_i)\bigr) \in \{1,2,3,4\}
$$

算术编码下每面比特数：

$$
\mathrm{BPF} = \frac{1}{|F|}\left[ H(V) + H(E) + H(F) \right]
$$

其中 $H(\cdot)$ 是各部分的熵，由预测器概率 $p_\theta(\cdot)$ 决定。

---

## 实验结论

- **数据集**：MPEG V-DMC 测试序列 8 个 × 256 帧
- **基线**：V-Mesh (MPEG V-DMC 参考)
- **结果**：
  - 平均 **7.033 bits/face**（无损）；
  - 比 V-Mesh 低 **12.8%**；
  - 支持 9 级渐进细化（顶点 + 边）；
  - 残差边 + 最细层 face-selection payload 完成完整重建。

---

## 局限性

- 仅在 MPEG V-DMC 测试序列上验证，工业场景的复杂模型未覆盖；
- 神经网络预测器需 GPU 推理，移动 / 嵌入式部署成本未评估；
- 编码时间是单次解码的数倍（编码-解码不对称常见）。

---

## 相关工作

- **V-Mesh** (Mammou et al., MPEG V-DMC) — 主流视频网格编码方案；
- **Draco** (Google) — 通用网格压缩；
- **OctAttention** (Fu et al., 2022) — 点云八叉树注意力编码；
- **MPEG V-DMC** — 视频动态网格编码标准；
- [[Lossless Mesh Compression]]

---

## 实现建议

- **实现难度**：中-高（需要八叉树 + 神经算术编码 + 自定义 CUDA 内核）
- **预期性能**：编码 100k 面网格 < 5s / 解码 < 0.5s（GPU）
- **适用场景**：
  - 大规模网格资产传输（游戏 / VR / 数字孪生）；
  - 渐进式网格流式下载；
  - 网格归档压缩；
- **推荐栈**：
  - 神经网络框架：**PyTorch** / **TensorRT** 部署；
  - 算术编码：**torchac** / **range-coder**；
  - 八叉树数据结构：**Open3D** / 自实现；
  - 参考代码：可借鉴 **OctAttention** 的八叉树注意力实现。

---

## 推荐度

✅ **推荐关注**——对需要网格流式 / 渐进式加载的产品（Web 3D、VR、数字孪生）有实际价值。
