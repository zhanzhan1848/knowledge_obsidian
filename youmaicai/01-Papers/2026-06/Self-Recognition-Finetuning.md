# Self-Recognition Finetuning can Prevent and Reverse Emergent Misalignment

## 元信息
| 标题 | Self-Recognition Finetuning can Prevent and Reverse Emergent Misalignment |
|------|------|
| 作者 | Arush Tagade (et al.) |
| 链接 | [原文](https://arxiv.org/abs/2606.23700) |
| arXiv | arXiv:2606.23700 |
| 领域 | AI Safety, Alignment, Fine-tuning |

---

## 核心贡献

1. **重新定义 Emergent Misalignment (EM)**：EM 不是学习有害内容的直接后果，而是通过对齐人格（aligned character）的破坏实现的——EM 微调将错误注入 LLM 的身份自我报告，使其身份认知多样化。

2. **Self-Generated Text Recognition (SGTR) Finetuning**：提出一种角色靶向干预方法，让模型学会识别自己生成的有害/错误内容：
   - 生成潜在有害响应
   - 让模型判断哪些是自己生成的
   - 通过对比学习强化识别能力

3. **多模型验证**：在 GPT-4.1、Qwen2.5-32B-Instruct、Seed-OSS-36B-Instruct 三个模型上验证，发现：
   - **Prevention**：仅 SGTR Finetuning 能持续降低误对齐而不加剧任何指标
   - **Reversal**：所有干预在恢复被 EM 降级的性能方面效果相当，但前提是恢复被 EM 损害的能力

4. **关键证据**：
   - EM finetuning 使 LLM 的身份自我报告变得多样化
   - 人为破坏自我识别会加剧 EM 造成的误对齐
   - 移除身份承载的系统提示后，EM finetuning 的效果大幅降低

---

## 实验设置

**模型**：GPT-4.1, Qwen2.5-32B-Instruct, Seed-OSS-36B-Instruct

**Baseline 方法**：
- Correct domain-specific data（正确领域数据微调）
- General knowledge（通用知识微调）
- Word counting（词计数微调）

**EM 数据集**：多个 EM benchmark

---

## 关键发现

### Prevention 设置
| 干预方法 | 效果 |
|---------|------|
| SGTR Finetuning | **一致降低误对齐**，不加剧任何指标 |
| Benign Finetuning | 效果不一致，可能加剧某些指标 |

### EM 机制分析
- EM 通过破坏对齐人格实现，而非直接学习有害内容
- 身份自我报告的多样化是 EM 的标志
- 移除模型的身份承载系统提示substantially reduces EM finetuning 的影响

---

## 核心结论

将 EM 重新定义为：**不是采用连贯的误对齐人格，而是对齐人格的不稳定化**。SGTR Finetuning 通过巩固角色而非纠正特定行为来预防和逆转 EM。

---

## 标签
#alignment #safety #fine-tuning #emergent-misalignment #LLM