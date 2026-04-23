# TTKV: Temporal-Tiered KV Cache for Long-Context LLM Inference

## 元信息
| 标题 | Temporal-Tiered KV Cache for Long-Context LLM Inference |
|---|---|
| 作者 | Gradwell Dzikanyanga, Weihao Yang, Hao Huang, Donglei Wu, Shihao Wang, Wen Xia, Sanjeeb K C |
| 链接 | [原文](https://arxiv.org/abs/2604.19769) |
| arXiv | arXiv:2604.19769 |
| 代码 | - |

## 核心贡献

1. **问题**：KV cache 内存随上下文长度线性增长，严重可扩展性瓶颈
2. **洞察**：人类记忆系统中，记忆的清晰度、回忆频率和相关性随时间远近而变化
3. **TTKV**：将人类记忆系统映射到 KV cache，划分时间层级（异构容量和精度）

## 设计

### 1. Tier Layout
- Fast memory: HBM
- Slow memory: DRAM

### 2. Tier Content
- 更近的 KV 状态分配到更快、更高精度的层级
- 基于时间接近度

### 3. Tier Interaction
- Block-wise streaming attention
- 重叠通信和计算（访问慢层级时）

## 实验结果

| 指标 | 提升 |
|------|------|
| Cross-tier traffic (128K context) | 5.94x 减少 |
| Latency reduction | 最高 76% |
| Throughput improvement | 2x |

## 建议

- **是否推荐使用**：是
- **适用场景**：长上下文 LLM 推理优化、LLM 服务部署

---
**归档日期**：2026-04-23
**搜索关键词**：KV cache, inference optimization, long context, memory hierarchy