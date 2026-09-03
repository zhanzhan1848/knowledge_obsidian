# EvalDetectBench: Measuring Evaluation Awareness in Frontier Language Models

## 元信息
| 标题 | EvalDetectBench: A Benchmark for Measuring Evaluation Awareness in Frontier Language Models |
|------|------|
| 作者 | Xinning Li, Kemunto Ochwang'i, Aryasomayajula Ram Bharadwaj, Alexandra Souly, Robert Kirk |
| 链接 | [原文](https://arxiv.org/abs/2609.01611) |
| arXiv | arXiv:2609.01611 |
| 代码 | [GitHub](https://github.com/freeze-lasr/aware_bench) |
| 数据 | [HuggingFace](https://huggingface.co/datasets/el7982/aware-bench) |

## 核心贡献
1. 提出 **EvalDetectBench**：首个测量前沿 LLM「评估意识」(evaluation awareness) 的开放基准，支持任意 Inspect-compatible 评估
2. 识别现有文献中两个引入系统性偏差的方法问题：生成模型的 identity 占测量方差的 11.25% 并可重排模型排名；针对某模型优化的 elicitation prompt 对其他模型可能接近随机
3. 提出 **per-model probe calibration** 和 **stratified generator-harmonisation procedure** 修正偏差

## 模型架构 / 方法
- Pipeline 支持任意 Inspect-compatible 评估
- 新构建的 transcript suite 覆盖前沿 system-card 评估和多样化部署来源
- 两个测量维度：(1) LLM 识别自己被评估的可靠性；(2) 各基准作为评估的可检测程度

## 实验结果
- 模型 identity 引入 11.25% 测量方差
- 生成模型身份可重排模型排名
- 单一模型的 elicitation prompt 在其他模型上接近 chance 表现

## 局限性
- EvalDetectBench 仅测量 awareness，不直接解决模型在评估 vs 部署中的行为差异
- transcript suite 覆盖范围仍有限，需要持续更新

## 关键词
#evaluation #LLM #safety #benchmark #awareness
