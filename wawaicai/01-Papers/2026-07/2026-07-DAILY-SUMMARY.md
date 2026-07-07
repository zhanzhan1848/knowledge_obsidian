# 每日汇总 - 2026-07-07

## 今日搜索概况

**搜索时间**：2026-07-07 14:04 UTC
**搜索范围**：arXiv cs.GR, ACM Digital Library, SIGGRAPH/SIGGRAPH Asia/Eurographics
**关键词**：mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 发现的论文

### ⭐ 核心论文：内在网格重网格化

| 论文 | arXiv ID | 类别 | 推荐度 |
|------|----------|------|--------|
| **Intrinsic Meshing of Closed Surfaces Using Geodesic Distances** | 2607.04989 | 几何处理/网格生成 | ⭐⭐⭐⭐⭐ |
| 3DMPE: 3D Multi-Perspective Embedding | 2607.04898 | 点云重建 | ⭐⭐⭐⭐ |
| Deform360: Visuotactile Dataset | 2607.05390 | 数据集/3D重建 | ⭐⭐⭐⭐ |

### 论文详情

#### 1. Intrinsic Meshing of Closed Surfaces Using Geodesic Distances 🥬⭐

**作者**：Tim Gabriel, Jean-François Remacle, Christophe Geuzaine
**机构**：Université de Liège, UCLouvain

**核心贡献**：
- 提出首个同时支持**细化+粗化**的内在三角化框架
- 测地线计算降至标准传播的 **3%** 成本（A* 加速）
- 支持**直接生成高阶等几何网格**，绕过传统线性→弯曲流程
- 在 Thingi10K 5000 模型上验证

**技术亮点**：
- 边 = 最短测地路径（非欧氏直线）
- 面 = 从原始网格继承的几何基元
- 局部操作：边交换/分裂/折叠/三角形分裂
- **Gmsh 开源实现**

**可行性**：⭐⭐⭐⭐⭐ **强烈推荐**

#### 2. 3DMPE: 3D Multi-Perspective Embedding 🥬

**作者**：Vahan Huroyan et al.
**类别**：cs.CV / cs.CG

**核心贡献**：
- 多视角点云重建的**无需训练**优化方法
- 处理跨视图缺失点和噪声对应
- 支持固定/可变投影设置

**技术亮点**：
- 扩展 MSPE 到不完整数据
- 几何优化驱动，非学习式

**可行性**：⭐⭐⭐⭐

#### 3. Deform360 Dataset 🥬

**作者**：Hongyu Li et al. (ECCV 2026)
**类别**：cs.RO / cs.CV

**核心贡献**：
- 198 物体，1980 序列，215+ 小时观测
- 41 环绕相机 + 双手机械手
- 无标记触觉 3D 追踪 + 3DGS 重建

**几何处理相关**：
- 网格数据评测
- 可变形物体几何跟踪
- 3DGS 几何重建 pipeline

---

## 技术趋势观察

1. **内在三角化 (Intrinsic Triangulation)** 正成为网格处理新范式
2. **A* 加速测地线计算** 使精确内在方法达到实用效率
3. **3DGS (Gaussian Splatting)** 在几何重建中持续流行
4. **无训练/优化驱动方法** 与学习型方法互补

---

## 知识库更新

- `2026-07/2026-07-07-Intrinsic-Meshing-Geodesic-Distances.md`
- `2026-07/2026-07-07-3DMPE-Point-Cloud-Reconstruction.md`
- `2026-07/2026-07-07-Deform360-Visuotactile-Dataset.md`

---

## 下一步行动

- [ ] 将 **Intrinsic Meshing** 方法传递给 @墨鱼丸
- [ ] 评估 Gmsh intrinsic mesh API 集成方案
- [ ] 持续监控 SIGGRAPH 2026 新论文

---

*🥬 娃娃菜 | 几何处理专家 | 2026-07-07*