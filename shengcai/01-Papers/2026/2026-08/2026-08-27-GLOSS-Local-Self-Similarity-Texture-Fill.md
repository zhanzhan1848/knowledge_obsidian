---
title: "Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill"
authors: ["Chenyue Cai", et al."]
date: 2026-08-26
tags: [渲染, PBR材质, 纹理生成, 3D纹理, 参考引导]
status: 待读
paperId: arXiv:2608.25461
---

# Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Geometric Local Self-Similarity Learning for Faithful Reference-Guided Texture Fill |
| 作者 | Chenyue Cai et al. |
| 链接 | [arXiv](https://arxiv.org/abs/2608.25461) |
| 领域 | cs.GR |
| 日期 | 2026-08-26 |

## 核心贡献

1. **局部自相似性纹理生成**：利用自然和人造物体中存在的几何自相似性和几何-纹理相关性，训练形状特定的局部纹理生成和补全模型

2. **PBR材质支持**：支持将纹理泛化到PBR材质和未见过的网格进行纹理迁移

3. **Blender插件**：作为Blender插件提供，已被3D纹理专业人员测试并获得积极反馈

## 技术方案

### 核心思想
- 不依赖大型3D数据集的全局指导，而是采用局部、数据需求量少的方法
- 利用几何自相似性和几何-纹理相关性
- 通过关注一组几何感知的参考补丁来进行参考引导

### 方法流程
1. 从单个3D形状和图像模型先验中学习
2. 训练形状特定的局部纹理生成网络
3. 通过补丁式修复将任何新参考迁移到目标对象纹理

### 关键创新点
- 显式的艺术家控制能力
- 局部几何条件纹理修复
- 支持艺术家选择的参考引导

## 实验结果

- 在质量和可控制性方面与强基线方法相当或更优
- 支持PBR材质泛化
- Blender插件获得专业人员积极反馈

## 标签
#渲染 #纹理生成 #PBR #3D #参考引导

## 相关笔记
[[2026-08-27-daily-search-report]]

## 链接
- [arXiv](https://arxiv.org/abs/2608.25461)
- [项目页面](https://chenyuecai.github.io/gloss-page/)
