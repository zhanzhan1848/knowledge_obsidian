---
title: "DealMaTe: Multi-Dimensional Material Transfer via Diffusion Transformer"
date: 2026-05-18
tags: [渲染, 材质, 扩散模型, PBR, 材质传输]
status: 待读
authors: Nisha Huang et al.
source: arXiv
source_id: 2605.15681
categories:
  - Material Generation
  - Diffusion Models
  - PBR Materials
---

# DealMaTe: Multi-Dimensional Material Transfer via Diffusion Transformer

## 元信息
| 标题 | DealMaTe: Multi-Dimensional Material Transfer via Diffusion Transformer |
|------|-----|
| 作者 | Nisha Huang et al. |
| 来源 | arXiv:2605.15681 [cs.GR] |
| 链接 | [原文](https://arxiv.org/abs/2605.15681) |
| 发表时间 | 2026年5月15日 |
| 代码 | https://github.com/haha-lisa/DealMaTe |

## 核心贡献

1. **简化的扩散框架**：使用depth、normal、lighting图像进行材质传输，无需文本引导和参考网络
2. **Multi-Dim 3D Shader LoRA**：轻量级3D信息注入方法
3. **Shader Causal Mutual Attention**：优化注意力机制
4. **KV caching**：减少多条件推理延迟

## 技术方案

### 方法
DealMaTe = **De**pth, n**A**ture, **L**ighting images for **Ma**terial **Te**ransfer

- 不修改基础模型权重
- 实现兼容的控制条件
- 达到和谐稳定的结果

### 优化
- **Shader Causal Mutual Attention**：减少推理延迟
- **KV caching**：提高计算效率
- **低架构复杂度**：高质量材质传输

## 性能表现

- 在各种物体和光照条件下实现显著的高保真材质传输
- 支持任意输入材质的材质传输
- 开源代码可用

## 可行性分析

- **实现难度**：中
- **技术成熟度**：有代码
- **创新性**：⭐⭐⭐⭐
- **实用性**：⭐⭐⭐⭐⭐
- **推荐度**：⭐⭐⭐⭐

## 相关工作
- Diffusion-based material transfer
- PBR material generation
- Neural rendering
- Texture synthesis

## 标签
#渲染 #材质 #PBR #扩散模型 #材质传输 #2026 #arXiv
