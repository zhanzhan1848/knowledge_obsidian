# LACUNA: LLM Unlearning 参数级遗忘评估基准

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | A Testbed for Evaluating Localization Precision for LLM Unlearning |
| **arXiv** | [2607.02513](https://arxiv.org/abs/2607.02513) |
| **作者** | Matteo Boglioni et al. |
| **分类** | cs.CL, cs.AI, cs.LG |
| **发表** | 2026-07-02 |
| **链接** | [arXiv](https://arxiv.org/abs/2607.02513) |

## 核心贡献

1. **首个参数级真实标签遗忘测试平台 LACUNA**: 解决现有基准只在输出层面评估遗忘的问题，无法判断遗忘是否真正从模型参数中擦除知识

2. **PII 注入方法**: 通过掩码持续预训练将合成个人的 PII 注入到 1B 和 7B OLMo 模型预定参数位置

3. **基准测试现有 SOTA 方法**: 发现尽管输出级表现良好，现有方法高度不精确且容易受到 resurfacing 攻击

4. **精确遗忘的重要性**: 证明当定位成功时，即使简单的梯度基遗忘方法也能实现强擦除和对 resurfacing 攻击的鲁棒性

## 问题背景

- LLM 记忆化敏感训练数据，包括个人身份信息 (PII)
- Unlearning 成为一种有前景的后训练删除方法
- SOTA 方法通常遵循 "localize-first, unlearn-second" 范式
- 现有基准仅在输出层面评估，无法验证参数级真实性
- resurfacing 攻击的成功引发担忧：是否只是混淆而非真正擦除

## 方法

### LACUNA 设计
- 在 1B 和 7B OLMo 模型预定参数位置注入合成个人 PII
- 支持直接评估遗忘是否针对存储知识的权重
- 提供 ground-truth 参数级定位

### 评估发现
- 当前 SOTA 方法输出级表现强，但精确度低
- 易受 resurfacing 攻击影响
- 当定位成功时，简单梯度基方法可实现强遗忘效果

## 关键结论

> 尽管输出级表现良好，现有方法高度不精确且容易受到 resurfacing 攻击。精确的遗忘对鲁棒的基于定位的遗忘至关重要。

## 局限性

- 主要关注合成 PII 和特定模型架构
- 需要更多真实世界场景验证
- 对更大型号模型的影响待研究

## 建议

- **是否推荐使用**: 是
- **适用场景**: LLM 遗忘研究、隐私保护、模型安全评估
- **相关方向**: Machine Unlearning, Privacy in ML, Model Security

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
