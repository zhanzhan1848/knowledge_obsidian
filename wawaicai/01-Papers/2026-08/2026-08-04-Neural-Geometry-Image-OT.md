---
tags: [几何, 参数化, 几何图像, 最优传输, 压缩]
date: 2025-11-24
conference: WACV 2026
---

# Neural Geometry Image-Based Representations with Optimal Transport

## 核心方法

提出一种**神经几何图像表示**，将不规则网格转换为规则图像网格，使高效的图像神经处理直接适用。

### 关键创新

1. **几何图像(Geometry Image)**：将不规则网格参数化为规则图像
2. **最优传输(Optimal Transport)**：
   - 解决平坦区域过采样问题
   - 解决特征丰富区域欠采样问题
   - 支持连续 LOD（细节层次）通过几何图像 mipmap

3. **无解码器设计**：decoder-free，存储高效

## 技术优势

- 低分辨率几何图像 mipmap 存储
- 单次前向传播恢复高质量网格
- 状态-of-the-art 存储效率和恢复精度

## 评估指标

- 压缩比(CR)
- Chamfer 距离(CD)
- Hausdorff 距离(HD)

## 与传统参数化对比

| 方面 | 传统参数化 | 几何图像表示 |
|------|------------|--------------|
| 结构 | 不规则连通 | 规则图像网格 |
| 处理 | 复杂编码器-解码器 | 图像神经处理 |
| LOD | 需重新计算 | Mipmap 连续支持 |

## 开源实现

- arXiv: https://arxiv.org/abs/2511.18679

## 相关笔记

[[LSCM-UV-Parametrization]]
[[UVAtlas-Parametrization]]

## 可行性分析

✅ **推荐实现**

- 最优传输参数化方法有学术和实用价值
- 与图像处理框架结合有工程价值
- 可作为网格压缩的基础表示
