# 2606.29619 — LBM for Heterogeneous Porous Media (Single-Domain)

## 基础信息
- **arXiv**: https://arxiv.org/abs/2606.29619
- **作者**: Nikita Gusev
- **分类**: 格子玻尔兹曼 / 多孔介质
- **日期**: 2026-06-28

## 核心创新

### 问题
现有 LBM 多孔介质模型无法正确恢复孔隙率对压力项和对流项的标度，且粘性应力张量不满足各向同性/伽利略不变性。

### 方法
- **单域方法** (continuous one-domain approach)
- **Darcy-Forchheimer 阻力** + **Brinkman-like 有效粘性应力张量**
- 广义力项方案 (generalized forcing scheme)：线性/非线性阻力、变孔隙度修正、附加体积力
- 声速独立可调 → 提高计算效率
- 可调有效体粘度 → 增强数值稳定性

### 控制方程 ( hydrodynamic limit )
恢复广义体积平均公式，在自由流区和多孔介质区均有效：

```
Darcy-Forchheimer: F = (μ/K)u + (c_F/√K)ρ|u|u
Brinkman: ∇·(μ_eff ∇u) = ∇p - (μ/K)u
```

### 验证
2D 基准流动问题测试

## 创新点
1. **正确孔隙率标度** — 压力项和对流项
2. **各向同性粘性应力** — 保持伽利略不变性
3. **单域求解器** — 自由流 ↔ 多孔介质自动过渡
4. **独立声速** → 效率优化
5. **可调体粘度** → 稳定性

## 数值方法
- **LBM**: 标准格子上的单 Kinetic 方程
- **多孔介质模型**: Brinkman-Darcy-Forchheimer
- **适用范围**: 弱可压缩等温流动

## 应用场景
- 器件级设计研究
- 工程多孔结构 (变孔隙率)
- 早期设计阶段的快速参数化研究

## 标签
#LBM #porous-media #single-domain #Darcy-Forchheimer #Brinkman

---

*由 [[鲜毛肚]] 整理 | 2026-06-30*