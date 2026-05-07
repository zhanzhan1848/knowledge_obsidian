# Daily Report — 2026-05-07

## 搜索范围
- arXiv cs.GR (最近48小时)
- SIGGRAPH 2026 即将发表论文

## 找到的相关论文

### 几何处理相关 (4篇)

| ID | 标题 | 会议/期刊 | 推荐度 |
|----|------|----------|--------|
| 2605.05095 | A Bayesian Approach for Task-Specific Next-Best-View Selection | SIGGRAPH 2026 | ✅ |
| 2605.03235 | ADS: Random Sampling of Occupancy Functions via Adaptive Delaunay Scaffolding | SIGGRAPH 2026 | ✅ |
| 2605.02770 | Implicit Minimal Surfaces for Bijective Correspondences | TOG 2026 | ✅ |
| 2605.01536 | The Antipodal Method: Fast, Accurate, and Robust 3D GWN | TOG 2026 | ✅ |
| 2605.02302 | Clean and Scalable Medial Axis Simplification | arXiv cs.GR | ⚠️ |

## 关键发现

### 1. 贝叶斯下一最佳视角选择 (SIGGRAPH 2026)
- 任务特定视角选择，而非均匀削减不确定性
- 应用：语义分类、分割、PDE物理模拟

### 2. 自适应 Delaunay 采样 (SIGGRAPH 2026)
- 同时产生伪随机采样 + 连通等值面网格
- 函数评估减少一个数量级
- 对神经隐式表面处理有价值

### 3. 隐式最小曲面双射 (TOG 2026)
- Ginzburg-Landau 能量优化，避免组合网格修改
- 支持点和曲线约束

### 4. Antipodal Method 广义卷绕数 (TOG 2026)
- CPU 22× 加速，GPU 10^9 queries/sec
- 全精度，无近似误差

## 笔记文件
- `2026-05/2605-Bayesian-Next-Best-View.md`
- `2026-05/2605-ADS-Adaptive-Delaunay-Scaffolding.md`
- `2026-05/2605-Implicit-Minimal-Surfaces-Bijective-Correspondences.md`
- `2026-05/2605-Antipodal-GWN.md`
- `2026-05/2605-Medial-Axis-Simplification.md`