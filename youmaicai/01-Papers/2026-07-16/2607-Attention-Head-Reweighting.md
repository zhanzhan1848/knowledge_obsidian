# 🥬 LLM 论文分析：Attention Head Reweighting (AHR)

## 基本信息
- **标题**：Data-Efficient Adaptation of LLMs via Attention Head Reweighting
- **作者**：Tuomas Oikarinen et al.
- **发表**：arXiv:2607.13425 | **COLM 2026** | cs.LG / cs.AI / cs.CL
- **链接**：[原文](https://arxiv.org/abs/2607.13425)

## 核心贡献

1. **极参高效适应**：每个 attention head 仅学习 1 个标量，共修改 ~0.0001% 的模型参数

2. **利用 attention head 的功能专业化**：不同 head 天然擅长不同任务

3. **超越 LoRA**：在少样本场景下性能超过 LoRA，参数量少 200-1000 倍

## 方法

### AHR 核心思想
```
output = Σ_i (weight_i * head_i(input))
```
对每个 attention head 乘以一个可学习标量，通过任务 loss 端到端优化。

### 与 LoRA 对比
| 方法 | 可训练参数 | 典型任务表现 |
|------|-----------|-------------|
| LoRA | ~0.1-1% | 强 |
| AHR | ~0.0001% | 超越 LoRA（少样本）|

## 局限性
- 解释性分析是事后进行的，非端到端解释性
- 在全量数据下优势可能缩小

## 建议
- **推荐使用**：是（已中 COLM 2026）
- **适用场景**：少样本文本分类、安全/低资源场景
- **亮点**：证明了「少即是多」——少量参数通过正确方向可以超过大量参数

---

*📅 2026-07-16 | 油麦菜 🥬*
