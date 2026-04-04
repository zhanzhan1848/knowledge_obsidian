# 每日论文搜索报告 — 2026-04-04

## 搜索配置
- **搜索时间**: 2026-04-04 14:10 UTC
- **搜索范围**: arXiv `physics.flu-dyn` 最近24小时新发表论文
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

## 搜索结果概览

| 分类 | 数量 |
|------|------|
| physics.flu-dyn 新增 (Apr 3) | 8 篇 |
| 跨学科列表 (Apr 1-2) | 2 篇 |
| **总计相关论文** | **7 篇** |

## 关键词匹配分析

### 🔥 高相关度论文

#### 1. arXiv:2604.01968 — PINNs 守恒性 vs 非守恒形式
- **主题**: 非守恒 PINNs 在 CFD 中的失效及路径积分修复
- **方法**: PINNs-AWV, PI-PINN, DLM 理论
- **方程**: Euler 方程, 浅水方程, Sod 激波管
- **创新点**: 揭示非守恒 PINNs 在瞬态高速流动中的失效机制, 提出路径积分框架
- **链接**: https://arxiv.org/abs/2604.01968

#### 2. arXiv:2604.01800 — 非均匀Cartesian网格上的深度学习 Navier-Stokes
- **主题**: HyDEA 扩展至非均匀 Cartesian 网格加速不可压 N-S 求解
- **方法**: Mesh-Conv (MConv) 算子, U-Net, 深度算子网络 (DeepONet)
- **创新点**: 多层距离向量图构造策略, 浸入边界投影法解耦
- **链接**: https://arxiv.org/abs/2604.01800

#### 3. arXiv:2604.01377 — 多原子气体 Shakhov-BGK 模型
- **主题**: SBGK 模型扩展至多原子分子气体混合物
- **方法**: PICLas, Shakhov-BGK, DSMC 对比验证
- **创新点**: Prandtl 数参数推导, 70° 钝头锥高超音速流动精确激波捕捉
- **链接**: https://arxiv.org/abs/2604.01377

#### 4. arXiv:2604.02124 — VarMiON 瞬态粘性流动
- **主题**: 变分拟算子网络 (VarMiON) 求解瞬态粘性流动
- **方法**: 算子网络 + 变分 formulation, 时空近似
- **创新点**: 从椭圆问题扩展至 Navier-Stokes 瞬态 Stokes 问题
- **链接**: https://arxiv.org/abs/2604.02124

#### 5. arXiv:2604.01292 — 约束流动的分支路径统计
- **主题**: Navier-Stokes 非线性输运的分支随机过程表示
- **方法**: 连续分支过程, 后向 Monte Carlo 算法
- **创新点**: 将分支表示扩展至强非线性 N-S 流动, 约束域流高效模拟
- **链接**: https://arxiv.org/abs/2604.01292

#### 6. arXiv:2604.01718 — 湍流全谱小尺度发电机
- **主题**: Kazantsev 方程小尺度发电机系数计算
- **方法**: 磁流体湍流谱计算, Re up to 10⁸
- **创新点**: 发现 Rm_c ≈ 300 阈值饱和, Pm 对磁能谱的影响机制
- **链接**: https://arxiv.org/abs/2604.01718

#### 7. arXiv:2604.00668 — 矩保持粒子合并算法
- **主题**: 稀薄气体动力学中的矩保持粒子合并
- **方法**: 非负最小二乘 (NNLS), 精确/近似碰撞率保持
- **创新点**: 任意速度和空间矩保持, 显著降低 DSMC 合并误差
- **链接**: https://arxiv.org/abs/2604.00668

### 📋 次相关论文 (记录但不深度分析)

- **2604.01185** — 聚电解质吸附与接触线失稳 (非牛顿液滴)
- **2604.01380** — 快速旋转内部加热对流理论界限
- **2604.01692** — 无偏好方向漂浮体 Zindler 曲线 (静力学)
- **2604.01788** — 复合泡沫肋流场 PEM 燃料电池 (工程应用)

## 本日技术趋势

1. **Physics-Informed Neural Networks (PINNs)**: 持续活跃, 关注守恒性/非守恒形式的选择问题
2. **深度学习加速 CFD**: Mesh-Conv 算子处理非均匀网格, DeepONet 家族扩展
3. **稀薄气体动理学**: BGK 模型向多原子分子和多组分扩展, 与 DSMC 对比验证
4. **算子学习方法**: VarMiON 将变分结构引入神经算子, 覆盖瞬态 Stokes 流动
5. **Monte Carlo 方法**: 分支路径表示为高维 N-S 提供新的概率计算框架

## 笔记文件

- `2026-04-04-PINNs-Conservativeness-Path-Integral.md`
- `2026-04-04-DeepONet-Nonuniform-Grid-Navier-Stokes.md`
- `2026-04-04-Shakhov-BGK-Polyatomic-Gas.md`
- `2026-04-04-Branching-Paths-Navier-Stokes.md`
- `2026-04-04-VarMiON-Transient-Viscous-Flows.md`
- `2026-04-04-Small-Scale-Dynamo-Turbulence.md`
- `2026-04-04-Moment-Preserving-Particle-Merging.md`

---
*🥬 鲜毛肚 · 流体力学专家 Agent · 2026-04-04*
