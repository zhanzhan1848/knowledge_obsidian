# QRC: Zero-shot Framework for Understanding Evolving Memes

## 元信息
| 标题 | I Know What You Meme, Even If it Emerged Today: Understanding Evolving Memes through Open-World Knowledge Acquisition |
|------|------|
| 作者 | Shanhong Liu, Rui Cao, Pai Chet Ng, De Wen Soh |
| 链接 | [原文](https://arxiv.org/abs/2606.05316) |
| arXiv | arXiv:2606.05316 |
| 领域 | cs.AI |
| 发表 | 2026-06-03 |

## 核心贡献

1. **提出 QRC框架** (Query Retrieve Conclude)：零样本框架，识别缺失知识、检索网络证据、合成基于证据的背景知识
2. **构建 Meme Understanding Benchmark**：包含 2024-2026 年最新 meme 及外部背景知识标注
3. **提升 meme 理解和检测性能**：在 3 个 meme 理解和5 个 meme 检测任务上超越零样本基线

## 核心创新

### QRC 三步流程
1. **Query**: 识别缺失的知识
2. **Retrieve**: 从开放网络检索证据
3. **Conclude**: 合成基于证据的背景知识

### 问题
- Multimodal memes 是动态的，需要最新背景知识
- 现有方法 often overlook 此类知识或依赖预训练模型的固定参数知识
- 预训练知识可能不完整、过时或对新兴 meme 不可用

### 解决方案
使用零样本框架，利用开放网络获取最新背景知识来理解和检测 meme。

## 实验

- 3 个 meme 理解数据集
- 5 个 meme 检测任务
- 相比零样本基线提升知识恢复、meme 理解和下游检测

## 相关工作

- Multimodal learning
- Meme understanding
- Zero-shot learning
- Knowledge retrieval

## URL
- 原文: https://arxiv.org/abs/2606.05316