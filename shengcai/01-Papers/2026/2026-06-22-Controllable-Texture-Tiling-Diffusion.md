---
title: Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models
authors: -
date: 2026-06-22
source: arXiv cs.GR
url: https://arxiv.org/abs/2606.22945
pdf: https://arxiv.org/pdf/2606.22945
tags: [rendering, paper, 2026, texture-tiling, material, diffusion, PBR]
status: unread
---

# Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models |
| 作者 | - |
| 来源 | arXiv cs.GR |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.22945) |
| PDF | [下载](https://arxiv.org/pdf/2606.22945) |

## 核心贡献
1. 提出基于Diffusion Transformers的可控高保真纹理平铺框架
2. 提出坐标变换旋转位置编码（Coordinate-Transformed RoPE）机制
3. 提出不相交注意力掩码（Disjoint Attention Mask）保持参考纹理结构完整性

## 技术方案
纹理平铺需要根据用户定义的参数（频率、方向、比例）精确重复参考图案。现有问题：
- 像素级重采样破坏性
- 语义图像编码器缺乏细粒度空间信息
- 难以保持原始场景的光照和几何一致性

**两个关键技术创新：**

### 1. 坐标变换旋转位置编码（CT-RoPE）
- 将2D仿射变换直接应用于目标潜在特征与图像条件之间的相对位置嵌入
- 无需显式像素变形即可实现平铺模式精确控制

### 2. 不相交注意力掩码
- 屏蔽参考特征语义泄漏
- 保持结构完整性同时无缝融合纹理与场景

```python
# CT-RoPE核心
def coordinate_transform_rope(relative_pos, transform_matrix):
    # 应用2D仿射变换到位置编码
    transformed_pos = transform_matrix @ relative_pos
    return rotary_embedding(transformed_pos)

# 不相交注意力
def disjoint_attention(query, reference, mask):
    # 参考特征不参与语义泄漏
    return attention(query, reference * mask)
```

## 实验结论
- 在控制精度和纹理保真度方面优于SOTA基线

## 局限性
- 依赖Diffusion Transformer计算资源
- 对极端变换参数可能效果下降

## 可行性分析
- 实现难度：高（Diffusion模型训练复杂）
- 性能预期：高质量纹理生成
- 适用场景：PBR材质生成、游戏纹理、影视表面编辑

## 相关工作
- [[texture-synthesis-survey]]
- [[material-generation]]

## 笔记
纹理平铺对PBR材质工作流重要，CT-RoPE和不相交注意力掩码是创新点，可用于自动材质生成。