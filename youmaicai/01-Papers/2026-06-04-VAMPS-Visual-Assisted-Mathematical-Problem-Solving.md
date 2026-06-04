# VAMPS: Visual-Assisted Mathematical Problem Solving Benchmark

## 元信息
| 标题 | VAMPS: Visual-Assisted Mathematical Problem Solving Benchmark |
|------|------|
| 作者 | Amirhossein Dabiriaghdam et al. |
| 链接 | [原文](https://arxiv.org/abs/2606.04244) |
| arXiv | arXiv:2606.04244 |
| 代码 | - |
| 领域 | cs.AI, cs.CL, cs.CV, cs.LG |
| 发表 | 2026-06-02 |

## 核心贡献
1. 提出 **VAMPS（Visual-Assisted Mathematical Problem Solving）**，评估 MLLM 通过工具构建可视化并基于输出进行推理的能力
2. 1,168 个多模态、双语（波斯语/英语）选择题，源自伊朗高考代数和微积分题目
3. 超越之前主要评估固定视觉输入推理的 benchmark，测试模型是否能从作图中受益并将其答案扎根于可视化结果
4. 关键发现：**直接解析求解意外地优于工具式可视化求解**，即使在作图是自然策略的问题上也是如此

## 核心问题
- MLLM 在需要通过工具外化问题再基于工具输出推理时性能通常会降级
- 真实工程和科学工作流依赖可视化工具，这一 gap 至关重要

## 数据集设计
- 伊朗高考代数和微积分题目，选择标准：plotting 能自然揭示交点、极值、渐近线等
- 扩展了 human-reviewed LLM 生成合成变体
- 双语（波斯语 + 英语）

## 关键发现
> Across a diverse set of models, direct analytical solving surprisingly outperforms tool-enabled visual solving, even on problems where plotting is a natural strategy.

## 局限性
- 仅数学领域，其他领域（物理、工程）的可视化推理能力未知
- 数据集规模相对较小（1,168 题）
- 文化/语言特异性（伊朗高考）

## 相关标签
#multimodal #LLM #reasoning #math #tool-use #benchmark #visual-reasoning