# No Universal Signal Predicts Sample-Level LLM Regression under Version Updates

## 元信息
| 属性 | 值 |
|------|-----|
| **标题** | No Universal Signal Predicts Sample-Level LLM Regression under Version Updates |
| **作者** | Jia Sheng, Yiwei Lu |
| **链接** | [arXiv](https://arxiv.org/abs/2608.13607) |
| **arXiv** | arXiv:2608.13607 |
| **类别** | cs.AI, cs.CL, cs.LG |
| **代码** | [GitHub](https://github.com/jiashengsally/llm-regression-signals) |

## 核心贡献
1. 系统研究 LLM 版本更新导致的**样本级回归**预测问题
2. 比较单模型信号 vs 跨版本信号的预测效果
3. 提出**统一 added-value test** 隔离每个信号相对于 confidence 基线的增益

## 问题背景

### 现象
- Frontier LLMs 频繁更新，通常聚合性能提升
- 但**聚合收益对个体样本无说明**：更新可能导致样本级回归（旧模型正确答案变错误）

### 研究问题
如何利用推理时可用的信号预测这种样本级回归？

## 信号分类

### 单模型信号 (Single-model signals)
| 信号 | 描述 |
|------|------|
| **Confidence** | 输出 token 的概率之和 |
| **Logit margin** | top-1 与 top-2 logit 差值 |
| **Attention entropy** | attention weight 的熵 |

### 跨版本信号 (Cross-version signals)
| 信号 | 描述 |
|------|------|
| **Output KL divergence** | 两版本输出的 KL 散度 |
| **Likelihood drift** | 似然变化量 |
| **Token-level KL** | token 级 KL 散度 |
| **Representation drift** | 表征空间漂移 |

## 实验设置

### 数据
- **6 个 benchmarks**：3 类任务家族
  - MCQ (Multiple-choice QA)
  - Math reasoning
  - Code generation
- **6 个模型更新对**: 不同版本间的比较

### 评估方法
- **Added-value test**：隔离每个信号相对于 confidence 基线的增益
- 检验信号在控制基线后的额外预测能力

## 关键发现

### Finding 1: 信号有效性依赖任务
| 任务类型 | 最强信号 |
|---------|---------|
| MCQ | Confidence |
| 简单数学 | Confidence |
| 困难数学 | Likelihood/KL signals |
| 代码生成 | Likelihood/KL signals |

### Finding 2: 无通用最优信号
- 没有单一信号在所有模型更新中都是最优的
- 即使跨版本信号也不存在"万能"方案

### Finding 3: 跨版本信号在 confidence 失效时仍有效
- 部分 cross-version signals 在 confidence 失败时仍提供信息
- **支持 proof-of-concept selective fallback**：将高风险样本路由回旧模型
- 某些信号甚至可以**无标签**使用

## 实践建议

### 对于 practitioners
> 根据任务级别模式选择回归信号：
> - MCQ → 信任 confidence
> - 数学/代码 → 使用 likelihood/KL 信号
> - 关键样本 → 考虑 selective fallback 到旧模型

### 局限性
- 6 benchmarks 覆盖有限
- 模型更新对数量有限
- 无标签场景的信号有效性需进一步验证

## 代码与资源
- **GitHub**: https://github.com/jiashengsally/llm-regression-signals
- 包含所有信号实现和评估代码

## 建议
- **是否推荐使用**: 是
- **适用场景**: LLM 版本部署决策、质量监控、长 context 应用
- **相关工作**: 可与 RLHF、模型选择结合

---

*笔记整理: 2026-08-17*
