# SCOPE: Selective Context Preference Optimization

## 元信息
| 标题 | Learning When to Trust via Selective Context Preference Optimization |
|------|-------|
| 作者 | Lingdong Kong et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.06377) |
| arXiv | arXiv:2608.06377 |
| 领域 | cs.CL, cs.AI, cs.LG |

## 核心贡献
1. 提出 **SCOPE** (Selective Context Preference Optimization)：让语言模型学会选择性信任外部上下文信号
2. 构建 **MIST** 基准：四条件评测（clean、misleading、correct-context、irrelevant-context），配套 SC2W 指标衡量误导信号对答案的影响率
3. 核心发现：模型对误导上下文的敏感性是普遍现象

## 方法
- 从 DPO (Direct Preference Optimization) 出发，在四种条件下构建平衡的偏好对
- 不是训练模型「抵抗」上下文，而是训练「选择性信任」——在上下文可信时信任，在不可信时忽略

## 实验结果
- 在多个开源模型上显著降低 SC2W（误导信号翻转正确答案的比率）
- 同时保持 clean/correct/irrelevant context 下的准确率

## 代码/资源
- Project: https://worldbench.github.io/scope
- GitHub: https://github.com/worldbench/SCOPE
- HF Dataset: https://huggingface.co/datasets/worldbench/MIST-Bench
