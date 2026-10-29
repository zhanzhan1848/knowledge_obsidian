---
type: paper
created: 2026-10-29
updated: 2026-10-29
tags: [paper, fluid-rendering, water-rendering, eulerian-simulation, quadtree, pacific-graphics, real-time]
status: processed
domain: fluid-rendering
agent: doumiao
source: https://graphics.c.u-tokyo.ac.jp/en/publications/
---

# Beyond Horizontal Refinement: Extending Quadtree Tall Cells with Adaptive Optical Layers

## 📋 基本信息

| 字段 | 内容 |
|------|------|
| **标题** | Beyond Horizontal Refinement: Extending Quadtree Tall Cells with Adaptive Optical Layers |
| **作者** | Fumiya Narita (GAME FREAK Inc. / The University of Tokyo), Takashi Kanai (The University of Tokyo) |
| **会议** | **Pacific Graphics 2026**（Symposium Proceedings） |
| **期刊** | Computer Graphics Forum, Vol. 45, Issue 7, e70629, **October 2026** |
| **DOI** | 10.1111/cgf.70629（Crossref 尚未激活，见上游记录） |
| **实验室** | Takashi Kanai Laboratory, The University of Tokyo (Komaba I Campus) |
| **发表日期** | 2026-10（Pacific Graphics 2026 于 2026-10-06 新加坡举办） |

> ⚠️ **行业影响**：本工作由 **GAME FREAK**（宝可梦开发商）工程师 Fumiya Narita 与东大金井崇教授合作完成，被游戏媒体广泛报道为《宝可梦 风与浪》（Pokémon Winds and Waves）可能采用的新水面模拟技术。

---

## 🔑 核心贡献

1. **突破"仅水平细化"的限制**：前作 *Adaptive Optical Layers*（Eurographics 2026, CGF 45(2) e70357）只能在**水平方向**调整光学层厚度；本文将自适应光学层扩展到**垂直方向**，实现真正的各向异性自适应
2. **四叉树高单元 (Quadtree Tall Cells) 网格**：近液面区域用规则网格，远离液面区域用拉长的矩形单元
3. **自适应光学层厚度**：光学层厚度按液体运动动态调整，在不牺牲视觉质量的前提下大幅减少投影步所需的网格单元数
4. **薄光学层下的刚体双向耦合**：解决了两向耦合在光学层较薄时的精度退化问题
5. **算法简洁**，易于集成到已有的 tall cell grid 框架

---

## 🧪 技术方案

### 核心思想

**Tall Cell Grid** 是一套加速大规模液体仿真的高效网格方案：

```
液面附近 (高频细节)          远离液面 (低频细节)
┌───────────────────┐      ┌───────────────────┐
│  ▓▓▓ 规则网格       │      │ ▓  ▓  ▓  ▓  ▓     │  ← 拉长矩形单元
│  ▓▓▓ 规则网格       │      │ ▓  ▓  ▓  ▓  ▓     │     (Tall Cells)
│ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ │      │ ▓  ▓  ▓  ▓  ▓     │
│ ▓  ▓  ▓  ▓  ▓  ▓  ▓ │      │ ▓  ▓  ▓  ▓  ▓     │
│ ▓  ▓  ▓  ▓  ▓  ▓  ▓ │      │ ▓  ▓  ▓  ▓  ▓     │
└───────────────────┘      └───────────────────┘
  ▲ optical layer (光学层)   ▲ 拉长的 tall cell
  规则网格覆盖的近表面区域
```

- **Optical Layer（光学层）**：紧贴液面的规则网格区域，捕捉飞溅、涟漪、浪花等**视觉关键高频细节**
- **Tall Cells**：液面以下的拉长单元，捕捉压力传播等低频大尺度行为，单元数远少于规则网格
- **本文贡献**：光学层不再使用统一固定厚度，而是**依据液体运动自适应调整**

### 关键技术

| 技术 | 说明 |
|------|------|
| **四叉树 Tall Cells** | 水平方向按四叉树自适应细分，垂直方向允许拉长单元，实现各向异性分辨率分配 |
| **自适应光学层** | 光学层厚度随液体速度/运动动态变化：平静区域变薄（省算力），剧烈运动区域变厚（保细节） |
| **垂直方向扩展** | 突破 Eurographics 2026 版本仅限水平细化的限制，允许光学层在 z 方向也随需变化 |
| **投影步加速** | 投影（pressure projection）是液体仿真的主要瓶颈；减少网格单元数直接带来端到端加速 |
| **薄层双向耦合** | 在 optical layer 薄的区域引入刚体-液体双向耦合方案，维持交互正确性 |

---

## 📊 渲染方法分类

- **类型**：表面渲染 + Eulerian 流体模拟（网格法）
- **技术**：Tall Cell Grid、Quadtree、Pressure Projection

## 🎯 视觉质量

- **逼真度**：⭐⭐⭐⭐⭐（保持飞溅/涟漪/浪花等高频细节）
- **风格化支持**：是（模拟层与渲染层解耦）
- **物理准确性**：高（仍基于完整 Navier-Stokes 压力投影，不是近似模型）

## ⚡ 性能预期

- **加速比**：媒体报道压力计算部分可达 **约 3 倍加速**（up to 3x faster in pressure calculations）
- **GPU 需求**：中（规则网格 + 拉长单元的混合网格，单次 pass 复杂度中等）
- **内存占用**：低-中（相比全规则网格大幅减少单元数）
- **商业价值**：✅ 已进入商业游戏管线（Game Freak）

## 🔧 实现建议

- **着色器复杂度**：中
- **管线要求**：
  - 混合规则/拉长单元的网格数据结构
  - 压力投影求解器（需支持非规则单元）
  - 刚体-液体双向耦合模块
  - 光栅化与法线重建需处理拉长单元
- **推荐度**：✅ **强烈推荐**——这是 2026 年**最贴近商业实时液体渲染落地**的工作之一，兼顾了质量与性能，且有开源学术血统（Kanai Lab）

## ⚠️ 局限性

- Tall cell 几何使得**各向异性梯度计算与法线重建**较为复杂，边界处可能需要特殊处理
- 自适应光学层会引入**时间上的分辨率突变**，对时间连续性（闪烁）需谨慎处理
- 垂直方向扩展对**压力传播精度**的影响需评估（拉长单元本身在垂直方向已是低分辨率）
- 论文细节（具体网格构造、光学层自适应准则）需查阅原文

## 🔗 相关工作

- [[Adaptive-Optical-Layers-Eurographics-2026]]（前作）
- [[Quadtree-Tall-Cells-SIGGRAPH2025]]（SIGGRAPH 2025 前前作：Quadtree Tall Cells for Eulerian Liquid Simulation）
- [[Conservation-Aware-Learned-Shallow-Water-Simulation]]
- [[A-Flux-Interpolated-Advection-Scheme]]（Kanai Lab）
- [[Mantaflow]] · [[OpenFOAM]]
- [[2026-10-29-NFSR-NeRF-Inspired-Super-resolution-Reacting-Flows]]

## 📚 引用

```bibtex
@article{narita2026beyond,
  title={Beyond Horizontal Refinement: Extending Quadtree Tall Cells with Adaptive Optical Layers},
  author={Narita, Fumiya and Kanai, Takashi},
  journal={Computer Graphics Forum},
  volume={45},
  number={7},
  pages={e70629},
  year={2026}
}
```

---
*创建日期: 2026-10-29*
*来源: arXiv/SIGGRAPH 每日论文搜索 + Takashi Kanai Laboratory 出版物页*
*标签: #fluid-rendering #water-rendering #eulerian-simulation #quadtree #pacific-graphics #real-time #game-production*
