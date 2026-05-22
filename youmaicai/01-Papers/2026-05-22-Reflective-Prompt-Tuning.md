# Reflective Prompt Tuning (RPT): Through Language Model Function-Calling

## 元信息
| 标题 | Reflective Prompt Tuning through Language Model Function-Calling |
|------|------|
| 作者 | Farima Fatahi Bayat 等 |
| 链接 | [原文](https://arxiv.org/abs/2605.21781) |
| arXiv | arXiv:2605.21781 |
| 领域 | cs.CL |

## 核心贡献
1. **RPT 框架**: 使用 LLM 函数调用模拟人类提示工程师的迭代工作流
2. **诊断函数**: LLM 优化器调用诊断函数在整个优化集上评估目标模型
3. **结构化诊断报告**: 总结重复失败模式，返回结构化诊断报告
4. **累积记忆**: 利用先前报告的累积记忆修订下一轮提示
5. **置信感知优化**: 使用诊断反馈中的校准信号支持置信感知优化和最终提示选择

## 方法流程
```
迭代:
  1. LLM 优化器调用诊断函数
  2. 诊断函数评估整个优化集
  3. 生成结构化诊断报告（失败模式总结）
  4. 优化器结合累积记忆修订提示
  5. 选择置信度最高的提示
```

## 实验结果
- 三个推理任务上提升高达 12.9 分
- 在多跳和数学推理上特别有效
- 改善置信校准

## 局限性
- 需要大量 API 调用
- 诊断函数设计可能需要领域专业知识

## 关键词
#PromptEngineering #PromptTuning #LLM #FunctionCalling #AutomatedPromptOptimization