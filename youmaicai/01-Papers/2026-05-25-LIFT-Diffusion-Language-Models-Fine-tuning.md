# LIFT: Learnability-Informed Fine-Tuning of Diffusion Language Models

## 元信息
| 标题 | Learnability-Informed Fine-Tuning of Diffusion Language Models |
|------|------|
| 作者 | Shubham Parashar |
| 链接 | [原文](https://arxiv.org/abs/2605.22939) |
| arXiv | arXiv:2605.22939 |
| GitHub | [divelab/LIFT](https://github.com/divelab/LIFT) |
| 领域 | cs.CL, cs.LG |

## 核心贡献
1. **问题**: SFT 在 diffusion language models (DLMs) 上表现不佳或伤害性能
2. **根因**: Vanilla SFT 忽略了 learnability——即"什么token"和"何时学习"
   - 稀有 token 在输入大部分被 mask 时难以学习
   - 常见 token 在输入大部分 unmask 时容易学习但价值低
3. **方法**: LIFT，根据扩散时间步的信息可用性动态调整学习策略
4. **结果**: 6个推理基准超越 SFT 基线，AIME'24/AIME'25 相对提升 3x

## 方法详解
### Learnability 问题
- DLM 中输入大部分被 mask，稀有 token 难以学习
- 输入大部分 unmask 时学习常见 token 价值低
- SFT 忽略这两个问题

### LIFT 策略
- 当输入大部分被 mask 时学习简单 token
- 当更多上下文可用时学习困难 token
- 训练与不同扩散时间步的信息可用性对齐

## 实验结果
- 6个推理基准超越现有 SFT 基线
- AIME'24 和 AIME'25 相对增益达 3x

## 局限性
- 仅在 diffusion models 测试
- 对其他生成范式的适用性未知

## 建议
- 适用场景: 扩散语言模型微调、推理能力提升
- 推荐程度: ⭐⭐⭐⭐