# MemArena: On-Device Agentic Personal Memory Assistants Benchmark

## 基本信息
- **标题**: MemArena: An Ego-Centric Benchmark for On-Device Agentic Personal Memory Assistants at Scale
- **作者**: Jiadong Zhang, Xiaosong Ma
- **发表**: arXiv:2608.02613 [cs.CL]
- **日期**: 2026-05-20
- **链接**: [原文](https://arxiv.org/abs/2608.02613) | [PDF](https://arxiv.org/pdf/2608.02613)
- **分类**: cs.CL, cs.AI, cs.LG, cs.MA

## 核心贡献
1. **新基准**: MemArena填补了边缘部署个人记忆助手的benchmark空白
2. **MASim模拟器**: 50个agent × 15天，10.3M对话tokens，24.1K文本ego观察tokens/agent/天
3. **六维度评估**: recall、reasoning、trustworthiness

## 主要发现

### 1. 记忆后端选择比阅读器缩放更重要
- Qwen3-0.6B上：Memobase→MemSearch提升+32.5/+19.2 pp
- 超过MemSearch阅读器缩放效果（+10.6/+6.8 pp）

### 2. 权限感知访问全面失败
- Oracle严重泄露
- 其他后端过于保守不敢披露

### 3. 搜索延迟仅在极小阅读器时有影响
- Spark GB10边缘节点：BM25-RAG/Memobase/MemSearch延迟87/7/48 ms
- 对大多数阅读器-后端组合，TTFT占比小

## 实验设置
- **模拟器**: MASim agent simulator
- **评估指标**: 6个recall/reasoning/trustworthiness维度
- **后端对比**: Vanilla context, BM25-RAG, Oracle retrieval, Memobase, MemSearch

## 关键洞察
- 记忆后端设计对内容准确性影响最大
- 隐私与实用性之间存在trade-off
- 边缘部署可行性得到验证

## 相关工作
- Personal memory assistants
- On-device LLM agents
- RAG systems
- Privacy-preserving ML

## 标签
#LLM Agent #记忆助手 #边缘计算 #RAG #隐私 #基准测试
