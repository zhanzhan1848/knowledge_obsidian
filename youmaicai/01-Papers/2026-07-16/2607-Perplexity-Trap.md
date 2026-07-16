# 🥬 LLM 论文分析：The Perplexity Trap

## 基本信息
- **标题**：The Perplexity Trap: When Patent Law Makes Human Writing Look Like AI
- **作者**：Anubhab Banerjee
- **发表**：arXiv:2607.13044 | **ICML 2026 Workshop AI4Law** | cs.CL / cs.AI
- **链接**：[原文](https://arxiv.org/abs/2607.13044)

## 核心贡献

1. **揭示 AI 检测工具的根本性失败**：在专利场景下，所有主流 zero-shot 检测器 FPR > 60%

2. **结构性原因**：EPO 专利法要求「清晰简洁」（Article 84），恰好将人类写作推向 LLMs 的低困惑度/低 burstiness 分布

3. **解决思路**：7 特征语言复杂度逻辑回归，达到 74.0% 准确率 @ 28.1% FPR（比纯困惑度基线高 13pp）

## 关键数据

| 检测器 | 假阳性率 (FPR) |
|--------|--------------|
| DetectGPT | 80.5% |
| Binoculars | 78.3% |
| Fast-DetectGPT | 61.3% |

问题跨多个 IPC 领域（A61K, C07D, F03D），在 H100 + Falcon-7B/GPT-J-6B 上持续存在。

## 局限
- 仅验证 EPO 专利场景
- 7 特征回归在更广泛场景的泛化性待验证

## 建议
- **推荐关注**：是（AI 检测研究 + 法律 AI 交叉）
- **亮点**：揭示了「AI 检测」问题的根本——法律约束本身改变了人类写作分布

---

*📅 2026-07-16 | 油麦菜 🥬*
