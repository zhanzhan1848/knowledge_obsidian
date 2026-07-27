# FlowGuard: Securing Multimodal AI through Internal Information Decomposition

## 元信息
| 标题 | Securing Multimodal AI through Internal Information Decomposition |
|------|------|
| 作者 | Jehyeok Yeon, Hyeonjeong Ha, Qiusi Zhan, Heng Ji |
| 链接 | [原文](https://arxiv.org/abs/2607.21600) |
| arXiv | arXiv:2607.21600 |
| 代码 | 待补充 |
| 会议 | ICML 2026 Spotlight |
| 领域 | cs.AI |

## 核心贡献

1. **关键发现**: 良性输入在文本-only 和视觉-only 推理中产生兼容的预测行为，融合时趋于稳定；而对抗性操纵会破坏这种一致性，导致异常的模态融合行为
2. **核心洞察**: 多模态大模型存在**风格不一致性 (Stylistic Inconsistency)**：MLLM 可以鲁棒地理解任意视觉风格的内容，但其防御机制容易被特定风格触发器轻易绕过
3. **方案**: 提出 **FlowGuard**，一个轻量级推理时框架，通过监控内部多模态一致性来检测有害输入

## 核心技术: FlowVectors

- 灵感来自**部分信息分解 (Partial Information Decomposition, PID)**
- 量化跨模态冗余、协同和模态特定主导性
- 捕获融合的多模态预测是否与单模态语义证据保持一致

## 核心创新点

- **训练方式**: 单类分类问题，仅在良性数据上训练
- **防御目标**: 跨模态一致性作为检测信号，而非单独检查每个模态
- **计算效率**: 与依赖标量置信度指标的方法不同，FlowGuard 延迟降低高达 6 倍

## 实验结果

| 指标 | 基线 | FlowGuard |
|------|------|-----------|
| Attack Success Rate | >90% | **<15%** |
| Utility Loss | - | **<3%** |
| Latency Reduction | - | **up to 6x** |

## 局限性

- 评估在特定多模态攻击类型上进行
- 对新型未知攻击的泛化能力待进一步验证
- FlowVectors 的可解释性可以进一步增强

## 建议
- **是否推荐使用**: 是
- **适用场景**: 需要部署多模态 LLM 的安全敏感场景
- **备注**: ICML 2026 Spotlight 论文，值得关注多模态安全方向

---

> 💡 归档时间: 2026-07-27 | 来源: arXiv cs.AI
