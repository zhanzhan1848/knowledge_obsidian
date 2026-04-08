# Real-time Neural Six-way Lightmaps

## 论文信息
- **arXiv ID**: [2604.03748](https://arxiv.org/abs/2604.03748)
- **标题**: Real-time Neural Six-way Lightmaps
- **作者**: Wei Li, Hanxiao Sun, Tao Huang, Haoxiang Wang, Tongtong Wang, Zherong Pan, Kui Wu
- **提交时间**: 2026年4月4日
- **类别**: cs.GR; cs.CV
- **DOI**: 10.48550/arXiv.2604.03748

## 核心创新点

### 问题背景
参与介质 (Participating Media) 是虚拟环境中常见且迷人的视觉效果。然而，由于体积渲染方程 (Volume Rendering Equation) 的计算开销大，在实时应用中渲染这类现象非常困难。

### 现有方法局限
六向光贴图 (Six-way Lightmaps) 技术已在电子游戏中广泛用于烟雾渲染：
- 使用相机朝向的广告牌 (camera-oriented billboard)
- 使用六张预计算光贴图近似光照效果
- **局限性**：仅支持预模拟动画序列，忽略相机运动

### 本文方法：神经六向光贴图
1. **引导图生成**：从相机视角使用大采样距离的 ray marching 生成引导图，近似烟雾散射和轮廓
2. **神经网络预测**：给定引导图，训练神经网络预测对应的六向光贴图
3. **游戏引擎集成**：结果可直接集成到现有游戏引擎管线

### 核心公式
- 使用 ray marching 近似参与介质的散射和吸收
- 引导图提供烟雾几何和光照的先验信息
- 神经网络从引导图推断六向光贴图

## 技术细节

### 支持的交互效果
- 烟雾-障碍物交互 (smoke-obstacle interaction)
- 相机移动 (camera movement)
- 光照变化 (light change)
- VR/AR 实时应用

### 性能
- 实时性能，适用于游戏和 VR/AR

## 渲染方法分类

| 维度 | 类别 |
|------|------|
| 类型 | 体积渲染 (Volume Rendering) |
| 技术 | Ray Marching + Neural Network |
| 光照模型 | Six-way Lightmaps |
| 介质类型 | 参与介质 (Participating Media) |

## 可行性分析

### 视觉质量
- **逼真度**: ⭐⭐⭐⭐⭐
- 基于物理的体积渲染方程
- 神经网络增强光照预测
- 风格化支持: 是

### 性能预期
- **帧率**: 实时 (60+ FPS)
- **GPU 需求**: 中等
- **内存占用**: 低至中等 (预计算光贴图)
- 适合 VR/AR 应用

### 实现难度
- **着色器复杂度**: 中等
- **管线要求**: 需集成神经网络推理
- **推荐度**: ✅ 强烈推荐

## 相关技术
- [[体积渲染]]
- [[Ray Marching]]
- [[烟雾渲染]]
- [[参与介质]]
- [[六向光贴图]]
- [[神经网络渲染]]

## 知识来源
- 原始论文摘要
- arXiv cs.GR (2026-04-04)
