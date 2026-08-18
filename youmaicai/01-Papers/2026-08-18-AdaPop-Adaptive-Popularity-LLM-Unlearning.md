# AdaPop: Adaptive Popularity for LLM Unlearning

## 元信息
| 标题 | The More Popular, The Harder to Forget: Adaptive Popularity for LLM Unlearning |
|------|-----|
| 作者 | Anna Borisiuk 等 |
| 链接 | [原文](https://arxiv.org/abs/2608.14229) |
| arXiv | arXiv:2608.14229 |
| 领域 | cs.CL |

## 核心贡献
1. **问题**：流行事实在预训练中记忆更深，比稀有事实更难遗忘
2. **现有方法**：统一梯度压力，忽视训练数据频率差异
3. **AdaPop (Adaptive Popularity)**：结合局部 token 置信度 + 基于外部代理的每事实热门度指数

## 方法
```
AdaPop = 局部 token 置信度 × (热门度指数)^β
```
- 热门度代理：Wikidata sitelinks, LLM-as-Judge
- **双上升控制器**：自动化 forget-retain 平衡，每 epoch 调整 retain penalty

## 实验结果
三个模型家族 × 两个基准：
- **Paraphrased queries**: ~5x 减少遗忘内容泄露
- **Adversarial reformulations**: ~1.6x 减少泄露

## 内部指标验证
- 遗忘集 hidden states 移动更远离 unlearning 前模型状态
- 保留集表示保持接近

## 核心洞察
- 流行度是一个被忽视但关键的遗忘难度因素
- 自适应热门度指数比统一处理更有效

## 局限性
- 依赖外部热门度代理质量
- 双控制器需要额外调参
