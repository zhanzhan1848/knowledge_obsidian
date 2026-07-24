# Detecting LLM-Generated Tokens in Human–LLM Coauthored Text

> 🥬 LLM 论文分析：Token 级 LLM 生成检测

## 基本信息
- **作者**: Yangjun Lu et al.
- **链接**: [arXiv](https://arxiv.org/abs/2607.21458)
- **arXiv**: arXiv:2607.21458
- **Subjects**: cs.AI, stat.ME

## 核心贡献
1. 针对人机协作写作场景的**细粒度检测**需求——识别混合 authorship 文档中哪些部分是 LLM 生成的
2. 现有方法仅能做 document-level 分类，无法定位具体生成部分
3. 提出 **token 级检测方法**：
   - 在 token 级别操作（现代语言模型的自然单位）
   - 基于现有 token 级检测分数
   - **关键思想**：平滑相邻 token scores 以降低变异性，同时使用 adaptive Lepski-type rule 根据局部 authorship 结构选择 bandwidth
4. 方法简单易实现，无需 token 级标注数据进行训练
5. 理论分析：刻画 tradeoff，证明在估计底层信号时达到 favorable MSE 性能
6. 在合成数据集和现实数据集上均优于广泛基线
7. 部署了公开可访问的网站

## 方法

### 核心思想
1. Token-level score 平滑（减少相邻 token 变异性）
2. Adaptive Lepski-type rule（根据局部 authorship 结构选择 bandwidth）
3. 无需 token-level labeled training data

### 理论基础
- 表征 tradeoff
- 证明 favorable MSE 性能

## 应用场景
- 人机协作写作检测
- AI 生成内容识别
- 学术诚信检测

## 标签
#LLM-detection #token-level # authorship-attribution #AI-generated-text
