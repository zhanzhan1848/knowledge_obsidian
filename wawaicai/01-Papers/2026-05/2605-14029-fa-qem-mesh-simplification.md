---
title: "FA-QEM: Fast and Robust Mesh Simplification for Generated and Real-World 3D Assets"
authors: ["Qingyang Hu et al."]
date: 2026-05-13
venue: "CVPR 2026 Workshop 3D4S (Best Paper Award Runner-up)"
tags: [几何, 网格简化, QEM, 特征保持]
paper_url: "https://arxiv.org/abs/2605.14029"
---

## 核心方法

提出 **Feature-Aware Quadric Error Metric (FA-QEM)**，一种面向现代 3D 资产生成的网格简化 pipeline。

### 核心创新
1. **多术语 Quadric Error 公式**
   - 几何偏差 (geometric deviation)
   - 边界曲率 (boundary curvature)  
   - 表面法向一致性 (surface normal consistency)

2. **联合编码** → 最优顶点放置，保留尖锐特征

3. **高质量几何简化** → 改善下游 appearance transfer

### 关键结果
- 在 AI 生成网格和真实数据集 (Thingi10K, Real-World Textured Things) 上验证
- 显著更快的运行时间
- 更好的视觉保真度

---

## 算法复杂度
- 时间复杂度：O(n log n) 典型 QEM 级别
- 空间复杂度：O(n)

---

## 开源实现
- 暂无开源代码（arXiv 2026-05-13）

---

## 相关笔记
[[Mesh Simplification]]
[[Quadric Error Metric]]
[[Feature Preservation]]

---

## 可行性分析

**推荐度**: ⭐⭐⭐⭐⭐ (5/5)

### 优势
- **实用性强**：针对 AI 生成mesh的真实痛点（密集、噪声、非流形）
- **性能优异**：速度和鲁棒性兼顾
- **特征保持**：多术语 QEM 有效保留尖锐特征
- **端到端可用**：改善 texture mapping 下游任务

### 挑战
- 需要处理非流形输入的预处理
- 边界曲率计算可能对噪声敏感

### 开源参考 (libigl)
- `decimate` 函数可作为基础
- 可参考 `quadric_error_metric.cpp` 自定义 QEM

### 推荐理由
**强烈推荐实现**。网格简化是几何处理的基础操作，FA-QEM 解决了 AI 生成内容的特殊需求（噪声、非流形、保持特征），具有很高的实用价值和研究意义。