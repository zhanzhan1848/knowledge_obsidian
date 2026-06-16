---
tags: [渲染, 全局光照, 神经渲染, 光照贴图, CVPR2026]
date: 2026-06-16
status: 已读
cite: arXiv:2604.12625
---

# Neural Dynamic GI: Random-Access Neural Compression for Temporal Lightmaps

## 元信息

| 标题 | Neural Dynamic GI: Random-Access Neural Compression for Temporal Lightmaps in Dynamic Lighting Environments |
|------|--------------------------------------|
| 作者 | Jianhui Wu, Jian Zhou, Zhi Zhou, Zhangjin Huang, Chao Li |
| 机构 | USTC, Zhejiang University |
| 链接 | [arXiv](https://arxiv.org/abs/2604.12625) |
| 发表 | CVPR 2026 |
| 领域 | cs.GR, cs.AI |

## 核心贡献

1. **首个专为时序光照贴图设计的神经压缩框架**，实现高质量动态 GI
2. **引入块压缩 (BC) 模拟策略**，确保与标准 GPU BC 格式兼容
3. **虚拟纹理集成的神经解码系统**，支持实时渲染的按需解压
4. **发布时序光照贴图数据集**，包含多种场景和时间变化

## 技术方案

### 问题
动态光照环境需要预计算多组光照贴图，导致巨大的存储和内存开销。

### 解决方案：NDGI
- **多维特征图**：将时序光照信息编码为紧凑特征图
- **轻量级 MLP 解码器**：根据纹理坐标和时间重建光照
- **BC 模拟策略**：训练时模拟量化压缩，提高压缩比
- **虚拟纹理 (VT) 集成**：tile 级流送和缓存

### 公式

**时序光照贴图表示**：
$$L = \{L_i | i = 0, 1, 2, ..., n-1\}$$

**动态 GI 重建**：
$$I(u,v,t) = \mathbf{H}_\Theta(u,v,t)$$

其中 $\mathbf{H}_\Theta$ 是神经模型，$\Theta$ 是可学习参数。

### 方法概述
1. 对不同结构的特征图进行采样
2. 将特征与编码后的时间嵌入拼接
3. 输入 MLP 重建光照
4. 使用 BC7 格式进一步压缩

## 实验结论

- 相比 PRT 和 NTC，**更高压缩比 + 更高光照质量**
- 更低实时计算开销
- 相比 NTC 更少噪声

## 相关工作

- Precomputed Lighting (PRT, Lightmaps)
- Traditional Texture Compression (DXTC, ASTC)
- Neural Texture Compression (Instant NGP)

## 标签

#全局光照 #神经压缩 #光照贴图 #动态光照 #2026
