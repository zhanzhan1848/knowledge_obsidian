# 🥬 LLM 论文分析：HybridDeepResearch

## 基本信息
- **标题**: Benchmarking Hybrid Deep Research Across Database Querying and Web Search
- **作者**: Ruofan Wu, Zhewei Yao et al. (Snowflake AI Research)
- **链接**: [arXiv:2609.09410](https://arxiv.org/abs/2609.09410)
- **arXiv**: arXiv:2609.09410v1
- **代码**: [GitHub](https://github.com/Snowflake-AI-Research/HybridDeepResearch) | [HuggingFace](https://huggingface.co/datasets/Snowflake/HybridDeepResearch)
- **类别**: cs.CL

## 核心贡献

1. **HybridDeepResearch 基准**: 首个需要同时使用 Web Search 和 SQL 才能形成完整可验证答案的深度研究基准
2. **380 个工具依赖任务**: 基于 LiveSQLBench-Base-Lite 数据库和公开网络语料库
3. **三种推理模式**: SQL2S、S2SQL、Parallel

## 核心问题

现有基准评估单一模态：
- Web Search 基准：纯非结构化文本
- DB 基准：纯结构化查询
- **忽略了关键"交接"能力**: 在系统间移动时保持约束

## 关键发现

- 即便是 SOTA 模型 (GLM-5.2, Claude-Sonnet-4.6, GPT-5)，在 hard 子集上仅达 **50-54% Pass@8**
- **方向性推理 (directional reasoning) 比并行交集困难得多**
- 在结构化和非结构化信息空间之间桥接而不丢失约束仍是重大挑战

## 数据集特点

- 380 个工具依赖任务
- 基于真实数据库 + 网络语料
- 自动检查 + 人工审核双重验证
- 三种推理模式覆盖不同复杂度

## 局限性

- 仅覆盖英文
- SQL 复杂度有限
- 单一数据库，未考虑多数据库场景

## 建议
- **是否推荐使用**: 是（用于评估混合工具 Agent）
- **适用场景**: Deep Research Agent 评测、多模态工具使用研究
- **亮点**: 填补了结构化+非结构化混合工具调用评测的空白

---

标签: #LLM-Agent #深度研究 #工具使用 #SQL #Web-Search #基准评测 #Agent
