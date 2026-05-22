---
tags: [渲染, 神经渲染, Gaussian Avatar, 动态服装, 实时渲染, 2026]
date: 2026-05-22
status: 待读
---

# PiG-Avatar: Hierarchical Neural-Field-Guided Gaussian Avatars

## 基本信息

| 标题 | 值 |
|------|-----|
| 作者 | (From Adobe/Digital Domain?) |
| 发表 | cs.GR |
| 链接 | [arXiv:2605.20185](https://arxiv.org/abs/2605.20185) |

## 核心贡献

1. **解耦表示与模板拓扑**: 使用参数化人体模型仅用于运动传输，而非几何表示
2. **体素规范空间中的 Gaussian**: 在连续神经场控制的体素规范空间中表示 Avatar
3. **3D 重心锚点传输**: 保持运动一致性，允许锚点自由偏离模板表面
4. **双层空间一致优化**: Sobolev 预条件化 + KNN 预条件化
5. **自发组织**: 锚点自动迁移到高曲率区域，无需显式启发式

## 技术方案

### 传统 Gaussian Avatar 问题
- 基于人体模板表面参数化几何
- 受限于模板变形空间
- 无法捕获分层、离体、非刚性服装几何

### PiG-Avatar 方法

```
模板拓扑 ──(仅用于运动)──→ 运动传输
     ↓
神经场 ──(几何表示)──→ 3D Gaussian 锚点
```

### 核心创新

1. **规范空间表示**
   - Gaussian 锚定在体素规范空间
   - 连续神经场控制
   - 解耦几何与模板拓扑

2. **3D 重心锚点传输**
   - 运动引导而非几何约束
   - 允许偏离模板表面
   - 密集稳定的时间表面对应

3. **双层优化**
   - Sobolev 预条件化神经场更新
   - KNN 预条件化规范锚点几何
   - 协同诱导锚点自发组织

### 关键公式

锚点密度自发组织:
```math
\nabla \phi \rightarrow \text{curvature regions}
\phi + \text{anchor graph} \rightarrow \text{appearance variation}
```

## 实验结果

- 复杂服装几何和分层表面自然涌现
- 多级细节层次重建
- 最先进渲染质量
- 实时渲染（所有细节层级）

## 与渲染相关

- 3D Gaussian 用于渲染
- 神经场用于几何表示
- 实时渲染能力
- 可应用于游戏/VR Avatar

## 标签

#神经渲染 #Gaussian #Avatar #动态服装 #实时渲染 #NeRF #人体重建