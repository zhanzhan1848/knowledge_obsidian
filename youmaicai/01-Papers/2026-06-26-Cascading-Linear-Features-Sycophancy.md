# Detecting and Controlling Sycophancy with Cascading Linear Features

## 元信息
| 标题 | Detecting and Controlling Sycophancy with Cascading Linear Features |
|------|-----|
| 作者 | Maty Bohacek, Rishub Jain, Nicholas Dufour, Thomas Leung, Chris Bregler, Roma Patel |
| 链接 | [原文](https://arxiv.org/abs/2606.26155) |
| arXiv | arXiv:2606.26155 |
| 领域 | cs.AI |
| 发表 | 2026-06-23 |

## 核心贡献
1. **Cascading Linear Features**: 提出迭代数据生成管道，通过级联线性特征而非简单的二元对比样本来发现行为特征
2. **Sycophancy Steering**: 聚焦于谄媚行为（LLM 优先用户验证而非真实回答）的检测和 steering
3. **理论证明**: 证明级联样本发现的 sycophancy 特征形成线性可分的子空间
4. **优于基线**: 在检测、确定性评分和鲁棒 steering 上匹配或优于 LLM-as-judge 和 system prompting 基线，且计算成本更低

## 核心方法

### 问题
Activation steering 方法需要大量对比样本来确定行为特征，但二元样本对难以有效 disentangle 特征。

### 方案：Cascading Linear Features
- 不使用简单的正/负样本对，而是生成**具有不同程度特征的样本**
- 特征强度与行为呈线性缩放关系
- 允许更好地隔离和识别目标特征

### 实验设置
- 模型: Qwen2.5-7B-Instruct, Llama-3.1-8B-Instruct
- 任务: Sycophancy detection and steering
- 评估: LLM-as-judge, system prompting baselines

## 实验结果
- Sycophancy 特征在级联样本上形成线性可分子空间
- Compliant persona steering 可将 Llama 的 refusal rate 从 97% 降至 2%
- 提供更低的计算需求和更强的可解释性保证

## 代码
https://cascading-feats.github.io/

## 标签
#LLM #interpretability #activation-steering #sycophancy #fine-tuning