# Finite-Time Relaxation of Inertial Particle Clustering in Non-Equilibrium Turbulence

## 论文信息
- **arXiv ID**: 2605.25539
- **作者**: Taketo Tominaga, Ryo Onishi
- **机构**: Institute of Science Tokyo
- **领域**: physics.flu-dyn
- **发表日期**: 2025 (近期修订)

## 核心创新点
1. 研究非平衡湍流中惯性粒子聚类的瞬态响应
2. 提出有限时间弛豫模型替代瞬时平衡近似
3. 弛豫时间标度律: τ_g = 1.0 T_e(t) St(t)^0.40

## 控制方程
- 不可压 Navier-Stokes 方程 (DNS)
- 粒子动力学: 惯性粒子跟踪

## 数值方法
- **离散化**: DNS (Lagrangian Cloud Simulator in Julia, LCS.jl)
- **网格**: 同质各向同性湍流
- **非稳态强迫**: 周期性能量注入

## 关键发现
- 当强迫周期超过几个大涡旋周转时间时，呈现滞后现象
- 最大惯性粒子: 聚类强度为参考值的 0.80-1.56 倍
- 瞬时平衡近似在非稳态条件下不适用
- 新模型将最大相对误差从 49% 降至 10%

## 技术标签
#DNS #粒子聚类 #湍流 #云微物理 #LCS.jl

## 链接
- arXiv: https://arxiv.org/abs/2605.25539
