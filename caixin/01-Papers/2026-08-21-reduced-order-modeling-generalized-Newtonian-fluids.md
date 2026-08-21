# Intrusive versus non-intrusive reduced-order modeling of generalized Newtonian fluid flows

**arXiv:** [2608.18259v1](https://arxiv.org/abs/2608.18259v1)  
**Published:** 2026-08-18  
**Category:** physics.flu-dyn  
**Tags:** #reduced-order-modeling #POD #Carreau-fluid #Galerkin #ROM #non-Newtonian

## 核心创新点

- 系统比较三种降阶建模方法对**广义牛顿流体**（Carreau 流变模型）的适用性
- 三种 ROM 策略：ROM-FULL（侵入式 Galerkin）、ROM-DEIM（超降阶）、ROM-RBF（非侵入式 RBF 插值）
- 提供基于求解器可访问性、计算效率、精度需求的 ROM 选择指南

## 三种 ROM 方法对比

| 方法 | 精度 | 计算效率 | 侵入性 |
|------|------|----------|--------|
| **ROM-FULL** | 最高 | 最低（需重组全阶非线性算子）| 高（需访问求解器）|
| **ROM-DEIM** | 中高 | 中（ hyper-reduced GappyPOD）| 中（需部分求解器访问）|
| **ROM-RBF** | 中（依赖数据，超出训练区间退化）| 高（全非侵入）| 无 |

## 验证案例

1. **盖驱动腔道流** (lid-driven cavity)：边界驱动
2. **球体在封闭容器中沉降**：力驱动

## 关键发现

- ROM-FULL 精度最高但在线阶段计算量大
- ROM-RBF 完全非侵入但外推能力差
- ROM-DEIM 在数据稀疏时仍能保持效率和精度的平衡

## 关键词
#reduced-order-modeling #Carreau-fluid #POD #Galerkin-projection #DEIM #ROM
