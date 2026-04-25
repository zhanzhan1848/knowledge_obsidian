# 2604.21858: Meshless h-adaptive Solution for non-Newtonian Natural Convection

## 论文信息
- **arXiv ID**: 2604.21858v1
- **作者**: Miha Rot, Gregor Kosec
- **发表日期**: 2026-04-23
- **分类**: physics.flu-dyn, math.NA, physics.comp-ph
- **链接**: https://arxiv.org/abs/2604.21858
- **DOI**: 10.48550/arXiv.2604.21858

## 研究背景
非牛顿流体自然对流在自然界中广泛存在，血液是典型例子。剪切变稀行为导致粘度随剪切率增加而降低，形成更尖锐的流动结构。de Vahl Davis 测试用例是经典的差温矩形腔自然对流问题。

## 核心创新点

### 无网格 h-自适应方法
- 使用 RBF-FD (Radial Basis Function-generated Finite Difference) 方法
- 基于 3rd order polyharmonic splines + 2nd order monomial augmentation
- 模板大小 s=15
- 自适应离散化：根据局部变异性指标 δi^ℒ 调整节点密度
- 细化阈值 Γr 和去细化阈值 Γd 控制节点增减

### 变异性指标 (Variability Indicator)
```
δi^ℒ = max_{j∈Si} |ℒu_i - ℒu_j| / avg_{j∈Si} |ℒu_j|
```
归一化指标使指示器在不同值域都适用。

### 控制方程
- 质量守恒: ∇·v = 0
- 动量守恒 (Ostwald-de Waele power-law 模型):
  η = η0 (½‖∇v+(∇v)^T‖)^((n-1)/2)
- 能量守恒: ρcp DT/Dt = ∇·(λ∇T)
- 非牛顿指数 n=0.6 (强剪切变稀)

### 无量纲数
- **Rayleigh数**: Ra = ρgβΔT L^(2n+1) / (α^n η0)
- **Prandtl数**: Pr = η0/(ρ) α^(n-2) L^(2-2n)
- **Nusselt数**: Nu = ∇T·n̂ / ((TH-TC)/L)

## 数值方法
- **离散化**: RBF-FD 无网格方法
- **压力-速度耦合**: 人工压缩性方法 (ACM)
- **时间积分**: 显式 Euler 法
- **自适应策略**: Shepard 插值 (3 neighbours 重构 h, 10 neighbours 重构场值)
- **节点密度梯度约束**: ‖∇h‖ < Δ = 0.05
- **细化因子**: k=1.5

## 实验结果
- de Vahl Davis 案例: Ra=10^5, Pr=100
- 球形腔案例: Ra=10^6, Pr=100
- 自适应方法在保持精度的同时显著降低计算成本

## 可行性分析
🥢 可行性分析：非牛顿流体自然对流无网格自适应模拟

## 控制方程
- 连续性方程 (不可压)
- 动量方程 (Power-law 非牛顿粘度)
- 能量方程
- Ostwald-de Waele 模型

## 数值方法
- 离散化：RBF-FD 无网格方法
- 求解器：显式 Euler + ACM
- 稳定性：显式方法受 CFL 约束

## 计算成本
- 网格需求：动态调整，h_min=10^-3
- 时间步长：由显式稳定性决定
- 并行性：适合 MPI 并行

## 推荐结论
✅ 推荐实现

无网格方法天然适合自适应，自适应策略有效降低计算量。RBF-FD 在此类问题有成熟应用。

## 标签
#meshless #RBF-FD #non-Newtonian #natural-convection #h-adaptivity #CFD