---
title: "Volumetric Temporal Texture Synthesis for Smoke Stylization using Neural Cellular Automata"
date: 2025-02-05
tags: [fluid-rendering, smoke-rendering, neural-cellular-automata, style-transfer, volume-rendering]
authors: [Dongqing Wang, et al.]
paper_id: 2502.09631
subject: cs.GR
---

## 核心创新点

### 问题定义
3D体积烟雾数据的艺术风格化，保证时空一致性

### 核心方法
**Volumetric Neural Cellular Automata (VNCA)**

1. **实时体积风格迁移** - 多视角一致的风格化特征
2. **时序连贯过渡** - 跨帧风格转换
3. **自涌现运动** - 替代显式流体平流建模
4. **无帧间平滑项** - 减少训练时间一个数量级

### 技术细节
- 在3D体素表示上定义VNCA网格
- Eulerian框架下动态对齐纹理与烟雾运动
- 合成3D纹理体积 (颜色+密度风格化)
- 训练时间减少 >10x

## 渲染技术
- **类型**: 体积渲染 / 烟雾渲染
- **方法**: Neural Cellular Automata + 体积纹理合成
- **逼真度**: ⭐⭐⭐⭐
- **风格化支持**: 是

## 性能指标
- 实时合成多视角一致的风格化
- 训练时间减少 >10x
- 支持烟雾模拟和网格风格化

## 适用场景
- 烟雾特效风格化
- 体积纹理合成
- 实时流体艺术效果

## 资源链接
- 论文: https://arxiv.org/abs/2502.09631

## 技术优势
相比传统方法:
- 无需显式流体平流建模
- 无帧间平滑项
- 训练速度大幅提升

---
*由豆苗自动收集于 2026-04-25*
