# MLJailDe: Multilingual Jailbreak Detection

## 元信息
| 标题 | One Jailbreak, Many Tongues: Learning Language-Insensitive Intention Representations for Multilingual Jailbreak Detection |
|------|-----|
| 作者 | Shuyu Jiang, Kaiyu Xu, Xingshu Chen, Hao Ren, Rui Tang, Yi Zhang, Tianwei Zhang, Hongwei Li |
| 链接 | [原文](https://arxiv.org/abs/2606.11202) |
| arXiv | arXiv:2606.11202 |
| 领域 | Multilingual · Jailbreak Detection · LLM Safety |

## 核心贡献

1. **MLJailDe 框架**：提升多语言鲁棒性和跨语言泛化的多语言越狱检测框架
2. **多语言回译数据增强**：构建跨越 **11 种语言**、包含 2,232 个良性样本和 1,239 个越狱样本的数据集
3. **相对距离约束**：减少跨语言表示分散，鼓励相似意图的越狱提示跨语言形成一致聚类
4. **类别不平衡感知分类目标**：缓解类别不平衡，学习更可靠的多语言决策边界

## 背景问题

### 现有挑战
- 安全训练集中在主导语言，多语言能力未同步发展
- 越狱攻击存在可利用的漏洞
- 现有防御主要在主导语言开发和评估
- 跨语言监督稀缺，表示分散

## 核心方法

### 多语言回译数据增强
- 构建语义一致、功能有效的数据集
- 跨越 11 种语言

### 相对距离约束
- 减少跨语言表示分散
- 促使相似意图的越狱提示跨语言形成一致聚类

### 类别不平衡感知分类目标
- 缓解类别不平衡
- 学习更可靠的多语言决策边界

## 关键结果
- 在多种语言上**超越 SOTA 基线**
- **F1 分数达到 98.5%**
- 在未见过的语言上平均 F1 分数 **97.1%**，展示强跨语言泛化能力

## 建议
- **是否推荐使用**：是
- **适用场景**：多语言 LLM 安全部署、跨语言内容审核

## 相关概念
- [[LLM Safety]]
- [[Jailbreak Detection]]
- [[Multilingual NLP]]
- [[Cross-lingual Generalization]]