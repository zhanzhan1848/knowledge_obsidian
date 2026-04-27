# Shared Lexical Task Representations Explain Behavioral Variability In LLMs

## 元信息
| 标题 | Shared Lexical Task Representations Explain Behavioral Variability In LLMs |
|------|-------|
| 作者 | Zhuonan Yang, Jacob Xiaochen Li et al. |
| 链接 | [原文](https://arxiv.org/abs/2604.22027) |
| arXiv | arXiv:2604.22027 |
| 分类 | cs.CL, cs.AI, cs.LG |

## 核心贡献

1. **Lexical Task Heads**: 发现任务特定注意力头，其输出字面描述任务本身
2. **跨 prompt 风格共享**: 这些 heads 在指令式 prompt 和示例式 prompt 之间共享，并触发后续答案生成
3. **行为变异性解释**: prompt 间行为变异性可由这些 heads 的激活程度解释
4. **竞争任务表示**: 失败源于竞争任务表示稀释目标任务信号

## 两种 Prompt 风格对比

| 风格 | 描述 |
|------|------|
| 指令式 (Instruction-based) | 自然语言描述任务 |
| 示例式 (Example-based) | 上下文少样本演示对 |

## 关键发现

1. **共同底层机制**: 尽管性能随 prompt 变化大，模型在不同 prompt 下使用共同底层机制
2. **激活程度解释变异性**: prompt 间行为差异由 lexical task heads 激活程度解释
3. **任务表示竞争**: 失败源于竞争任务表示稀释目标信号

## 机制解释

```
指令式/示例式 Prompt 
    ↓
共享 Lexical Task Heads（字面描述任务）
    ↓
激活程度 → 行为变异性
    ↓
竞争表示 → 失败
```

## 建议
- **适用场景**: 理解 LLM 内部表示、分析 prompt 敏感性
- **推荐指数**: ⭐⭐⭐⭐ (对可解释性和 prompt 工程有重要启发)
