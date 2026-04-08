# Cactus: Constrained Acceptance Speculative Sampling

## 元信息

| 标题 | Cactus: Accelerating Auto-Regressive Decoding with Constrained Acceptance Speculative Sampling |
|------|------|
| 作者 | Yongchang Hao, Lili Mou |
| 链接 | [原文](https://arxiv.org/abs/2604.04987) |
| arXiv | arXiv:2604.04987 |
| 领域 | cs.LG, cs.AI, math.OC, stat.ML |
| 发表 | ICLR 2026 |

## 核心贡献

1. **形式化**：通过约束优化视角形式化 speculative sampling 算法
2. **Cactus 方法**：保证从验证器分布的受控偏离，提高接受率
3. **解决 Speculative Sampling (SpS) 的核心矛盾**：严格匹配分布（SpS）vs. 过度扭曲分布（TAS entropy-based）

## 问题背景

### Speculative Sampling (SpS)
- 利用小 draft 模型加速 auto-regressive LLM 解码
- 严格强制生成分布匹配验证器 LLM
- **过于严格**：top-k 或 temperature 的轻微变化也是可接受的

### Typical Acceptance Sampling (TAS)
- 用 entropy-based 启发式接受更多 token
- **问题**：扭曲验证器分布，当验证器编码关键信息时可能降级输出质量

## 核心方法

### 约束优化视角
SpS 的严格匹配约束 → 改为受控偏离约束

### Cactus 特性
- **Guaranteed controlled divergence**：保证与验证器分布的受控偏离
- **Increased acceptance rates**：提高接受率
- 介于 SpS 和 TAS 之间，兼具两者优点

## 形式化

设 $p$ 为 verifier 分布，$q$ 为 draft 分布。SpS 严格约束 $p=q$ 太强，TAS 无约束太弱。

Cactus 的核心思想：定义一个可接受偏离范围 $\epsilon$，使得：
$$D(p || q) \leq \epsilon$$
其中 $D$ 为某种散度度量，在此范围内 $q$ 的输出可接受。

## 实验结果

- 广泛基准测试验证
- 接受率提升，输出质量保持
- 相比 SpS 和 TAS 均优

## 关键洞察

> Speculative Sampling 的核心问题是"接受多少偏离"——太严格则加速有限，太宽松则扭曲分布。Cactus 通过约束优化找到了理论上有保证的平衡点。

## 局限性

- 实现复杂度增加
- $\epsilon$ 参数需要针对具体模型和数据调优
- 在非英语语言上的效果待验证

## 关键词

#speculative-sampling #LLM #inference #acceleration #ICLR2026 #optimization #autoregressive

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
