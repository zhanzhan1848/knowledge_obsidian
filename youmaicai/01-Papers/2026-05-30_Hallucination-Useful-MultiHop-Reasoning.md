# Can Hallucinations Be Useful? SLMs Solving Multi-Hop Questions

## 元信息
| 标题 | Can Hallucinations Be Useful? Solving Multi-Hop Questions With SLMs By Chaining System-I/II Reasoning |
|------|------|
| 作者 | (Team) |
| 链接 | [原文](https://arxiv.org/abs/2605.27596) |
| arXiv | arXiv:2605.27596 |
| 发表 | 2026-05-26 (v1) |
| 领域 | cs.CL |

## 核心贡献

1. **Inversion of Think-First Strategy**: 反转"先思考后回答"策略
2. **Answer First-Reason Later**: 先给出答案再推理
3. **Beneficial Hallucations**: 证明幻觉实际上可以帮助逼近正确答案

## 关键发现

### SLM 特性
1. SLMs 通常对自己的初始答案有准确的自信
2. 幻觉实际上可以有益于锁定正确答案

### System-I / System-II 链
- System-I: 快速直觉判断（可能包含幻觉）
- System-II: 反思和验证

## 方法

### Answer First-Reason Later
1. 模型先给出答案（基于快速直觉）
2. 然后进行推理验证
3. 利用初始答案的"幻觉"作为线索

## 关键词
#SLM #Hallucination #Multi-hop-Reasoning #System-I #System-II #Reasoning