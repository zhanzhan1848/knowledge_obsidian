# ASO: Adversarial Style Optimization for VLM Jailbreaks

## 元信息
| 标题 | Adversarial Style Optimization: Enhancing VLM Jailbreaks by GRPO-based Stylistic Triggers Optimization |
|------|------|
| 作者 | Bingjun Luo, Jialin Guo, Yue Yao, Xinpeng Ding |
| 链接 | [原文](https://arxiv.org/abs/2607.21619) |
| arXiv | arXiv:2607.21619 |
| 代码 | [GitHub](https://github.com/bingjunluo/ASO) |
| 会议 | CVPR 2026 (Oral) |
| 领域 | cs.CL, cs.AI |

## 核心贡献

1. **关键发现**: MLLM 存在**风格不一致性 (Stylistic Inconsistency)**：
   - MLLM 可以鲁棒地理解任意视觉风格的内容
   - 但其防御机制容易被特定风格触发器轻易绕过
2. **方案**: 提出 **Adversarial Style Optimization (ASO)**，一个即插即用的增强模块
3. **方法**: ASO 微调图像编辑模型，将优化的风格修改叠加到给定对抗图像上

## 核心技术: GRPO + Structurally-Tiered Reward Function

- **Group Relative Policy Optimization (GRPO)**: 分组相对策略优化
- **Structurally-Tiered Reward Function**:
  - 基于检测明确拒绝的 logit 信号
  - 来自强 judge 模型的高保真语义评估

## 核心创新点

- **首次利用风格偏差作为红队 MLLM 的可扩展向量**
- 仅修改视觉风格，不修改文本内容
- 显著增强 SOTA 攻击的 ASR (Attack Success Rate)

## 实验结果

- ASO 显著增强了 SOTA 攻击的 ASR
- 证明了风格偏差是红队 MLLM 的可扩展攻击向量

## 局限性

- 主要关注视觉 jailbreak，对其他模态攻击的泛化性待验证
- 防御策略可能需要相应更新

## 建议
- **是否推荐使用**: 对研究者有价值
- **适用场景**: VLM 安全对齐、红队测试
- **备注**: CVPR 2026 Oral，多模态安全对齐方向的重要工作

---

> 💡 归档时间: 2026-07-27 | 来源: arXiv cs.CL
