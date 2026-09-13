# Data Scarcity and Model Sparsity: Mixtures-of-Experts Overfit More to Repeated Data

## 元信息
| 标题 | Data Scarcity and Model Sparsity: Mixtures-of-Experts Overfit More to Repeated Data |
| 作者 | Margaret Li, Luke Zettlemoyer, Jure Leskovec, Percy Liang et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.11917) |
| arXiv | arXiv:2609.11917 |

## 核心贡献
1. **首次系统研究 MoE 数据重复**: 首次深入探索稀疏架构（MoE）在数据重复场景下的性能退化问题
2. **发现 MoE 退化更快**: MoE 在 4x 数据重复即开始退化，而 80M 密集模型可在 8x 下保持；32x 后 MoE 甚至不如密集模型
3. **正则化缓解方法**: dropout 等方法可缓解过拟合；强 masking 正则化下 MoE 在 64x 重复仍可超越密集模型

## 模型架构
- 80M ~ 1B active (8.5B total) 参数的 MoE 模型
- 变化 expert 数量和粒度
- 对比密集模型（Dense Transformers）

## 关键公式/发现
- MoE 稀疏度（sparsity）由**总参数**而非活跃参数决定退化速度
- 80M dense: 可重复数据 8x 无明显退化
- MoE: 4x 开始退化，32x 后性能反而不如 dense
- 专家专业化（expert specialization）与重复数据过拟合相关

## 实验设置
- 单域和多域数据混合
- 多种 MoE 配置（expert 数量、粒度）
- 数据重复率：1x ~ 64x

## 实验结果
| 模型 | 4x 重复 | 8x 重复 | 32x 重复 |
|------|---------|---------|----------|
| Dense 80M | ~无退化 | ~无退化 | 轻微退化 |
| MoE | 开始退化 | 明显退化 | 性能下降超越 dense |

## 正则化方法效果
- **Dropout**: 可缓解过拟合
- **Masking-based 正则化**: 强 masking 正则化下，MoE 在 64x 重复仍可优于 dense
- 无方法能完全达到 all-unique 训练数据的性能

## 内部机制分析
1. MoE 路由在训练早期即稳定（universally stabilizes early）
2. 专家专业化与重复数据过拟合正相关
3. 过拟合机制：减少参数过度专业化可打断记忆化模式

## 建议
- 是否推荐使用：是（重要发现）
- 适用场景：大模型训练数据管理、MoE 模型设计
- 关键词：MoE, Data Repetition, Overfitting, Sparsity
