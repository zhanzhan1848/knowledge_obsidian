---
tags: [渲染, 全局光照, 神经渲染, 探针, Eurographics2026]
date: 2026-06-16
status: 已读
cite: arXiv:2602.12949
---

# Real-time Rendering with a Neural Irradiance Volume

## 元信息

| 标题 | Real-time Rendering with a Neural Irradiance Volume |
|------|--------------------------------------|
| 作者 | Arno Coomans, Giacomo Nazzaro, Edoardo A. Dominici, Christian Döring, Floor Verhoeven, Konstantinos Vardis, Markus Steinberger |
| 机构 | Huawei Technologies, Graz University of Technology |
| 链接 | [arXiv](https://arxiv.org/abs/2602.12949) |
| 发表 | Eurographics 2026 |
| 领域 | cs.GR |

## 核心贡献

1. **预计算方案**：将路径追踪质量的光照烘焙为神经 irradiance，无需逐场景启发式设计
2. **推理速度提升一个数量级**（相比 SOTA 神经渲染方法）
3. **紧凑表示**：相同内存预算下质量提升 10 倍
4. **可扩展到非静态 irradiance 场**（如时间-of-day 循环）

## 技术方案

### 核心问题
传统的 irradiance probe 网格存在：
- 混叠伪影
- 高内存消耗（立方级缩放）
- 需要场景特定启发式设计

### 解决方案：Neural Irradiance Volume (NIV)
- **神经压缩**：创建自适应、摊销的 irradiance 表示
- **规避立方缩放**：将 irradiance 场编码为紧凑神经模型
- **无光线追踪、无去噪**：仅需 G-buffer 输入

### 性能指标
- **推理时间**：~1 ms/帧 (消费级 GPU, 1080p)
- **内存**：1-5 MB（中大规模场景）

### 关键洞察
神经压缩创建自适应、摊销的 irradiance 表示，规避网格方法的立方缩放。

### 公式

**Irradiance 函数**：
$$E(x,n) = \int_{\Omega} L_i(x, \omega_i) \langle \omega_i, n \rangle^+ d\omega_i$$

**漫反射辐射率**：
$$L_r(x) = \frac{\rho(x)}{\pi} \cdot E(x, n)$$

## 相关工作

- Irradiance Probe Volumes (Greger et al., 1998)
- Neural Radiance Caching
- Precomputed Radiance Transfer (PRT)

## 标签

#全局光照 #神经渲染 #IrradianceVolume #实时渲染 #Eurographics2026
