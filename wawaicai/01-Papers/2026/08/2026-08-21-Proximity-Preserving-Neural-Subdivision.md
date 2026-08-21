---
title: "Proximity-Preserving Neural Subdivision"
authors: [Hassan Ugail et al.]
date: 2026-08-10
tags: [几何, 网格处理, 细分曲面, 神经网络, Loop细分]
arxiv: "2608.14704"
doi: "10.48550/arXiv.2608.14704"
subjects: [cs.GR]
---

# Proximity-Preserving Neural Subdivision (PNS)

## 核心方法

提出**保持接近度的神经细分方法**，增强 Loop 细分以适应局部几何特征（锐脊、软边缘）。

### 核心问题
经典细分方案使用固定模板，无法适应局部几何特征（曲率集中区域）。

### 关键技术

1. **曲率门控校正**（Curvature-Gated Correction）
   - 小型、有界、曲率门控校正
   - 在协变局部坐标系中表达
   - 不改变细分的整体结构

2. **严格保证（架构保证，无需训练）**
   - 刚性运动精确等变
   - 精确重现平面输入
   - 保持在 Loop 模板的二次接近包络内

3. **线性化操作符**
   - 在平面 valence-k stars 上与 Loop 一致
   - 继承 Loop 的切线特征空间和 Reif 谱隙

### 核心创新点
- 将神经网络与经典细分方案结合
- 保持细分有用的结构约束
- 改善局部锐脊特征逼近
- 保持 prescribed proximity envelope

## 开源实现
- 项目页面待确认

## 相关技术
- Loop Subdivision / Loop 细分
- Neural Mesh Refinement
- Subdivision Surfaces / 细分曲面
- Curvature-Adaptive Refinement

## 可行性评估

**推荐度：✅ 推荐实现**

- 神经细分是前沿方向
- 保持约束的设计理念值得学习
- libigl 的 Loop subdivision 可作为基础
- 对网格细分、特征增强有参考价值

## 会议信息
arXiv Submission, 2026-08-10
