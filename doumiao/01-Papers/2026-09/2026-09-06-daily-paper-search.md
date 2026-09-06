# 每日论文搜索报告 - 2026-09-06

## 搜索概要
- **时间**: 2026-09-06 14:04 UTC
- **搜索范围**: arXiv cs.GR, SIGGRAPH/SIGGRAPH Asia
- **关键词**: fluid rendering, water rendering, smoke rendering, fire simulation, ocean rendering, particle system, volume rendering

---

## 📄 新发现论文

### 1. Hamiltonian Two-Way Coupling of Nonlinear Waves and 3D Flows

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2608.25203](https://arxiv.org/abs/2608.25203) |
| **会议** | SIGGRAPH Asia 2026 (ACM Transactions on Graphics) |
| **作者** | Sinan Wang, Ruicheng Wang, Taiyuan Zhang, Fan Feng, Jinjin He, Yuchen Sun, Zhiqi Li, Bo Zhu |
| **日期** | 2026-08-25 |
| **DOI** | 10.1145/3842540 |

#### 核心创新点
**问题**: 大规模自由水面模拟通过耦合局部3D流体求解器和更便宜的2D表面模型实现，但传统2D波模型通常是线性或非色散的，与强非线性3D求解器耦合时会在2D-3D界面产生可见反射和伪影。

**解决方案**: 
- 引入基于规范 Zakharov 公式的非线性色散2D波模型
- 哈密顿结构：水面高度和表面势能形成规范对 (η, ψ)
- 实现了 canonically consistent 双向耦合方案

#### 技术指标
| 指标 | 数值 |
|------|------|
| 波高误差降低 | 1.7-5× (相比 SWE, BEM, Airy) |
| BEM 加速比 | >10³× |
| 完整系统加速 | >4× (相比纯 GPU NB-FLIP) |

#### 适用场景
- 海洋波浪模拟
- Kelvin 尾流测试
- 大规模水面渲染
- 实时流体-波交互

#### 关键公式/方法
- Zakharov  formulation: Hamiltonian structure with canonical pair (η, ψ)
- 2D-3D 双向耦合
- 3D Navier-Stokes 求解器集成

#### 相关链接
- PDF: https://arxiv.org/pdf/2608.25203
- HTML: https://arxiv.org/html/2608.25203v1

---

### 2. From Fixed Grids to Moving Particles: A Transferable Latent Operator for Fluid Dynamics

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2608.14120](https://arxiv.org/abs/2608.14120) |
| **作者** | Huaxi Huang 等 |
| **日期** | 2026-08-14 (v1), 2026-08-17 (v2) |
| **类别** | cs.LG, cs.AI, cs.GR |

#### 核心创新点
**问题**: 拉格朗日建模对流体动力学至关重要，但大多数神经算子在欧拉表示中训练和评估，这种不匹配限制了模型在粒子系统上的零样本泛化能力。

**解决方案 - Transferable Latent Operator (TLO)**:
- 学习欧拉场预测和拉格朗日粒子 rollout 共享的统一流表示
- 将潜在流演化与坐标依赖解码解耦
- 在固定空间坐标查询 → 欧拉场
- 在粒子位置查询速度 + 递归更新 → 拉格朗日 rollout

#### 技术贡献
- 零样本从欧拉预测泛化到拉格朗日粒子 rollout
- 无需拉格朗日监督或任务特定适应
- 在 5 个流体动力学基准上持续优于现有神经算子
- 有限拉格朗日微调可进一步提升

#### 适用场景
- 粒子系统渲染
- 流体动画
- 欧拉-拉格朗日混合模拟
- 神经流体模拟

#### 相关链接
- PDF: https://arxiv.org/pdf/2608.14120v2
- HTML: https://arxiv.org/html/2608.14120v2

---

### 3. Projective Affine Body Dynamics for Multibody Systems

| 属性 | 内容 |
|------|------|
| **arXiv ID** | [2609.02675](https://arxiv.org/abs/2609.02675) |
| **作者** | Xiaowei He 等 |
| **日期** | 2026-09-02 |
| **类别** | cs.GR |

#### 核心创新点
**问题**: 多体系统应用广泛，但处理非光滑接触、可变形关节的非线性和并行化挑战复杂。

**解决方案**:
- 在仿射体动力学内引入稳定且高度并行的 GPU 算法
- 将约束多体动力学重新表述为变分形式
- 使用 peridynamic bonds 连接仿射体
- 半隐式逐次代换法求解非线性优化
- 无需组装全局 Hessian，适合 GPU 高效实现

#### 适用场景
- 刚体-柔性体交互模拟
- 实时物理仿真
- 机器人、娱乐、动画
- 接触、关节约束、摩擦

#### 相关链接
- PDF: https://arxiv.org/pdf/2609.02675

---

## 📊 搜索统计

| 指标 | 数量 |
|------|------|
| cs.GR 总论文 | ~9702 |
| 流体相关论文 (cs.GR) | ~1162 |
| 最近24小时新发现 | 3 篇 |
| SIGGRAPH Asia 2026 | 1 篇 |

---

## 🏷️ 标签分类

- [[水面渲染]] - Hamiltonian Wave Coupling
- [[流体模拟]] - TLO, Projective Affine Body
- [[粒子系统]] - TLO
- [[欧拉-拉格朗日]] - TLO
- [[GPU并行计算]] - Projective Affine Body
- [[SIGGRAPH Asia 2026]] - Hamiltonian Wave Coupling

---

## 📅 下次搜索
- 2026-09-07 02:00 UTC

---

*由 豆苗 (Doumiao) 自动生成 - 流体渲染知识研究专家*
