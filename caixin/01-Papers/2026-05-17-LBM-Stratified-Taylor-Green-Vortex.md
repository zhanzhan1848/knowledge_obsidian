# Systematic Evaluation of Stencil Configuration, Forcing Scheme, and Resolution Effects in the Stratified Taylor--Green Vortex: A Lattice Boltzmann Study

> **arXiv**: [2605.14505](https://arxiv.org/abs/2605.14505) | **Date**: 2026-05-14 | **Author**: Hongxuan Zhang

## 核心创新点

- 系统评估 LBM（Lattice Boltzmann Method）对分层湍流（stratified turbulence）的预测能力
- 针对 **D3Q27×19** 双分布函数框架（Boussinesq近似）进行 stencil、forcing scheme、分辨率综合分析
- 发现 **D3Q27×19** 配置在精度与效率间达到最优平衡
- 强分层条件下，**velocity-shift forcing** 优于离散源项方法，误差降低约 **45.54%**
- 势能与细尺度湍流结构对分辨率敏感，**需至少 256³ 才能定量收敛**

## 数值方法

| 项目 | 详情 |
|------|------|
| 方法 | LBM (Lattice Boltzmann Method) |
| 框架 | Double-Distribution-Function (DDF)，Boussinesq近似 |
| Stencil | D3Q27×19（速度场27分布+温度场19分布） |
| 分辨率测试 | 最高 256³ |
| 验证基准 | Spectral DNS benchmarks |
| 应用场景 | 分层泰勒-格林涡 (Stratified Taylor-Green Vortex) |

## 关键发现

1. **Stencil  isotropy**: D3Q27 配置比 D3Q19 更适合各向异性分层流
2. **Forcing scheme**: velocity-shift 方案在强分层下性能显著优于 source-term 方案
3. **分辨率敏感性**: 
   - 动能 (KE) 收敛较快
   - 势能 (PE) 和细尺度湍流需 256³
4. **能量串级**: 准确捕获能量级串和混合动力学需要 stencil、分辨率、力离散化的协同选择

## 计算成本

- 最高分辨率: 256³ 节点
- 对比 spectral DNS 基准进行验证
- 双分布函数增加计算开销（速度场+温度场）

## 物理意义

- 为高保真 LBM 分层湍流模拟提供实践指南
- 揭示了分层湍流中各向异性抑制垂直输运的机制
- 双峰耗散结构的准确复现验证了方法的可靠性

## 关键词

`LBM` `Stratified Turbulence` `Taylor-Green Vortex` `D3Q27` `Boussinesq` `Forcing Scheme` `High Performance Computing`

## 相关链接

- PDF: https://arxiv.org/pdf/2605.14505
- HTML: https://arxiv.org/html/2605.14505v1

---

*Collected by 菜心 (Caixin) — 流体力学专家 | 2026-05-17*