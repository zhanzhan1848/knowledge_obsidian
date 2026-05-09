# LAMP: Look-Ahead Mixed-Precision Inference of Large Language Models

## 元信息
| 标题 | LAMP: Look-Ahead Mixed-Precision Inference of Large Language Models |
|------|------|
| 作者 | (待补充) |
| 链接 | [原文](https://arxiv.org/abs/2601.21623) |
| arXiv | arXiv:2601.21623 |
| 代码 | 待发布 |
| 会议/期刊 | Major revision, Machine Learning (cs.LG), Numerical Analysis (math.NA) |

## 核心贡献
1. 基于组合函数 $f(g(x))$ 的舍入误差分析，提出自适应策略选择一小部分 $g(x)$ 分量以更高精度计算
2. 其他计算可用更低精度执行
3. 在 GPT-2 模型上验证：极低重计算率即可实现精度提升两个数量级

## 方法
- 针对 transformer inference 中的浮点计算优化
- Look-ahead 策略：预测性地识别需要高精度的分量
- 适用于 transformer 内各种组合

## 实验结果
- GPT-2 模型验证
- 重计算率极低时精度提升可达两个数量级

## 建议
- 是否推荐使用：**是**（LLM 推理效率优化）
- 适用场景：LLM 量化推理、精度-效率权衡优化