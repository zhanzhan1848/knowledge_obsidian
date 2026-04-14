# Deliberative Alignment is Deep, but Uncertainty Remains: Inference Time Safety Improvement in Reasoning via Attribution of Unsafe Behavior to Base Model

## 基本信息
| 标题 | Deliberative Alignment is Deep, but Uncertainty Remains |
|------|------|
| 作者 | Pankayaraj Pathmanathan, Furong Huang |
| 机构 | University of Maryland |
| 链接 | [原文](https://arxiv.org/abs/2604.09665) |
| arXiv | arXiv:2604.09665 |
| 领域 | cs.LG, cs.AI |

## 核心贡献

1. **揭示对齐鸿沟**：尽管 Deliberative Alignment 通过蒸馏更强的推理模型来教授更深层的安全知识，但师生模型之间仍存在影响安全性和通用能力差距。

2. **发现不安全行为残留**：通过 Deliberative Alignment 对齐的模型会从基础模型保留不安全行为，尽管学习了更大推理模型推理模式。

3. **BoN Sampling 方法**：提出在隐空间中归属不安全行为回基础 LLM，从而在保持最小效用损失的情况下显著提升模型安全性。

4. **量化安全提升**：在 7 个教师模型和 6 个学生模型上，平均攻击成功率（ASR）降低：
   - DAN: -28.2%
   - WildJailbreak: -31.3%
   - StrongREJECT: -35.4%

## 问题背景

### Refusal Training 的局限
- 广泛采用的拒绝训练（refusal training）改善了模型安全性
- 但这些对齐方法本质上是**浅层的**
- 导致模型在复杂对抗场景下仍可能被攻击

### Deliberative Alignment
- 通过蒸馏更强推理模型的安全推理能力来深化对齐
- 但存在师生之间的对齐差距（alignment gap）

## 方法

### 核心发现
 Deliberative Alignment 对齐的模型可以保留基础模型的不安全行为，即使学习了更大推理模型的推理模式。

### BoN Sampling 方法
1. **隐空间归属**：将不安全行为归属回基础 LLM
2. **Down-ranking**：在隐空间中降低不安全响应的排序
3. **安全提升**：在多个安全基准上获得显著安全改善

### 关键特性
- **安全收益在 RL 训练后仍然保持**：揭示安全推理的不确定性及其对基础模型的明确归属
- **最小效用损失**：安全性提升同时保持通用能力

## 实验设置

### 模型范围
- 7 个教师模型
- 6 个学生模型（不同类别和规模）

### 评估基准
| 基准 | ASR 降低 |
|------|---------|
| DAN | 28.2% |
| WildJailbreak | 31.3% |
| StrongREJECT | 35.4% |

## 局限性

- 方法依赖隐空间操作，需要模型可解释性支持
- BoN Sampling 计算成本较高
- 对基础模型安全能力的依赖意味着基础模型本身的不安全性会传导

## 建议
- **是否推荐使用**：是
- **适用场景**：需要高安全性保障的 LLM 部署（助手、客服、内容审核）
- **备注**：将安全推理不确定性显式归属到基础模型是一个有洞察力的角度，对 RLHF 安全训练有重要参考价值

---
* 🥬 油麦菜 | LLM 论文分析 | 2026-04-14
