# MEDIAREF: 媒体背景检查公共知识库

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Know Your Source: A Public Knowledge Store for Media Background Checks |
| **arXiv** | [2607.02383](https://arxiv.org/abs/2607.02383) |
| **作者** | Nedjma Ousidhoum et al. |
| **分类** | cs.CL |
| **发表** | 2026-07-02 |
| **代码** | [GitHub](https://github.com/nedjmaou/mediaref) |

## 核心贡献

1. **MEDIAREF 知识库**: 公开可用的网络文档知识库，支持可重现、低成本的媒体背景检查 (MBC) 生成评估

2. **覆盖范围**: 200 个媒体源的网络文档

3. **可重现方法论**: 描述构建和更新集合的可重现方法

4. **评估多种 LLM**: 评估广泛使用的 LLM 在 MBC 生成任务上的表现

## 问题背景

- 基于 LLM 的检索增强生成 (RAG) 越来越多用于自动事实检查 (AFC)
- 现有方法假设检索证据可靠
- 现实世界信息可能冲突、过时，来自不可靠或有偏见的来源
- 源关键推理 (source-critical reasoning) 通过媒体背景检查 (MBC) 解决这一挑战
- 现有 MBC 生成依赖昂贵的专有搜索 API，限制可重现性

## 方法

### MEDIAREF 构建
- 从网络来源收集文档
- 覆盖 200 个媒体源
- 支持 MBC 生成的可重现评估

### 评估
- 自动评估
- 定性评估
- 证明 MEDIAREF 支持更高质量的 MBC 生成

## 建议

- **是否推荐使用**: 是
- **适用场景**: 事实检查、RAG 系统评估、源可信度分析、新闻验证
- **相关方向**: RAG, Fact-checking, Source Credibility, NLP Applications

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
