---
title: Mesh Generation with Equivariant Flow Matching
authors: Qi Sun et al.
date: 2026-06-22
source: arXiv cs.GR (SIGGRAPH 2026)
url: https://arxiv.org/abs/2606.23489
pdf: https://arxiv.org/pdf/2606.23489
tags: [rendering, paper, 2026, mesh-generation, 3D, flow-matching, SIGGRAPH]
status: unread
---

# Mesh Generation with Equivariant Flow Matching

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Mesh Generation with Equivariant Flow Matching |
| 作者 | Qi Sun et al. |
| 来源 | arXiv cs.GR (SIGGRAPH 2026) |
| 年份 | 2026 |
| 链接 | [原文](https://arxiv.org/abs/2606.23489) |
| PDF | [下载](https://arxiv.org/pdf/2606.23489) |

## 核心贡献
1. 提出MeshFlow：直接生成三角网格作为三角汤（triangle soups），避免序列化长自回归序列
2. 采用等变最优传输流匹配模型，保持面和顶点的置换不变性
3. 对Diffusion Transformer架构进行简单有效修改，保持所需等变性

## 技术方案
网格是最常见的3D场景表示之一，但直接生成网格具有挑战性，因为表示包含重要对称性：
- 面的置换不变性
- 每个面内顶点的置换不变性

**MeshFlow方法：**
1. 学习直接生成三角汤而非有序网格
2. 采用等变最优传输流匹配模型
3. 提出Diffusion Transformer的简单有效修改

```python
# 等变流匹配
class EquivariantFlowMatcher:
    def __init__(self, model):
        self.model = model  # 保持置换等变性的网络
    
    def compute_velocity(self, x0, x1, t):
        # 最优传输计划的流匹配
        return self.model(x0, x1, t)
```

## 实验结论
- 推理速度比SOTA自回归网格生成器快约18倍
- 网格质量相当

## 局限性
- 生成三角汤可能需要后续网格重建步骤
- 对复杂拓扑结构处理可能有挑战

## 可行性分析
- 实现难度：中（基于现有flow matching框架）
- 性能预期：快速3D资产生成
- 适用场景：游戏资产创建、影视建模、实时应用

## 相关工作
- [[3D-generation-survey]]
- [[mesh-processing]]

## 笔记
SIGGRAPH 2026接收，18倍加速的网格生成方法值得关注，特别是对实时渲染资产生成有价值。