---
type: paper
created: 2026-05-01
updated: 2026-05-01
tags: [quad-mesh, remeshing, SIGGRAPH2026, generative, CDF]
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
| **作者** | Yang Liu (et al.) |
| **发表** | SIGGRAPH 2026 Journal Track |
| **链接** | [原文](https://arxiv.org/abs/2604.27329) |
| **DOI** | 10.1145/3811348 |
| **代码** | https://youkang-kong.github.io/squadgen/ |

---

## 核心贡献

> 提出 Chart Distance Fields (CDF) 连续曲面表示方法，配合扩散模型生成简洁的四边形网格布局，解决现有重网格化方法产生的复杂布局难以编辑的问题。

1. **Chart Distance Fields (CDF)**：连续曲面表示，将离散网格连接性难题转为连续问题，便于学习
2. **扩散生成框架**：基于 Diffusion 的 quad layout 生成，优于传统优化方法
3. **大规模数据集构建**：定义 loop-aware simplicity metrics，从公开 3D 库恢复高质量 quad layouts
4. **简单、艺术家友好**的 quad layouts 输出，直接支持高效编辑和建模

---

## 技术方案

### 核心问题

3D 形状（扫描/重建/AI生成）通常缺少简洁的 quad mesh layouts。现有 quad-remeshing 技术产生复杂布局（不规则 loop 密集），需大量手动清理。

### CDF 方法

- 将 quad layout 的连接性编码为 Chart Distance Field（标量场）
- 零 level set = chart boundaries（quad 边界）
- SDF-like 连续表示使神经网络可学习
- 避免离散网格连接的组合爆炸问题

### 关键数据

- 构建大规模数据集：从公共 3D 库通过 robust quad-recovery pipeline 恢复高质量 quad layouts
- 定义 loop-aware simplicity metrics 量化 layout 简洁程度

---

## 实验结论

- **数据集**: 多样化 3D 输入
- **基线**: 现有 quad-remeshing / layout 生成方法
- **结果**: 持续优于现有方法，生成 robust、artist-friendly 的简单 quad layouts

---

## 局限性

- 依赖高质量 3D 模型数据集的构建
- 扩散模型推理速度可能影响交互使用

---

## 实现建议

- **实现难度**: 中-高（扩散模型 + SDF 表示需理解）
- **预期性能**: 生成质量好，支持多种 3D 输入
- **适用场景**: 3D 建模工具、网格编辑、AI 生成内容管线
- **可借鉴点**: CDF 连续表示将离散问题连续化的思路，可扩展到其他网格处理任务

---

## 相关工作

- [[Quad Remeshing]]
- [[Chartification]]
- [[Diffusion for Geometry]]
