# CADFT: Compatibility-Aware Dynamic Fine-Tuning

## 元信息
| 标题 | Compatibility-Aware Dynamic Fine-Tuning for Large Language Models |
|------|-----|
| 作者 | Yucheng Zhou, Junwei Sheng, Qianning Wang, Jianbing Shen |
| 链接 | [原文](https://arxiv.org/abs/2606.11206) |
| arXiv | arXiv:2606.11206 |
| 会议 | ACL 2026 |
| 领域 | Fine-tuning · SFT · LLM Alignment |

## 核心贡献

1. **CADFT 方法**：DFT 的原则性扩展，控制样本级优化方差
2. **兼容性信号**：从模型似然中导出动态、策略依赖的兼容性信号，用于调制监督更新
3. **低频重写策略**：延迟的、低频的兼容性引导重写策略，将持续不兼容的演示转化为可学习目标
4. **方差控制估计器**：将 token 级稳定化泛化到样本级

## 背景问题

### SFT 的问题
- 优化不稳定
- 泛化能力有限
- 病理梯度缩放

### DFT 的局限
- 假设所有演示都是同等的学习目标
- 大规模指令数据异质性强，演示-策略不匹配导致样本级高方差更新

## 核心方法

### 兼容性信号
- 从模型似然导出动态、策略依赖的兼容性信号
- 调制监督更新，抑制不兼容演示的高方差梯度

### 兼容性引导重写
- 延迟的、低频的重写策略
- 将持续不兼容的演示转化为可学习目标

### 方差控制视角
- CADFT 可解释为方差控制估计器
- 将 DFT 的 token 级稳定化泛化到样本级

## 关键结果
- 改善了**稳定性、泛化能力、冷启动强化学习初始化**
- 完全监督，独立于显式 reward modeling

## 建议
- **是否推荐阅读**：是（ACL 2026 论文，对 SFT 优化有重要改进）
- **适用场景**：LLM 微调、模型对齐、指令跟随模型训练

## 相关概念
- [[Supervised Fine-Tuning]]
- [[Dynamic Fine-Tuning]]
- [[LLM Alignment]]
- [[Instruction Tuning]]