# RECONTEXT: 长上下文推理的递归证据回放

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Recursive Evidence Replay as LLM Harness for Long-Context Reasoning |
| **arXiv** | [2607.02509](https://arxiv.org/abs/2607.02509) |
| **作者** | Yanjun Zhao et al. |
| **分类** | cs.AI |
| **发表** | 2026-07-02 |
| **代码** | [GitHub](https://github.com/Yanjun-Zhao/ReContext) |

## 核心贡献

1. **提出 RECONTEXT**: 一种无需训练的推理方法，通过递归证据回放改善长上下文推理

2. **查询条件证据池**: 利用模型内部相关性信号构建 query-conditioned evidence pool

3. **理论分析**: 基于关联记忆的理论框架，将上下文视为记忆存储、问题视为检索线索、注意力视为线索-追踪关联、回放视为追踪再激活

4. **跨模型验证**: 在 Qwen3-4B、Qwen3-8B、Llama3-8B 三个 backbone 上验证

## 问题背景

- 现代 LLM 支持越来越长的上下文窗口
- 但往往无法有效利用输入中已存在的相关证据
- 存在 context access 与 context utilization 之间的 gap

## 方法

### RECONTEXT 核心思想
```
1. 利用模型内部相关性信号
2. 构建 query-conditioned evidence pool
3. 在最终生成前回放证据
4. 保留完整原始上下文
```

### 关键特点
- **无需训练**: 纯推理方法
- **无需外部记忆**
- **无需上下文裁剪**
- **递归选择**: 将证据组织与答案生成分离

## 实验结果

在 8 个长上下文数据集、128K 上下文长度下:
- 三个 backbone 均实现一致改进
- 在所有三个 backbone 上获得最佳平均排名

## 理论基础

基于关联记忆的理论分析:
| 概念 | 映射 |
|------|------|
| Context | Memory Store |
| Question | Retrieval Cue |
| Attention | Cue-Trace Association |
| Replay | Trace Reactivation |

## 建议

- **是否推荐使用**: 是
- **适用场景**: 长文档理解、多证据推理、长上下文应用
- **相关方向**: Long Context LLM, Retrieval-Augmented Generation, Attention Mechanism

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
