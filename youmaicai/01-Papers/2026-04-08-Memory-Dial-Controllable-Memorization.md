# Memory Dial: Controllable Memorization in Language Models

## 元信息

| 标题 | Memory Dial: A Training Framework for Controllable Memorization in Language Models |
|------|------|
| 作者 | Xiangbo Zhang, Ali Emami |
| 链接 | [原文](https://arxiv.org/abs/2604.05074) |
| arXiv | arXiv:2604.05074 |
| 领域 | cs.CL |
| 发表 | ACL Findings 2026 |

## 核心贡献

1. **Memory Dial**：首个使记忆压力成为显式、可控变量的训练框架，通过单一参数 $\alpha$ 在标准交叉熵和温度锐化目标间插值
2. **实验验证**：6种架构 × 5个基准，证明 $\alpha$ 可靠控制记忆压力（seen-example 准确率单调增加，unseen 准确率稳定）
3. **规模效应**：大模型对记忆压力更敏感；高频序列更易记忆
4. **跨语言迁移**：效果可迁移到多语言设置；可检测自然发生的单次出现序列

## 核心机制

### Memory Dial 目标函数
$$\mathcal{L}_{\text{Dial}}(\alpha) = \text{interpolate}(\text{CE}, \text{temperature-sharpened CE})$$

- $\alpha = 0$：标准交叉熵
- $\alpha = 1$：完全温度锐化目标
- $\alpha$ 单调控制记忆压力

### 为什么有效
- 温度锐化使模型对见过示例的回忆更确定
- unseen 准确率保持稳定
- 不影响架构或优化器

## 主要发现

| 发现 | 描述 |
|------|------|
| $\alpha$ 控制可靠性 | seen-example 准确率随 $\alpha$ 单调增加，unseen 准确率稳定 |
| 规模响应 | 大模型对记忆压力更敏感 |
| 频率效应 | 高频序列更易记忆 |
| 跨语言迁移 | 效果迁移到多语言环境 |
| 单次出现检测 | 即使自然发生的单次序列也能检测 |

## 研究意义

**Memory Dial 提供了一个受控实验框架**，用于研究：
- 记忆行为如何涌现
- 记忆与泛化如何相互作用

## 与现有工作区别

- 现有方法：post-hoc 检测（训练后检测记忆，无法 disentangle 影响）
- Memory Dial：主动控制（训练时显式控制记忆压力）

## 局限性

- 仅在有限架构和基准上验证
- 温度锐化目标可能不适用于所有任务
- $\alpha$ 的最优值需针对具体应用调整

## 关键词

#memorization #fine-tuning #language-model #ACL2026 #training-framework #controllable

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
