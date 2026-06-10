# 每日论文搜索报告 — 2026-06-10

## 搜索概况
- **时间范围**: 2026-06-09 ~ 2026-06-10 (UTC)
- **搜索源**: arXiv physics.flu-dyn
- **论文总数**: 34 篇 (最近48小时)
- **关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 高相关性论文列表

### 数值方法 (CFD)

| ID | 标题 | 方法 | 相关度 |
|----|------|------|--------|
| [[2606.09799]] | Sharp-interface IBM for moving bodies | 浸入边界法, 锐界面 | ⭐⭐⭐⭐⭐ |
| [[2606.10848]] | Data-driven surrogate models for fluid flows | U-Net, FNO, DMD | ⭐⭐⭐⭐ |
| [[2606.09044]] | Hybrid Generative ROM for Minimal Flow Unit | β-VAE-GAN, Transformer | ⭐⭐⭐⭐ |
| [[2606.10386]] | Baroclinic wave dynamics (OpenFOAM) | 有限体积, OpenFOAM | ⭐⭐⭐ |

### 湍流与分层流

| ID | 标题 | 方法 | 相关度 |
|----|------|------|--------|
| [[2606.09490]] | Scaling laws in stratified turbulent flows | DNS, Boussinesq | ⭐⭐⭐⭐ |
| [[2606.09044]] | Hybrid Generative ROM for wall turbulence | LES/ROM | ⭐⭐⭐⭐ |

### 多相流与微流动

| ID | 标题 | 方法 | 相关度 |
|----|------|------|--------|
| [[2606.08575]] | Rise regimes of droplets (moderate viscosity) | DNS, VOF | ⭐⭐⭐ |
| [[2606.10268]] | Rotation-to-translation in viscoelastic fluids | DNS, 非牛顿 | ⭐⭐⭐ |
| [[2606.10919]] | Flow in disordered porous media | 孔隙网络, Stokes | ⭐⭐⭐ |
| [[2606.10661]] | Microswimmers near a boundary | 力偶极子模型 | ⭐⭐⭐ |

### 其他

| ID | 标题 | 备注 |
|----|------|------|
| [[2606.11126]] | Oscillating hydrofoil energy harvester | 实验, PIV |
| [[2606.09333]] | Pulsating heat pipe (CASCO) | 热工水力 |

---

## 关键发现

1. **浸入边界法新进展** (2606.09799): 提出 sharp-interface IBM，结合双侧欧拉强迫策略和一致质量修正，保持二阶精度且计算高效

2. **数据驱动湍流建模** (2606.09044, 2606.10848): β-VAE-GAN + Transformer 在仅 128t⁺ 初始化窗口下实现 17,288t⁺ 预测；U-Net/FNO/DMD 在圆柱尾流 Re=590 测试

3. **分层湍流** (2606.09490): DNS 研究 Boussinesq 方程，发现 Buoyancy flux 呈强非高斯分布（峰度≈10²）

4. **OpenFOAM 应用** (2606.10386): 旋转矩形环腔体中双温梯度驱动的斜压波研究，Ri₀=99→1 时热通量增强一个量级

---

## 待深入阅读
- `2606.09799` — 锐界面 IBM (CFD 数值方法)
- `2606.09044` — 混合生成式 ROM (AI+CFD)
- `2606.09490` — 分层湍流标度律 (湍流建模)