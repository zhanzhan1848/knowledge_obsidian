---
tags: [几何, TPMS, Diffusion, 周期最小曲面, 逆向设计]
type: paper
venue: arXiv cs.GR
date: 2026-08-04
---

# Fourier-Latent Diffusion for Constrained Generation of Triply Periodic Minimal Surfaces

## 核心方法

### 问题定义
现有 TPMS 生成方法：
- 仅限于少数规范族 (canonical families)
- 或产生偏离精确最小性的 TPMS-like 近似

### 核心创新

**1. 大规模 TPMS 数据集构建**
- 枚举 admissible boundary loops on mirrorable fundamental bounding volumes
- 求解 diverse minimal-surface patches
- **18K+ 唯一 TPMS** 数据集

**2. Fourier Latent Space**
- 将表面投影到紧凑 Fourier 潜在空间
- 显式强制：
  - **周期性 (Periodicity)**
  - **D₂ₕ 对称性**

**3. Transformer-based Diffusion Model**
- 无条件采样
- 确定性反演 (deterministic inversion)
- 局部编辑 (local editing)
- 约束条件生成 (conditional generation)

### 应用

- TPMS 逆向设计
- 匹配目标均匀线性弹性特性
- 材料科学 / 3D 打印

## 相关笔记

[[2026-08-05-DAILY-SUMMARY]]

## 技术标签

#tpms #diffusion #periodic-surfaces #inverse-design #fourier-latent-space
