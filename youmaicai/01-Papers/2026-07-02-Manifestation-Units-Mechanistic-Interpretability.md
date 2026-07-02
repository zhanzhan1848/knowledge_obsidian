# Representation as a Bottleneck for Mechanistic Interpretability: The Manifestation Unit Protocol

## 元信息
| 标题 | Representation as a Bottleneck for Mechanistic Interpretability: The Manifestation Unit Protocol |
|------|------|
| 作者 | Hussein Chouman, Wataru Sasaki, Tomokazu Matsui, Hirohiko Suwa, Keiichi Yasumoto |
| 链接 | [原文](https://arxiv.org/abs/2607.00089) |
| arXiv | arXiv:2607.00089 [cs.LG] |
| 发表 | 2026-06-30 |
| 代码 | [GitHub](https://github.com/) (待确认) |

## 核心贡献

1. **识别表示层作为 bottleneck**：Mechanistic interpretability 的输出（selectivity tables、circuit diagrams、feature lists）不可复用、非组合化、无法用自然语言查询
2. **提出 Manifestation Units 协议**：类型化元组协议 (E, S, R, D, G) + attention-head primitives (T)，将 per-component 统计量组织为结构化字段
3. **支持混合检索**：自动填充字段 + 自然语言查询

## Manifestation Units 协议

### 核心结构

```
(E, S, R, D, G, T)
```
- **E** (Entity): 实体标识
- **S** (Selectivity): 选择性
- **R** (Representation): 表示
- **D** (Dynamics): 动态
- **G** (Generalization): 泛化
- **T** (Attention-Head Primitives): Transformer 专用

### 查询机制

- **Hybrid retrieval**：结构化字段查询 + 自然语言描述
- **类型化结构 > 非结构化基线**：显著的性能提升

## 实验验证

### 跨架构验证

| 架构 | 类型 | 验证结果 |
|------|------|---------|
| beta-VAE | 生成式视觉 | 协议适用 |
| CNN | 判别式视觉 | 因果充分/必要条件满足 |
| GPT-2 | 语言模型 | attention-head primitives 吸收无修改 |

### 关键发现

- **S+R 双字段核心不可约化**
- 其他字段要么冗余，要么主动干扰
- 在 retrieval-budget-matched 控制下恢复已知 IOI circuit 成员

## 局限性

- 提出作为 schema infrastructure，而非 frontier-scale 验证
- 在大型模型上的效果尚未验证

## 建议

- **是否推荐使用**：是
- **适用场景**：Mechanistic interpretability 研究、神经网络审计、可解释 AI
- **使用建议**：作为 interpretability 分析的标准化表示框架

## 标签
#mechanistic-interpretability #transformer #neural-network #representation #GPT-2
