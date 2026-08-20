# VoroTracing: Differentiable Voronoi Ray Tracing Beyond Rasterization Speeds

## 论文信息
- **arXiv**: [2608.17682](https://arxiv.org/abs/2608.17682)
- **作者**: Bernardo Taveira, Carl Lindström, Joakim Johnander, Fredrik Kahl (Chalmers University of Technology & Zenseact)
- **发表**: 2026-08-19
- **类别**: cs.GR (Computing methodologies → Reconstruction, Ray tracing)
- **会议**: 预印本
- **代码**: https://research.zenseact.com/publications/vorotracing

---

## 核心创新点

### 1. 问题定位
- 实时新视角合成领域被光栅化方法主导
- 基于光线的方法支持非针孔相机效果（鱼眼、滚动快门、景深）但被认为速度太慢
- **核心论点**：对于显式辐射场，基于光线的方法与光栅化方法的性能权衡并非固有的

### 2. VoroTracing 方法
基于 Radiant Foam 的 Voronoi 分区表示，重新设计渲染管线：

#### 关键技术：
1. **紧凑八面体外观纹理** (Compact Octahedral Appearance Textures)
   - 替代 per-cell 球谐函数
   - 减少每次 ray-cell 交互的外观数据加载量
   - 支持 cell 内部的空间细节

2. **表面集中不透明度** (Surface-Concentrated Opacity)
   - 鼓励不透明度集中在表面
   - 促进早期终止，减少半透明 cell 合成数量
   - 结合尺度不变密度参数化

3. **GPU 优化**
   - 空间 cell 排序
   - Warp 一致的 ray 调度
   - 对齐纹理加载
   - 低贡献 cell 跳过

4. **固定预算训练** (Fixed-Budget Training)
   - 从密集对应初始化，不依赖剪枝/致密化/渐进下采样
   - 避免多阶段调度

### 3. 性能结果
- **Mip-NeRF 360 数据集**
- RTX 5090 上达到 **623 FPS**
- 比最快 prior ray-based 方法快 **3.2×**
- 比 3D Gaussian Splatting 快 **2.8×**
- 鱼眼、滚动快门、运动模糊、景深效果通过 ray generation 实现

---

## 技术细节

### Voronoi Ray Traversal
- Voronoi 图将空间划分为恒定密度和外观的 cell
- Ray 通过局部邻接遍历，而非重复查询 BVH
- 成本主要取决于访问的 cell 数量，而非基元总数

### 与 Fluid Rendering 的关联
- Radiant Foam 是 particle-based 体积渲染方法
- VoroTracing 在其基础上优化了 per-cell 渲染效率
- **体积渲染优化**对流体渲染（烟雾、体积光）直接相关
- 技术可用于渲染带有复杂相机效果的流体场景

### 核心公式
- Voronoi cell 定义: $V_i = \{ \mathbf{x} \in \mathbb{R}^3 \mid \|\mathbf{x} - \mathbf{p}_i\| \leq \|\mathbf{x} - \mathbf{p}_j\|, \forall j \neq i \}$
- 八面体映射用于紧凑纹理存储
- 尺度不变密度参数化避免 cell 大小变化带来的偏差

---

## 渲染方法分类
- **类型**: 体积渲染 (Volume Rendering)
- **技术**: Voronoi Ray Tracing, Neural Rendering, Octahedral Mapping
- **逼真度**: ⭐⭐⭐⭐ (与 3DGS 竞争)
- **风格化支持**: 否

## 性能预期
- **帧率**: 623 FPS (RTX 5090)
- **GPU 需求**: 高端消费级 GPU
- **内存占用**: 中等 (紧凑纹理表示)

## 实现建议
- **着色器复杂度**: 高
- **管线要求**: 定制 GPU 实现
- **推荐度**: ✅ 体积渲染方向重要进展

---

## 相关工作引用
- Radiant Foam (Govindarajan et al. 2025) - Voronoi tracing 基础
- Power Foam (Govindarajan et al. 2026) - 能量图混合
- Radiance Meshes (Mai et al. 2026) - 四面体网格
- 3D Gaussian Ray Tracing / 3DGRT (Moenne-Loccoz et al. 2024)

## 标签
#volume-rendering #voronoi-tracing #neural-rendering #real-time #novel-view-synthesis #ray-marching #fluid-rendering
