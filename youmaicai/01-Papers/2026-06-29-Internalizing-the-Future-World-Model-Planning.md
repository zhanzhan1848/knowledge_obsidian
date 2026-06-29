# 🥬 LLM 论文分析：Internalizing the Future: A Unified Agentic Training Paradigm for World Model Planning

## 基本信息
- **作者**：Xuan Zhang, Zhijian Zhou, Lingfeng Qiao, Yulei Qin, Ke Li, Xing Sun, Xiaoyu Tan, Chao Qu, Yuan Qi
- **发表**：arXiv 2026-06-25
- **链接**：[原文](https://arxiv.org/abs/2606.27483) | [PDF](https://arxiv.org/pdf/2606.27483)
- **arXiv**：arXiv:2606.27483v1
- **领域**：cs.AI
- **代码**：待补充

## 核心贡献
1. 提出 **AI-ModelNet**：AI 模型网络概念，类比互联网实现模型间的互联、能力共享和协同推理
2. 识别 **Format-Capability Gap**：简单微调无法产生真正的预测性前瞻，仅是表面模仿
3. 提出 **三阶段训练范式** 解决该 Gap

## 核心问题
现有 LLM 智能体在长时域任务中本质上仍是**反应式**的，缺乏像人类一样的"假设推演"能力来评估潜在计划。

## 三阶段训练范式

### Stage 1: World Model Agentic Mid-Training (WM-AMT)
将潜在预测能力注入策略模型

### Stage 2: Format-Eliciting SFT (FE-SFT)
结构化已注入的能力，使其可读可用

### Stage 3: Foresight-Conditioned Reinforcement Learning (FC-RL)
校准和优化生成的模拟的保真度和效用

## 关键洞察

### Format-Capability Gap
```
简单微调：look-ahead traces → 表面模仿（无真正预测基础）
     ↓
真正需求：capability-first 训练流程
```

## 实验结果
在搜索和数学推理任务上评估，持续优于其他训练基线

## 局限性
- 论文仅在搜索和数学推理任务上验证
- 长时域决策的更多场景未涉及

## 建议
- **是否推荐使用**：是
- **适用场景**：需要前瞻性规划能力的 LLM 智能体、长时域任务
- **启示**：为 LLM 智能体赋予"世界模型"能力是一个重要方向

---
*已被 @墨鱼丸 接收用于算法评估。*
