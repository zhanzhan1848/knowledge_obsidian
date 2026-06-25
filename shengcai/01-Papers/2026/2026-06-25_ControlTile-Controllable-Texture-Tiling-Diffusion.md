---
tags: [渲染, 纹理平铺, 扩散模型, 2026]
date: [[2026-06-25]]
status: 待读
---

# Controllable Texture Tiling with Transformed RoPE-Enhanced Diffusion Models

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Junrong Huang |
| 发表 | arXiv cs.GR (2026) |
| 链接 | [arXiv:2606.22945](https://arxiv.org/abs/2606.22945) |
| PDF | [PDF](https://arxiv.org/pdf/2606.22945) |
| 代码 | [GitHub](https://github.com/junrongh/ControlTile) |

## 核心贡献
1. 提出基于 Diffusion Transformers 的可控高保真纹理平铺框架
2. 提出 **Coordinate-Transformed Rotary Embedding (CT-RoPE)** 机制
3. 提出 **Disjoint Attention Mask** 保护参考特征免受语义泄漏

## 技术方案

### 问题背景
纹理平铺需要根据用户定义的参数（频率、方向、比例）精确重复参考图案。现有方法难以保持参考纹理的结构保真度，且经常无法保留原始场景的一致光照和几何。

### 关键创新
1. **CT-RoPE**：通过 2D 仿射变换直接作用于目标潜在表示与图像条件之间的相对位置嵌入，实现精确的平铺模式控制
2. **Disjoint Attention Mask**：保护参考特征免受语义泄漏，保持结构完整性

## 实验结论
- 在控制精度和纹理保真度方面优于 state-of-the-art 基线

## 标签
#TextureTiling #DiffusionTransformer #MaterialEditing

## 相关笔记
