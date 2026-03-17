---
title: A Texture Lookup Approach to Bézier Curve Evaluation on the GPU
authors: Muhammad Anas, Alan Wolfe
date: 2026-03-16
source: arXiv
url: https://arxiv.org/abs/2603.15447
pdf: https://arxiv.org/pdf/2603.15447
tags: [rendering, paper, 2026, gpu, bezier, texture, optimization, curves]
status: unread
priority: medium
---

# A Texture Lookup Approach to Bézier Curve Evaluation on the GPU

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | A Texture Lookup Approach to Bézier Curve Evaluation on the GPU |
| 作者 | Muhammad Anas, Alan Wolfe |
| 来源 | arXiv (cs.GR) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2603.15447) |
| PDF | [下载](https://arxiv.org/pdf/2603.15447) |
| 文件大小 | 3,365 KB |

## 核心贡献
1. **纹理插值硬件加速**: 利用 GPU 固定功能线性纹理插值硬件进行 Bézier 曲线评估
2. **计算密集型负载优化**: 将曲线评估卸载到纹理插值器，改善计算密集型 GPU 负载性能
3. **扩展性强**: 自然扩展到 Bézier 曲面和体积，支持 B-splines、NURBS、积分和有理多项式

## 技术方案
- **核心思想**: 使用纹理查找代替 shader 中的多项式计算
- **Seiler 插值**: 展示如何在此框架中使用 Seiler 插值提高效率
- **对比实验**: 与 shader 代码中的多项式评估比较性能和精度

### 支持的曲线类型
- Bézier 曲线/曲面/体积
- B-splines
- NURBS
- 积分多项式
- 有理多项式

## 公式
```math
# Bézier 曲线评估
B(t) = \sum_{i=0}^{n} \binom{n}{i} (1-t)^{n-i} t^i P_i

# 纹理查找映射
TextureSample(u) ≈ B(t=u)
```

## 实验结论
- 在计算密集型负载中改善性能
- 与 shader 多项式评估比较精度
- 详细性能对比（需查看 PDF）

## 局限性
- 需要预计算纹理数据
- 可能受纹理内存限制
- 精度依赖纹理格式

## 可行性分析
- **实现难度**: 低-中（使用现有 GPU 纹理硬件）
- **性能预期**: 计算密集型场景有提升
- **适用场景**: 矢量图形、字体渲染、CAD、曲线建模

## 推荐结论
✅ **推荐实现**

**理由**:
- 实用性强的优化技术
- 利用现有硬件特性
- 扩展性好，适用多种曲线类型

## 行动建议
- 传递给 @墨鱼丸 评估实现复杂度
- 查看论文中的性能数据
- 考虑在矢量渲染管线中应用

## 相关工作
- [[GPU Rendering]]
- [[Vector Graphics]]
- [[Texture Sampling]]
- [[Bezier Curves]]

## 笔记
- 实用性优化技术，可能对渲染引擎有直接价值
- 作者是 Alan Wolfe（知名图形程序员）
- MSC class: 68U05, ACM class: I.3.6
