---
type: paper
created: 2026-04-07
updated: 2026-04-07
tags: [gaussian-splatting, appearance-disentanglement, relighting, neural-rendering, autonomous-driving]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2604.03462
---

# Appearance-Disentangled Feed-Forward Gaussian Splatting for Driving Scenes

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Appearance-Disentangled Feed-Forward Gaussian Splatting for Driving Scenes |
| **作者** | Quentin Herau |
| **发表** | arXiv 2026-04-03 (cs.CV, cs.GR), Under Review |
| **链接** | [原文](https://arxiv.org/abs/2604.03462) |
| **DOI** | 10.48550/arXiv.2604.03462 |
| **代码** | 待补充 |
| **页数** | 约 16 figures |

---

## 核心贡献

> 前馈3DGS方法将场景几何与瞬态外观（光照、天气、时间）解耦，实现可控制的appearance transfer和时序一致的重新打光

1. **外观解耦**：将颜色预测分解为 appearance-agnostic base stream 和 appearance-conditioned adapted stream
2. **DINOv2 特征嵌入**：使用 DINOv2 特征提取全局外观嵌入
3. **混合重新打光管线**：结合物理基础内分解与扩散生成精炼的配对观测
4. **时序历史记忆**：存储 appearance-agnostic 特征，支持任意目标外观重新渲染

---

## 技术方案

### 核心思想

传统前馈3DGS方法存在的问题：
- 将场景几何与瞬态外观属性（光照、天气、时间）纠缠
- 无法支持重新打光、appearance transfer

本文提出 **SpectralSplat**：
1. **双流颜色预测**：
   - Base stream：appearance-agnostic
   - Adapted stream：appearance-conditioned
   - 两者由共享MLP生成，输入为全局外观嵌入（来自DINOv2）

2. **解耦训练**：
   - 使用混合重新打光管线生成配对观测
   - 物理基础内分解 + 扩散生成精炼
   - 监督：一致性、重建、跨外观、基础颜色损失

3. **时序历史**：
   - 存储 appearance-agnostic 特征
   - 累积的高斯可在任意目标外观下重新渲染

---

## 实验结论

- **数据集**：自动驾驶场景
- **应用**：可控 appearance transfer、时序一致的重新打光
- **效果**：保持底层重建质量的同时实现外观控制

---

## 局限性

- 方法依赖于 DINOv2 特征质量
- 扩散模型生成 refinement 的计算开销

---

## 实现建议

- **实现难度**: 高
- **适用场景**: 自动驾驶数据编辑、场景重打光、AR/VR
- **相关工作**: Feed-forward 3DGS, Neural Relighting, Gaussian Splatting

---

## 标签

#3DGS #高斯泼溅 #外观解耦 #重新打光 #神经渲染 #自动驾驶
