# On-Device Real-Time Subtitle Translation: LocalSubs

## 元信息
| 标题 | Workload-Driven Optimization for On-Device Real-Time Subtitle Translation |
|------|-----|
| 作者 | Tsz-To Wong |
| 链接 | [原文](https://arxiv.org/abs/2607.09957) |
| arXiv | arXiv:2607.09957 |
| 日期 | 2026-07-14 |
| 分类 | cs.CL, cs.AI |

## 核心贡献

1. **端侧英→繁体中文字幕翻译**：针对台湾场景的本地化需求
2. **LocalSubs 系统**：从 LMT-60-0.6B 出发，针对短输入、短输出、batch-size-one、低延迟、隐私约束优化
3. **领域自适应词表压缩**：151k → 64k token 的字幕领域 tokenizer

## 约束条件

- **短输入/短输出**：字幕场景特性
- **Batch size = 1**：实时流式处理
- **低延迟**：实时字幕需求
- **隐私**：本地处理，无云端上传
- **统一内存受限设备**：macOS Apple Silicon

## 方法

### 问题诊断
Profile 发现：GGUF 量化降低 Transformer 块相对成本后，**词表投影（vocabulary projection）成为更重要的解码时成本**

### 优化方案
1. **词表压缩**：151k → 64k token（字幕领域 tokenizer）
2. **嵌入空间迁移**：保留语义，压缩空间
3. **Embedding Calibration + Full SFT**：两阶段适应

### 架构
```
Original: LMT-60-0.6B (151k vocab) 
    ↓
词表压缩: 64k subtitle-domain tokenizer
    ↓
Embedding Calibration + Full SFT
    ↓
LocalSubs (优化后模型)
```

## 实验结果

### 质量（GPT-4o pairwise judging）
- **59.2%** tie-excluded win rate vs Google Translate（OpenSubtitles2024, 500 examples）
- 短 cue 性能最强，随 cue 长度增加性能下降

### 延迟（Apple M2 Metal）
- **1.63× speedup**（64k vs 151k 词表 baseline）

## 关键洞察

> GGUF 量化改变了 Transformer 块 vs 词表投影的成本比，使词表投影成为新的瓶颈。

- 隐私敏感场景（字幕翻译）必须本地运行
- 领域自适应词表压缩是有效优化方向
- 短 cue 优化优先级高于长序列

## 局限性

- 基准配置未完成，延迟结果为初步结果
- 仅覆盖英→繁中方向
- 性能随 cue 长度增加而下降

## 标签
#OnDevice #Translation #Subtitle #Quantization #GGUF #端侧部署 #隐私计算

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
