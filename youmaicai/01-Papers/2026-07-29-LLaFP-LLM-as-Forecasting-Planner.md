# LLaFP: LLM 作为预测规划器

## 元信息
| 标题 | LLM as Forecasting Planner: Training-Free Text Conditioning for Time-Series Foundation Models |
|------|-----|
| 作者 | Huu Hiep Nguyen 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.24892) |
| arXiv | arXiv:2607.24892 |

## 核心贡献
1. **LLaFP (LLM As Forecasting Planner)**: 训练-free 框架，桥接 TSFM 和 LLM
2. 将预测问题表述为 **TSFM 生成轨迹上的规划问题**
3. 避免 LLM 直接生成/修改预测值（会扭曲 TSFM 捕捉的时序结构）

## 核心方法
```
Frozen TSFM → 模拟器，提出数值延续（numerical continuations）
LLM as Policy/Value → 引导候选选择，评估完成轨迹
```

## 架构
- **Ranker LLM**: 作为 policy，选择候选轨迹
- **Judge LLM**: 作为 value function，评估轨迹
- **MCTS**: Monte Carlo Tree Search over forecast horizon

## 关键洞察
直接让 LLM 生成/修改预测值会扭曲 TSFM 捕捉的时序结构 → 改用 planning 框架

## 实验
- **数据集**: Context-is-Key, Time-MMD
- **TSFM backbones**: Chronos, TimesFM
- **LLMs**: 4 个不同 LLM
- **结果**: LLaFP 在所有模型组合上持续改进

## 结论
> "Sequential search as an effective training-free approach to text-conditioned forecasting"

序贯搜索作为文本条件预测的有效训练-free 方法

## 关键词
#TSFM #time-series #LLM-planning #MCTS #text-conditioning #forecasting
