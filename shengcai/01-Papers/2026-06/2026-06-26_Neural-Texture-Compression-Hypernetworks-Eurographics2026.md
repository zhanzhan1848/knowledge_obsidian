---
type: paper
created: 2026-06-27
updated: 2026-06-27
tags: [paper, rendering, neural-texture, PBR, compression, Eurographics2026]
status: processed
domain: rendering
agent: shengcai
source: https://arxiv.org/abs/2606.26913
---

# Neural Texture Compression using Hypernetworks

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Neural Texture Compression using Hypernetworks |
| **作者** | Laurent Belcour et al. |
| **发表** | Eurographics Symposium on Rendering 2026 |
| **链接** | [原文](https://arxiv.org/abs/2606.26913) |
| **DOI** | 10.48550/arXiv.2606.26913 |
| **代码** | 待公开 |

---

## 核心贡献

> 训练单一超网络同时输出神经纹理的潜特征和 MLP 解码器权重/偏置，实现per-material梯度下降优化向单次超网络推理的范式转换。

1. **超网络统一建模**：训练一个超网络同时生成潜特征和 MLP 解码器的完整权重，替代每个材质独立优化
2. **等效压缩质量**：尽管解空间高维，方法仍达到与当前参考神经纹理压缩器相当的重建质量
3. **多解码器扩展**：支持一次性推断多个解码器，甚至生成超分辨率解码器

---

## 技术方案

### 背景

现有神经纹理压缩方法：
- 学习 per-material 的潜纹理 + 小型 MLP 解码器
- 在着色时实时解码，重现 PBR 材质输入
- **问题**：每个 MLP + 潜配置组合都需要独立梯度下降优化

### 方法

训练单一超网络 $\mathcal{H}$，对给定材质 $M$：
$$\mathcal{H}(M) \rightarrow (\mathbf{z}, \theta)$$

其中 $\mathbf{z}$ 是潜特征，$\theta = (W, b)$ 是 MLP 的权重和偏置

### 核心思想

将高维解空间压缩为超网络的条件生成问题，一次前馈即可得到完整解码器

### 扩展应用

1. **多解码器推断**：一次性生成多个材质的解码器
2. **超分辨率解码器**：解码器学习将低分辨率潜纹理上采样

---

## 实验结论

- 发表在 Eurographics Symposium on Rendering 2026
- 质量与当前参考神经纹理压缩器相当
- 大幅降低推理计算量（单次前传 vs. 迭代优化）

---

## 局限性

- 解空间高维，理论保证待完善
- 对复杂材质的泛化能力待验证
- 超网络训练本身需要大量计算资源

---

## 相关工作

- [[OpenPBR]] 物理材质标准
- [[神经材质]] Neural Material 相关研究
- [[材质压缩]] 实时材质压缩技术

---

## 实现建议

- **实现难度**: 高（涉及超网络训练 + 神经渲染管线）
- **预期性能**: 推理速度大幅提升，压缩率显著改善
- **适用场景**: 游戏/实时渲染引擎的 PBR 材质流送、VR/AR 材质系统
- **研究价值**: ⭐⭐⭐⭐ 发表于 EGSR 2026，值得深入研究超网络在材质重建中的应用
