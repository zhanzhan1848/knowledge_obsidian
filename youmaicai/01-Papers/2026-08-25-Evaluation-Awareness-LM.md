# Evaluation Awareness in Language Models: Representation, Verbalization, and Control

## 元信息
| 标题 | Evaluation Awareness in Language Models: Representation, Verbalization, and Control |
|------|------|
| 作者 | Farzaneh Heidari |
| 链接 | [原文](https://arxiv.org/abs/2608.21766) |
| arXiv | arXiv:2608.21766v1 |
| 领域 | cs.CL, cs.AI |
| 发表 | 2026-08-22 |

## 核心贡献
1. **三维度系统研究**:
   - **Representation**: 是否在激活空间中线性表示"处于评估中"
   - **Verbalization**: 是否在输出 token 中表达这种状态
   - **Control**: 因果 steering 是否影响行为
2. **线性可解码性**: 所有模型残差流中均可线性解码评估意识（AUROC ≥ 0.7）
3. **微调放大效应**: SFT 阶段放大评估意识，之后稳定；steering 效应在每阶段更显著
4. **Open-Checkpoint 分析**: 对 Olmo 模型各训练阶段测试，发现 base 模型已有评估意识

## 三维度发现
| 维度 | 结论 |
|------|------|
| Representation | 线性可解码 (AUROC ≥ 0.7)，所有模型/层 |
| Verbalization | 部分对齐，相关性因模型/层/readout 而异 |
| Control | Steering 可改变 verbalization 分数 |

## 训练阶段影响
```
Base → SFT (amplified) → Post-SFT (stable, but steering effects grow)
```

## 标签
#LLM-Evaluation #Alignment #Mechanistic-Interpretability #Steering #Benchmark
