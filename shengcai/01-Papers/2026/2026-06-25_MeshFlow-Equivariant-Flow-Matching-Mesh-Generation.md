---
tags: [渲染, 网格生成, 神经渲染, SIGGRAPH2026, 2026]
date: [[2026-06-25]]
status: 待读
---

# Mesh Generation with Equivariant Flow Matching

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Qi Sun |
| 发表 | SIGGRAPH 2026 |
| 链接 | [arXiv:2606.23489](https://arxiv.org/abs/2606.23489) |
| PDF | [PDF](https://arxiv.org/pdf/2606.23489) |
| 项目 | [MeshFlow](https://qiisun.github.io/MeshFlow/) |

## 核心贡献
1. 提出 **MeshFlow**，使用 equivariant optimal-transport flow matching 模型直接生成三角形网格
2. 修改 Diffusion Transformer 架构，保持所需等变性（face 排列不变性、vertex 排列不变性）
3. 引入 optimal-transport 训练目标，消除违反对称性的监督信号

## 技术方案

### 问题背景
网格是常见的 3D 场景表示，直接生成网格面临重要对称性挑战：
- Face 的任意排列
- 每个 face 内 vertex 的排列

### 关键创新
1. **Equivariant Flow Matching**：模型学习速度场同时保持等变性
2. **Optimal-Transport 训练目标**：提高收敛性
3. **Mesh 直接作为 triangle soups 生成**：避免序列化成长自回归序列

## 实验结论
- 推理速度比当前最优自回归网格生成器快约 **18 倍**
- 网格质量相当

## 标签
#MeshGeneration #FlowMatching #DiffusionTransformer #SIGGRAPH2026

## 相关笔记
