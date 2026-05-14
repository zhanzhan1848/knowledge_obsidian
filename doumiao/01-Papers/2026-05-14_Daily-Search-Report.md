# 每日论文搜索报告 - 2026-05-14

## 搜索范围
- **arXiv cs.GR**: 最近 7 天 (2026-05-08 ~ 2026-05-14)
- **SIGGRAPH 2026**: 会议日程发布

## 搜索关键词
- fluid rendering, water rendering, smoke rendering
- fire simulation, ocean rendering, particle system, volume rendering

## 搜索结果

### 直接相关论文
未发现直接属于流体渲染领域的论文。

### 间接相关论文（可能对流体渲染有参考价值）

#### 1. Hierarchical Transformer Preconditioner for Interactive Physics Simulation
- **arXiv**: [2605.13343](https://arxiv.org/abs/2605.13343)
- **分类**: cs.GR
- **日期**: 2026-05-12
- **作者**: -
- **摘要**: 神经预条件器用于实时物理模拟，基于弱容许性 H-matrix 分区引入多尺度结构先验。在多相 Poission 系统（密度比高达 100:1，N=1024-16384）上达到 ~143 到 ~21 fps。
- **相关度**: ⚠️ 物理仿真预条件器，与流体模拟数值求解器相关

#### 2. Time-of-Flight Rendering with Spatio-temporal Reservoir Resampling
- **arXiv**: [2605.11536](https://arxiv.org/abs/2605.11536)
- **分类**: cs.GR
- **日期**: 2026-05-12
- **DOI**: 10.1145/3811299
- **摘要**: 将 ReSTIR 扩展到时域光传输渲染，支持时间门控成像和瞬态光捕获。Path-length-aware shift mapping 保证光路长度约束。
- **相关度**: ⚠️ 体积光渲染技术，可能应用于烟雾/火焰的瞬态成像

#### 3. Color-Adaptive Volumetric Video Streaming with Dynamic 3D Gaussian Splatting
- **arXiv**: [2605.09279](https://arxiv.org/abs/2605.09279)
- **分类**: cs.GR
- **日期**: 2026-05-12
- **摘要**: 基于 3DGS 的体积视频流式传输，颜色自适应压缩与参考图像校正。
- **相关度**: ⚠️ 3DGS 体积视频，可能用于动态体积效果

#### 4. STA-FEM: Streaming Assembly for Dynamic Tetrahedral Topology
- **arXiv**: [2605.11673](https://arxiv.org/abs/2605.11673)
- **分类**: cs.GR
- **日期**: 2026-05-12
- **摘要**: 四面体网格动态拓扑的流式组装方法，用于断裂、细化、合并事件。 fracture 帧加速达 76%。
- **相关度**: ⚠️ 四面体有限元，与流体模拟网格处理相关

#### 5. 3D Surface Splatting for Inverse Rendering
- **arXiv**: [2605.05876](https://arxiv.org/abs/2605.05876)
- **分类**: cs.GR (v3)
- **日期**: 2026-05-08
- **摘要**: 可微分表面 splatting 渲染器，用于物理基逆向渲染。基于覆盖的合成模型，抗锯齿轮廓。
- **相关度**: ⚠️ 表面渲染技术，可能用于水面/反射表面

## SIGGRAPH 2026 流体相关 Talks

### Avatar: Fire and Ash (Wētā FX)
来自 beforesandafters.com 报道，SIGGRAPH 2026 包含多个 Avatar 水特效演讲：

1. **Advancing Large-Scale Water Simulation in Avatar: Fire and Ash**
   - 演讲者: Sean Flynn, Alexey Stomakhin, Joel Wretborn 等 (Wētā FX)
   - 内容: Pahi 水系统改进

2. **Blurring the Line Between Real and Digital Water in Avatar: Fire and Ash**
   - 演讲者: Sam Cole, Nicholas Illingworth, Alexey Stomakhin, Sean Flynn
   - 内容: 特征驱动方法恢复时间一致水流

3. **Thick Foam and Floating Debris in Avatar: Fire and Ash**
   - 演讲者: Job Guidos, Joel Wretborn, Sean Flynn 等
   - 内容: 泡沫和漂浮碎片模拟

4. **Creating the Elemental Vortex in Avatar: Fire and Ash**
   - 演讲者: Nicholas Illingworth, Alexey Stomakhin 等
   - 内容: Flux Devil 元素漩涡（等离子、水、火）

## 结论
今日 arXiv cs.GR 未发现直接流体渲染论文。Wētā FX 在 SIGGRAPH 2026 分享的水模拟技术值得关注，建议追踪其演讲细节和可能的论文发表。

---
*生成时间: 2026-05-14 14:19 UTC*