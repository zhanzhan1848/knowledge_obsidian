---
type: paper
created: 2026-10-08
updated: 2026-10-08
tags: [paper, geometry, brep, cad, boundary-representation, image-to-3d, deep-learning]
status: processed
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.04092
arxiv_id: 2610.04092v1
priority: high
---

# UniBRep: Learning Unified Geometry and Topology for Image-conditioned B-Rep Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | UniBRep: Learning Unified Geometry and Topology for Image-conditioned B-Rep Generation |
| **作者** | Haiyang Ying, Allen Tu, Jiaye Wu, Tom Goldstein, Matthias Zwicker (Univ. of Maryland) |
| **发表** | arXiv 2026-10-02 (cs.CV, cs.GR) |
| **链接** | [arXiv:2610.04092](https://arxiv.org/abs/2610.04092) |
| **代码** | 未公开 |
| **分类** | cs.CV (primary), cs.GR |

---

## 核心贡献

> 用统一的"特征网格"中间表示同时编码几何与拓扑，再用 CAD 内核拟合出 B-Rep，从单张图像生成**有效拓扑且可扩展面数**的边界表示。

1. **特征网格中间表示**：在网格表面基础上附加空间对齐的学习特征，作为 face-separation 提示来恢复拓扑。
2. **双解码器**：分别解码几何与面分割特征，几何 + 特征双引导的 B-Rep 构造流水线。
3. **拓扑可扩展**：摆脱了预设架构对面数的限制，面数随形状复杂度自然增长，可处理远超 DeepCAD 30-face 标准的高复杂度形状。
4. **SOTA 指标**：DeepCAD 上有效 B-Rep 占比 80.49%；face Chamfer 距离从 0.1096 降至 0.0345（相对 CADDreamer 提升 3×）。

---

## 技术方案

### 核心思想

从图像到 B-Rep 的难点在于"几何 + 拓扑"联合恢复：
- **几何**：曲面参数、位置、形状；
- **拓扑**：面、边、点的连接关系，环 (loop) 信息。

直接预测 B-Rep token 序列（如 CADDreamer）受限于离散 token 化，难以处理复杂拓扑。

**核心方案**：先用一个图像到 3D 的预训练模型生成**特征网格**——该网格是显式三角网格表面（提供几何骨架）+ 每个顶点携带一个学习特征向量（编码拓扑语义）。然后用经典 CAD 流水线在该网格上拟合参数化曲面、提取边界曲线、组装 B-Rep。

### 关键技术

| 技术 | 说明 |
|------|------|
| **Pretrained image-to-3D backbone** | 复用现成的图像→3D 模型作为几何骨架来源 |
| **Feature mesh** | 在输出网格上附加 per-vertex 特征向量，编码 face-separation 信息 |
| **Dual decoder** | 一个解码器输出几何（顶点位置、网格），另一个输出面分割特征 |
| **CAD kernel reconstruction** | 在特征网格上拟合参数化曲面 (NURBS/Bezier)、提取 sharp edges、装配显式 B-Rep |
| **Topology-recovery from mesh regions** | 不预设 face count，面数随特征分布自适应分裂 |

---

## 实验结论

- **数据集**：DeepCAD 标准集 + Fusion360 + 真实照片（定性）
- **基线**：CADDreamer、HoLa (public demo)
- **结果**：
  - 有效 B-Rep 率：**80.49%** (DeepCAD)；
  - face Chamfer：0.0345 vs CADDreamer 0.1096（≈3× 提升）；
  - 优于 HoLa public demo 全部指标；
  - 可处理 >30-face 复杂形状（标准 DeepCAD 范围之外）；
  - 对 CAD 训练分布外对象（OOD）有泛化能力；
  - 真实照片可定性迁移。

---

## 局限性

- 仅在 DeepCAD / Fusion360 风格工业零件验证，未覆盖自由曲面 / 高曲率有机形状；
- 拟合参数化曲面的过程依赖商业 CAD 内核，复现成本高；
- 特征网格分辨率受预训练图像到 3D 模型限制。

---

## 相关工作

- **CADDreamer** (Xu et al., 2024) — 直接预测 B-Rep token；
- **HoLa** (Liu et al., 2025) — 层次化 B-Rep 生成；
- **DeepCAD** (Wu et al., 2021) — 数据集；
- **Fusion360Gallery** (Willis et al., 2021) — 数据集；
- [[B-Rep Generation Survey]]
- [[CAD Reconstruction from Point Cloud]]

---

## 实现建议

- **实现难度**：高（需要预训练图像到 3D 模型 + 双解码器 + CAD 拟合内核）
- **预期性能**：单张 RTX 4090 上图像→B-Rep 推理时间 < 30s（基于类似方法推断）
- **适用场景**：
  - 工业 CAD 设计自动化；
  - 单视图 3D 重建的可编辑输出；
  - 逆向工程中"图像→可编辑模型"的桥梁；
- **推荐组件**：
  - 图像到 3D 网格：**TripoSR** / **CRM** / **Stable Fast 3D**；
  - B-Rep 内核：**OpenCascade (OCCT)**；
  - 曲面拟合：**libigl** + 自定义 NURBS 拟合；
  - 训练框架：**PyTorch3D** 或 **PyTorch + custom CUDA**。

---

## 推荐度

✅ **强烈推荐跟踪**——图像→B-Rep 是工业 AI 落地的核心路径，UniBRep 在拓扑可扩展性上是显著进步。
