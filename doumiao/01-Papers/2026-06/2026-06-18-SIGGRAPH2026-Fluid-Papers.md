# SIGGRAPH 2026 流体渲染相关论文

> 收集日期: 2026-06-18
> 来源: SIGGRAPH 2026 Technical Papers

---

## 1. Mixwell: Sharp 2D Fluid Brushes for Progressive Physics-Based Mixing

**奖项:** Best Paper  
**类别:** 流体模拟 / 渲染  
**关键词:** fluid mixing, 2D brushes, GPU-accelerated, progressive physics

### 核心创新
- 提出**锐利的2D流体画笔**概念
- GPU加速的解析方法实现**渐进式、分辨率无关**的物理流体混合
- 基于**圆柱势流(potential flow around cylindrical tines)**推导
- 每个采样点独立计算漂移，无需网格或中间重采样

### 技术要点
- **数值耗散极低**: negligible numerical dissipation
- **实时性能**: real-time, arbitrary-resolution
- **无需网格**: 无网格或中间重采样

### 作者
Doug James, Ethan James

### 会议信息
- SIGGRAPH 2026
- Session: [papers_413](https://s2026.conference-schedule.org/presentation/?id=papers_413&sess=sess108)

### 评估
- **逼真度:** ⭐⭐⭐⭐⭐
- **实时性:** ✅ 支持实时
- **风格化支持:** 适合艺术化流体效果

### 适用场景
- 数字艺术/2D流体效果
- 实时流体混合演示
- 游戏中的流体效果

---

## 2. Spatiotemporal FLIP for Fast Free-Surface and Two-Phase Simulation With Very Large Time Steps

**奖项:** Honorable Mention  
**类别:** 流体模拟  
**关键词:** FLIP, free-surface, two-phase, large time steps

### 核心创新
- **时空FLIP方法**实现超大时间步长的自由表面和两相模拟
- 突破传统FLIP的时间步长限制
- 适合自由表面流动(free-surface)和两相流(two-phase)模拟

### 技术要点
- 支持超大时间步长
- 自由表面追踪
- 两相流模拟（气-液或液-液）

### 作者
Bernhard Braun, Rene Winchenbach, Jan Bender, Nils Thuerey

### 机构
- Bernhard Braun, Jan Bender: Technical University of Munich
- Rene Winachenbach: DKRZ (German Climate Computing Center)
- Nils Thuerey: Technical University of Munich

### 会议信息
- SIGGRAPH 2026

### 评估
- **逼真度:** ⭐⭐⭐⭐⭐
- **性能:** ⭐⭐⭐⭐⭐ 适合大规模模拟
- **实现难度:** 中等

### 适用场景
- 电影级流体特效
- 大规模液体模拟
- 工业流体仿真

---

## 3. LagrangianSplats: Divergence-Free Transport of Gaussian Primitives for Fluid Reconstruction

**类别:** 流体重建 / 粒子渲染  
**关键词:** Lagrangian, Gaussian primitives, divergence-free, fluid reconstruction

### 核心创新
- 使用**高斯原语(Gaussian primitives)**的拉格朗日传输
- **散度自由(divergence-free)**流场保证
- 用于流体重建

### 技术要点
- 基于拉格朗日粒子方法
- 高斯 splatting 表示
- 保证流场散度为零

### 会议信息
- SIGGRAPH 2026
- Time: 4:00 AM (arXiv cs.GR)

### 评估
- **逼真度:** ⭐⭐⭐⭐⭐
- **实时性:** 待评估
- **创新性:** 高

### 适用场景
- 流体捕捉重建
- 基于物理的渲染
- 粒子系统可视化

---

## 4. Fast VEM Fluid Simulation

**类别:** 流体模拟  
**关键词:** VEM (Virtual Element Method), fluid simulation

### 核心创新
- 快速VEM流体模拟方法
- 虚拟元方法的应用

### 会议信息
- SIGGRAPH 2026

### 评估
- **性能:** 高
- **精度:** 待评估

---

## 5. Buoyancy-driven Phase Separation in the Material Point Method

**类别:** 两相流 / MPM  
**关键词:** MPM, buoyancy, phase separation

### 核心创新
- 物质点法(MPM)中的浮力驱动相分离
- 适用于气-液或液-液两相流

### 会议信息
- SIGGRAPH 2026

---

## 6. Volume-Preserving LBM-MPM Coupling for Air-Water-Sand Mixtures

**类别:** 多相流 / 耦合方法  
**关键词:** LBM, MPM, volume-preserving, multi-phase

### 核心创新
- 格子玻尔兹曼(LBM)与物质点法(MPM)的耦合
- 保持体积守恒
- 适用于气-水-沙混合物

### 会议信息
- SIGGRAPH 2026

---

# arXiv 论文 (cs.GR)

## 7. Adaptive GPU Kinetic Solver for Fluid-Granular Flows

**arXiv:** [2603.14982](https://arxiv.org/abs/2603.14982)  
**日期:** 2026-03-16  
**类别:** 流体-颗粒耦合

### 核心创新
- **统一框架**: 耦合LBM(流体)与MPM(颗粒)模拟
- **自适应多级LBM求解器**: 基于固体几何结构的自适应分块多级HOME-LBM求解器
- **GPU加速**: 动态维护多级块以响应粒子运动

### 技术要点
- Lattice Boltzmann Method (LBM) 用于流体
- Material Point Method (MPM) 用于颗粒材料（沙、雪）
- 准确的M2F (MPM-to-Fluid) 双向耦合

### 应用场景
- 雪崩 (snow avalanches)
- 沙尘暴 (sandstorms)
- 沙滩迁移 (sand migration)

### 作者
Xingqiao Li 等

### 评估
- **逼真度:** ⭐⭐⭐⭐⭐
- **性能:** ⭐⭐⭐⭐⭐ GPU加速
- **适用性:** 大规模工业和自然现象

---

## 8. Blended Chart Surfaces: A Seamless Explicit Representation for Smooth Surface Fitting

**arXiv:** [2606.18069](https://arxiv.org/abs/2606.18069)  
**日期:** 2026-06-16  
**类别:** 曲面表示 / 几何处理

### 核心创新
- **紧凑、免网络、无参数化的显式表示**
- **全局光滑保证**
- 支持多种拓扑
- 可靠的微分量(法向量、表面能)访问
- 完全可微

### 技术要点
- 基于用户提供的粗略代理网格
- 联合优化每个代理顶点的多项式映射
- **一环坐标(one-ring coordinate)融合方案**消除接缝

### 与流体渲染的关系
- 可用于流体表面重建
- 提供高质量的曲面表示

### 作者
Romy Williamson

### 评估
- **逼真度:** ⭐⭐⭐⭐⭐
- **性能:** 优化效率高
- **可微性:** 完全可微

---

# 论文趋势分析

## 2026流体渲染技术趋势

### 1. 混合方法崛起
- LBM + MPM 耦合
- FLIP 改进方法
- 欧拉-拉格朗日结合

### 2. 实时化
- GPU加速成为标配
- 无网格方法受关注
- 分辨率无关性

### 3. 深度学习辅助
- 神经流体模拟
- 数据驱动重建

### 4. 表面表示进步
- 光滑曲面方法
- 高斯原语

---

# 下一步行动

- [ ] 深入分析 Mixwell 的技术细节
- [ ] 追踪 Spatiotemporal FLIP 的arXiv预印本
- [ ] 关注 LBM-MPM 耦合的开源实现

---

*笔记由 豆苗 (Doumiao) 自动生成于 2026-06-18*
