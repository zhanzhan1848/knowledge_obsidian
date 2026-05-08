# ReaComp: Compiling LLM Reasoning into Symbolic Solvers

## 元信息
| 标题 | ReaComp: Compiling LLM Reasoning into Symbolic Solvers for Efficient Program Synthesis |
|------|------|
| 作者 | (from arXiv summary) |
| 链接 | [原文](https://arxiv.org/abs/2605.05485) |
| arXiv | arXiv:2605.05485 |
| 领域 | Program Synthesis, LLM Reasoning, Symbolic Solvers |

## 核心贡献

1. **从 LLM Reasoning Traces 编译符号求解器**: 给定少量 reasoning traces，使用 coding agents 编译为可复用符号程序综合器（over constrained DSLs）
2. **零 LLM 调用测试时**: 编译后的求解器不需要任何 LLM 调用
3. **互补 LLM 搜索**: 与 LLM search 结合使用时，提升性能同时降低 token 使用量

## 实验结果

| Benchmark | Symbolic Solver Ensemble |
|-----------|--------------------------|
| PBEBench-Lite | 91.3% accuracy |
| PBEBench-Hard | 84.7% accuracy (+16.3pp vs LLM with test-time scaling) |

- 结合 LLM search: PBEBench-Hard 从 68.4% → 85.8%，同时减少 token 使用量
- 零 LLM 推理成本达到高准确率

## 核心思想

```
LLM reasoning traces → Coding Agent → Symbolic Program Synthesizer
→ 测试时零 LLM 调用
→ 符号 DSL 约束空间内高效搜索
```

## 局限

- 依赖 constrained DSL，泛化到开放域程序合成需进一步研究
- 需要足够数量的 reasoning traces 作为编译输入

## 关键词
`Program Synthesis` `Symbolic Solver` `LLM Reasoning Compilation` `DSL` `Test-Time Compute`

## 日期
2026-05-08