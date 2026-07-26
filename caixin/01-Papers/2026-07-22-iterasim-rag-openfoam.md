# 2607.20346 - IteraSim RAG: RAG Agentic Back-End for OpenFOAM-Based CFD

## 论文信息
- **arXiv ID**: [2607.20346](https://arxiv.org/abs/2607.20346)
- **日期**: 2026-07-22
- **分类**: cs.CE, physics.flu-dyn
- **期刊**: Computer Physics Communications (submitted)
- **DOI**: https://doi.org/10.48550/arXiv.2607.20346

## 核心创新点
1. **多阶段检索增强生成(RAG)**: LLM扩展查询为物理/求解器关键词/故障排除变体
2. **Reciprocal Rank Fusion**: 合并排序列表
3. **Maximal Marginal Relevance**: HNSW索引密集向量存储的重新排序
4. **确定性关键词路由器**: 分离工作流查询和语料库物理查询的检索路径
5. **三分支生成架构**: Architect + InputWriter + Reviewer agent
6. **静态规范知识层**: 覆盖求解器选择、湍流封闭、边界条件、有限体积默认值

## 系统架构

### 查询扩展
- LLM将查询扩展为物理变体、求解器关键词变体、故障排除变体
- Reciprocal Rank Fusion合并排序列表

### 检索策略
- **MMR重排序**: Maximal Marginal Relevance
- **HNSW索引**: 密集向量存储
- **分离检索路径**: 
  - 工作流查询路径
  - 语料库物理查询路径

### 生成架构
1. **Architect Agent**: 规划
2. **InputWriter Agent**: 编写OpenFOAM输入
3. **Reviewer Agent**: 审查和修复

### 规范知识层
- 求解器选择指南
- 湍流封闭选项
- 边界条件规范
- 有限体积默认设置

## 基准测试结果
- **28-case benchmark**: 覆盖零样本设置、少样本泛化、单参数修改、湍流模型切换
- **平均检索覆盖率**: 77.9%（中位数79.1%）
- **参数修改类别**: 超过90%
- **OpenFOAM v2506完成率**: 100%（6个参考配置）
- **损坏案例修复**: 2个合成损坏案例在有限Reviewer循环中诊断和修复

## 技术特点
- **开源**: 基准、评分标准和图形脚本已发布
- **OpenFOAM v2506**: 集成最新版本
- **多阶段检索**: 超越单flat查询
- **工作流分离**: 操作不同请求使用不同检索策略
- **生成分离**: 架构/编写/审查职责分离

## 局限性
- 非专家用户的主要障碍：多目录输入deck的一致性
- 单flat查询的局限性
- 单一agent同时起草和审查的问题

## 应用场景
- OpenFOAM自动化案例生成
- CFD工作流自动化
- 非专家CFD使用

## 相关工具
- [[OpenFOAM]] - 开源CFD求解器
- [[RAG]] - 检索增强生成
- [[LLM]] - 大语言模型
- [[HNSW]] - 近似最近邻索引

---
tags: #CFD #OpenFOAM #RAG #LLM #automation #2026
