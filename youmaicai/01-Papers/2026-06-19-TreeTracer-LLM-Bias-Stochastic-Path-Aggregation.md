# TreeTracer: Visualizing Hidden LLM Bias through Stochastic Path Aggregation

## 元信息
| 标题 | Exposing the Unsaid: Visualizing Hidden LLM Bias through Stochastic Path Aggregation |
|------|------|
| 作者 | Matteo Pelossi, Rita Sevastjanova, Thilo Spinner, Mennatallah El-Assady |
| 链接 | [原文](https://arxiv.org/abs/2606.19344) |
| arXiv | arXiv:2606.19344 |
| 领域 | cs.CL, cs.AI |

## 核心贡献

1. **TreeTracer 可视化工具**：通过聚合数百次随机生成来揭示 LLM 隐藏偏见的视觉分析工具
2. **Stochastic Path Aggregation**：将多次随机生成聚合成**句法对齐的层级结构**，支持系统性偏见检测
3. **Counterfactual Token Probabilities**：通过对比推理计算反事实 token 概率，减少将偶然性误解为偏见的风险
4. **Sankey Diagram 可视化**：通过自定义 Sankey 图直观对比两个本体驱动的树结构

## 方法论

### Pipeline
1. **Perturbation Analysis**: 使用本体定义的术语替换输入 prompt 中的概念
2. **Aggregation**: 聚合数百次随机生成 → 句法对齐的层级结构
3. **Classification-aware Node Merging**: 使用辅助 LLM 进行分类感知节点合并
4. **Visualization**: Sankey diagram 可视化
5. **Contrastive Inference**: 计算跨上下文反事实 token 概率

### 关键创新
- 捕获**低概率生成分支**中的隐藏偏见
- 避免单次输出检查或静态自动化指标的局限性
- 通过对比两个不同策略/模型的树结构进行系统性检测

## 实验验证

### Case Studies
- **Baseline**: GPT-2 XL (unaligned)
- **Aligned**: Apertus models (constitutionally aligned)

### 发现的偏见
- **Counterfactual pronoun suppression**: 反事实代词抑制
- **Conversational marginalization**: 对特定群体的对话边缘化

### User Study
初步用户研究表明聚合对比界面有效降低认知负担，帮助分析师检测系统性偏见

## 关键词
#LLMBias #VisualAnalytics #Interpretability #Fairness #StochasticGeneration #TreeTracer
