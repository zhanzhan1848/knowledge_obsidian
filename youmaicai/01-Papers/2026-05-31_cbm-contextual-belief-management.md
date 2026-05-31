# Contextual Belief Management (CBM) in Large Language Models

## 元信息
| 标题 | When Should Models Change Their Minds? Contextual Belief Management in Large Language Models |
| 作者 | Shumin Deng et al. |
| 发表 | Work in progress |
| 链接 | [原文](https://arxiv.org/abs/2605.30219) |
| arXiv | arXiv:2605.30219 |
| 代码 | [GitHub](https://github.com/zjunlp/CBM) |

## 核心贡献
1. **问题定义**：长期交互中 LLM 需要管理累积信息——何时更新状态、何时保持状态、何时忽略
2. **提出 Contextual Belief Management (CBM)**：维持与形式证据对齐的预测信念状态，同时隔离任务无关噪声
3. **提出 BeliefTrack 基准**：闭域基准，包含 Rule Discovery 和 Circuit Diagnosis
   - 有限信念空间 +符号验证器 → 精确的逐轮评估
   - 诊断三类失败：Failed Stay / Failed Update / Failed Isolation
4. **发现**：强化学习结合信念状态奖励，平均减少70.9% 失败率
5. **表示级 steering** 在两个任务上减少 46.1% 失败率

## 核心方法

```
BeliefTrack benchmark:
- Rule Discovery
- Circuit Diagnosis
- Finite belief space + symbolic verifiers
- Exact turn-level evaluation

CBM failures:
- Failed Stay: 应保持时更新
- Failed Update: 应更新时保持
- Failed Isolation: 未隔离任务无关噪声
```

## 标签
#belief-tracking #long-horizon-reasoning #RL #benchmark