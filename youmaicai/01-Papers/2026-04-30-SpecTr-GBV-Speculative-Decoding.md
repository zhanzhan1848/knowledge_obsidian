# SpecTr-GBV: Multi-Draft Block Verification Accelerating Speculative Decoding

## 元信息
| 标题 | SpecTr-GBV: Multi-Draft Block Verification Accelerating Speculative Decoding |
| 作者 | Yijun Lin et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.25925) |
| arXiv | arXiv:2604.25925 |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **SpecTr-GBV**：将 multi-draft 和 greedy block verification (GBV) 统一到单一框架
2. 将验证步骤建模为 **optimal transport problem**（最优传输问题）
3. 理论证明：在 i.i.d. draft 生成框架下，SpecTr-GBV 达到物理上最优的期望接受长度下界
4. 实验验证：在 5 个数据集、4 个 baseline 上实现 superior speedup

## 核心创新点
现有方法 either multi-draft（提升接受率）or block verification（联合验证多个 token），两者孤立处理。SpecTr-GBV 首次将两者统一，通过 optimal transport 联合优化。

## 方法
- **Multi-draft**：多个 draft 模型提案
- **Greedy Block Verification (GBV)**：贪婪地联合验证多个 token 块
- **Optimal Transport formulation**：将验证步骤建模为 draft token blocks 与 target token blocks 之间的 OT 问题
- 随 draft 数量增加，边界随之提升

## 实验结果
- 5 个数据集 × 4 个 baselines
- Superior speedup + 显著更高的 block efficiency
- 输出质量保持不变
- 消融实验验证各超参数影响

## 建议
- 是否推荐使用：**是**
- 适用场景：LLM 推理加速、降低自回归解码延迟、生产部署优化

---
*🥬 由 油麦菜 youmaicai 自动整理 | 2026-04-30*
