# 每日 arXiv 流体力学论文搜索报告

**日期**: 2026-04-07  
**搜索范围**: arXiv physics.flu-dyn, cs.FL  
**搜索时间**: 14:09 UTC

---

## 搜索统计

- **搜索关键词**: CFD, fluid simulation, navier-stokes, SPH, LBM, vortex method, turbulence
- **本次发现相关论文**: 6 篇
- **涵盖主题**: 多相流、湍流、CFD、燃烧、流动稳定性

---

## 论文列表

### 1. 表面访问限制：多孔单体催化剂的性能诊断（孔解析CFD）
- **arXiv**: [2604.03514](https://arxiv.org/abs/2604.03514)
- **作者**: Olivier Guévremont et al.
- **日期**: 2026-04-03
- **关键词**: pore-resolved CFD, porous monolith, catalysis, mass transport
- **主题分类**: 多孔介质、多相流
- **摘要**: 使用孔解析计算流体动力学（PRCFD）研究催化多孔单体的表面访问限制问题。

---

### 2. 优先浓度对铁颗粒燃烧的影响（同质各向同性湍流数值研究）
- **arXiv**: [2604.04048](https://arxiv.org/abs/2604.04048)
- **作者**: Shyam Hemamalini et al.
- **日期**: 2026-04-05
- **关键词**: preferential concentration, iron combustion, DNS, isotropic turbulence, particle clustering
- **主题分类**: 湍流、燃烧、颗粒流
- **摘要**: 通过直接数值模拟（DNS）研究优先浓度对铁颗粒燃烧的影响。

---

### 3. 湍流通道流中的解析扭结型解和条纹形成
- **arXiv**: [2604.04180](https://arxiv.org/abs/2604.04180)
- **作者**: Alex Fedoseyev et al.
- **日期**: 2026-04-05
- **关键词**: turbulent channel flow, analytical solutions, streaks, wall-bounded turbulence
- **主题分类**: 湍流、流动稳定性
- **摘要**: 基于Alexeev流体方程建立湍流通道流的解析框架。

---

### 4. HYMOR：高超声速飞行器全局模态/非模态和响应分析开源包
- **arXiv**: [2604.03824](https://arxiv.org/abs/2604.03824)
- **作者**: Adrián Antón-Álvarez, Adrián Lozano-Durán
- **日期**: 2026-04-04
- **关键词**: hypersonic flow, linear stability analysis, modal analysis, open-source
- **主题分类**: 流动稳定性、高超声速流、开源软件
- **摘要**: 高超声速流动线性稳定性分析的开源工具箱，包含MATLAB和Julia实现。

---

### 5. 空化气泡与初始扰动自由表面的相互作用
- **arXiv**: [2604.04559](https://arxiv.org/abs/2604.04559)
- **作者**: Jingyu Gu et al.
- **日期**: 2026-04-06
- **关键词**: cavitation bubble, free surface, Rayleigh-Plesset equation, jetting
- **主题分类**: 空化、多相流、自由表面流
- **摘要**: 实验、数值和解析方法研究空化气泡与扰动自由表面的相互作用。

---

### 6. 基于全球高分辨率 radiosonde 数据的平流层湍流时空分布
- **arXiv**: [2604.04040](https://arxiv.org/abs/2604.04040)
- **作者**: Hongwei Sun et al.
- **日期**: 2026-04-05
- **关键词**: stratospheric turbulence, turbulence diffusivity, Richardson number, atmospheric flow
- **主题分类**: 大气湍流、流动稳定性
- **摘要**: 利用370个站点的高分辨率radiosonde数据估算平流层湍流扩散系数。

---

## 技术要点提炼

### 孔解析CFD (2604.03514)
- **方法**: 反应PRCFD + micro-CT几何 + pseudo-heterogeneous eggshell模型
- **关键发现**: 拓扑结构依赖的表面可及性决定反应器性能
- **应用**: 多孔反应器设计优化

### DNS + 优先浓度 (2604.04048)
- **方法**: 强制均匀各向同性湍流 + 粒子追踪
- **参数范围**: St=1,10,50; Re_λ=5,10,20
- **关键发现**: 聚类分布燃烧时间可延长8倍

### 解析湍流理论 (2604.04180)
- **方法**: 基于Alexeev方程的解析推导
- **适用范围**: 3×10³ ≤ Re ≤ 3.5×10⁷
- **创新点**: 扭结型解作为条纹结构的解析表示

---

## 后续建议

1. **孔解析CFD** 方法值得在多孔介质研究中应用
2. **HYMOR** 开源包可作为流动稳定性分析工具
3. **优先浓度** DNS研究对颗粒-湍流相互作用有参考价值

---

*报告生成: 2026-04-07 14:10 UTC*
