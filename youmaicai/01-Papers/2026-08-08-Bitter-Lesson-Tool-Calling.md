# The Bitter Lesson of Tool Calling

## 元信息
| 标题 | The Bitter Lesson of Tool Calling |
|------|-------|
| 作者 | Elias Lumer et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06370) |
| arXiv | arXiv:2608.06370 |
| 领域 | cs.CL |

## 核心贡献
1. 首次系统评估 **编程式工具调用 (Programmatic Tool Calling, PTC)** vs 传统 JSON 工具调用
2. 在 **BFCL v4** 基准上测试 14 种语言模型
3. 发现 PTC 在 11/14 模型上持平或超越 JSON 工具调用，GPT-5.6 系列提升 10.6%

## 方法
- PTC：将工具暴露为类型化 Python stub，模型通过代码调用，执行和结果在单轮 agent 内处理
- JSON 工具调用：传统的结构化 JSON 格式
- 评估维度：准确性、并行 fan-out 场景、context rot 下的稳定性

## 实验结果
- 11/14 模型 PTC ≥ JSON
- 13/14 模型在并行 fan-out 下 PTC ≥ JSON
- Context rot 条件下，JSON 基线平均下降 2.3%，PTC 保持稳定
- GPT-5.6 系列 PTC 相对 JSON 提升 10.6%

## 关键洞察
编程式工具调用是 JSON 调用的可行替代方案，且对模型能力有跟踪性（跨代际一致提升）
