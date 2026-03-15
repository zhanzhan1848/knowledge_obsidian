# Neural Thickets: Diverse Task Experts Are Dense Around Pretrained Weights

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Neural Thickets: Diverse Task Experts Are Dense Around Pretrained Weights |
| 作者 | Yulu Gan, Phillip Isola |
| 链接 | [原文](https://arxiv.org/abs/2603.12228) |
| arXiv | arXiv:2603.12228 |
| 代码 | [GitHub](https://github.com/sunrainyg/RandOpt) |
| 领域 | cs.LG, cs.AI |
| 发表时间 | 2026-03-12 |

## 核心贡献
1. **新视角**: 将预训练结果视为参数向量的分布，而非单一参数向量的起点
2. **关键发现**: 大型、良好预训练的模型中，任务专家密度急剧增加，多样化任务改进专家占据预训练权重邻域的很大一部分
3. **简单并行方法**: 随机采样 N 个参数扰动，选择 top K，通过多数投票集成预测

## 核心洞察

### 小模型 vs 大模型
- **小模型**: 专家解占据分布体积的极小部分，发现依赖梯度下降等结构化优化
- **大模型**: 任务专家密度大幅增加，任务改进专家密集分布

### 方法流程
```
1. 随机采样 N 个参数扰动
2. 评估每个扰动在任务上的表现
3. 选择 top K 个表现最好的
4. 多数投票集成预测
```

## 实验结果
- 与标准后训练方法竞争: PPO, GRPO, ES
- 在当代大规模模型上表现优异
- 简单性 + 并行性 = 高效

## 局限性
- 未明确提及

## 技术要点
- 关键词: `#pretraining` `#post-training` `#ensemble` `#parameter-perturbation` `#task-experts`
- 创新点: 大模型预训练权重邻域中密集存在任务专家

## 理论意义
- **预训练的本质**: 预训练不仅找到好的初始化，还在参数空间中"播种"了大量任务专家
- **优化启示**: 对于大模型，简单的随机采样可能足够找到好的任务特定解

## 推荐评估
- **是否推荐**: ✅ 是
- **适用场景**: 大模型后训练、快速任务适配、低资源微调替代方案

## 相关论文
- [[Pretraining and Transfer Learning]]
- [[Ensemble Methods]]
- [[Parameter Efficient Fine-Tuning]]
