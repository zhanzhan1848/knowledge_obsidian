# Imaginative Perception Tokens Enhance Spatial Reasoning in Multimodal Language Models

## 元信息
| 标题 | Imaginative Perception Tokens Enhance Spatial Reasoning in Multimodal Language Models |
|------|-----|
| 作者 | Mahtab Bigverdi, Lindsey Li, Weikai Huang, et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.03988) |
| arXiv | arXiv:2606.03988 |
| 发表 | 2026-06-02 |
| 领域 | cs.AI |

## 核心贡献
1. **问题**：视觉语言模型（VLMs）在空间推理上仍然困难，特别是关键信息不能直接观察的情况。
2. **Imaginative Perception Tokens (IPT)**：引入中间感知表示，将 VLM 在替代空间配置下会感知的内容外化，同时保持与观察输入的一致性。
3. **任务设计**：三个任务 PET (Perspective Taking), PT (Path Tracing), MVC (Multiview Counting)，约 20K 示例。

## 方法细节

### IPT 监督
- 使用 BAGEL 作为 backbone
- IPT 监督持续改善空间推理
- 通常优于文本 chain-of-thought 训练（无需在推理时生成图像）

### 实验结果
- **MVC**: 精度提升 **3.4%**
- **PT**: 与强闭源模型竞争性能
- **组合**：IPT + label-only 监督产生额外收益
- 文本 chain-of-thought 可显著降低性能（当空间计算被强制通过语言时存在模态不匹配）

## 核心创新点
- 为想象性感知推理提供原则性监督信号
- 中间可解释表示
- 证明模态选择对空间推理任务的重要性

## 标签
#multimodal #VLM #spatial-reasoning #attention #chain-of-thought