# 📊 每日流体力学论文搜索报告 - 2026-03-12

**搜索时间**: 2026-03-12 14:06 UTC  
**搜索范围**: arXiv physics.flu-dyn, cs.FL  
**时间窗口**: 最近24小时  

---

## 📈 搜索统计

- **physics.flu-dyn 新论文**: 7篇
- **cs.FL 新论文**: 2篇
- **总计处理**: 7篇（筛选后）
- **关键词匹配**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence

---

## 🎯 今日亮点

### 1. **机器学习 + CFD** 🤖
**[[2026-03-12-diffusion-models-physics-fields]]** - 将去噪扩散模型（DDPM）和潜在扩散模型（LDM）应用于物理场预测，涵盖热扩散到高超音速流动。这是深度学习在CFD领域的重要进展。

### 2. **多相流方法突破** 💧
**[[2026-03-12-sharp-conservative-VOF-3D]]** - 首次建立全几何守恒VOF方案，能够在任意复杂3D表面上准确解析接触线动力学，引入接触角迟滞模型。

### 3. **激波管实验精度提升** 💨
**[[2026-03-12-shock-tube-thermodynamic-gradients]]** - 结合RANS-LES和实验量化激波管中的热力学非均匀性，为化学动力学测量提供更准确的基准。

---

## 📚 论文列表

### 数值方法与方法论

1. **[[2026-03-12-fkl-transform-wedge-flows]]** - Fourier-Kontorovich-Lebedev 变换用于楔形流
   - **类别**: 谱方法, Stokes 流
   - **应用**: 微流体器件, 角几何
   - **标签**: #SpectralMethods #Microfluidics

2. **[[2026-03-12-sharp-conservative-VOF-3D]]** - 3D 尖锐守恒VOF方法
   - **类别**: VOF, 多相流
   - **创新**: 无CFL限制, 接触角迟滞
   - **标签**: #VOF #ContactLine #MultiphaseFlow

### 机器学习与数据驱动

3. **[[2026-03-12-diffusion-models-physics-fields]]** - 扩散模型用于物理场模拟
   - **类别**: 深度学习, 降阶建模
   - **验证**: 热扩散, 翼型绕流, 高超音速
   - **标签**: #MachineLearning #DiffusionModels #CFD

### 燃烧与化学反应流

4. **[[2026-03-12-kinetics-uncertainty-mapping]]** - 化学动力学不确定性映射
   - **类别**: 不确定性量化, 燃烧
   - **方法**: 简化流形 + UQ
   - **标签**: #ChemicalKinetics #UQ #Combustion

5. **[[2026-03-12-shock-tube-thermodynamic-gradients]]** - 激波管热力学非均匀性
   - **类别**: 激波管, RANS-LES
   - **发现**: 测试气体依赖的梯度特性
   - **标签**: #ShockTube #ChemicalKinetics

### 生物流体与物理

6. **[[2026-03-12-ciliary-transport-inertial-coasting]]** - 纤毛惯性滑行传输
   - **类别**: 生物流体, 中等雷诺数
   - **创新**: Pufflets 概念, 惯性冲浪
   - **标签**: #BiologicalFluids #Cilia #InertialEffects

### 理论与数学

7. **[[2026-03-12-gravity-water-wave-kinetic]]** - 重力水波动能方程
   - **类别**: 弱湍流, PDE分析
   - **成果**: L¹ 强解存在性证明
   - **标签**: #WaterWaves #WeakTurbulence #PDE

---

## 🔍 研究趋势分析

### 热门方向
1. **机器学习驱动CFD** - 扩散模型、生成模型应用
2. **多相流高精度方法** - VOF、接触线动力学
3. **不确定性量化** - 化学动力学、燃烧模拟

### 方法创新
- **混合方法**: RANS-LES 耦合
- **智能降维**: 潜在空间扩散
- **严格守恒**: 几何VOF + 嵌入边界

---

## 📌 重点关注

### 对CFD工程师
- **扩散模型**可用于快速流场预测
- **VOF新方法**提升多相流精度
- **激波管研究**改进实验基准

### 对研究人员
- **FKL变换**提供楔形流解析工具
- **化学UQ**支持燃烧模拟可靠性
- **弱湍流理论**深化波动力学理解

---

## 🔗 快速导航

### 按应用领域
- **微流体**: [[2026-03-12-fkl-transform-wedge-flows]]
- **多相流**: [[2026-03-12-sharp-conservative-VOF-3D]]
- **燃烧**: [[2026-03-12-kinetics-uncertainty-mapping]], [[2026-03-12-shock-tube-thermodynamic-gradients]]
- **高超音速**: [[2026-03-12-diffusion-models-physics-fields]]
- **生物流体**: [[2026-03-12-ciliary-transport-inertial-coasting]]
- **海洋工程**: [[2026-03-12-gravity-water-wave-kinetic]]

### 按数值方法
- **谱方法**: [[2026-03-12-fkl-transform-wedge-flows]]
- **VOF**: [[2026-03-12-sharp-conservative-VOF-3D]]
- **深度学习**: [[2026-03-12-diffusion-models-physics-fields]]
- **RANS-LES**: [[2026-03-12-shock-tube-thermodynamic-gradients]]
- **UQ方法**: [[2026-03-12-kinetics-uncertainty-mapping]]

---

## ✅ 任务完成状态

- [x] arXiv physics.flu-dyn 搜索
- [x] arXiv cs.FL 搜索
- [x] 论文信息抓取（7篇）
- [x] 结构化笔记创建（7篇）
- [x] 每日报告生成
- [ ] Git 同步到 GitHub

---

**生成时间**: 2026-03-12 14:08 UTC  
**Agent**: 菜心 (Caixin) 🥬  
**下次运行**: 2026-03-13 22:00 UTC
