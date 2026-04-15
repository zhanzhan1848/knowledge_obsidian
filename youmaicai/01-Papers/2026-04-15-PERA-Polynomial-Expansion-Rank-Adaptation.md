# Polynomial Expansion Rank Adaptation: Enhancing Low-Rank Fine-Tuning with High-Order Interactions

## 元信息
| 标题 | Polynomial Expansion Rank Adaptation: Enhancing Low-Rank Fine-Tuning with High-Order Interactions |
|------|-----|
| 作者 | Lin Mu et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.11841) |
| arXiv | arXiv:2604.11841 |
| 代码 | [GitHub](https://github.com/zhangwenhao6/PERA) |
| 发表 | ACL 2026 Findings |

## 核心贡献
1. 指出 LoRA 严格线性结构限制表达能力
2. 提出 **PERA (Polynomial Expansion Rank Adaptation)**，在低秩因子空间中引入结构化多项式展开
3. 将适应空间转换为能够建模更丰富非线性耦合的多项式流形

## 问题背景
- LoRA 的双线性公式仅捕获低秩因子之间的一阶依赖
- 限制非线性和高阶参数交互的建模

## 方法

### 核心思想
- 扩展每个低秩因子以合成高阶交互项
- 在不增加秩或推理成本的情况下增强表达能力
- 特别地，加入二阶非线性分量（平方项）对增强表达能力至关重要

## 理论分析
- 证明 PERA 提供增强的表达能力
- 更有效利用特征

## 实验结果
- 在多种基准测试中一致优于 SOTA 方法
- 在各种 rank 设置下保持强劲和鲁棒的性能

## 相关领域
- LoRA
- Parameter-Efficient Fine-Tuning (PEFT)
- Low-Rank Adaptation
- LLM Fine-tuning

## 关键词
#LoRA #PEFT #fine-tuning #ACL2026 #low-rank-adaptation
