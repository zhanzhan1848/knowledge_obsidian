# AsyncFC: Future-based Asynchronous Function Calling for LLMs

> 🥬 LLM 论文分析：LLM 函数调用的异步并行执行

## 基本信息
- **作者**: Guangyu Feng et al.
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15077) | [PDF](https://arxiv.org/pdf/2605.15077)
- **arXiv**: arXiv:2605.15077 [cs.CL]

## 核心贡献

### 核心创新点
提出 **AsyncFC**，一个纯执行层框架，将 LLM 解码与函数执行解耦，实现：
- 模型解码与函数执行的 **overlap**
- 依赖允许时的 **函数间并行**

### 关键特性
- **无需微调**：直接叠加在现有模型和标准同步函数调用协议上
- **零协议修改**：不改变标准的 function calling 接口
- **异步执行**：LLM 可在函数结果未返回时继续解码

### 核心发现
LLMs 原生具备对 **符号未来 (symbolic futures)** 的推理能力——即对未解决执行结果表示的推理能力。这使得异步范式的模型-工具交互成为可能。

### 方法图示

```
传统同步：
LLM Decoding → [Wait] → Function Exec → [Wait] → Function Result → LLM Decoding
              (blocked)               (blocked)

AsyncFC：
LLM Decoding ──→ [speculative future] ──→ Continue Decoding
      ↓                                            ↑
Function Exec (parallel) ──→ Results available ──┘
```

### 实验结果
- 在标准 function-calling benchmarks 上显著降低端到端任务完成时间
- 同时保持任务准确率
- 在软件工程 benchmark 上同样有效

## 局限性
- 需要函数执行时间足够长才能获得加速收益
- 对高度串行依赖的场景收益有限

## 建议
- **是否推荐使用**: 是（对延迟敏感的生产系统）
- **适用场景**: LLM Agent 部署、生产环境函数调用、多工具并行场景

## 标签
#LLM-Agent #function-calling #async #inference-optimization