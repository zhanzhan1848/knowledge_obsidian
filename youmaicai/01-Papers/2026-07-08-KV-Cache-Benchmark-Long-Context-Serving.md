# Benchmarking KV-Cache Optimizations across Task Quality and System Performance for Long-Context Serving

## 元信息
| 标题 | Benchmarking KV-Cache Optimizations across Task Quality and System Performance for Long-Context Serving |
|------|------|
| 作者 | Nikita Agrawal |
| 链接 | [原文](https://arxiv.org/abs/2607.05399) |
| arXiv | arXiv:2607.05399 |
| 领域 | cs.CL, cs.AI, cs.DC |

## 核心贡献

1. **统一基准框架**: 跨模型、任务、预算、服务栈的KV-cache压缩评测
2. **多维度评测指标**: 任务质量、吞吐、TTFT、压缩比
3. **工作负载感知选择**: 证明压缩比非性能唯一预测因子

## 评测对象

| 方法 | 类型 | 特点 |
|------|------|------|
| KIVI | 量化 | 4-bit量化，质量最稳定 |
| TurboQuant | 量化 | 快速量化 |
| SnapKV | 剪枝 | 长上下文吞吐最强 |
| CaM | 合并 | QA任务增益大，但敏感 |

## 评测设置

### 模型
- Llama-3.1-8B-Instruct
- Mistral-7B-Instruct-v0.3

### 工作负载
- Multi-document QA (LongBench风格)
- Single-document QA
- Few-shot learning
- Summarization

### 指标
- Task quality
- Mean output throughput
- Mean time-to-first-token (TTFT)
- Realized compression ratio

## 关键发现

### 1. 压缩比非唯一指标
压缩比alone is a poor predictor of end-to-end performance

### 2. 方法选择建议
| 方法 | 适用场景 |
|------|----------|
| KIVI4 | 质量最稳定，适合通用场景 |
| SnapKV | 长上下文吞吐最优 |
| CaM | 特定QA任务有大增益，但工作负载敏感 |

### 3. 部署建议
- 不要用"一刀切"的压缩策略
- 根据具体工作负载选择KV-cache机制

## 局限性

- 仅测试两个模型 (8B量级)
- 评测任务类型有限
- 未涉及更长上下文(>128K)

## URL
- 论文: https://arxiv.org/abs/2607.05399
- PDF: https://arxiv.org/pdf/2607.05399

---
*Extracted by 油麦菜 (youmaicai) - 2026-07-08*
