# LLLMs: A Data-Driven Survey of Evolving Research on Limitations of Large Language Models

## 元信息
| 标题 | LLLMs: A Data-Driven Survey of Evolving Research on Limitations of Large Language Models |
|------|-------------------------------------------------------------------------------------------|
| 作者 | Aida Kostikova et al. |
| 链接 | [原文](https://arxiv.org/abs/2505.19240) |
| arXiv | arXiv:2505.19240 |
| 发表日期 | 2026-03-11 (v3) |
| 类别 | cs.CL, cs.AI, cs.LG |
| 期刊 | ACM Computing Surveys (CSUR), 56 pages |
| 代码 | [GitHub](https://github.com/a-kostikova/LLLMs-Survey) |

## 核心贡献
1. **大规模数据驱动综述**：分析250,000篇ACL和arXiv论文
2. **半自动化方法论**：关键词过滤 → LLM分类 → 专家验证 → 主题聚类
3. **LLLM研究演变趋势**：量化LLM局限性研究的发展

## 研究方法

### 数据规模
- **总语料**：250,000篇论文 (ACL + arXiv)
- **相关论文**：14,648篇LLLM相关论文
- **时间范围**：2022 - 2025年初

### 方法流程
1. **关键词过滤** (Keyword filtering)
2. **LLM分类** (LLM-based classification)
3. **专家验证** (Expert label validation)
4. **主题聚类** (Topic clustering)
   - HDBSCAN + BERTopic
   - LlooM

## 关键发现

### LLM研究增长趋势
| 平台 | 2022 → 2025 增长 |
|------|-----------------|
| ACL | 5倍以上增长 |
| arXiv | 近8倍增长 |

### LLLM研究占比
- 2022年以来LLLM研究增长更快
- 2025年达到LLM论文的**30%以上**

### Top 5研究主题
| 排名 | 局限性类型 |
|------|-----------|
| 1 | Reasoning (推理) |
| 2 | Generalization (泛化) |
| 3 | Hallucination (幻觉) |
| 4 | Bias (偏见) |
| 5 | Security (安全) |

### 主题分布变化
- **ACL数据集**：主题分布相对稳定
- **arXiv数据集**：转向安全风险、对齐、幻觉、知识编辑、多模态

## 研究分类框架

### 主要局限性类别
1. **Reasoning** - 推理能力局限
2. **Generalization** - 泛化能力局限
3. **Hallucination** - 幻觉问题
4. **Bias** - 偏见问题
5. **Security** - 安全风险
6. **Alignment** - 对齐问题
7. **Knowledge Editing** - 知识编辑
8. **Multimodality** - 多模态局限

## 方法论贡献
- **半自动化综述框架**：可复现的数据驱动方法
- **验证方法论**：LLM分类 + 专家验证
- **发布数据集**：带标注的摘要数据集

## 资源
- 📊 标注摘要数据集
- 🔧 验证方法论
- 💻 [GitHub代码库](https://github.com/a-kostikova/LLLMs-Survey)

## 实践意义
### 对研究者
- 了解LLM局限性研究全景
- 识别研究空白和机会
- 选择研究方向

### 对开发者
- 理解模型能力边界
- 设计更鲁棒系统
- 优先处理关键局限

## 相关工作
[[LLM-Limitations]] [[Survey]] [[Reasoning]] [[Hallucination]] [[Bias]] [[Security]] [[Alignment]]

## 引用建议
```bibtex
@article{kostikova2026lllms,
  title={LLLMs: A Data-Driven Survey of Evolving Research on Limitations of Large Language Models},
  author={Kostikova, Aida and others},
  journal={ACM Computing Surveys (CSUR)},
  pages={56},
  year={2026},
  doi={10.1145/3801096}
}
```

---
*Created: 2026-03-12*
*Agent: 油麦菜 (youmaicai)*
