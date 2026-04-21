# Fast Voxelization and LoD for Microgeometry Rendering

## 基本信息
| 属性 | 值 |
|------|-----|
| **arXiv** | [2604.13191](https://arxiv.org/abs/2604.13191) |
| **分类** | cs.GR |
| **日期** | 2026-04-14 |
| **作者** | Javier Fabre |
| **发表** | The Visual Computer (accepted) |
| **PDF** | [pdf](https://arxiv.org/pdf/2604.13191) |
| **补充材料** | [supp.pdf](https://javierfabre.com/projects/voxel-lod/supp.pdf) |

## 摘要
Many materials show anisotropic light scattering patterns due to the shape and local alignment of their underlying micro structures: surfaces with small elements such as fibers, or the ridges of a brushed metal, are very sparse and require a high spatial resolution to be properly represented as a volume.

The acquisition of voxel data from such objects is a time and memory-intensive task, and most rendering approaches require an additional Level-of-Detail (LoD) data structure to aggregate the visual appearance.

We introduce:
1. An efficient parallel voxelization method designed to facilitate fast data aggregation at multiple resolution levels
2. A novel representation based on hierarchical SGGX clustering that provides better accuracy than baseline methods

Validated with CUDA-based voxelizer implementation on triangle meshes and volumetric fabrics with explicit fibers. Results generated with path tracer based on proposed LoD rendering model.

## 核心创新点

### 1. 高效并行体素化
- CUDA并行实现
- 多分辨率级别快速数据聚合
- 支持三角形网格和体积织物

### 2. 层次SGGX聚类
- 改进的LoD表示
- 比基线方法更高精度
- 各向异性散射模式

### 3. SGGX微几何分布
- 精确模拟微结构光散射
- 纤维等元素渲染
- 体积材质表示

## 技术贡献

| 贡献 | 描述 |
|------|------|
| 并行体素化 | O(n) 复杂度 |
| 层次LoD | 多尺度细节保留 |
| SGGX聚类 | 改进材质表示 |

## 实验验证
- CUDA实现
- 三角形网格测试
- 体积织物 (explicit fibers)
- Path tracer渲染验证

## 流体渲染相关性

### 适用场景
- ✅ 流体体素表示
- ✅ 体积数据压缩
- ✅ 多尺度水体素化
- ✅ 泡沫/飞溅粒子

### 技术借鉴
1. **并行体素化** → 流体模拟数据处理
2. **层次LoD** → 视距相关的流体细节
3. **SGGX散射** → 次表面散射效果

### 不适用于
- ❌ 实时水面反射
- ❌ 高速流体模拟
- ❌ 交互式流体

## 方法分类
- **类型**: 体积渲染 (Volume Rendering)
- **方法**: Voxelization + SGGX BRDF
- **层次**: LOD (Mip-mapping风格)

## 性能评估
| 指标 | 预期 |
|------|------|
| 速度 | 高效 (CUDA) |
| 内存 | 可压缩 |
| 质量 | 高精度 |

## 可行性分析

🩸 **可行性分析：快速体素化 + LOD 渲染**

## 渲染方法
- 类型：体积渲染
- 技术：Voxelization + SGGX BRDF + LOD

## 视觉质量
- 逼真度：⭐⭐⭐⭐
- 风格化支持：是

## 性能预期
- 帧率：离线渲染优化，实时需优化
- GPU 需求：中等-高
- 内存占用：依赖体素分辨率

## 实现建议
- 着色器复杂度：高
- 管线要求：CUDA + Path Tracer
- 推荐度：✅ 适用于体积流体和材质渲染

---

*笔记创建: 2026-04-21*
