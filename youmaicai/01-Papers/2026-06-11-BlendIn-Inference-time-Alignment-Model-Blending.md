# BlendIn: Inference-time Alignment with Probabilistic Model Blending

## 元信息
| 标题 | To Intervene or Not: Guiding Inference-time Alignment with Probabilistic Model Blending |
|------|-----|
| 作者 | Jin Gan, Xin Li, Jun Luo |
| 链接 | [原文](https://arxiv.org/abs/2606.11201) |
| arXiv | arXiv:2606.11201 |
| 会议 | ACL 2026 |
| 代码 | [GitHub](https://github.com/DecayingSeart/BlendIn) |
| 领域 | LLM Alignment · Inference-time Alignment |

## 核心贡献

1. **BlendIn 框架**：推理时对齐框架，从二元决策转变为创建融合两个模型知识的混合分布
2. **系统性评估**：揭示 guidance effectiveness 在不同模型间差异巨大
3. **质量感知对齐**：执行质量感知的对齐，按可靠性比例加权每个模型的贡献
4. **显著性能提升**：在挑战性模型对上实现高达 **50%** 的性能提升

## 背景问题

### 现有方法的问题
- 推理时对齐在输出生成期间干预，成本较低
- 但现有方案应用的 guidance 未充分评估其可靠性
- **无效 guidance 导致更多干预**：造成过度干预，性能下降

### 关键发现
- 不同模型间的 guidance effectiveness 差异巨大
- 无效 guidance 导致进一步混淆，从而导致更多干预
- 过度干预是性能不佳的信号

## 核心方法

### BlendIn 机制
1. **质量感知对齐**：评估 guidance 的可靠性
2. **比例加权**：根据可靠性比例加权每个模型的贡献
3. **保留有益 guidance，下调不可靠建议**

### 提供内容
- **诊断信号**：识别 misaligned guidance
- **缓解策略**：修复 misaligned guidance

## 关键结果
- 在挑战性模型对上实现 **高达 50% 的性能提升**
- 保留有益 guidance，同时下调不可靠建议

## 建议
- **是否推荐阅读**：是（ACL 2026论文，对推理时对齐有重要启示）
- **适用场景**：LLM 对齐、模型融合、推理时干预

## 相关概念
- [[LLM Alignment]]
- [[Inference-time Alignment]]
- [[Model Blending]]
- [[RLHF]]