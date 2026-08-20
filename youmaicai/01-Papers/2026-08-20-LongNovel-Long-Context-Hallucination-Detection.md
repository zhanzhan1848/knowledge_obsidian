# LongNovel: A Multi-Scale Benchmark for Hallucination Detection in Long-Context Novel Summarization

## 元信息
| 标题 | LongNovel: A Multi-Scale Benchmark for Hallucination Detection in Long-Context Novel Summarization |
|---|---|
| 作者 | Ruizhi Zhang, Jinwei Chen, Xiangju Lu, He Yan, Mo Yu, Junmin Zhu, Wei Zhang |
| 机构 | East China Normal University, iQIYI Inc, Tencent |
| 链接 | [原文](https://arxiv.org/abs/2608.18082) |
| arXiv | arXiv:2608.18082 |
| 代码 | [GitHub](https://github.com/BDML-lab/LongNovel) |

## 核心贡献
1. 提出 **LongNovel**，首个多尺度、双语（中英）长上下文小说摘要幻觉检测基准
2. 设计 **Multi-Model Arbitration** + **Entity-Referenced Hallucination Construction** 混合构建方法，保证数据真实性和类型均衡
3. 覆盖 4 个长度级别（S/M/L/XL: 16K-100K tokens）和 8 种幻觉类型

## 模型架构 / 数据集结构

### 数据集规模
- 来源：29 本中文小说（16K-100K tokens）+ BookSum 章节级数据
- 测试集：600 samples，四个长度场景
- 8 种幻觉类型：实体错误、属性幻觉、关系幻觉、事件幻觉、对话幻觉、背景幻觉、细节幻觉、未证信息

### 构建方法
**Multi-Model Arbitration**：使用 GLM4-9B-chat、Qwen3-32B、GPT-4o 生成摘要，通过跨模型验证捕获真实幻觉

**Entity-Referenced Hallucination Construction**：从人类摘要中提取实体，用 LLM 按 8 类模板注入幻觉，保证类型均衡

## 关键公式

**Refusal Centroid Drift (RCD)**（论文 LSR-Anchoring 定义此处引用）:
```math
RCD = 1 - \cos(\mathbf{R}_{en}, \mathbf{R}_{lang})
```

## 实验结果
- LongNovel 对当前 SOTA 模型具有挑战性
- 随着上下文增长，幻觉类型分布发生显著变化

## 局限性
- 依赖于 LLM 生成，真人标注成本高
- 8 种幻觉类型的自动分类仍有误差

## 相关工作
- NOCHA, StorySumm, FABLES, LCHD, CLIPPER 等基准对比
- LongNovel 是唯一同时满足：摘要幻觉检测 + 100K tokens + 自动标注 + 多尺度长度的基准

---
*关键词：幻觉检测，长上下文，摘要，BERT，长文本理解，多尺度基准*
*领域：cs.CL*
