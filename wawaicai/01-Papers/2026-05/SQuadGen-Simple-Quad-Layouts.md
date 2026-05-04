---
title: "SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields"
authors: [Yang Liu, et al.]
date: 2026-04-30
tags: [几何, 四边形布局, 重网格化, 参数化, Diffusion]
paper_id: 2604.27329
subjects: [cs.GR, cs.CV]
conference: SIGGRAPH 2026 Journal Track
status: new
---

# SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields

## 核心方法

### 问题定义
3D 形状（来自扫描、重建或 AI 生成）通常缺乏简单的四边形网格布局，这对于高效编辑和建模至关重要。现有四边形重网格化技术通常产生复杂布局，带有不规则环，导致繁琐的手动清理和广泛的算法调优。

### 关键创新

1. **Chart Distance Fields (CDF)**
   - 连续表面表示方法，实现有效的四边形布局学习和合成
   - 解决网格连通性的离散性质问题

2. **Loop-aware Simplicity Metrics**
   - 定义了循环感知的简单性度量
   - 从公共 3D 资源库中构建大规模高质量四边形布局数据集
   - 通过鲁棒的四边形恢复管道构建

### 方法流程
1. 使用 CDF 作为连续表示
2. 训练扩散模型生成简单四边形布局
3. 在多样化 3D 输入上进行评估

### 实验结果
- 在各种 3D 输入上一致性优于现有方法
- 产生鲁棒、艺术家友好的简单四边形布局

## 开源参考
- 项目页面: https://youkang-kong.github.io/squadgen/

## 相关笔记
[[Quad Remeshing]]
[[Chart Decomposition]]
[[Diffusion for Geometry]]

## 可行性分析
✅ 推荐实现

**理由**：
- SIGGRAPH 2026 Journal Track 论文，质量有保障
- 问题明确针对实际痛点（复杂四边形布局）
- 提供了数据集和项目页面，便于复现