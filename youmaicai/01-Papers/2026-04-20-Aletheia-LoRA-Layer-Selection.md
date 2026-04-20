# Aletheia: Gradient-Guided Layer Selection for Efficient LoRA Fine-Tuning Across Architectures

## 元信息
| 标题 | Aletheia: Gradient-Guided Layer Selection for Efficient LoRA Fine-Tuning |
|------|---------|
| 作者 | Abdulmalek Saket |
| 链接 | [原文](https://arxiv.org/abs/2604.15351) |
| arXiv | arXiv:2604.15351v1 |
| 领域 | cs.LG, cs.CL |
| 发表 | 2026-04-04 |

## 核心贡献

1. **问题发现**：标准 LoRA 对所有 transformer 层均匀应用适配器，忽视各层对下游任务的相关性差异
2. **Aletheia 方法**：通过轻量级梯度探针（gradient probe）识别最任务相关的层，仅对这些层应用 LoRA，并采用非对称 rank 分配
3. **大规模实验**：81 个实验行，覆盖 14 个模型（8 个架构家族，0.5B-72B 参数，含 Dense 和 MoE 架构）

## 实验结果

| 指标 | 结果 |
|------|------|
| 训练加速 | 15-28%（平均 23.1%，p < 0.001） |
| Campaign 1 加速胜率 | 100%（每模型） |
| 下游行为（MMLU, GSM8K, HumanEval） |  bounded extra forgetting 范围内保持 |
| Pythia/GPT-NeoX 尝试 | 失败（Campaign 2 中记录） |

## 方法细节

- **Layer Selection**：通过梯度探针评估每层对任务的贡献度
- **Asymmetric Rank Allocation**：不同层分配不同 LoRA rank（非均匀）
- **兼容性**：支持 Dense 和 Mixture-of-Experts 架构

## 核心结论

> 智能层选择可使 LoRA 微调效率显著提升（23.1% 训练加速），且不会对评估基准造成重大下游损伤

## 标签
#LoRA #fine-tuning #parameter-efficient #layer-selection #transformer #efficiency
