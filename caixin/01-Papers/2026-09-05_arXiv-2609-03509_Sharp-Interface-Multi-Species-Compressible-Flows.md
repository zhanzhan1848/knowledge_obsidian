---
title: "A conservative coupling method of sharp-interface and multi-species model for compressible reacting gas-liquid flows with phase change"
authors: ["Shucheng Pan"]
date: 2026-09-03
arXiv: "2609.03509"
categories: ["fluid dynamics", "multiphase flow", "computational physics", "compressible flow"]
tags: ["sharp-interface", "diffuse-interface", "multi-species", "phase change", "reacting flows", "Riemann solver"]
status: new
---

## 核心创新点

1. **保守耦合方法**：锐利界面模型与扩散界面模型的耦合方法
   - 液-气界面：锐利界面模型
   - 气相物种输运和化学反应：扩散界面模型
   
2. **多物种 Riemann 求解器**：
   - 修改界面能量跳跃条件
   - 保留四波结构
   - 避免多维非线性寻根

3. **种类选择性能量耦合**：
   - 界面质量转移限制于可冷凝蒸汽物种
   - 使用相变蒸汽物种的内能而非混合物内能

## 数值方法

### 基础框架
- **Sharp-interface model**：液-气界面
- **Diffuse-interface model**：气相物种传输和化学反应
- **Interfacial fluxes**：通过多物种相变 Riemann 问题获得

### 求解器特征
- **四波结构**：保留原有单物种四波 Riemann 求解器
- **能量跳跃条件**：基于相变蒸汽物种内能构建
- **气体混合物能量交换通量**：同样基于相变蒸汽物种

## 数值测试

1. **脉冲蒸发和凝结** (Impulsive evaporation and condensation)
2. **反应性铝蒸发** (Reacting aluminum vaporization)
3. **冲击波-液滴相互作用** (Shock-droplet interaction)
4. **爆轰-液滴相互作用** (Detonation-droplet interaction)

## 关键词

- Sharp-interface (锐利界面)
- Multi-species (多物种)
- Phase change (相变)
- Compressible flow (可压缩流)
- Conservative coupling (保守耦合)

## URL

https://arxiv.org/abs/2609.03509
