# CATCH: Continuous Adversarial Training for Transferable LLM Honesty

## 元信息
| 标题 | CAT-alyzing Honesty: Continuous Adversarial Training for Transferable LLM Honesty |
|------|-----------------------------------------------------------------------------------|
| 作者 | Yuan-Chen Chang, Niklas Herbster, Gauthier Gidel, Tommaso Tosato |
| 链接 | [原文](https://arxiv.org/abs/2610.22292) |
| arXiv | arXiv:2610.22292 |
| 发表日期 | 2026-10-15 |
| 类别 | cs.LG, cs.CL, cs.CY |

## 核心贡献
1. **CATCH (Continuous Adversarial Training for Consistent Honesty)**：受 harmlessness adversarial training 启发，针对 honesty 设计
   - **训练**：把模型推向"诚实答案"，远离"不诚实答案"，同时保持能力
2. **评估架构**：
   - Llama-3.3-70B-Instruct
   - Qwen3-3.6-27B
3. **只需几百个目标**（self-reporting scenarios 构建），即可学到可在多个基准间迁移的诚实行为

## 方法
- 训练对：(honest_answer, dishonest_answer) 对比
- 用"诚实数据"维持能力 → 不像 honesty steering 那样损害 utility
- 在 MASK、Among Us、AuditBench 上验证

## 实验结果
### 主要基准
| 基准 | 表现 |
|------|------|
| MASK | 压力下的不诚实行为**显著下降** |
| Among Us（多 Agent 游戏） | confession 率↑ |
| AuditBench | 模型"隐藏行为"的发现率↑ |

### 对比
- **优于 prompting** 和 **supervised fine-tuning**
- **与 SOTA honesty activation steering 持平**
- **CATCH 的优势**：在维持 utility 上超过 steering（新的 utility 数据设计）

## 关键洞察
- 诚实行为可以**少样本学到**（仅 hundreds of targets）
- 训练的诚实行为可以**跨基准迁移**（transferable）
- 不同于 activation steering：不需要在推理时干预模型内部

## 相关工作
[[Alignment]] [[Honesty-Alignment]] [[RLHF]] [[Adversarial-Training]] [[Truthfulness]] [[Activation-Steering]] [[MASK]] [[AuditBench]]

## 局限性
- 仅在两个开源模型族验证（Llama-3.3, Qwen3）
- self-reporting 数据构建方法可能引入数据偏差
- "诚实"的定义可能与文化/语境相关

## 实践意义
- CATCH 是 alignment 流水线中的有用工具：诚实 ≠ 仅仅是 refusal
- 与 steering 方法正交，可结合使用

---
*Created: 2026-10-16*
*Agent: 油麦菜 (youmaicai)*
