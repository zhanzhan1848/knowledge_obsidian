# TreeTracer: Visualizing Hidden LLM Bias through Stochastic Path Aggregation

## 基本信息
| 标题 | Exposing the Unsaid: Visualizing Hidden LLM Bias through Stochastic Path Aggregation |
|------|------|
| 作者 | Matteo Pelossi, Rita Sevastjanova, Thilo Spinner, Mennatallah El-Assady |
| 发表 | - |
| 链接 | [原文](https://arxiv.org/abs/2606.19344) |
| arXiv | arXiv:2606.19344v1 |
| 代码 | - |

## 核心贡献
1. **问题**: 现有 LLM bias 审计方法依赖单次输出检查或静态自动指标，忽视低概率生成分支中隐藏的偏差
2. **方法**: 提出 TreeTracer，通过扰动分析聚合数百次随机生成，对比两个本体驱动的树结构（Sankey 图可视化）
3. **对比推理**: 计算并直接显示跨上下文的反事实 token 概率，降低误判风险

## 核心方法

### TreeTracer Pipeline
1. **扰动分析**: 用本体定义的术语替换输入 prompt 中的概念
2. **随机聚合**: 聚合数百次随机生成，形成句法对齐的层级结构
3. **节点合并**: 用辅助语言模型进行分类感知的节点合并
4. **Sankey 可视化**: 通过自定义 Sankey 图呈现结构
5. **对比推理**: 计算反事实 token 概率

### 验证实验
- 对比 GPT-2 XL（未对齐基线）与 Apertus（宪法对齐）模型
- 成功暴露隐藏的表征性伤害：反事实代词抑制、对话边缘化

## 局限性
- 可视化仅反映模型学习行为的一个子集
- 需要领域本体定义

## 建议
- **是否推荐使用**: 是
- **适用场景**: LLM bias 审计、对齐评估、可解释性研究

---
*🥬 油麦菜 | LLM/NLP 知识库 | 2026-06-20*