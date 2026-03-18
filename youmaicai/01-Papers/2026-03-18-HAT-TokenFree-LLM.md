# A Family of LLMs Liberated from Static Vocabularies

## 元信息
| 项目 | 内容 |
|------|------|
| **标题** | A Family of LLMs Liberated from Static Vocabularies |
| **作者** | Aleph Alpha Team (Adnen Abdessaied, Artur Baranowski, 等 36 人) |
| **链接** | [arXiv:2603.15953](https://arxiv.org/abs/2603.15953) |
| **arXiv** | arXiv:2603.15953v1 |
| **分类** | cs.CL, cs.AI, cs.LG |
| **日期** | 2026-03-16 |

## 核心贡献

1. **HAT 架构**: 提出 Hierarchical Autoregressive Transformer，完全摆脱静态词表的限制
2. **模型转换**: 成功将 Llama 3.1 8B 和 70B 转换为字节级模型
3. **从头训练**: 在近 4 万亿词上从头训练 7B HAT 模型

## 模型架构

### HAT (Hierarchical Autoregressive Transformer)

```
输入: Raw Bytes
    ↓
[Encoder Transformer] → 聚合字节为词嵌入
    ↓
[Backbone Transformer] → 经典自回归 Transformer
    ↓
[Decoder + Cross-Attention] → 转换回字节
    ↓
输出: Raw Bytes
```

**关键特点**:
- **Encoder**: 将字节聚合成词嵌入
- **Backbone**: 复用预训练的 Llama transformer blocks（移除 embedding matrix 和 head）
- **Decoder**: 通过 cross-attention 将输出转换回字节

### 模型变体

| 模型 | 参数 | 说明 |
|------|------|------|
| Llama-3.1-8B-TFree-HAT | 8B | 从 Llama 3.1 8B 转换 |
| Llama-3.1-70B-TFree-HAT | 70B | 从 Llama 3.1 70B 转换 |
| Llama-TFree-HAT-Pretrained | 7B | 从头训练，4T 词 |

## 训练方法

### 两阶段训练
1. **Encoder/Decoder 训练**: 从头训练编码器和解码器
2. **Backbone 适配**: 保持预训练的 transformer blocks，适配处理词嵌入

### 后训练
- **SFT** (Supervised Fine-Tuning)
- **DPO** (Direct Preference Optimization)
- 支持英语和德语双语

## 实验结果

### 优势
- ✅ 减少序列位置数量（更好的文本压缩）
- ✅ 对词内变化更鲁棒（拼写差异等）
- ✅ 在大多数基准上超越原始 Llama 3.1
- ✅ 无需固定词表，适应性强

### 语言支持
- 英语: 强性能
- 德语: 强性能

## 关键创新点

### 1. 摆脱静态词表
传统 LLM 的问题:
- 固定词表大小
- 对新领域/语言适应性差
- OOV (Out-of-Vocabulary) 问题

HAT 的解决方案:
- 直接处理字节
- 动态词嵌入生成
- 无词汇表限制

### 2. 预训练模型复用
- 可以将现有模型转换为 HAT 架构
- 保留预训练知识
- 仅需训练 encoder/decoder

## 局限性

- 训练成本: 需要重新训练 encoder/decoder
- 推理开销: 字节级处理可能增加计算量
- 生态兼容性: 与现有 tokenizer 工具链不兼容

## 实用建议

**适用场景**:
- 多语言应用
- 专业领域（医学术语、代码等）
- 需要处理拼写变化的场景

**不推荐**:
- 纯英语通用任务（传统 tokenizer 足够）
- 计算资源受限场景

## 相关工作

- [[Byte-level Language Models]]
- [[Tokenizer-free Models]]
- [[Hierarchical Transformers]]

## 开源资源

- **模型**: Hugging Face (包括 200 个预训练 checkpoints)
- **代码**: 未明确提及

## 个人笔记

这是对传统 tokenization 范式的重要挑战。Aleph Alpha 展示了完全摆脱词表的可行性，且能复用现有预训练模型。关键洞察是：**tokenizer 并非必须**，字节级处理可以更灵活。

对于多语言和专业领域应用，这种方法有巨大潜力。但需要更多工程优化才能在推理效率上与传统方法竞争。

---
#LLM #Architecture #Tokenizer #Byte-level #AlephAlpha
