# 每日论文搜索报告 — 2026-06-18

**Agent**: 菜心 (Caixin)  
**搜索范围**: arXiv physics.flu-dyn (最近24小时)  
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence  
**执行时间**: 2026-06-18 14:07 UTC

---

## 📊 搜索概览

| 类别 | 24h 内论文数 | 筛选后相关数 |
|------|------------|------------|
| physics.flu-dyn | 12 | 5 |
| cs.FL | 1 | 0 (形式语言理论，不相关) |

---

## 📄 新增论文笔记 (5篇)

### 1. APU-Accelerated Large Eddy Simulation with GALÆXI
- **ID**: [2606.18927](https://arxiv.org/abs/2606.18927)
- **领域**: HPC CFD / LES / DGSEM
- **亮点**: AMD MI300A APU 加速间断 Galerkin 求解器 + 壁面建模 LES，跨音速压气机级联验证
- **Tags**: #LES #DGSEM #GPU #HPC

### 2. Intermittency in Shell Models of Turbulent Cascades
- **ID**: [2606.18995](https://arxiv.org/abs/2606.18995)
- **领域**: 湍流理论 / 间歇性
- **亮点**: 多分支壳模型增强间歇性，乘性子级联，大偏差估计
- **Tags**: #湍流 #间歇性 #Shell模型

### 3. Multi-objective Bayesian Optimization of Nozzles for Pulsed Jet Propulsion
- **ID**: [2606.19252](https://arxiv.org/abs/2606.19252)
- **领域**: 流固耦合 / 优化 / 推进
- **亮点**: 柔性喷嘴冲量/能量比刚性高1.8倍，贝叶斯优化 + 3D FSI
- **Tags**: #FSI #贝叶斯优化 #脉冲射流 #柔性结构

### 4. Response of TBL to Synthetic Periodic Large-Scale Structure
- **ID**: [2606.18602](https://arxiv.org/abs/2606.18602)
- **领域**: 湍流边界层 / 实验
- **亮点**: 等离子体致动器引入合成 LSS，实验验证"自上而下"湍流调制机制
- **Tags**: #TBL #大尺度结构 #实验 #PIV

### 5. Newtonian Couette Flow with Dynamic Wall Slip — PINN vs DeepONet
- **ID**: [2606.18499](https://arxiv.org/abs/2606.18499)
- **领域**: 机器学习求解 PDE
- **亮点**: DeepONet 比 PINN 推理速度快 540X，强泛化能力
- **Tags**: #PINN #DeepONet #Couette流 #操作符学习

---

## 📋 其他检测到的论文 (不满足关键词或领域不匹配)

| ID | 标题 | 不匹配原因 |
|----|------|----------|
| 2606.19018 | Global branches of Stokes waves | 理论水波，偏离 CFD/计算 |
| 2606.18838 | Bow shock-induced 3D separation | 激波边界层干扰，可压缩流 |
| 2606.18618 | Weak shock reflection at glancing incidence | 理论激波反射 |
| 2606.19098 | cross-list cond-mat.soft | 非相关交叉列表 |
| 2606.19251 | cross-list physics.comp-ph | 非相关 |

---

## 🔬 本日研究趋势

1. **GPU/异构计算 + LES** 成为 HPC CFD 热点（AMD MI300A 应用）
2. **机器学习代理模型** 在流动求解中表现突出（DeepONet 540X 加速）
3. **湍流间歇性** 仍是湍流理论研究的核心问题
4. **流固耦合优化** 在推进系统设计中应用增多

---

## 📁 知识库更新

```
caixin/01-Papers/
├── 2026-06-18-LES-DGSEM-GALEXI-APU-Accelerated.md
├── 2026-06-18-Turbulence-Shell-Model-Intermittency.md
├── 2026-06-18-Nozzle-Bayesian-Optimization-Pulsed-Jet-Propulsion.md
├── 2026-06-18-TBL-Synthetic-Large-Scale-Structure.md
├── 2026-06-18-Couette-Flow-PINN-DeepONet.md
└── 2026-06-18-daily-search-report.md
```

---

*由 菜心 (Caixin) 自动生成 | 2026-06-18*
