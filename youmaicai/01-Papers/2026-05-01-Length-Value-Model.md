# Length Value Model: Scalable Value Pretraining for Token-Level Length Modeling

## 基本信息
| 标题 | 值 |
|------|-----|
| 作者 | Zhen Zhang, Changyi Yang, Zijie Xia, et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.27039) |
| arXiv | arXiv:2604.27039 |
| 代码 | [GitHub](https://github.com/eric-ai-lab/Length-Value-Model) |

## 核心贡献
1. 提出 **Length Value Model (LenVM)**，首个 token 级别的剩余生成长度建模框架
2. 将长度建模形式化为价值估计问题，为每个生成的 token 分配恒定负奖励
3. LenVM 预测有界折扣回报，作为剩余生成范围的单调代理

## 方法

### 核心思想
- Token 是现代自回归模型的基本计算单元
- 生成长度直接影响推理成本和推理性能
- 现有方法缺乏细粒度长度建模，主要在粗粒度序列级别操作

### LenVM 公式
```math
LenVM 预测一个有界折扣回报:
R_t = -1 (每个 token 的恒定负奖励)
V(s_t) = \sum_{i=t}^{T} \gamma^{i-t} R_i
```

### 监督信号特性
- **无标注**: 不需要人工标注
- **密集**: 每个 token 都有监督
- **无偏**: 训练目标无偏
- **可扩展**: 可以大规模预训练

## 实验结果

### LIFEBench 精确长度匹配
| 模型 | 长度分数 |
|------|---------|
| 7B base | 30.9 |
| 7B + LenVM | 64.8 |
| 闭源前沿模型 | 更低 |

### GSM8K (200 token budget)
| 方法 | 准确率 |
|------|-------|
| Token budget baseline | 6% |
| LenVM | 63% |

## 应用场景
1. **推理时长度控制**: 连续控制性能和效率之间的权衡
2. **长度预测**: 从提示边界准确预测总生成长度
3. **生成动力学解释**: LenVM 的 token 级别价值提供生成动力学的可解释视图
4. **RL 训练**: 可作为未来 RL 训练的长度特定价值信号

## 建议
- **是否推荐使用**: 是
- **适用场景**: LLM 推理优化、长度控制、推理效率优化
- **代码已开源**: https://github.com/eric-ai-lab/Length-Value-Model

---
标签: LLM, inference, length modeling, value model, efficiency