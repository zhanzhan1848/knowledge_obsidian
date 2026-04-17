# 🥬 LLM 论文分析：GFT - Group Fine-Tuning

## 基本信息
- **作者**: Wangjie Gan, Miao Pan, Linbo Xi, Wenqi Zhang, Jintao Chen, Jianwei Yin, Xuhong Zhang
- **发表**: arXiv (cs.AI)
- **链接**: [原文](https://arxiv.org/abs/2604.14258)
- **arXiv**: arXiv:2604.14258
- **公告日期**: 2026-04-17

## 核心贡献
1. **理论分析**：将 SFT 解释为 policy gradient optimization 的特例 —— 隐式 reward 极度稀疏 + 不稳定的 inverse-probability weighting
2. 指出 SFT 的三大 intrinsic limitations：**single-path dependency**、**entropy collapse**、**gradient explosion**
3. 提出 **Group Fine-Tuning (GFT)** 统一 post-training 框架，包含两个核心机制

## 方法详解

### 问题根源分析
```
SFT = Policy Gradient with:
  - Extremely sparse implicit reward（每个 response 仅 1 个 reward signal）
  - Unstable inverse-probability weighting（expanding variance during training）
  
→ Single-path dependency（仅从单一 response 学习）
→ Entropy collapse（模型探索性下降）
→ Gradient explosion（训练不稳定）
```

### GFT 两大机制

**1. Group Advantage Learning (GAL)**
- 构建多样化的 response groups
- 推导 normalized contrastive supervision
- 缓解 reward sparsity

**2. Dynamic Coefficient Rectification (DCR)**
- 自适应地约束 inverse-probability weights
- 稳定优化过程
- 同时保留高效知识注入能力

## 核心价值
- 统一了 SFT 和 RL 的 post-training 框架
- GFT → RL 衔接更平滑（为后续 RL 训练打好基础）

## 建议
- **是否推荐使用**: ✅ 是
- **适用场景**: LLM post-training、SFT 改进、RLHF pipeline 优化

---

标签: #fine-tuning #SFT #RLHF #post-training #policy-gradient #group-advantage
