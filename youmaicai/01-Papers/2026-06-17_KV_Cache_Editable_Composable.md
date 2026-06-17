# KV Cache Can Be Editable and Composable

## 元信息
| 标题 | Models Take Notes at Prefill: KV Cache Can Be Editable and Composable |
|------|-----|
| 作者 | Bojie Li |
| 链接 | [原文](https://arxiv.org/abs/2606.17107) |
| arXiv | arXiv:2606.17107 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. 将 KV Cache 重新解释为**预填充时写入的"笔记本"（memoized conclusions）**
2. 发现字段自身的 key/value 对决策驱动不足 1%，因为模型已在预填充时将字段条件结论写入下游
3. 提出两个能力：**可编辑性**和**可组合性**

## 核心洞察
- Prefix caching 只在完全共享前缀时复用，字段变化使整个下游缓存失效
- 覆盖字段的 key/value 向量但复用其余部分，模型仍基于旧值行动
- 原因：在预填充时，模型已将字段条件结论写入下游 notes

## 方法
### 1. 可编辑性 (Editable)
- 对显著错误（erratum）修正 notes
- 使用 chain-of-thought 时，仅编辑字段即可恢复决策（8B 模型 1.00 准确率，~1% 计算量）
- 无 CoT 时修正被忽略

### 2. 可组合性 (Composable)
- Notes 是位置可移植的
- 预编译 skill 可通过 RoPE 重新定位并拼接进任意上下文
- 与完整重计算难以区分（logit cosine 0.90-0.999，12 个模型）
- O(L) 而非 O(L²) 的首 token 时间

### 统一 Edit+Compose Agent
- 决策与重计算相同，延迟降低 14.9x

## 实验结果
### 在线 vLLM 基准
- 保持 prefix cache 对齐（98.5% hit-rate）
- p90 首 token 时间减少 53-398x

### 泛化验证
- 跨规模、量化、MoE、多模态 cache 验证
- 扩展到多种注意力变体（通过小 adapters）

## 结论
- KV Cache 本质是预填充时写入的笔记
- 错误是追加的，可与生产 prefix caching 组合
- 为高效推理和知识更新提供新思路

## 关键词
`KV Cache` `Prefix Caching` `Attention Mechanism` `Editable Memory` `Transformer` `Inference Optimization