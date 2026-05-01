# Co-Evolving Policy Distillation

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Naibin Gu, Chenxu Yang, Qingyi Si, et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.27083) |
| arXiv | arXiv:2604.27083 |

## 核心贡献
1. 统一分析 RLVR 和 OPD 两种后训练范式在整合多专家能力时的能力损失机制
2. 发现问题根源：
   - **Mixed RLVR**: 专家间能力发散成本
   - **先训练专家再 OPD 流程**: 教师-学生行为模式差距大，吸收不充分
3. 提出 **Co-Evolving Policy Distillation (CoPD)**，在每个专家的 RLVR 训练过程中引入 OPD

## 问题分析

### RLVR (Reinforcement Learning from Vision/Rewards)
- 混合 RLVR 会导致**专家间能力发散成本**

### OPD (One-step Policy Distillation)
- 先训练专家再执行 OPD 的流程避免了发散问题
- 但由于教师-学生行为模式差距大，**无法完全吸收教师能力**

## CoPD 方法

### 核心思想
- 鼓励专家**并行训练**
- 在每个专家的 RLVR 训练过程中引入 OPD（而非训练完成后）
- 专家互相作为教师（**OPD 双向化**）
- 使专家之间保持更一致的行为模式，同时在整个过程中保持足够的互补知识

### 训练模式
```
Expert A (RLVR) ←→ Expert B (RLVR)
     ↓                  ↓
   OPD               OPD
   (bidirectional)
```

## 实验结果

### 多模态能力整合
CoPD 实现了文本、图像、视频推理能力的**一体化整合**：
- 显著优于 mixed RLVR 和 MOPD 基线
- 甚至超越了领域特定专家

### 训练范式创新
- 模型并行训练模式可能启发新的训练扩展范式

## 建议
- **是否推荐阅读**: 是
- **适用场景**: LLM 后训练、多专家模型、模型整合

---
标签: LLM, post-training, RLVR, OPD, policy distillation, multi-modal