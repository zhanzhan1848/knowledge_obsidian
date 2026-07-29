# CogArena: LLM 认知能力的结构化评估

## 元信息
| 标题 | CogArena: A Multimethod Evaluation of Cognitive Ability Structure in Large Language Models |
|------|-----|
| 作者 | Dengzhe Hou, Lingyu Jiang, Fangzhou Lin, Kazunori D Yamada |
| 链接 | [原文](https://arxiv.org/abs/2607.24999) |
| arXiv | arXiv:2607.24999 |
| 代码 | [GitHub](https://github.com/dengzhe-hou/CogArena) |

## 核心贡献
1. **CogArena**: procedurally generated 13-paradigm benchmark
2. **多方法框架**：确定认知任务分数何时有足够依据被赋予维度标签
3. 5 个理论驱动的分组（five theory-motivated groupings）
4. 跨 55 个开源模型、12 个模型家族的系统评估

## 核心发现
### 跨模型发现
- 几乎所有 paradigm correlations 都是正向的
- 一个共同轴解释了约 **50% 的方差**
- within-grouping 优势小，对 scoring 敏感，且跨模型家族不确定

### 提示 scaffold 实验
- targeted scaffolds 产生小的 matched-grouping 优势
- **但没有任何 scaffold-specific contrast 在多重校正后存活**
- 选择性（selectivity）没有改善 held-out-family prediction
- **冻结确认标准失败**

### 结论
> "Theory-aligned prompting produces a small in-battery diagonal tendency, but the present evidence does not establish stable five-dimensional profiles"

理论对齐的提示产生小的 in-battery 对角线趋势，但没有稳定五维认知画像的证据

## 方法论
CogArena 提供工作流，结合：
1. Behavioral signatures
2. Covariance
3. Matched interventions
4. Out-of-family prediction

在将认知标签附加到模型分数之前

## 关键词
#LLM #cognitive-evaluation #benchmark #CogArena #multimethod #dimensionality
