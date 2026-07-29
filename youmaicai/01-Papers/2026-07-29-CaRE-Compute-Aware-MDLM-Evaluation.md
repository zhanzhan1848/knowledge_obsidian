# CaRE: MDLM 评估协议

## 元信息
| 标题 | CaRE: Compute-aware Remasking Evaluation Protocol for Masked Diffusion Language Models |
|------|-----|
| 作者 | Yash Shah, Abhijit Chakraborty, Vivek Gupta |
| 链接 | [原文](https://arxiv.org/abs/2607.24763) |
| arXiv | arXiv:2607.24763 |

## 核心贡献
1. **CaRE**：compute-aware evaluation framework for MDLM remasking strategies
2. 揭示当前 MDLM 评估的系统性问题：
   - 7 篇近期 remasking 论文使用不兼容的评估设置
   - NFE (number of function evaluations)、metrics、sampling temperatures 变化不一致
   - 导致策略排名不可比

## CaRE 框架
### 三项原则
1. **Standardize actual NFE**: 标准化实际函数评估次数
2. **Enforce multi-metric reporting**: 强制多指标报告
3. **Control stochasticity explicitly**: 显式控制随机性

### 评估范围
- 7 种 remasking strategies
- LLaDA-8B-Base 和 Dream-7B-Base
- 4 stochasticity levels × 3 step budgets
- OpenWebText 和 LM1B

## 关键发现
| 发现 | 详情 |
|------|------|
| (i) Temperature 解释大部分 MAUVE 方差 | - |
| (ii) Compute-matched 比较**逆转**了多个已发表策略排名 | - |
| (iii) Informed remasking 与 stochastic unmasking 存在 tension | high-entropy remasking 在 unmask_temp=0.25, 256 steps 时 MAUVE 降低 0.296 (p=0.020) |

## 结论
当前 MDLM 评估可能系统性地将算法改进与隐藏的 compute 和 stochasticity 选择混为一谈。

## 关键词
#MDLM #diffusion-LM #evaluation #remasking #CaRE #MAUVE #benchmark
