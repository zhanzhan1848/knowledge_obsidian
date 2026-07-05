---
tags: [点云, 联邦学习, 知识蒸馏, 分类]
source: arXiv cs.GR
date: 2026-07-03
conference: ECCV 2026
---

# Federated Learning and Knowledge Distillation for Point Cloud Classification

## 论文信息
- **arXiv**: [2607.01272](https://arxiv.org/abs/2607.01272)
- **作者**: Avirup Mandal et al.
- **会议**: ECCV 2026

## 核心方法
部署 3D 点云分析在隐私敏感、资源受限的环境中面临两个障碍：数据无法集中化，模型必须在有限的边缘硬件上运行。

提出多种子基准测试，联合评估**联邦学习 (FL)** 和**知识蒸馏 (KD)** 用于 3D 点云分类：
- 13 种 FL 算法 × 10 种 KD 目标 = 130 对组合
- 504 次训练运行
- ModelNet40 和临床颅缝早闭数据集

### 关键发现
1. **极端 non-IID 标签偏斜下**：standalone FL 性能急剧下降
   - ModelNet40: 最佳方法 76.32% vs 集中式参考 92.26%
   - 临床数据: 最佳 75.83% vs 100%

2. **蒸馏成功压缩**：teacher → student 体积缩小 74.51%，推理速度提升约 2 倍，通常匹配或超越 teacher

3. **评估陷阱**：当蒸馏保留硬标签交叉熵时，崩塌的 federated teacher (8.50%) 配对 Logit-MSE 仍能产生 92.94% 的 student

### 推荐
评估 FL-KD 管道时应使用**无标签蒸馏**，使报告的准确率反映 federated teacher 而非 proxy。

## 创新点
- 首个联合 FL+KD 3D 点云分类基准
- 发现并解决 FL-KD 联合评估中的 proxy label 隐私问题
- 提出 label-free distillation objective

## 复杂度分析
- 时间：O(n × k) 其中 n=FL clients, k=KD objectives
- 空间：O(model_size × distillation_overhead)

## 开源实现
- 代码: GitHub (待确认)
- 数据集: ModelNet40, 临床颅缝早闭数据集

## 相关笔记
[[点云分类]], [[联邦学习]], [[知识蒸馏]], [[3D深度学习]]
