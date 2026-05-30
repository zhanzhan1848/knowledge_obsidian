# Reasoning, Code, or Both? Robustness Analysis on Math Problem Variations

## 元信息
| 标题 | Reasoning, Code, or Both? How Large Language Models Handle Variations in Math Questions |
|------|------|
| 作者 | Matthew Kutakh |
| 链接 | [原文](https://arxiv.org/abs/2605.26414) |
| arXiv | arXiv:2605.26414 |
| 发表 | 2026-05-26 (v1) |
| 领域 | cs.AI, cs.CL, cs.LG |

## 核心贡献

1. **GSM-Symbolic Dataset**: 1000 个配对问题（原版与变体）
2. **Robustness Comparison**: 三种方法的推理鲁棒性对比
3. **Code Execution Impact**: 系统评估代码执行对推理鲁棒性的影响

## 三种方法对比

| 方法 | 描述 | Robustness |
|------|------|-------------|
| **CoT** | Chain-of-thought prompting | 最鲁棒 |
| **PAL** | Program-Aided Language models (单次代码执行) | 最不鲁棒 |
| **SBSC** | Step-by-Step Coding (迭代代码执行) | 中间 |

## 实验结果

### 准确率下降 (原版 vs 变体)
- CoT: **1.3 pp**, 1.8% broke
- PAL: **1.7 pp**, 3.1% broke
- SBSC: 中间

### 统计显著性
p = .096 (不显著，但方向一致)

## 关键发现

1. **代码执行不提升鲁棒性**: 单次或迭代代码执行在简单问题变体上表现不如 CoT
2. ** perturbation sensitive**: 名称/数字变化影响所有方法
3. **结论**: 代码执行适合复杂计算，但不适合提升推理鲁棒性

## 关键词
#Math-Reasoning #Code-Execution #Robustness #CoT #PAL #GSM-Symbolic