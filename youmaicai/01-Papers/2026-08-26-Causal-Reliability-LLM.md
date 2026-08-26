# From Causal Plausibility to Causal Reliability: Evaluating LLMs as Causal-Edge Classifiers

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | From Causal Plausibility to Causal Reliability: Evaluating LLMs as Calibrated Direct Causal-Edge Classifiers |
| 作者 | Amit Kumar, Elnur Adl Zarabi, Suranjana Trivedy, Zhiqian Chen, Lei Zhang, Kaiqun Fu, Taoran Ji |
| 链接 | [原文](https://arxiv.org/abs/2608.23660) |
| arXiv | arXiv:2608.23660 [cs.LG] |
| 发表 | 2026-08-24 |

## 核心贡献

1. **系统评估**: 对 12 个指令微调开源模型进行因果边分类可靠性评估，涵盖：
   - 6 个基准因果图
   - 5 种提示策略
   - 4 种置信度来源：verbalized, logit-based, cross-prompt agreement, cross-model agreement

2. **三大发现**:

   ### 发现 1: LLM 因果判断高度 recall-dominant
   - 模型预测过于稠密的图，产生大量假阳性边
   - 提示策略主要移动 precision-recall  trade-off，无法解决 overprediction
   - 模型规模增大带来的收益在大图上减弱，无法消除 miscalibration

   ### 发现 2: LLM 捕捉因果相关性但无法可靠识别直接性与方向性
   - 相对于参考图，模型误分类 **40.0% 间接边** 和 **36.0% 反转非边** 为直接边（仅 28.2% 其他非边）
   - **80.8% 和 84.6% 的这些假阳性收到 ≥80% 置信度**，揭示对结构错误预测的高度过度自信

   ### 发现 3: 传统置信度估计不可靠
   - Logit-based 置信度频繁接近 1.0，与正确性无关
   - Cross-prompt/cross-model 一致性提供更好的 mean calibration 和 discrimination
   - 但 Holm 校正后优势不具统计显著性

3. **关键结论**: 
   > LLMs are better viewed as sources of externally validated soft causal priors than as direct evidence of causal structure.

## 评估协议

- **语言唯一成对协议**: language-only pairwise protocol
- **置信度来源对比**: verbalized, logit-based, cross-prompt, cross-model

## 建议

- **是否推荐**: ⭐⭐⭐⭐
- **适用场景**: 因果发现研究；LLM 用于科学推理；因果 AI 系统构建
- **必读理由**: 首篇全面评估 LLM 因果推理可靠性的系统性研究，揭示关键失败模式
