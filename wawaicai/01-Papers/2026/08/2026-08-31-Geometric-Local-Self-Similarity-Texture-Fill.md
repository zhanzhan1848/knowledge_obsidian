---
tags: [几何, 纹理映射, 自相似性, 参数化]
date: 2026-08-31
venue: arXiv cs.GR
---

# Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill

## 核心方法

利用**几何自相似性**和**几何-纹理相关性**，训练形状特定的局部纹理生成与补全模型。

### 关键思想

1. **几何自相似性**: 自然和人造形状中存在几何自相似性
2. **几何-纹理相关性**: 形状的几何特征与纹理模式相关
3. **局部纹理生成**: 无需大规模3D数据集的局部方法
4. **艺术家控制**: 提供显式的艺术家控制能力

### 方法流程

1. 给定一个3D形状和单张参考图像
2. 提取几何感知的参考patch集合
3. 训练形状特定的局部纹理生成网络
4. 通过patchwise inpainting将新参考迁移到目标形状
5. 支持局部几何条件纹理修复

## 关键创新点

1. **形状特定模型**: 每个形状训练专属模型，而非通用模型
2. **几何感知参考patch**: 利用几何特征选择和 attending 参考patch
3. **可控制的艺术家交互**: 支持艺术家选择参考、控制纹理生成
4. **泛化能力**: 可泛化到PBR材质和未见过的mesh

## 应用场景

- 3D纹理编辑
- 纹理探索与快速原型
- Blender插件 (已有3D纹理专业人士内测反馈)

## 开源实现

- Project page: https://chenyuecai.github.io/gloss-page/
- arXiv: https://arxiv.org/abs/2608.25461

## 相关笔记

[[2026-08-26-ExMesh-Multi-View-Relightable-UV-PBR-Mesh]]
[[SIGGRAPH2026-Nexus-Native-Mesh-Generation-Diffusion]]

## 可行性评估

✅ **推荐实现**

- 问题新颖: 局部纹理生成 vs 通用纹理生成
- 方法可分解: patch selection + network training + inference
- 已验证: Blender插件 + 专业人士反馈
- 代码开源预期

**实现建议**:
1. 复现patch-based纹理迁移流程
2. 使用预训练2D diffusion model作为prior
3. 参考GLIGEN等控制纹理生成工作
