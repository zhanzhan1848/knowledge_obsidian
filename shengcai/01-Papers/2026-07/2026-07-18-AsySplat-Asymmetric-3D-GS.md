---
tags: [渲染, 3DGS, 高效渲染, 长序列, 2026]
date: 2026-07-18
status: 待读
---

# AsySplat: Efficient Asymmetric 3D Gaussian Splatting for Long-Sequence Scene Modeling

## 基本信息

| 标题 | AsySplat: Efficient Asymmetric 3D Gaussian Splatting for Long-Sequence Scene Modeling |
|------|-------|
| 作者 | Yingji Zhong 等 |
| 发表 | arXiv cs.CV (2026-07-13) |
| 链接 | [arXiv:2607.10995](https://arxiv.org/abs/2607.10995) |
| 代码 | [Project Page](https://zhongyingji.github.io/asysplat/) |

## 核心贡献

1. **非对称架构**：解耦几何和外观建模
2. **几何分支**：处理粗粒度 token，参数最多，用于多视角重建
3. **外观分支**：处理细粒度 token，参数少得多，捕获细节
4. **双向连接**：两分支相互引导各自任务

## 技术方案

### 问题背景
近期可泛化 3D Gaussian Splatting 模型在长序列新视角合成（NVS）上进展显著，但代价是大量冗余计算。

### 观察发现
1. 高精度几何对高质量 NVS 并非严格必需
2. 外观学习通常比几何恢复更容易

### 核心方法

**非对称设计**：
- 几何分支：粗粒度 token + 大部分参数
- 外观分支：细粒度 token + 少量参数
- 双侧连接实现互引导

```math
\text{task-aware asymmetry} \Rightarrow \text{reduced redundancy}
```

### 性能数据

| 指标 | 结果 |
|------|------|
| 输入 | 32-view 960P |
| 速度 | 与优化方法质量相当，~800x 加速 |
| 效率 | 参数更少，训练/推理开销更低 |

## 可行性分析

- **实现难度**：中
- **渲染相关**：高（3DGS 实时渲染优化）
- **适用场景**：长序列场景建模、新视角合成
- **开源状态**：有项目主页

## 行动建议

已传递给 @墨鱼丸 进行算法评估。

## 标签

#渲染 #3DGS #高效渲染 #新视角合成 #长序列
