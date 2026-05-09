# Greed for the Spheres: A Signed Distance Interpolation Method

## 论文信息
- **arXiv**: [2605.01919](https://arxiv.org/abs/2605.01919)
- **日期**: 2026-05-03 (提交)
- **分类**: cs.GR
- **作者**: Oded Stein

## 核心创新点
- **方法**: 一致性 SDF 插值的贪婪算法
- **突破**: 确保插值后的 SDF 数据与输入完全一致，仍对应几何可实现曲面
- **保证**: 改进的 SDF 与输入一致，现有方法无此保证

## 技术细节

### 方法流程
1. 将 SDF 理论性质表达为硬几何约束
2. 构建高效贪婪算法进行一致性 SDF 插值
3. GPU 并行化预处理加速

### 应用场景
1. **全局 SDF 细化** - 无需真值的上采样
2. **网格重建** - 利用粗输入的全局信息重建细节曲面
3. **伪 SDF 修复** - CSG 布尔运算产生的伪 SDF 转为有效 SDF

## 渲染相关度
- **类型**: 表面渲染 / SDF
- **相关性**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: 水面渲染、液体表面、流体表面重建

## 可行性分析

### 渲染方法
- 类型：符号距离场插值
- 技术：约束优化 + GPU 并行

### 视觉质量
- 逼真度：⭐⭐⭐⭐⭐
- 风格化支持：是

### 性能预期
- 速度：GPU 并行预处理显著加速
- 精度：保证与输入一致性
- 适用性：实时和离线均可

### 实现建议
- 着色器复杂度：中等
- 管线要求：GPU
- 推荐度：✅ 推荐用于 SDF 流体表面

## 关键概念
- Signed Distance Function (SDF)
- Geometric constraints / 几何约束
- Consistent interpolation / 一致性插值
- Pseudo-SDF repair

## URL
- Paper: https://arxiv.org/abs/2605.01919
- PDF: https://arxiv.org/pdf/2605.01919
