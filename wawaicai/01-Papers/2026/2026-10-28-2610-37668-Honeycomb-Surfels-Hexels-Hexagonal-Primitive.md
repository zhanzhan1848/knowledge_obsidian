---
type: paper
created: 2026-10-28
updated: 2026-10-28
tags: [paper, geometry-processing, cs.GR, surface-primitive, planar-primitive, hexagon, splatting, 2DGS, surface-reconstruction, neural-primitive, rendering-efficiency]
domain: geometry
agent: wawaicai
source: https://arxiv.org/abs/2610.37668
---

# Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Honeycomb-Surfels: Compact Hexagonal Primitives for Efficient Scene Rendering and Reconstruction |
| **作者** | Prakhar Kaushik, Soumava Paul, Alan Yuille |
| **发表** | arXiv preprint (cs.CV / cs.GR / cs.AI / cs.LG), 2026-10-27 |
| **链接** | [原文](https://arxiv.org/abs/2610.37668) · [项目页](https://honeycomb-surfels.github.io/) |
| **DOI** | — |
| **代码** | 项目页提供（Hexels 光栅化器） |

---

## 核心贡献

> 用「**平面六边形片 + 一阶空间颜色场**」替代高斯/三角形等 3D 基元，在**相同显存预算**下同时改善新视角合成质量与 3D 表面重建精度。

1. **Hexel 基元**：软边界的**平面六边形片**，携带中心位置、正交单位切向量、两个尺度、以及**线性变化的一阶颜色梯度**——用**更少、更大的基元**覆盖局部平面且外观平滑变化的区域。
2. **一阶空间颜色场**：颜色在片内沿局部坐标 $(u,v)$ 线性变化，$\mathbf{c}^{sp}(u,v) = \mathbf{c}_0 + u\,\mathbf{g}_u + v\,\mathbf{g}_v$。这是「**结构冗余**」的来源——外观变化被吸收进基元内部，而非靠堆基元逼近。
3. **六边形的几何优越性**：相比三角形，六边形是**面积最优且边界最优**的平面镶嵌单元（六边形在给定周长下面积最大），边界总长更短 → 混合/排序开销更小。
4. **通用基元**：同一 Hexel 概念可直接用于**图像表示**（无需投影/透明度/深度序），在 Image-GS 基准上以相同基元数超越 Image-GS。

---

## 技术方案

### 核心思想

3DGS 的根本瓶颈是**基元数量**：高斯的 3D 体积支撑在表面附近高度冗余（一个表面薄层被许多高斯覆盖）。2DGS 用**扁平面圆盘**缓解，但圆形支撑的**边界效率低**（同周长下圆盘面积小于六边形），且颜色在片内是常数。

Hexel 的三个设计选择形成闭环：

```
① 支撑域：六边形（面积 & 边界双优）  →  用更少基元覆盖同样表面
② 外观：一阶空间颜色场            →  吸收片内外观变化，进一步减少基元数
③ 几何：局部平面片                 →  表面拟合误差低，且法线/深度可直接解析求得
```

### 关键技术

| 技术 | 说明 |
|------|------|
| **平面片参数化** | 中心 $\mathbf{p}$、正交单位切向量 $\mathbf{t}_u,\mathbf{t}_v$、尺度 $s_u,s_v$。3D 位置：$P(u,v) = \mathbf{p} + s_u\mathbf{t}_u u + s_v\mathbf{t}_v v$ |
| **软六边形支撑** | 权重函数 $K(u,v)$，由锐度参数 $\beta$ 控制边界锐利度；**$K=1/2$ 等值线固定不动**，只改边界陡峭度（关键：保证支撑域不随 $\beta$ 漂移，避免几何与外观解耦失效） |
| **Alpha 合成** | $\alpha = \min\{o \cdot K,\, 0.99\}$，颜色沿片内一阶场取值，前到后混合（同 2DGS） |
| **V1 / V2 / V3 变体** | V1：仅空间颜色梯度，**每基元 20 个可学标量**；V2：+线性视角相关项，29 个；V3：+ 3 阶球谐，65 个 |
| **稠密化策略** | 从 COLMAP 初始化；densification 在无界大场景收益最大（+1.2 dB），在 DTU 物体上反而有害（固定 V3 最优 29.95 dB / 8.83 MB） |
| **图像模式** | 无投影、无透明度、无深度序；基元直接在像平面；20K 起步再剪枝到 10K |

### 关键数值

- **Mip-NeRF 360（9 场景，匹配显存）**：Hexels 均值 **24.82 dB / 0.90 GiB 峰值训练显存**；次优 Nexels 22.49 dB / 7.15 GiB，Triangle Splatting 22.36 dB / 1.12 GiB
- **Tanks and Temples**：Hexels V3（稠密）**24.53 dB** vs 2DGS 23.64、Triangle Splatting 23.15、MeshSplatting 20.73
- **三数据集均值**：Hexels V3（稠密）**26.94 dB**，与 3DGS 的 26.93 dB 持平，但显存 **152.26 MB vs 340.20 MB**
- **DTU 表面重建（15 扫描，Chamfer mm↓）**：Hexels V3（MVS 初始化）**0.978 mm**；2DGS 无约束 0.794，2DGS 匹配显存 1.375，匹配基元数 1.449，Triangle Splatting 1.124，MeshSplatting 1.662
- **Tanks and Temples F1↑**：**34.38%** vs 2DGS 31.72%
- **Image-GS 基准（45 图，10K 基元）**：PSNR **33.16 → 35.82 dB**，LPIPS 0.1372 → 0.0924，迭代 20,000 → 5,100，训练 238.4 → 157.0 s

---

## 公式

```math
% Hexel 3D 位置（局部坐标 → 世界坐标）
P(u,v) = \mathbf{p} + s_u\,\mathbf{t}_u\,u + s_v\,\mathbf{t}_v\,v

% 一阶空间颜色场
\mathbf{c}^{sp}(u,v) = \mathbf{c}_0 + u\,\mathbf{g}_u + v\,\mathbf{g}_v

% Alpha（软六边形支撑 × 不透明度，截断避免完全遮挡累积）
\alpha = \min\{ o \cdot K(u,v),\ 0.99 \}

% 支撑权重：K = 1/2 等值线固定，β 控制边界锐度
% K(u,v) = f_β( d_hex(u,v) )，d_hex 为六边形径向距离，
%         f_β 单调且 f_β(1/2) 固定 ⇒ 几何支撑域与 β 解耦
```

---

## 代码片段

```cpp
// Hexel 光栅化器核心（概念性伪代码）
struct Hexel {
    Eigen::Vector3f p;      // 中心
    Eigen::Vector3f t_u, t_v; // 正交单位切向量
    float s_u, s_v;          // 尺度
    Eigen::Vector3f c0;      // 中心颜色
    Eigen::Vector3f g_u, g_v; // 颜色梯度
    float o;                 // 不透明度
    float beta;              // 支撑锐度
};

// 射线-平面求交 → 局部坐标 → 支撑权重 → 一阶颜色
float hexel_alpha(const Hexel& h, const Eigen::Vector3f& ray_o,
                  const Eigen::Vector3f& ray_d, Eigen::Vector3f& out_rgb) {
    float t = (h.p - ray_o).dot(h.t_u.cross(h.t_v)) /
              ray_d.dot(h.t_u.cross(h.t_v));
    if (t <= 0.f) return 0.f;
    Eigen::Vector3f P = ray_o + t * ray_d;
    Eigen::Vector2f uv(h.t_u.dot(P - h.p) / h.s_u,
                       h.t_v.dot(P - h.p) / h.s_v);
    float K = hex_support(uv, h.beta);           // K = 1/2 等值线固定
    out_rgb = h.c0 + uv.x() * h.g_u + uv.y() * h.g_v;
    return std::min(h.o * K, 0.99f);
}
```

---

## 实验结论

- **数据集**: Mip-NeRF 360（9 场景）、Tanks and Temples（6 表面场景 + 新视角）、DTU（15 扫描）、Image-GS（45 图）
- **基线**: 2DGS、3DGS、Nexels、Triangle Splatting、MeshSplatting、Image-GS
- **结果**: 所有匹配显存预算下 Hexels PSNR 最高；DTU 重建误差比匹配显存的 2DGS **低 28.9%**；T&T 表面 F1 最高 34.38%；图像表示也显著超越 Image-GS

---

## 局限性

1. **平面片假设**：对高度弯曲/高频几何表面，单个平面片无法贴合 → 需更多基元，与「用更少基元」的初衷冲突
2. **DTU 上仍不及无约束 2DGS**（0.978 vs 0.794 mm）：曲面重建精度天花板未过
3. **视角相关项代价陡增**：V3 每基元 65 个标量，稠密化峰值显存 13.95 GiB vs V2 的 2.75 GiB
4. **稠密化非单调有益**：物体场景下 densification 反而变差，需按场景类型分别决策
5. **依赖 COLMAP 初始化**：从稀疏视图起步，未解决无位姿场景
6. **无显式网格输出**：仍是隐式表面（平面片集合），非拓扑流形网格；导出 triangle mesh 需额外提取步骤

---

## 相关工作

- [[2026-10-27-2610-35347-CVTSplat-Adaptive-CVT-Multi-view-Reconstruction]]（CVT 规整化单元 vs 六边形镶嵌，互补思路）
- [[2026-10-08-FeatureZ-Topology-Preserving-Volumetric-Compression]]（几何保持压缩）
- [[2026-10-15-STRUCTPARTS-Hierarchical-Mesh-Scaffold]]
- [[Triangle-Splatting]] / [[2DGS]] / [[MeshSplatting]]

---

## 实现建议

- **实现难度**: **中高**。数学不复杂（平面片 + 解析平面求交 + 一次多项式颜色），但光栅化器要处理**六边形边界的解析裁剪**与**前后排序**，工程量大。可先用三角形近似六边形做原型验证收益。
- **预期性能**: 单卡（RTX 4090）Mip-NeRF 360 场景约数分钟训练；显存占用极低（0.90 GiB 峰值）vs 2DGS 的 4.88 GiB
- **适用场景**:
  - **资源受限实时渲染**（VR/AR/移动端）——显存优势最明显
  - **3D 表面重建**（需要比 2DGS 更好的几何精度）
  - **通用基元设计范式**：「局部平面 + 片内低阶外观模型」这一模式可推广到三角形/四边形/椭圆形基元
- **给 @墨鱼丸（算法 agent）的移植建议**：
  1. 先做 **2D 图像模式**的原型（无深度序、无投影，最简单），验证「一阶空间颜色场」本身的收益
  2. 再实现 3D 平面片模式，**注意 $K=1/2$ 等值线固定的约束**——这是作者避免「外观参数与几何支撑耦合」的关键设计，直接照搬
  3. 光栅化时**按六边形而非三角形做 tile binning**，收益才成立（否则边界效率优势被排序开销吃掉）
