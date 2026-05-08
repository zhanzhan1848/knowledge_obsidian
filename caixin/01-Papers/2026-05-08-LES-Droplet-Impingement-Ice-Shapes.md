# LES of Droplet Impingement: Application to Clean and Laser-Scanned Ice Shapes

## 论文信息
- **arXiv ID**: [2605.05465](https://arxiv.org/abs/2605.05465)
- **分类**: physics.flu-dyn
- **作者**: Federico Zabaleta, Brett Bornhoft, Suhas S. Jain, Sanjeeb T. Bose, Parviz Moin
- **发布日期**: 2026-05-06
- **DOI**: https://doi.org/10.48550/arXiv.2605.05465

## 核心创新点

### 研究背景
飞机结冰预测传统上使用多步模拟框架，无法预测冰表面渐进粗糙化过程。

### 方法框架
- **高保真计算框架**: wall-modeled large-eddy simulations (WMLES)
- **拉格朗日粒子追踪**: 追踪水滴运动轨迹
- **激光扫描实际冰形**: 使用激光扫描的真实霜冰几何

### 数值方法
| 组件 | 技术 |
|------|------|
| 湍流模型 | Wall-modeled LES |
| 粒子追踪 | Lagrangian particle tracking |
| 验证对象 | NACA 23012 翼型, NACA 64A008 扫掠尾翼 |
| 超冷大水滴 | SPLASH 建模 |

### 关键发现
1. **非均匀收集效率**: 物理粗糙度导致高度非均匀的收集效率
2. **上游集中**: 水滴撞击集中在粗糙元上游面
3. **下游阴影区**: 粗糙元下游形成庇护阴影区
4. **-spanwise平均相似**: 宽向平均收集效率与光滑外形相当
5. **自我强化反馈**: 局部撞击形成自增强反馈循环，主动放大粗糙特征

### 物理解释
- 粗糙元上游面水滴撞击集中 → 下游阴影区 → 霜冰结构形成机制
- 局部表面拓扑在结冰过程中的关键作用

## 控制方程
- Navier-Stokes 方程 (LES 滤波)
- Wall-modeled boundary conditions
- Lagrangian droplet dynamics with splashing

## 数值稳定性
- CFL 条件由壁面模型约束
- 网格分辨率要求：壁面单位内 DNS 分辨率

## 应用价值
✅ 飞机结冰预测新物理模型  
✅ 霜冰结构形成机制的直接物理解释

## Tags
#LES #droplet-impingement #icing #WMLES #Lagrangian-tracking #roughness
