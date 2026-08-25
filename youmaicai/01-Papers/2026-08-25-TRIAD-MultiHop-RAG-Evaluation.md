# Automating Multi-Hop RAG Evaluation via TRIAD

## 元信息
| 标题 | Automating Multi-Hop RAG Evaluation via TRIAD: From Context Extraction to Validated Dataset Generation |
|------|------|
| 作者 | Lorenz Brehme |
| 链接 | [原文](https://arxiv.org/abs/2608.21558) |
| arXiv | arXiv:2608.21558v1 |
| 领域 | cs.CL, cs.AI |
| 发表 | INLG 2026 |

## 核心贡献
1. **TRIAD 三阶段自动数据集生成**:
   - Stage 1: 为 RAG 系统知识库生成 QA 对
   - Stage 2: Validator 反馈循环检查每个 QA 对
   - Stage 3: 扩展 relevant-labeled 上下文文档用于下游评估
2. **支持 unanswerable questions**: 全面评估需要多跳查询和无法回答的问题
3. **跨领域适应**: 超越 Wikipedia 的 HotpotQA，可迁移到领域特定设置

## 三阶段流程
```
Knowledge Base → QA Pair Generation → Validator (feedback loop) → Extended QA with Context
```

## 对比基准
- MuSiQue
- HotpotQA

## 代码
- https://github.com/lorenzbrehme/triad

## 局限性
- 依赖领域知识库质量
- Validator 设计可能存在偏差

## 标签
#RAG #Evaluation #Multi-Hop-QA #Dataset-Generation #NLP
