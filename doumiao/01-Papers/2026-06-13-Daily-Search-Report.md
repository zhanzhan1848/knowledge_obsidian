# 每日论文搜索报告

## 日期
2026-06-13 (Saturday)

## 搜索范围
- **arXiv cs.GR**: 计算机图形学
- **SIGGRAPH 2026**: 北美图形学会议
- **时间范围**: 最近 24 小时 - 1 周

## 搜索关键词
- fluid rendering
- water rendering  
- smoke rendering
- fire simulation
- ocean rendering
- particle system
- volume rendering

## 找到的论文

### arXiv (cs.GR / physics.flu-dyn)

| 论文 | arXiv ID | 分类 | 日期 |
|------|----------|------|------|
| XPR: An Extensible Cross-Platform Point-Based Differentiable Renderer | 2606.11529 | cs.GR | 2026-06-10 |
| Adaptive, efficient, and scalable water wave modeling | 2606.12162 | physics.flu-dyn | 2026-06-10 |

### SIGGRAPH 2026

| 论文 | 奖项 | 作者 |
|------|------|------|
| Mixwell: Sharp 2D Fluid Brushes | Best Paper | Doug James, Ethan James |
| Spatiotemporal FLIP for Fast Free-Surface | Honorable Mention | Bernhard Braun et al. |
| Volume-Preserving LBM-MPM Coupling | - | Mathieu Desbrun et al. |
| Fast VEM Fluid Simulation | - | Renbo Wu |
| Tube Maps: Fast SPH Boundary Handling | - | Columbia |

## 关键发现

### 1. XPR 框架
- 点云可微渲染的跨平台解决方案
- 支持 3DGS, 3DGUT, LinPrim
- 几百行 Python 代码实现
- XLA 编译器支持多硬件平台

### 2. 水波建模
- Serre-Green-Naghdi 方程 + 浅水方程混合
- GeoClaw 实现
- 2x 加速比

### 3. SIGGRAPH 2026 流体论文
- Mixwell 获得最佳论文奖
- 强调 GPU 加速和大时间步长
- 多相流模拟（空气-水-沙）

## 知识库更新
已创建以下笔记：
- `2026-06-13-XPR-Point-Based-Differentiable-Renderer.md`
- `2026-06-13-Water-Wave-Modeling-Dispersive-Hyperbolic.md`
- `2026-06-13-SIGGRAPH2026-Fluid-Papers.md`

## 后续工作
- [ ] 深入分析 Mixwell 的 cylindrical tines 势流方法
- [ ] 对比 XPR 与现有 3DGS 实现
- [ ] 追踪 Tube Maps SPH 边界处理技术

## 标签
#每日搜索 #arXiv #SIGGRAPH2026 #流体渲染