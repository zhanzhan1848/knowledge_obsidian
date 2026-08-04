# 每日论文搜索报告 — 2026-08-04

**Agent**: 菜心 (Caixin) — 流体力学专家  
**搜索时间**: 2026-08-04 14:08 UTC  
**搜索范围**: arXiv cs.FL, physics.flu-dyn (最近24小时)  
**关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 搜索结果概览

| 序号 | 论文标题 | arXiv ID | 领域 | 重要性 |
|------|----------|----------|------|--------|
| 1 | Aerodynamic Drag and Heat Transfer Corrections for Dehydrated Pollen Particles | 2608.02360 | CFD, pollen transport | ⭐⭐⭐ |
| 2 | Measurements of non-linear energy transfer in canonical and drag-reduced turbulent boundary layers | 2608.02003 | Turbulence, TBL | ⭐⭐⭐ |
| 3 | Quantum Vortices in a Boundary Layer: New Results and Perspectives | 2608.02057 | Quantum vortex, BL | ⭐⭐ |
| 4 | Leidenfrost droplets: The roles of ambient humidity and internal droplet circulation | 2608.01828 | Multiphase, Leidenfrost | ⭐⭐⭐ |

---

## 论文详情

### 1. 脱水泥花粉颗粒空气动力学 (2608.02360)

**核心**: 首次使用CFD模拟真实脱水泥花粉的曳力和换热特性  
**方法**: OpenFOAM rhoSimpleFoam, 层流 (Rep ≤ 15)  
**发现**: 干花粉曳力系数比球形假设高8%-15%，努塞尔数低5%-15%  
**工具**: [[OpenFOAM]], [[CFD]]

### 2. 湍流边界层非线性能量传输 (2608.02003)

**核心**: 3D-PTV测量完整Reynolds应力谱传输方程  
**方法**: 三维粒子追踪测速, Reτ ≈ 1020  
**发现**: 减阻(~38%)强烈抑制非线性传输并使其远离壁面  
**工具**: [[3D-PTV]], [[Spectral-method]]

### 3. 边界层量子涡旋 (2608.02057)

**核心**: 边界层理论适用量子涡旋模型  
**方法**: 新型涡旋细丝量子化方法  
**发现**: 逆有效质量为张量，可正可负  
**工具**: [[Vortex-method]], [[Quantum-vortex]]

### 4. Leidenfrost液滴湿度与内部流动 (2608.01828)

**核心**: DNS研究Leidenfrost液滴全生命周期（四个数量级半径）  
**方法**: 直接数值模拟，液滴内部N-S + 气相耦合  
**发现**: 环境湿度和内部流动显著影响几何形状；轴对称假设导致大液滴偏差  
**工具**: [[DNS]], [[Phase-change]]

---

## 归档位置

所有论文笔记已保存至:
```
~/knowledge-vault/caixin/01-Papers/
```

---

## 下一步

- [ ] 分析论文间的关联性
- [ ] 提取可复用的数值方法
- [ ] 更新相关概念笔记

---

*报告生成时间: 2026-08-04 14:08 UTC*
