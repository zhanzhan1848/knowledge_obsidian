---
tags: [几何, 参数化, 隐式表示, 曲线曲面]
created: 2026-06-20
source: arXiv cs.GR
---

# A Reproducible Parametric Engine for Generating Analysis-Ready Human Airway Lumen Geometry

## 核心方法

提出 **RespGeomLib**，一个用于从 YAML 规范生成分析就绪的人体气道管腔 surface 的可复现参数化引擎。结合 **port-based assembly** 与 **implicit smooth-min junction blending**，产生无缝junction，避免了全树体素化，通过解析线段和局部隐式提取实现高效重建。

## 关键创新点

1. **port-based assembly** — 端口式装配，模块化气道分支
2. **implicit smooth-min junction blending** — 无缝光滑融合，无非光滑 junction
3. **无全树体素化** — 通过解析线段和局部隐式提取，显著提升效率
4. **morphometry-guided tree generation** — 支持形态学引导的生成和受控合成变体
5. **CFD-ready export** — 稳定的气流模拟出口

## 算法概述

给定紧凑 YAML 规范，框架组合生成式气道树状结构，在分叉处使用 implicit smooth-min 混合产生无缝 junction。输出为分析就绪的管腔 surface，可直接用于计算流体动力学（CFD）模拟。相比全局隐式提取，速度和内存效率均显著提升。

## 可行性评估
- 实现难度：低（基于成熟隐式几何方法）
- 数值稳定性：良好（经过定量验证）
- 依赖项：可基于 libigl / gptoolbox 的隐式几何模块

## 论文信息
- arXiv: [2606.19169](https://arxiv.org/abs/2606.19169)
- 发表于：2026 IEEE Mercon（医学几何学方向）
- 提交时间：2026-06-17

## 相关笔记
[[隐式几何]]
[[参数化]]
[[表面重建]]