# VEPO: Variable Entropy Policy Optimization for Low-Resource Language Foundation Models

## 元信息
| 标题 | Variable Entropy Policy Optimization for Low-Resource Language Foundation Models |
|------|------|
| 作者 | Chonghan Liu, Yimin Du, Qi An et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.19152) |
| arXiv | arXiv:2603.19152 |
| 日期 | 2026-03-19 |

## 核心贡献
1. 提出 VEPO：使用 RL with Verifiable Rewards 优化低资源语言
2. 引入可变熵机制，动态调节字面保真度与语义自然性
3. 在 90 个翻译方向上显著提升分词效率和翻译质量

## 问题背景
LLM 在低资源语言上表现不佳的原因：
- 分词效率低
- 训练数据系统性不平衡

## 核心技术
**VEPO 框架**：
- **确定性结构约束**：在策略对齐过程中强制执行
  - 规定序列长度
  - 格式一致性
  - 语言规范性
- **可变熵机制**：
  - 动态校准字面保真度与语义自然性的平衡
  - 调节探索-利用流形
- **Entropy-tempered advantage estimation** + **Asymmetric clipping**：
  - 保持鲁棒探索
  - 避免策略崩溃

## 实验结果
- **测试基准**：FLORES-200, COMET-22, chrF（90 个方向）
- **改进**：
  - 分词效率显著提升
  - 翻译质量大幅改善
  - 缩小代表性不足语言的性能差距

## 局限性
- 未提及

## 应用场景
- 低资源语言翻译
- 多语言 LLM 训练
- 跨语言对齐

## 相关链接
- [[low-resource-languages]]
- [[RLHF]]
- [[multilingual-LLMs]]
- [[tokenization]]
- [[policy-optimization]]
