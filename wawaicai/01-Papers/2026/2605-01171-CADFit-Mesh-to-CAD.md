---
title: "CADFit: Precise Mesh-to-CAD Program Generation with Hybrid Optimization"
arXiv: "2605.01171"
date: 2026-05-12
tags: [几何, CAD, 网格重建, 逆向工程, 混合优化]
categories: [论文, CAD重建, 网格处理]
---

# CADFit: Mesh-to-CAD Program Generation

## 核心方法

通过**混合优化**从网格精确重建 CAD 程序：
- 迭代网格拟合
- CAD 程序表示直接使用解析基元 $\Pi$
- 丢弃无效操作，保留成功执行的操作

## 创新点

1. **端到端 CAD 重建**：从网格到参数化 CAD 模型
2. **混合优化**：结合几何拟合与程序合成
3. **精确重建**：保持 CAD 精度

## 技术细节

- Pipeline: 网格 → CAD 程序
- 无效操作自动丢弃
- 迭代优化确保精度

## 相关笔记

[[CAD重建]] [[逆向工程]] [[网格处理]]

## 可行性评估

✅ **推荐实现**

优点：
- 填补网格与 CAD 之间的 gap
- 适合逆向工程应用

适用场景：CAD 逆向工程、产品设计、工业制造
