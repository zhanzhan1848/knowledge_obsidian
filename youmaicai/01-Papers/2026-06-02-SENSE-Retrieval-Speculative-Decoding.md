# 🥬 SENSE: Retrieval-based Speculative Decoding with Semantic Embedding

## 基本信息
- **标题:** SENSE: Semantic Embedding Navigation with Soft-gated Evaluation for Retrieval-based Speculative Decoding
- **作者:** Shaowen Chen, Zhicheng Liao, Hongwei Wang
- **链接:** [arXiv:2606.00021](https://arxiv.org/abs/2606.00021)
- **arXiv:** arXiv:2606.00021
- **分类:** cs.CL, cs.AI, cs.LG

## 核心创新点

SENSE 通过以下方式解决 RSD 的脆弱性问题：

1. **Semantic Embedding Navigation** — 基于 target model 的 hidden states 进行检索，建立鲁棒的语义对齐
2. **Soft-gated Evaluation Module** — 验证语义等价而非表面形式
3. **统一框架** — 将现有方法分解为原子原语，支持细粒度组件级比较

## 问题背景

- 投机解码 (SD) 用轻量 draft 模型提议候选 token，由目标模型并行验证
- Retrieval-based SD (RSD) 虽然灵活，但 rigid lexical dependencies 使检索和验证对表面变化敏感

## 方法

1. **Hidden State-based Retrieval** — 用目标模型的内部表示建立语义对齐
2. **Soft-gated Evaluation** — 语义等价验证
3. **Atomic Primitives Framework** — 组件级比较

## 实验结果

- LLaMA 和 Qwen 系列上优于多个 baseline
- **Mean Acceptance Length: 4.09**
- **Speedup: 3.26×**
- 保持生成质量

## 局限性

- 代码待发布

## 建议
- **推荐程度:** ⭐⭐⭐⭐
- **适用场景:** LLM 推理加速、speculative decoding、 inference optimization

---
*2026-06-02 收录自 arXiv cs.CL*