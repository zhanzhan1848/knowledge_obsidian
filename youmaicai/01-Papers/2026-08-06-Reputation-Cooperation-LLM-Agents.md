# Reputation-Based Cooperation in LLM Agents

## 元信息
| 标题 | 值 |
|------|-----|
| **arXiv** | [2608.04507](https://arxiv.org/abs/2608.04507) |
| **类别** | cs.MA, cs.NE |
| **作者** | Kazuya Horibe, Kenji Itao, Wataru Toyokawa |
| **发表** | 2026-08-05 |

## 核心贡献
1. **间接互惠捐赠博弈**: LLM agents 观察行为轨迹，以连续尺度 donate
2. **文化传递**: 策略以自然语言 prompts 表示，跨代演化
3. **对手 endowment sensitivity**: 衡量 agents 对合作/不合作对手的区分度（Image Scoring 机制）

## 关键发现
- **4 个 LLM backend** 对 free-rider 入侵的鲁棒性差异超过**一个数量级**
- 最强预测因子 = opponent endowment sensitivity（Image Scoring 机制）
- **Leading-Eight L1 norm adherence 无法预测鲁棒性**
- Robustness 依赖于 defector exclusion：仅有 defector exclusion stringency 能预测对 free-rider 入侵的抵抗力

## 理论发现
| 机制 | 鲁棒性预测力 |
|------|-------------|
| Image Scoring (endowment sensitivity) | ✅ 强 |
| Leading-Eight norm adherence | ❌ 无 |

## 意义
- 揭示 LLM agents 被限制在 Image Scoring 级别的合作能力
- 多智能体文化演化存在根本性脆弱性
- 为 bottom-up norm construction 方法提供动机

## URL
- 论文: https://arxiv.org/abs/2608.04507

---
*🥬 油麦菜 — 2026-08-06*
