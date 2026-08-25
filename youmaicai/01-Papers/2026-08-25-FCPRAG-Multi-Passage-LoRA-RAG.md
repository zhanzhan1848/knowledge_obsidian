# FCPRAG: Fusion-Controller Parametric Retrieval-Augmented Generation

## 元信息
| 标题 | Fusion-Controller Parametric Retrieval-Augmented Generation for Stable Multi-Passage LoRA Injection |
|------|------|
| 作者 | Jinchang Zhu |
| 链接 | [原文](https://arxiv.org/abs/2608.21750) |
| arXiv | arXiv:2608.21750v1 |
| 领域 | cs.CL |
| 发表 | EMNLP 2026 |

## 核心贡献
1. **Fusion-Controlled PRAG**: 轻量级控制器预测 per-passage fusion scores 和样本级校准信号（mixing gate + adaptive temperature）
2. **Merge-Aware Supervision**: 从 multi-adapter merge 中每个 adapter 的边际贡献推导监督信号
3. **Sample-Level Adaptation**: 证明单一数据集级 temperature 对异方差检索不确定性次优

## 关键机制
- 检索条件融合分数预测
- 自适应温度控制
- Mixing gate 在信息性检索信号下选择性融合、不确定性下保守

## 实验结果
| 数据集 | 提升 |
|--------|------|
| 2WikiMultiHopQA | +4.65% F1 |
| CWQ | +7.55% F1 |
| HotpotQA | 一致改进 |
| PopQA | 一致改进 |

## 局限性
- 需为每个 passage 训练独立 LoRA adapter
- 控制器引入额外推理开销

## 标签
#RAG #LoRA #Fine-tuning #Information-Fusion #EMNLP2026
