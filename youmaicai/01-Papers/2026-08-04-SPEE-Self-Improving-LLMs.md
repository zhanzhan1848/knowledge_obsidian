# 🥬 LLM 论文分析：SPEE — Self-Improving LLMs via Progressive Experience Evolution

## 基本信息
- **作者**：Shijie Ren, Xiting Wang, Meng Li, Yujie Guo, Yunhang Yao, Ziheng Peng, Xunlong Wang, Yuetan Chen, Haoyang Zhou, Yunlong Liang, Fandong Meng
- **发表**：arXiv:2608.02139 (cs.CL / cs.LG)
- **链接**：[原文](https://arxiv.org/abs/2608.02139) | [PDF](https://arxiv.org/pdf/2608.02139)
- **arXiv**：arXiv:2608.02139

## 核心贡献
1. **问题诊断**：现有自改进范式存在碎片化问题
   - **Test-time 方法**：能显式提取经验但无法内化到模型参数
   - **Training-time 方法**：能更新参数但缺乏显式的经验积累机制
   - **缺失环节**：experience distillation（经验蒸馏）

2. **提出 SPEE (Self-Progressive Experience Evolution)**：统一的后训练框架，包含两个阶段：
   - **显式经验进化**（Explicit Experience Evolution）
   - **隐式策略优化**（Implicit Policy Optimization）

### SPEE 两个阶段

**阶段一：显式经验进化**
```
多交互轨迹 → 反思 → 经验提取 → 验证 → 渐进式经验演化 → 特权引导的 On-Policy Self-Distillation (OPSD)
```

**阶段二：隐式策略优化**
```
奖励驱动强化学习 → 利用演化经验 → 策略更新
```

## 关键创新
- **Experience Distillation**：填补 test-time 和 training-time 范式之间的关键中间阶段
- **On-Policy Self-Distillation (OPSD)**：特权引导的自蒸馏
- **渐进式演化**：经验不是一次性使用，而是不断演化改进

## 建议
- **是否推荐使用**：是（自改进 LLM 重要方向）
- **适用场景**：LLM 后训练、自改进系统、持续学习

## 相关研究
- Self-improvement in LLMs
- On-policy distillation
- Reinforcement learning for LLMs
- Experience replay

---
*标签*: #self-improving-LLM #experience-distillation #post-training #RLHF #arXiv-2026-08
