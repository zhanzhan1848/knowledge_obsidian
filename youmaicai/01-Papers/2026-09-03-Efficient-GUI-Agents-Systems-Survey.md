# Efficient GUI Agents: A Systems Survey of Observation, Memory, Action, and Runtime Optimization

## 元信息
| 标题 | Efficient GUI Agents: A Systems Survey of Observation, Memory, Action, and Runtime Optimization |
|------|------|
| 作者 | Bizhe Bai et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.02309) |
| arXiv | arXiv:2609.02309 |
| 会议 | GRLM @ EMNLP 2026 |

## 核心贡献
1. GUI agent 领域进展主要通过任务成功率报告，忽视了效率维度（上下文量、计算量、动作预算、运行时开销）
2. 从端到端系统角度研究高效 GUI agent，覆盖：观察效率、上下文与记忆效率、动作效率、规划器/系统效率
3. 识别文献中的重复性核心思路：选择性读取（而非全上下文摄入）、全局到局部的视觉分配、可恢复记忆而非原始历史回放、验证感知控制、混合运行时

## 模型架构 / 方法
- 系统综述：通过 targeted search + backward/forward citation chaining 扩展文献
- 四大效率维度分解分析

## 实验结果（综述发现）
- 端到端高效 GUI agent 的收敛方向：selective reading、global-to-local visual allocation、recoverable memory、verification-aware control、hybrid runtimes

## 开放问题
- 验证器成本诚实核算
- 跨基准可比性
- 在真实延迟和隐私约束下共同设计观察、记忆和执行层

## 关键词
#GUI-agent #efficiency #survey #LLM-agent #systems
