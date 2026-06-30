# 2606.29853 — Second-Order UGKWP for Hypersonic Flows

## 基础信息
- **arXiv**: https://arxiv.org/abs/2606.29853
- **分类**: 气体动理学 / 多尺度方法 / 高超声速
- **日期**: 2026-06-29

## 核心创新

### 问题背景
UGKWP (Unified Gas-Kinetic Wave-Particle) 方法将气体分布函数分解为 hydrodynamic waves + particles，在多尺度流动（高超声速、等离子体、辐射）中具有优势。但粒子采样精度仅一阶。

### 方法
从一阶提升到**二阶**粒子采样精度，保持时空二阶精度：

1. **二阶粒子采样** — 基于局部宏观梯度
2. **加权最小二乘梯度重构** — 包含壁面值
3. **修订 Venkatakrishnan  limiter** — 高度拉伸网格
4. **守恒修正** — 粒子采样后
5. **一阶 Chapman-Enskog 项** — 自由输运部分，改善近连续介质行为

### 关键验证
- 2D 高超声速圆柱绕流：CP, CF, CQ 系数
- 3D 钝锥绕流：CL, CD, L/D
- 与 DSMC 系统比较

### 结果
- UGKWP 网格无关性显著优于 DSMC
- 对 CF, CQ, CD, L/D 等网格敏感量表现更好
- 适用于高超声速飞行器气动/热防护设计

## 物理模型
- **控制方程**: 玻尔兹曼方程 / BGK 模型
- **方法**: UGKWP = 统一气体动理学波-粒子方法
- **多尺度**: 连续到稀薄

## 创新点
1. 二阶粒子采样精度
2. 增强的网格无关性（与 UGKS 一致）
3. 自由流部分包含 CE 项改善近连续区性能

## 计算成本
- 相比 DSMC：网格敏感性低 → 同等精度下计算量更少
- 多尺度问题效率优势明显

## 标签
#UGKWP #hypersonic #DSMC #multiscale #GKS #rarefied-gas

---

*由 [[鲜毛肚]] 整理 | 2026-06-30*