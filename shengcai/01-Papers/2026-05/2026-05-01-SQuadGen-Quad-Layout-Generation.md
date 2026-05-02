---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [paper, quad-mesh, mesh-generation, SIGGRAPH2026, rendering]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.27329
---

# SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | SQuadGen: Generating Simple Quad Layouts via Chart Distance Fields |
| **作者** | Yang Liu, et al. |
| **发表** | SIGGRAPH 2026 Journal Track, April 30, 2026 |
| **链接** | [原文](https://arxiv.org/abs/2604.27329) |
| **DOI** | 10.1145/3811348 |
| **代码** | https://youkang-kong.github.io/squadgen/ |

---

## 核心贡献

> 提出基于Chart Distance Fields (CDF)的扩散框架，解决四边形网格布局生成的离散连接性学习和大规模数据稀缺两大挑战。

1. **CDF表示**：连续曲面表示，有效学习和合成四边形布局
2. **大规模数据集**：定义loop-aware simplicity metrics，从公开3D库恢复高质量quad layouts
3. **扩散模型**：基于diffusion的生成框架

---

## 技术方案

### 核心思想

3D形状（扫描/重建/AI生成）通常缺乏简单的四边形网格布局——这对高效编辑和建模至关重要。现有quad-remeshing技术通常产生复杂布局，导致繁琐的手动清理。

**关键洞察**：
1. 离散网格连接性阻碍学习
2. 简单四边形网格大规模数据集稀缺

**解决方案**：
1. CDF：连续曲面表示，实现有效学习和合成
2. Loop-aware simplicity metrics + quad-recovery pipeline构建大规模数据集

### 关键技术

| 技术 | 说明 |
|------|------|
| Chart Distance Fields | 连续曲面表示，用于quad layout合成 |
| 扩散模型 | diffusion-based generative framework |
| Loop-aware simplicity metrics | 定义"简单"四边形布局的标准 |
| Quad-recovery pipeline | 从公开3D库恢复高质量quad layouts |

---

## 实验结论

- **质量**: consistently outperforms existing methods
- **鲁棒性**: 对不同3D输入产生鲁棒、artist-friendly的简单quad layouts
- **适用性**: 适用于扫描、重建、AI生成的各种输入

---

## 实现建议

- **实现难度**: 高（扩散模型训练）
- **预期性能**: 高质量简单四边形布局自动生成
- **适用场景**: 网格编辑、建模管道、AI生成内容

---

## 标签

#四边形网格 #网格生成 #SIGGRAPH2026 #扩散模型 #计算机图形学
