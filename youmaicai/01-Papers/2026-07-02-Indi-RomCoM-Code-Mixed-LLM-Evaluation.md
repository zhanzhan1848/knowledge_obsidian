# Indi-RomCoM: Code-Mixed Benchmark for Evaluating LLMs on Romanized Indic-English Instructions

## 元信息
| 标题 | Indi-RomCoM: Code-Mixed Benchmark for Evaluating LLMs on Romanized Indic-English Instructions |
|------|------|
| 作者 | Avisha Das, Mihir Parmar, Mohana Ramneth, Pulkit Verma |
| 链接 | [原文](https://arxiv.org/abs/2606.30790) |
| arXiv | arXiv:2606.30790 [cs.CL] |
| 发表 | 2026-06-29 |

## 核心贡献

1. **定义 Romanized Code Mixing (RCM) 问题**：双语者在 Roman 脚本中混合本地语言和英语，已成为多语言社区的主要交流形式
2. **提出 Indi-RomCoM benchmark**：
   - 7 个 instruction-following 任务
   - 4 种广泛使用的印度语言（Hindi, Bengali, Tamil, Telugu）
   - 3 个代码混合强度等级
3. **全面评估**：覆盖 proprietary、open-weight、Indic-focused 模型

## 核心发现

### 主要结论

1. **LLM 在 RCM 指令上持续表现不佳**：性能随代码混合密度增加而下降
2. **推理任务比检测任务下降更少**：因为生成的解释提供了必要上下文
3. **Indic-focused 模型相对较好**，但仍有改进空间

### 代码混合密度影响

```
低密度混合 → 性能接近 monolingual
中密度混合 → 显著下降
高密度混合 → 严重退化
```

## Benchmark 设计

### 任务类型

| 任务类型 | 描述 |
|---------|------|
| Instruction Following | 遵循代码混合指令 |
| Reasoning | 代码混合推理 |
| Toxicity Detection | 检测有害内容（下降最严重）|
| ... | ... |

### 语言覆盖

- Hindi (hi)
- Bengali (bn)
- Tamil (ta)
- Telugu (te)

## 建议

- **是否推荐使用**：是
- **适用场景**：多语言 LLM 评估、Indic 语言 NLP、印度多语言社区应用
- **使用建议**：benchmark 对外开放，支持社区开发包容性多语言系统

## 标签
#multilingual-LLM #code-mixing #benchmark #Indic-languages #LLM-evaluation
