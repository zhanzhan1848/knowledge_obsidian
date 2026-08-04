# 📋 每日几何处理论文总结 - 2026-08-04

## 收集概况

- **搜索时间**: 2026-08-04 14:05 UTC
- **搜索来源**: arXiv cs.GR, ACM Digital Library, SIGGRAPH/Eurographics
- **关键词**: mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification
- **新论文数**: 7 篇

---

## 📑 论文列表

### 1. MeshFlow: Mesh Generation with Equivariant Flow Matching
- **会议**: SIGGRAPH 2026
- **核心**: 使用等变最优传输流匹配直接生成三角形网格汤
- **亮点**: 18倍推理加速，保持网格质量
- **标签**: 网格生成, 生成模型, Flow Matching

### 2. Meschers: Geometry Processing of Impossible Objects
- **会议**: ACM Trans. Graph. (2025)
- **核心**: 基于离散外微积分的"不可能物体"网格表示
- **亮点**: 支持标准几何操作和逆渲染
- **标签**: 网格表示, 不可能对象

### 3. ExMesh: EXplicit Mesh Reconstruction with Topology Adaptation
- **会议**: CVPR 2026
- **核心**: 可微优化与离散拓扑更新结合的显式网格重建
- **亮点**: 首个离散+连续统一框架
- **标签**: 网格重建, 拓扑适应

### 4. TriFlow: Generating Artist-Like 3D Mesh Topology
- **会议**: arXiv
- **核心**: 最近顶点向量场(NVF) + QEM网格简化
- **亮点**: 90%更低的Chamfer距离，8倍加速
- **标签**: 拓扑优化, QEM

### 5. Neural Geometry Image with Optimal Transport
- **会议**: WACV 2026
- **核心**: 几何图像表示 + 最优传输采样
- **亮点**: decoder-free，支持连续LOD
- **标签**: 参数化, 几何图像, 压缩

### 6. OT-UVGS: UV Mapping for Gaussian Splatting
- **会议**: Eurographics 2026 Short Papers
- **核心**: 最优传输容量分配问题视角的UV映射
- **亮点**: 即插即用，一致提升PSNR/SSIM/LPIPS
- **标签**: UV参数化, 高斯溅射

### 7. SeamGen: Artist-Aligned UV Seam Generation
- **会议**: arXiv
- **核心**: 图流匹配生成艺术家风格UV接缝
- **亮点**: 学习专业接缝布局偏好
- **标签**: UV接缝, 生成模型, Mesh Transformer

---

## 🔬 技术趋势分析

### 1. 最优传输(Optimal Transport)成为热点
- MeshFlow: OT训练目标
- OT-UVGS: OT容量分配
- Neural Geometry Image: OT采样

### 2. 生成模型进入几何处理
- Flow Matching: MeshFlow, TriFlow, SeamGen
- Mesh Transformer: SeamGen

### 3. 拓扑感知处理成熟
- 自适应拓扑更新: ExMesh
- 艺术家风格拓扑: TriFlow

### 4. UV参数化持续进展
- 从单对象优化到学习-based: SeamGen
- 与新型表示结合: OT-UVGS + Gaussian Splatting

---

## 💡 推荐关注

### 高优先级
1. **ExMesh**: CVPR 2026，拓扑适应框架有广泛应用
2. **TriFlow**: 艺术家风格拓扑生成，实用价值高
3. **OT-UVGS**: Eurographics 2026，即插即用

### 中优先级
4. **SeamGen**: UV接缝自动化，艺术工作流相关
5. **MeshFlow**: SIGGRAPH 2026，生成模型baseline

---

## 📊 传递目标

**墨鱼丸 (moyuwan)**:
- TriFlow 的 NVF+QEM 方法可作为网格简化模块参考
- ExMesh 的拓扑适应策略可应用于网格重建流程
- OT-UVGS 可作为 UV 参数化改进参考

---

*由 wawaicai 自动生成 | 几何知识库 v1.0*
