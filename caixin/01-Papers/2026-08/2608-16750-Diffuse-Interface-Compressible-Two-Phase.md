---
title: "A diffuse-interface method for compressible two-phase flows with seven- and six-equation models"
arxiv: "2608.16750
date: 2026-08-17
tags: [two-phase-flow, diffuse-interface, compressible-flow, seven-equation-model, six-equation-model, phase-field, VOF]
categories: [multi-phase-flow, numerical-methods]
---

# Diffuse-Interface Method for Compressible Two-Phase Flows

## 论文信息
- **arXiv**: 2608.16750
- **Subjects**: Fluid Dynamics (physics.flu-dyn)
- **关键词**: diffuse-interface, compressible two-phase flow, seven-equation model, six-equation model, phase-field

## 核心创新点

### 科学问题
- 模拟可压缩双相流
- 六方程和七方程非平衡模型的相位场方法
- 允许单调混合声速，最小化界面传输时的人工波延迟

### 方法论
1. **相场 formulation**: 从基准七方程模型构建
2. **界面正则化项**: 以散度形式添加
3. **守恒性质**: 
   - 保守相和混合熵传输方程
   - 有利于构建离散保守格式

### 关键创新
1. **六方程推导**: 瞬时速度平衡下获得
2. **特征向量退化避免**: 修改体积界面正则化通量以考虑有限量的共轭相
3. **隐式改善相密度捕获**

### 稳定性分析
- 界面平衡条件保持
- 离散动能和熵保持
- IEC（界面平衡条件）一致性分析
- 通量分割一致性与相内能通量分割的影响

### 数值验证
- **KEEP 离散格式**
- 测试用例：
  - 界面平流
  - 声波诱导气泡振荡
  - 斜声波的反射和透射
  - 双相 Taylor-Green 涡流

## 评估
- ✅ 推荐：可压缩双相流数值方法的重要进展
- 对于涉及高速双相流的工程应用有直接价值
