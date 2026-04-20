---
type: paper
created: 2026-04-20
updated: 2026-04-20
tags: [paper, rendering, voxelization, LOD, microgeometry, SGGX, path-tracing, 2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.13191
---

# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Fast Voxelization and Level of Detail for Microgeometry Rendering |
| **作者** | Javier Fabre |
| **发表** | arXiv cs.GR, April 2026 (Accepted to The Visual Computer) |
| **链接** | [原文](https://arxiv.org/abs/2604.13191) |
| **DOI** | https://doi.org/10.48550/arXiv.2604.13191 |
| **代码** | - |

---

## 核心贡献

> 针对各向异性光散射微结构材质（如纤维、拉丝金属），提出高效的体素化方法和层级细节表示

1. **并行体素化方法**：高效并行体素化算法，支持多分辨率级别的快速数据聚合
2. **层级 SGGX 聚类**：基于层次化 SGGX 聚类的新型表示，比基线方法提供更高精度
3. **路径追踪验证**：在基于 CUDA 的体素化器和路径追踪器上验证方法有效性

---

## 技术方案

### 核心问题
- 各向异性材质（纤维、拉丝金属表面）的微结构需要高空间分辨率体素表示
- 体素数据获取耗时且内存密集
- 渲染时需要额外的 LOD 数据结构来聚合多距离下的视觉外观

### 解决方案

#### 1. 并行体素化（Parallel Voxelization）
- CUDA 实现的高效体素化方法
- 支持快速数据聚合到多个分辨率级别
- 适用于三角网格和显式纤维建模的体积织物

#### 2. 层级 SGGX 聚类（Hierarchical SGGX Clustering）
- 层次化 SGGX 聚类表示
- 比 MIP map 基线方法更好的精度
- 支持 microgeometry 的多分辨率表示

#### 3. LOD 渲染模型
- 基于路径追踪的验证
- 多分辨率数据聚合
- 减少每像素采样数量

### 关键技术

| 技术 | 说明 |
|------|------|
| SGGX | 各向异性相位函数的紧凑表示，用于体积散射 |
| 体素化 | 并行网格体素化，支持多分辨率 |
| LOD | MIPmap 风格的层级细节，但针对微几何优化 |
| 路径追踪 | 用于验证渲染质量的路径追踪器 |

---

## 实验结论

- **实现**：CUDA 体素化器，在三角网格和体积织物上测试
- **验证方法**：基于提议 LOD 渲染模型的路径追踪器
- **应用场景**：纤维材质渲染、拉丝金属表面、各向异性散射材质

---

## 局限性

- 主要针对静态微结构
- 需要预计算体素数据
- 内存占用随分辨率增长

---

## 实现建议

- **实现难度**：中
- **预期性能**：高效并行处理，适合 GPU 实现
- **适用场景**：材质扫描、微表面渲染、纤维织物渲染
- **推荐度**：⭐⭐⭐⭐ 推荐实现，特别适合材质渲染 pipeline

---

## 相关工作

- [[NDGI - Neural Dynamic Global Illumination]] - 动态光照下的 GI 压缩
- [[VVGT - Visual Volume-Grounded Transformer]] - 体积数据的高斯表示
- [[Neural Gabor Splatting]] - 高频细节的 Gaussian Splatting
