# arXiv 流体动力学日报 - 2026-03-20

> 📅 搜索日期: 2026-03-20  
> 📂 分类: physics.flu-dyn, cs.FL  
> 🔑 关键词: CFD, turbulence, Navier-Stokes, LES, DNS

## 今日新论文统计

| 分类 | 数量 |
|------|------|
| physics.flu-dyn | 18 篇 |
| cs.FL | 2 篇 |

---

## 🌟 重点推荐论文

### 1. [arXiv:2603.18913] Geometric Dynamics of Turbulence
**作者**: Alejandro Sevilla

**核心创新**: 
提出湍流的几何动力学理论，将 Reynolds 应力组织为涌现的振荡自由度。通过传播子的谱结构发现主导复共轭极点对，暗示与平均流耦合的有效振荡器。

**关键结果**:
- 壁面湍流: 近壁 Airy 结构通过非局部反馈稳定该模式，产生对数速度剖面
- von Kármán 常数: $\kappa \simeq 0.39$
- 均匀湍流: Kolmogorov 常数 $C_k = 2/[3(1-2^{-2/3})] \simeq 1.80$
- 相场与 Berry 相、Lumley 三角形各向异性演化相关

**技术要点**:
- 闭环三维平均场张量方程组
- 比 DNS 计算成本低但支持几何依赖的简化动力学
- 可解释为相互作用振荡器的分布式网络

**arXiv**: https://arxiv.org/abs/2603.18913

---

### 2. [arXiv:2603.19180] Reduction of Triadic Interactions Suppresses Intermittency and Anomalous Dissipation in Turbulence
**作者**: Anikat Kankaria

**核心创新**: 
研究三维湍流统计特性对 Fourier 空间三波相互作用网络系统减少的响应。

**关键发现**:
- 渐进削减活跃模态集 → 系统性抑制间歇性
- **重要**: 大雷诺数极限下平均耗散率趋于零
- 结构函数指数坍缩到量纲值
- 多分形奇异性谱收缩
- 从指数谱尾提取的解析宽度随削减单调增加

**结论**: 不可压缩湍流的异常耗散不是 Navier-Stokes 方程的通用性质，而是需要其三波非线性相互作用的完整组合丰富性。

**arXiv**: https://arxiv.org/abs/2603.19180

---

### 3. [arXiv:2603.18061] SIREN Residual Error as a Regularity Diagnostic for Navier-Stokes Equations
**作者**: Jason Burton

**核心创新**: 
使用正弦表示网络 (SIREN) 的逼近误差检测三维 Navier-Stokes 方程解的正则性损失。

**技术方法**:
- SIREN 使用 sin() 激活，产生 C∞ 输出，无法表示非光滑特征
- 误差界: O(N^{-s})，其中 s 是局部 Sobolev 正则性
- 在奇点处 (s→0)，误差为 O(1) 并通过 Gibbs 现象局部化
- 分解速度场: 解析基线 (对流-扩散) + 学习残差 (压力修正)
- 紧凑 SIREN: 4,867 参数

**验证结果**:
- 3D Taylor-Green 涡: 粘度从 0.01→0.0001，误差集中度从 4.9x→13.6x
- 轴对称方程: 重现爆破特征，识别临界粘度 $\nu_c = 0.00582$

**arXiv**: https://arxiv.org/abs/2603.18061

---

## 📋 其他重要论文

### 4. [arXiv:2603.19197] LES 氢气-空气火焰中的微分扩散与应变耦合
**主题**: 燃烧 CFD, LES, flamelet 热化学  
**创新**: 证明无拉伸 flamelet 热化学能捕获正应变引起的混合分数增加和负曲率引起的混合分数变化  
**应用**: 湍流氢气预混火焰燃烧建模简化  
**arXiv**: https://arxiv.org/abs/2603.19197

---

### 5. [arXiv:2603.18622] SU2 周期性翅片降阶湍流求解器
**主题**: CFD 软件, SU2, 热交换器  
**创新**: 实现流向周期湍流源项，用于等温壁面通道流  
**验证**: offset circular fins 层流和湍流条件下与完整阵列仿真一致  
**arXiv**: https://arxiv.org/abs/2603.18622

---

### 6. [arXiv:2603.18882] 磁对流尺度分析 (低磁雷诺数)
**主题**: MHD, Rayleigh-Bénard 对流, DNS  
**参数**: Ra=10⁶, Pr=1, Ha=0/20/40/80  
**发现**: Lorentz 力表现为各向同性汇，抑制中小尺度运动  
**arXiv**: https://arxiv.org/abs/2603.18882

---

### 7. [arXiv:2603.19125] Navier-Stokes 方程与多分形模型的数学关系
**主题**: 湍流理论, 多分形模型, Leray 弱解  
**创新**: 推导 Paladin-Vulpiani 逆尺度 $L\eta_{h,pav}^{-1} = Re^{1/(1+h)}$  
**范围**: $1 \leq m \leq \infty$ 等价于 $-2/3 \leq h_{min} \leq 1/3$  
**arXiv**: https://arxiv.org/abs/2603.19125

---

### 8. [arXiv:2603.19190] van der Waals 效应下的二维 Poiseuille 和 Couette 流功率谱
**主题**: 可压缩流, 非理想气体效应  
**发现**: 功率谱的物理机制主要存在于密度和速度散度变量中，与涡量无直接关系  
**arXiv**: https://arxiv.org/abs/2603.19190

---

### 9. [arXiv:2603.18302] 屈服应力材料的亚屈服动力学
**主题**: 非牛顿流体, 流变学  
**方法**: 平行叠加流变测量  
**结论**: 亚屈服区域由非线性粘弹性支撑，需要改进的本构关系  
**arXiv**: https://arxiv.org/abs/2603.18302

---

## 🔬 技术领域分布

| 领域 | 论文数 |
|------|--------|
| 湍流理论与建模 | 4 |
| CFD 数值方法 | 2 |
| 燃烧/反应流 | 1 |
| MHD/磁流体 | 1 |
| 非牛顿流体 | 1 |
| 机器学习/神经网络 | 2 |

---

## 📚 相关 Wiki 链接

- [[湍流模型/LES]]
- [[数值方法/DNS]]
- [[开源项目/SU2]]
- [[湍流理论/多分形模型]]

---

*由 Caixin Agent 自动生成 - 2026-03-20*
