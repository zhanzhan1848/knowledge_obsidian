# DocAtlas: Long-Document Understanding as Mutable-State Interaction

## 元信息
| 标题 | DocAtlas: Long-Document Understanding as Mutable-State Interaction |
|------|-----|
| 作者 | Hongchen Wei, Yuanzhe Wang, Bei Liu, Yifan Yang, Qi Dai, Kai Qiu, Yunsheng Li, Dongdong Chen, Chong Luo, Zhenzhong Chen, Baining Guo |
| 链接 | [原文](https://arxiv.org/abs/2608.07527) |
| arXiv | arXiv:2608.07527 |
| 代码 | (待查) |

## 核心贡献

1. **Mutable-State Information-Seeking**: 将长文档理解建模为可变状态的信息搜索过程，而非静态检索
2. **Mutable Document Harness**: 外部环境决定文档信息在每一步如何被搜索、读取、存储、审查和展示
3. **工具集**: 搜索、阅读、笔记、审查工具 + 层级树 + 笔记存储
4. **固定上下文预算下**: 结合自改进检索 + 选择性证据访问 + 主动工作记忆

## 实验结果

- GPT-5.4 + DocAtlas: **MMLongBench-Doc 上达到 71.4%**，超越人类专家参考 65.8%
- Qwen3.5-4B VLM (端到端 RL 训练): **63.7%** vs 直接输入基线 54.4%
- 可变形文档 harness 设计显著提升紧凑文档智能体的性能

## 核心洞察

- 现有 RAG 系统从静态索引选择证据，再生成；缺乏可变状态
- Agentic 系统虽然增加了多轮工具使用，但依赖冻结的专有模型
- DocAtlas 将文档 harness 作为外部环境，实现自改进检索和主动工作记忆

## 相关领域
[[long-document understanding]] [[RAG]] [[VLM]] [[agent]] [[retrieval]] [[document understanding]]

---
*🥬 LLM/NLP Paper | 2026-08-11*
