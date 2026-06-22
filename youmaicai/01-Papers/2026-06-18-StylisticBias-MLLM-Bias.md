# StylisticBias: A Few Human Visual Cues Drive Most Social Biases in MLLMs

## 元信息

| 属性 | 内容 |
|------|------|
| 标题 | StylisticBias: A Few Human Visual Cues Drive Most Social Biases in MLLMs |
| 作者 | Shaghayegh Kolli, Timo Cavelius, Nafiseh Nikeghbal, Samantha Dalal, Jana Diesner |
| 链接 | [arXiv](https://arxiv.org/abs/2606.20527) |
| arXiv | arXiv:2606.20527 |
| 领域 | cs.CL, cs.CV |
| 发表 | 2026-06-18 |
| 发表地 | ICML 2026 Workshops (AI4Good, Culture x AI) |
| 代码 | [GitHub](https://github.com/timo-cavelius/StylisticBias) |
| 数据 | [HuggingFace](https://hf.co/datasets/shaghayegh/stylistic-bias-dataset) |

## 核心贡献

1. **StylisticBias Benchmark**：首个受控的属性级 MLLM 社会偏见评估基准
2. **精确属性控制**：基于500张真实面孔，每张生成约50个单属性变化，共约25K张图像
3. **解耦 identity 和 appearance**：保持 identity 不变，每次只改变一个视觉属性
4. **关键发现**：约15个属性解释了80%的总变异，说明偏见集中于少量视觉线索

## 方法

### 数据集构建
- 500张 photorealistic 基础面孔
- 每张约50个单属性变体 → 约25K图像
- 25个二元社会判断场景

### 评估对象
- 6个 MLLM
- 保持 identity 固定，变化单一视觉属性 → 精确测量属性如何影响模型判断

## 关键发现

| 发现 | 描述 |
|------|------|
| Age & Body Type | 在 identity 级别效应中占主导 |
| Fashion Style | 驱动最大的属性级别偏移 |
| 15属性 ≈ 80%变异 | 偏见集中于少量视觉线索 |
| 语义对齐敏感性 | 在与社会 appearance 对齐的判断中最强 |

## 局限性分析

- 年龄和体型主导 identity 级别效应
- 时尚风格和视觉线索驱动属性级别偏移
- 敏感性在语义与 appearance 对齐的判断中最强

## 关键词

#MLLM #multimodal #bias #fairness #benchmark #social-bias #vision-language
