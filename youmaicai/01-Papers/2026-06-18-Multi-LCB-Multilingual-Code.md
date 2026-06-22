# Multi-LCB: Extending LiveCodeBench to Multiple Programming Languages

## 元信息

| 属性 | 内容 |
|------|------|
| 标题 | Multi-LCB: Extending LiveCodeBench to Multiple Programming Languages |
| 作者 | Maria Ivanova, Pavel Zadorozhny, Rodion Levichev, Ivan Petrov, et al. (8人) |
| 链接 | [arXiv](https://arxiv.org/abs/2606.20517) |
| arXiv | arXiv:2606.20517 |
| 领域 | cs.AI, cs.PL |
| 发表 | 2026-06-18 |
| 发表地 | ICLR 2026 |

## 核心贡献

1. **Multi-LCB Benchmark**：首个跨12种编程语言的 LLM 代码生成评估基准
2. **保留污染控制**：完全兼容原始 LCB 格式，自动跟踪未来 LCB 更新
3. **Python 过度拟合证据**：发现 LLM 在 Python 上存在明显过拟合
4. **语言特异性污染**：发现语言特异性污染现象
5. **跨语言性能差距**：揭示了当前 LLM 在多语言代码生成上的显著差距

## 背景

LiveCodeBench (LCB) 已被广泛采用，但仅限于 Python，无法评估 LLM 是否能泛化到真实软件工程所需的多种编程语言。

## 方法

### 语言覆盖
12种编程语言，包括 Python（保留原始 LCB）

### 任务转换
将 Python 任务转换为等价的其他语言任务，保持：
- 相同的任务语义
- 相同的污染控制
- 相同的评估协议

## 关键发现

| 发现 | 描述 |
|------|------|
| Python Overfitting | LLM 在 Python 上性能显著高于其他语言 |
| Language-Specific Contamination | 存在语言特异性数据污染 |
| Performance Disparities | 各语言间性能差异巨大 |

## 评估结果

- 24个 LLM 在指令和推理任务上进行了评估
- 建立了多编程语言代码评估的新基准
- 暴露了当前 LLM 能力的关键差距

## 关键词

#LLM #code-generation #benchmark #multi-language #LiveCodeBench #Python-overfitting
