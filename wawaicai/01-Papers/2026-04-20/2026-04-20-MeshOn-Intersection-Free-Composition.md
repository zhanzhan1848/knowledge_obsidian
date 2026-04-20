---
tags: [几何, 网格组合, 无交叉, 优化, 物理约束]
date: 2026-04-20
authors: Columbia University, University of Chicago, Cornell University
source: arXiv cs.GR
arxiv: 2604.08799
---

# MeshOn: 无交叉的网格组合

## 核心问题

如何将预建的3D物体（配饰）自动装配到目标网格（基础网格）上，同时：
- 保持物理真实性
- 保持语义对齐
- 防止表面交叉

## 核心方法

**MeshOn** - 多步骤优化框架

### 流程

1. **初始化** 
   - 使用 Vision-to-Language Model 进行结构化对齐
   - 获取粗略位置和方向

2. **吸引几何损失优化**
   - 将配饰拉向基础网格

3. **物理屏障损失**
   - GPU优化BVH高效执行无交叉约束
   - 防止表面穿透

4. **最终形变优化**
   - 通过Jacobians优化对象形变
   - 保持物理真实感
   - 考虑材料参数

## 技术特点

- **多步骤策略**：每种损失顺序引入
- **无交叉保证**：物理屏障损失
- **语义对齐**：VLM引导的初始化
- **形变保持**：Jacobian-based形变

## 与现有方法对比

MeshOn 优于：
- 生成方法（丢失关键属性如纹理、动画rigs）
- 传统注册算法（intersection-free保证）

## 应用场景

- 数字艺术工作流
- 游戏资产生成
- 动画角色装配

## 开源资源

- Project: https://threedle.github.io/MeshOn/

## 相关笔记

[[2026-04-20-SATO-Arist-Mesh-Generation]]
