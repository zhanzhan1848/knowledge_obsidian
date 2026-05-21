# Multi-Pass Prompt Verification for Quantized LLMs in Qualitative Analysis

## 元信息
| 标题 | Improving Quantized Model Performance in Qualitative Analysis with Multi-Pass Prompt Verification |
|------|------|
| 作者 | Aisvarya Adeseye, Jouni Isoaho, Adeyemi Adeseye |
| 链接 | [原文](https://arxiv.org/abs/2605.20193) |
| arXiv | arXiv:2605.20193 |
| 会议 | 12th Intelligent Systems Conference 2026 |
| 领域 | LLM 量化, 定性分析, 幻觉检测 |

## 核心贡献
1. **Multi-Pass Prompt Verification**: 提出量化的多步提示验证方法,减少低比特量化模型的幻觉
2. **8-bit 保持最佳**: 8-bit 模型最接近黄金标准 ground truth
3. **方法有效性**: 4-bit 模型应用该方法后变得稳定,3-bit 和 2-bit 模型也有改善

## 核心发现
**量化对定性分析的影响**:
- 低比特模型(8/4/3/2-bit)常产生更多幻觉和不稳定结果
- 非专家语言(含模糊术语)对低比特模型挑战更大
- 同一比特级别但不同量化类型表现不同

## 方法
```
Low-bit LLM Output → Verification Step → Remove Unreliable Content → Next Transcript → Refined Output
```
通过受控步骤引导模型,减少幻觉,去除不可靠内容后传递给下一个 transcript

## 黄金标准构建
- 人类编码器使用 NVivo 和 BF16 LLaMA 分析 transcripts
- BF16 LLaMA-3.1 产生高精度输出但存在语义漂移和幻觉
- 人工校正 BF16 输出 + NVivo 人类编码 → Gold-Standard Ground Truth (GSGT)

## 建议
- 是否推荐阅读: **是**,量化部署、定性研究应用方向
- 适用场景: 质性研究、低资源部署、定性数据分析

---

*📅 收录日期: 2026-05-21 | 分类: #quantization #qualitative-analysis #hallucination #LLaMA*