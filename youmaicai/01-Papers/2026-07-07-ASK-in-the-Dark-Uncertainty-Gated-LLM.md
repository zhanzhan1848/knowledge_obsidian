# ASK in the Dark: Uncertainty-Gated LLM Assistance under Partial Observability

## 元信息
| 标题 | ASK in the Dark: Uncertainty-Gated LLM Assistance under Partial Observability |
|------|------------------------------------------------------------------------------------|
| 作者 | Juarez Monteiro, Nathan Gavenski, Guilherme Lima, et al. |
| 链接 | [原文](https://arxiv.org/abs/2607.02686) |
| arXiv | arXiv:2607.02686 |
| 类别 | cs.AI, cs.LG |
| 发表 | 2026-07-02 |
| 会议 | IJCAI-ECAI Joint Workshop |

## 核心贡献
1. **问题诊断**：vanilla uncertainty-gated 方法在 POMDP 环境下 overwrite rate 接近零，SLM 几乎不贡献独立 action
2. **根因定位**：问题不是容量问题（capacity problem），而是**上下文问题**（context problem）—— bare egocentric prompt 提供的信息不足以支撑真正的推理
3. **ASK+ 方法**：
   - 为 SLM 提供 trajectory-aware context（部分地图、访问位置、动作历史）
   - 结构化 chain-of-thought reasoning
   - 将 SLM 从被动冗余检查转换为主动咨询者
4. **理论发现**：预测熵信号测量的是 action 不确定性而非 state 不确定性，在 POMDP 中仍然有效
5. **实践效果**：Qwen3.5-2B 匹配或超过 Qwen3.5-4B，证明 prompt 设计 > 模型规模

## 实验结果
| 环境 | Vanilla ASK | ASK+ |
|------|-------------|------|
| DoorKey | 89% | **93%** |
| FourRooms | 53% | **70%** |
| HigherLower | ~50% | **73.7%** |

## 关键洞察
- **Prompt design > Model scale**：在小模型上精心设计的 prompt 可以优于粗放的大模型
- **Selective gating works**：不确定性门控在正确上下文下有效
- **Action vs State uncertainty**：预测熵衡量的是动作不确定性，这对 POMDP 辅助至关重要

## 相关方向
- [[LLM Agent]]
- [[POMDP]]
- [[Chain-of-Thought]]
- [[Partial Observability]]
- [[Uncertainty-Gated]]
- [[Prompt Engineering]]

---
*🥬 LLM Agent - 不确定性门控在部分可观测环境中的上下文工程*
