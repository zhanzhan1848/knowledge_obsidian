# The Illusion of Equivalence: Systematic FP16 Divergence in KV-Cached Autoregressive Inference

## 元信息
| 标题 | The Illusion of Equivalence: Systematic FP16 Divergence in KV-Cached Autoregressive Inference |
|------|---------|
| 作者 | Ranjith Chodavarapu, Lei Xu |
| 链接 | [原文](https://arxiv.org/abs/2604.15409) |
| arXiv | arXiv:2604.15409v1 |
| 领域 | cs.LG, cs.AI |
| 发表 | 2026-04-16 |

## 核心贡献

1. **问题发现**：KV cache 长期被认为与无缓存计算数值等价，但**在标准 FP16 下此假设不成立**
2. **根因**：cache-ON 和 cache-OFF 执行路径使用不同的浮点累加顺序（FP16 非结合性）
3. **实验验证**：三个模型（LLaMA-2-7B, Mistral-7B-v0.3, Gemma-2-2B）在 GSM8K 上：
   - **100% token divergence rate**（包括 greedy decoding）
   - cache-ON 在 8/9 条件下准确率更高
   - FP32 验证后 divergence 减少 8 个数量级，flip rate 降至 0.0%

## 架构传播模式

| 架构 | Divergence 特征 |
|------|----------------|
| Grouped-Query Attention 模型 | 首次层处急剧发散 |
| Gemma (大 head dim + sliding window attention) | 全层均匀累加 |

## 因果定位

- 激活 patching（整个残差流）无法恢复无缓存轨迹
- **因果变量定位到 stateful KV cache**
- 证实 FP16 KV cache 推理**本质上不等同于重计算**

## 核心发现

> FP16 KV cache 推理与重计算存在系统性数值差异，非等价
> 差异具有确定性（由 FP16 非结合性驱动），且方向性一致

## 标签
#KV-cache #FP16 #numerical-precision #inference #transformer #LLaMA #Mistral #Gemma #numerical-stability
