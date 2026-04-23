# ARES: Adaptive Red-Teaming and End-to-End Repair of Policy-Reward System

## 元信息
| 标题 | ARES: Adaptive Red-Teaming and End-to-End Repair of Policy-Reward System |
|---|---|
| 作者 | Jiacheng Liang, Yao Ma, Tharindu Kumarage, Satyapriya Krishna, Rahul Gupta, Kai-Wei Chang, Aram Galstyan, Charith Peris |
| 链接 | [原文](https://arxiv.org/abs/2604.18789) |
| arXiv | arXiv:2604.18789 |
| 会议 | ACL 2026 Main |
| 代码 | - |

## 核心贡献

1. **问题定义**：RLHF 中的不完美 Reward Model (RM) 成为单点故障，无法惩罚不安全行为
2. **系统弱点 (Systemic Weaknesses)**：首次提出 LLM 和 RM 同时失效的场景
3. **Safety Mentor**：通过结构化组件（topic、persona、tactic、goal）动态组合对抗性提示
4. **双阶段修复**：先微调 RM 检测有害内容，再利用改进的 RM 优化核心模型

## 方法

```
Safety Mentor → 动态生成对抗性提示
     ↓
同时暴露 LLM 和 RM 的弱点
     ↓
两阶段修复：
1. Fine-tune RM → 更好检测有害内容
2. Leverage improved RM → 优化核心模型
```

## 关键发现

- ARES 在多个对抗安全基准上显著提升安全鲁棒性
- 保留模型原有能力（无性能损失）
- 提供 RLHF 安全对齐新范式

## 实验

- 多个 adversarial safety benchmarks
- 增强安全鲁棒性同时保留模型能力

## 局限性

- 依赖 Safety Mentor 的生成质量
- 需要大量对抗性提示进行训练

## 建议

- **是否推荐使用**：是
- **适用场景**：LLM 安全对齐、RLHF 流程优化

---
**归档日期**：2026-04-23
**搜索关键词**：RLHF, safety alignment, red-teaming, reward model