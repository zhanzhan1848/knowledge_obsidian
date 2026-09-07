# VarFlexI: Aeroelastic Solver with Reformulated Vortex-Particle and FEM

## 基本信息

- **arXiv**: [2609.05243](https://arxiv.org/abs/2609.05243)
- **标题**: An Aeroelastic Solver Integrating Reformulated-Vortex-Particle and Finite-Element Methods across Non-Conforming Interfaces
- **作者**: (见论文)
- **日期**: 2026-09-07 (v1)
- **领域**: physics.flu-dyn, physics.comp-ph

## 核心创新

### 方法框架

**VarFlexI** (Variable Fidelity Unsteady Flow-FEniCS Exchange Interface) — 模块化气动弹性求解器：

1. **气动求解器**: Reformulated Vortex Particle Method (rVPM)
   - 求解不可压缩 Navier-Stokes 方程
   - **无需体积网格** (meshless)
   - 集成于 FLOWUnsteady 框架，支持变 fidelity 建模

2. **结构求解器**: Reissner-Mindlin 板有限元
   - 在 FEniCS 框架中实现
   - 广义-α 方法时间积分
   - Gauss-Newton 求解非线性平衡方程

3. **FSI 耦合**: 显式交错分步格式 (partitioned scheme)
   - 界面力与位移转移均满足虚功守恒
   - 非匹配网格界面通过公共中间界面处理
   - work-conservative force & reverse-geometry transfer

### 关键数值特点

```
rVPM 优势:
  - 无网格 → 避免网格生成成本
  - 涡粒子方法天然满足无散约束 (∇·u=0)
  - 适合大变形、自由表面、FSI 问题

FEM 优势:
  - 结构力学高精度
  - FEniCS 成熟开源生态

耦合策略:
  - 分区耦合（ staggered）→ 稳定性好
  - 守恒型界面转移 → 全局虚功守恒
```

## 验证案例

- 水洞实验验证（气动弹性响应）
- 灵敏度分析（不同流条件、结构参数、耦合参数）

## CFD 相关性

| 方面 | 评价 |
|------|------|
| 数值方法 | ⭐⭐⭐⭐⭐ 涡粒子法 + FEM + FSI |
| 物理场景 | ⭐⭐⭐⭐ 气动弹性、翼面振动 |
| 方法可迁移性 | ⭐⭐⭐⭐ 可推广至一般 FSI 问题 |
| 开源潜力 | 高 (FEniCS + FLOWUnsteady) |

## 关键公式（待补充）

VPM 速度重建：
```math
u(x) = \sum_{p} \Gamma_p G(x - x_p)
```
rVPM 在保持相同精度下减少计算量。

## 链接

- PDF: https://arxiv.org/pdf/2609.05243
- HTML: https://arxiv.org/html/2609.05243v1
