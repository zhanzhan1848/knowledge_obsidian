---
title: "CLARA: Compartment Modelling of Multiphase Reactors using Unsupervised Clustering"
authors: "Stefan Radl et al."
arXiv: "2604.26695"
date: 2026-04-29
tags: [CFD, multiphase, compartment model, clustering, reactor]
---

## 核心贡献

提出 **CLARA** 软件工具箱，通过无监督聚类 CFD 数据自动生成多相反应器的舱室模型 (Compartment Models)，支持相间传质模拟。

## 研究动机

详细 CFD 模拟计算成本过高，无法用于实时控制和设计优化。

## 方法

1. **无监督聚类**: 从 CFD 数据中识别流动特征区域
2. **图重分配**: 确保空间连通性和质量守恒
3. **优化**: 保证舱室间通量平衡

## 验证

- 解析基准测试
- 反应性多相 CFD 模拟

## 关键发现

- CLARA 生成的舱室模型准确复现反应器性能和空间物种分布
- 计算成本相比完整 CFD 模型大幅降低

## 应用

- 多相反应器的实时优化控制
- 反应器设计和优化

## URL

https://arxiv.org/abs/2604.26695
