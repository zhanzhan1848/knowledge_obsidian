# 每日几何处理论文收集报告

**日期**: 2026-05-04
**时间**: 14:06 UTC
**执行人**: wawaicai (娃娃菜)

## 搜索范围
- arXiv cs.GR (最近一周)
- 相关交叉列表 (cs.CV, cs.LG, etc.)
- SIGGRAPH/SIGGRAPH Asia/Eurographics 2026 论文

## 关键词
mesh processing, geometry processing, point cloud, subdivision surface, parametrization, remeshing, simplification

---

## 新增论文 (6 篇)

| # | 论文 | 标签 | 推荐度 |
|---|------|------|--------|
| 1 | P2M++ (2605.00429) - 点到网格距离查询加速 | 几何, 加速算法 | ✅ |
| 2 | SQuadGen (2604.27329) - Chart Distance Fields 生成简单四边形布局 | 几何, 重网格化, SIGGRAPH 2026 | ✅ |
| 3 | GMT (2604.26518) - 几何多重网格 Transformer 求解器 | 神经求解器, SIGGRAPH 2026 | ✅ |
| 4 | Surface-Aware GS (2605.00569) - 几何精确网格重建 | 3DGS, 网格重建 | ✅ |
| 5 | SAND (2604.25936) - 神经隐式曲面快速采样 | 神经隐式, 加速 | ✅ |
| 6 | FieryGS (2605.00177) - 物理集成高斯泼溅火焰合成 | 3DGS, 物理模拟 | ⚠️ |

---

## 重点论文摘要

### 🥇 SQuadGen (SIGGRAPH 2026 Journal Track)
**Generating Simple Quad Layouts via Chart Distance Fields**

- 问题：3D 形状缺乏简单四边形网格布局
- 方法：提出 Chart Distance Fields (CDF) 连续表示 + 扩散模型
- 结果：产生鲁棒、艺术家友好的简单四边形布局
- 链接：https://youkang-kong.github.io/squadgen/

### 🥇 GMT (SIGGRAPH 2026 Journal Track)
**Geometric Multigrid Transformer for Microstructure Homogenization**

- 问题：晶格超材料均匀化评估计算成本高
- 方法：Point Transformer V3 + 稀疏 GMG 层次结构
- 结果：10^-5 残差误差，160x 加速
- 链接：项目页面待确认

### 🥇 P2M++ 
**Enhanced Solver for Point-to-Mesh Distance Queries**

- 问题：现有 Voronoi 定位方法预计算成本高，旋转对称结构扩展性差
- 方法：自适应辅助站点 + BVH 碰撞检测 + 递归动态规划
- 结果：预处理 3-10x 加速，查询 1.5x 加速

### 🥇 SAND
**Spatially Adaptive Network Depth for Neural Implicit Surfaces**

- 问题：神经隐式模型对所有点使用相同网络深度
- 方法：volumetric depth map + T-MLP
- 结果：显著提升推理速度

---

## 几何领域趋势观察

1. **Gaussian Splatting 持续火热**
   - Surface-Aware GS, FieryGS 等持续涌现
   - 与几何处理结合成为热点

2. **神经求解器崛起**
   - GMT 等神经多重网格方法
   - 精度与速度兼得

3. **扩散模型应用于几何**
   - SQuadGen 用扩散生成四边形布局
   - 连续表示 (CDF) 解决离散连通性问题

4. **自适应计算**
   - SAND 的空间自适应网络深度
   - P2M++ 的自适应辅助站点

---

## 待办事项
- [ ] 跟进 SQuadGen 开源代码发布
- [ ] 评估 GMT 在特定场景的实用性
- [ ] 分析 P2M++ 与 libigl 的潜在集成

---

## Git 同步
状态: 已同步至 GitHub