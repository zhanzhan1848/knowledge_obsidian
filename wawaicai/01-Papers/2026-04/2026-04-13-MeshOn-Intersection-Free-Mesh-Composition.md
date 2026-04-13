---
tags: [几何, 网格处理, 网格合成]
date: 2026-04-13
source: arXiv cs.GR
arXiv_id: 2604.08799
---

# MeshOn: Intersection-Free Mesh-to-Mesh Composition

## 核心方法

MeshOn 是一种用于两个输入网格之间进行物理和语义真实合成的方法。主要流程：

1. **多步优化框架** - 给定配件网格、基础网格（带用户定义目标区域）和可选文本描述
2. **结构化对齐初始化** - 使用 Vision-to-Language (VLM) 模型进行刚性配置对齐
3. **几何损失优化** - 结合吸引几何损失和物理启发的屏障损失防止表面相交
4. **扩散先验辅助变形** - 最终对象变形

## 创新点

- 防止网格相交（intersection-free）
- 利用 VLM 进行结构化对齐
- 物理启发的屏障损失函数

## 算法复杂度

- 依赖多步优化和神经网络推理

## 开源参考

- Project Page: https://threedle.github.io/MeshOn/

## 相关笔记

[[2026-04-13-VisACD-GPU-Accelerated-Convex-Decomposition]]

## 可行性分析

✅ 推荐实现

**技术概述**: 网格到网格的合成与融合，避免交叉

**实现难度**:
- 算法复杂度：中
- 数值稳定性：需要屏障损失防止退化
- 依赖项：VLM、扩散模型

**推荐结论**: ✅ 推荐实现

**开源参考**:
- 论文代码: https://threedle.github.io/MeshOn/
