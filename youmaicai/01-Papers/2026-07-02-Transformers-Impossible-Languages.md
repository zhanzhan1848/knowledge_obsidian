# When Transformers Learn "Impossible" Languages, What Do They Learn?

## 元信息
| 标题 | When Transformers Learn "Impossible" Languages, What Do They Learn? |
|------|------|
| 作者 | Ram Janarthan, Coleman Haley, Sharon Goldwater |
| 链接 | [原文](https://arxiv.org/abs/2606.30815) |
| arXiv | arXiv:2606.30815 [cs.CL] |
| 发表 | 2026-06-29 |
| 荣誉 | **CoNLL 2026 Best Paper Award** |

## 核心贡献

1. **挑战"Transformer 偏向人类语言"的论断**：以往研究基于 sample efficiency 和 perplexity，而非对语言学能力的直接评估
2. **提出两个 linking hypothesis**：
   - Impossibility 源于 **grammatical sensitivity（语法敏感性）的缺陷**
   - Impossibility 源于 **generative production（生成能力）的缺陷**
3. **核心发现**：Transformer 在"不可能语言"上表现出 **generative deficiency（生成缺陷）**，而非语法敏感性缺陷

## 方法

### 实验设计

使用 GPT-2 风格的模型训练在扰动的"不可能英语"变体上：

- **不可能语言变体**：违反人类语言学约束的扰动英语
- **测量 1**：BLiMP 最小对测试——评估 grammatical sensitivity
- **测量 2**：生成长度上的生成质量——评估 generative production

### 关键结果

| 能力 | 表现 | 结论 |
|------|------|------|
| **语法敏感性** | 逐渐退化，受信息局部性调节 | 缺陷较小 |
| **生成能力** | 在长长度上严重失败 | **主要缺陷** |

### 理论解释

信息局部性（information locality）调节了性能下降的速度：
- 高局部性语言：扰动影响局部，语法敏感性保留较好
- 低局部性语言：长距离依赖被破坏，生成能力显著下降

## 结论

> 结果支持 **generative deficiency and transmission failures** 作为连接语言模型行为与人类语言非标注之间 plausible 的 linking hypothesis。

## 建议

- **是否推荐使用**：是
- **适用场景**：语言学理论研究、Transformer 能力边界探索、人类语言获得理论
- **研究价值**：CoNLL 2026 Best Paper，理解 LLM 能力边界的重要工作

## 标签
#transformer #language-model #linguistics #CoNLL2026 #generative-model
