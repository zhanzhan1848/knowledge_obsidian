# Fast Voxelization and Level of Detail for Microgeometry Rendering

## 文献信息
- **arXiv**: [2604.13191](https://arxiv.org/abs/2604.13191)
- **日期**: 2026-04-14
- **作者**: Javier Fabre et al.
- **类别**: cs.GR, cs.LG
- **发表**: Accepted to The Visual Computer

## 核心创新点

### 问题背景
- 许多材料因微观结构形状和局部排列呈现各向异性光散射模式
- 纤维表面、刷毛金属脊等非常稀疏，需要高空间分辨率才能正确表示为体积
- 体积数据获取耗时且内存密集
- 渲染需要额外 LOD 数据结构聚合多距离视觉外观

### 核心贡献

1. **高效并行体素化方法**: 促进多分辨率级快速数据聚合
2. **层次化 SGGX 聚类**: 提供比基线方法更好的精度
3. **CUDA 实现**: 在三角网格和具有显式纤维的体积织物上验证
4. **路径追踪器**: 基于所提 LOD 渲染模型

### SGGX 分布
SGGX (Scaled Grand勒让德展开) 用于微几何各向异性反射分布的紧凑表示

## 技术规格

| 参数 | 值 |
|-----|---|
| 体素化 | 并行 CUDA |
| 渲染验证 | 路径追踪 |
| 应用 | 纤维织物、刷毛金属 |
| LOD | 层次化 SGGX 聚类 |

## 与流体渲染关联

| 技术 | 关联度 | 说明 |
|-----|-------|------|
| 体素化 | ⭐⭐⭐⭐ | 流体模拟的网格化方法 |
| 各向异性散射 | ⭐⭐⭐⭐ | 烟雾/纤维渲染 |
| LOD | ⭐⭐⭐ | 大规模场景渲染优化 |

## 补充材料
- https://javierfabre.com/projects/voxel-lod/supp.pdf

## 关键词
`voxelization` `level of detail` `microgeometry` `anisotropic scattering` `SGGX`
