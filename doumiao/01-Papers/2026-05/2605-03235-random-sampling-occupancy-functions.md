# Random Sampling of Occupancy Functions via Adaptive Delaunay Scaffolding

## 论文信息
- **arXiv**: [2605.03235](https://arxiv.org/abs/2605.03235)
- **日期**: 2026-05-05 (提交)
- **会议**: SIGGRAPH 2026
- **作者**: Suzuran Takikaw

## 核心创新点
- **方法**: Adaptive Delaunay Sampling (ADS)
- **突破**: 首次在单一框架下同时实现 occupancy function 的随机采样和曲面重建
- **效率**: 相比现有方法减少一个数量级的函数评估次数

## 技术细节

### 核心算法
1. **Delaunay tetrahedralization** 作为采样和曲面重建的脚手架
2. **逐步细化** 穿越边缘 (crossing edges)
3. **Marching tetrahedra** 用于曲面重建
4. **法向量估计** 用于细化细粒度特征区域

### 关键贡献
- 伪随机 OCCupancy function 表面采样
- 等值面网格连接采样点
- 自适应特征和曲率区域密集采样

## 渲染相关度
- **类型**: 体积渲染 / 隐式曲面
- **相关性**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: 烟雾、体积云、液体表面重建

## 可行性分析

### 渲染方法
- 类型：隐式曲面采样 + 网格重建
- 技术：Occupancy Function + Delaunay  tetrahedralization

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：有限

### 性能预期
- 采样效率：比现有方法高 10x
- 函数评估：数量级减少
- 适用性：实时/离线均适用

### 实现建议
- 着色器复杂度：中等
- 管线要求：GPU 并行
- 推荐度：✅ 高度推荐用于体积渲染

## 关键公式/概念
- Adaptive Delaunay Sampling (ADS)
- Crossing edge refinement
- Marching tetrahedra
- Normal estimation for feature densification

## URL
- Paper: https://arxiv.org/abs/2605.03235
- PDF: https://arxiv.org/pdf/2605.03235
