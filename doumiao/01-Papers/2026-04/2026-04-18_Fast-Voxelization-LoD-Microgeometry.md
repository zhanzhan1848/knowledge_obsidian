# Fast Voxelization and Level of Detail for Microgeometry Rendering

**arXiv**: [2604.13191](https://arxiv.org/abs/2604.13191)
**时间**: 2026-04-14
**类别**: cs.GR, cs.LG
**发表**: The Visual Computer (已接受)
**作者**: Javier Fabre et al.
**链接**: https://javierfabre.com/projects/voxel-lod/supp.pdf

---

## 核心问题

许多材质由于微观结构（microstructures）的形状和局部排列而表现出各向异性光散射模式：
- 表面微小元素（如纤维）
- 拉丝金属的脊
- 这些结构非常稀疏，需要高空间分辨率才能正确表示为体积

**挑战**:
- 从此类对象获取体素数据耗时且内存密集
- 大多数渲染方法需要额外的 LOD 数据结构来聚合从多个距离观察到的视觉外观
- 减少每像素计算的采样数（E.g.: MIP mapping）

---

## 核心创新

### 1. 高效并行体素化方法
- 支持快速数据聚合的多分辨率级别
- CUDA 实现

### 2. 层次化 SGGX 聚类
- 改进精度：比基线方法更好准确度
- 紧凑表示：有效压缩微几何视觉特征

### 3. Path Tracer 集成的 LoD 渲染模型

---

## 技术细节

### SGGX 分布
SGGX (Symmetric Gaussian Gram) 是一种各向异性相位函数表示，用于描述微表面的光散射方向分布。

### 层次化聚类方法
```
High-res Voxel Grid → Hierarchical SGGX Clustering → Multi-resolution LOD
     (parallel voxelization)           ↓
                        Aggregated Appearance per LOD Level
```

### 验证
- CUDA 体素化器
- 三角网格输入
- 具有显式纤维的体积织物
- Path tracer 渲染结果

---

## 关键贡献

1. **高效并行体素化**: O(n) 复杂度，支持 GPU 并行
2. **层次化 SGGX 聚类**: 多分辨率聚合，减少存储
3. **LoD 渲染模型**: 距离自适应采样，提高效率

---

## 流体渲染价值

### 类比应用
- **烟雾渲染**：烟雾微结构（煤烟颗粒、灰烬）的体积表示
- **云层渲染**：体积云的多分辨率体素化
- **参与介质**：气体/液体微结构的光散射

### 技术借鉴
- 体素化 → 流体模拟结果的快速体素化后处理
- SGGX 散射 → 烟雾/云层各向异性散射近似
- LoD → 流体体积渲染的距离自适应采样

---

## 与流体渲染的关系

| 方面 | 关系 |
|------|------|
| 体积渲染 | 直接方法 |
| 烟雾渲染 | 技术类比 |
| 纤维渲染 | 技术核心（可用于烟雾微结构） |
| 各向异性散射 | SGGX 可用于烟雾相位函数 |

---

## 参考价值

- ⭐⭐⭐ 体积渲染研究者参考
- ⭐⭐ 烟雾/云层渲染可借鉴体素化方法
- ⭐⭐ GPU 体素化高效实现参考

---

*由 doumiao (豆苗) 整理 | 2026-04-18*
