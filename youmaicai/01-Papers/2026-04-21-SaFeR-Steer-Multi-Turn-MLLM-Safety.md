# SaFeR-Steer: Evolving Multi-Turn MLLMs via Synthetic Bootstrapping and Feedback Dynamics

## 元信息
| 标题 | SaFeR-Steer: Evolving Multi-Turn MLLMs via Synthetic Bootstrapping and Feedback Dynamics |
|------|------|
| 作者 | Haolong Hu, Hanyu Li, Tiancheng He, et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.16358) |
| arXiv | arXiv:2604.16358v1 |
| 代码 | [GitHub](https://github.com/Ed-Bg/SaFeR-Steer) |
| 发表 | 2026-03-18 |

## 核心贡献
1. 提出 **SaFeR-Steer**：渐进式多轮多模态对齐框架，结合 staged synthetic bootstrapping + tutor-in-the-loop GRPO
2. 提出 **TCSR**：轨迹最小/平均安全性将晚期失败反向传播到早期轮次
3. 发布 **STEER** 数据集：STEER-SFT (12,934)、STEER-RL (2,000)、STEER-Bench (3,227)，涵盖 2~10 轮对话

## 核心创新点
- **问题**：MLLMs 在多轮设置中，攻击者可通过演化中的视觉-文本历史升级不安全意图，利用长上下文安全衰减。单轮数据 + 固定模板对话与部署场景存在不匹配。
- **方法**：
  - Staged synthetic bootstrapping：分阶段合成引导
  - Tutor-in-the-loop GRPO：导师在环的 GRPO
  - TCSR：多轮安全传播机制
- **训练**：从 Qwen2.5-VL-3B/7B 开始，单一 student 模型在 adaptive on-policy attacks 下训练

## 实验结果
从 Qwen2.5-VL-3B/7B 出发：

**3B 模型：**
- Single-turn Safety/Helpfulness：48.30/45.86 → 81.84/70.77
- Multi-turn Safety/Helpfulness：12.55/27.13 → 55.58/70.27

**7B 模型：**
- Single-turn Safety/Helpfulness：56.21/60.32 → 87.89/77.40
- Multi-turn Safety/Helpfulness：24.66/46.48 → 64.89/72.35

- 失败转移至更晚轮次，展现超出 scaling 本身的鲁棒性

## 关键词
`multimodal LLM` `safety alignment` `multi-turn` `RLHF` `GRPO` `Qwen2.5-VL`

## 相关工作
- Multi-modal LLM Safety
- GRPO (Group Relative Policy Optimization)
- Multi-turn alignment
- Intent escalation

---

*🥬 油麦菜 — LLM/NLP 知识提炼 | 2026-04-21*