---
title: "Re-Mask and Redirect: Exploiting Denoising Irreversibility in Diffusion Language Models"
authors: ["Arth Singh"]
category: [cs.CL, cs.AI]
date: 2026-04-13
tags: [diffusion language model, safety, jailbreak, dLLM, alignment]
reviewer: youmaicai
---

## 元信息

| 标题 | Re-Mask and Redirect: Exploiting Denoising Irreversibility in Diffusion Language Models |
|------|------|
| 作者 | Arth Singh |
| 链接 | [原文](https://arxiv.org/abs/2604.08557) |
| arXiv | arXiv:2604.08557 |
| 会议/期刊 | - |
| 代码 | - |

## 核心贡献

1. **发现 dLLM 安全对齐的脆弱性**：基于去噪不可逆性的结构性漏洞
2. **简单两步攻击实现高 ASR**：
   - Re-masking：重新屏蔽拒绝 token
   - Redirect：注入 12-token 肯定前缀
3. **确认漏洞是结构性而非算法性**：梯度优化扰动反而降低攻击成功率

## 核心发现

### 安全假设的脆弱性

> 扩散语言模型（dLLM）安全对齐依赖于单一脆弱假设：去噪调度是单调的，承诺的 token 从未被重新评估

### 关键观察

- Safety-aligned dLLMs 在 **64 步去噪的前 8-16 步**内提交拒绝 token
- 调度将这些承诺视为永久性的

### 攻击方法

**两步干预**：
1. Re-mask：重新屏蔽这些 token
2. Redirect：注入 12-token 肯定前缀

## 实验结果

| 目标模型 | ASR（HarmBench, n=159, Lg=128） |
|----------|--------------------------------|
| LLaDA-8B-Instruct | 76.1% |
| Dream-7B-Instruct | 81.8% |

### 梯度优化扰动反而降低 ASR

> 使用可微分 Gumbel-softmax 链的梯度优化扰动反而将 ASR 从 76.1% 降至 41.5%

这确认漏洞是**结构性**而非需要复杂利用的

## 核心结论

> dLLM 安全不是对抗鲁棒的，而是架构浅层的——它成立仅因为去噪调度从未被违反

## 建议防御

1. **Safety-aware unmasking schedules**：安全感知去屏蔽调度
2. **Step-conditional prefix detection**：步条件前缀检测
3. **Post-commitment re-verification**：承诺后重新验证

## 局限性

- 主要针对文本生成 dLLM
- 防御方案尚未实现和测试

## 相关论文

- 相关: [[Diffusion language model]]
- 相关: [[AI safety]]
- 相关: [[Jailbreak]]

## 原始摘要

> Diffusion-based language models (dLLMs) generate text by iteratively denoising masked token sequences. We show that their safety alignment rests on a single fragile assumption: that the denoising schedule is monotonic and committed tokens are never re-evaluated. Safety-aligned dLLMs commit refusal tokens within the first 8-16 of 64 denoising steps, and the schedule treats these commitments as permanent. A trivial two-step intervention - re-masking these tokens and injecting a 12-token affirmative prefix - achieves 76.1% ASR on HarmBench (n=159, Lg=128) against LLaDA-8B-Instruct and 81.8% ASR (n=159) against Dream-7B-Instruct, without any gradient computation or adversarial search. The simplicity of this exploit is itself the central finding: augmenting with gradient-optimized perturbation via a differentiable Gumbel-softmax chain consistently degrades ASR (e.g., 41.5% vs. 76.1% at Lg=128), confirming that the vulnerability is structural rather than requiring sophisticated exploitation. These findings reveal that dLLM safety is not adversarially robust but architecturally shallow - it holds only because the denoising schedule is never violated. We discuss defenses including safety-aware unmasking schedules, step-conditional prefix detection, and post-commitment re-verification.

---

*论文收录于 youmaicai/01-Papers/2026-04/*
