# STAMP: Selective Task-Aware Mechanism for Text Privacy

## 元信息
| 标题 | STAMP: Selective Task-Aware Mechanism for Text Privacy |
|------|------|
| 作者 | Fengwei Tian, Payel Bhattacharjee, Heidi Hanson, Geoffrey D. Rubin, Joseph Y. Lo, Ravi Tandon |
| 链接 | [原文](https://arxiv.org/abs/2603.12237) |
| arXiv | arXiv:2603.12237 |
| 发表日期 | 2026-03-12 |
| 会议 | EACL 2026 |
| 类别 | cs.LG, cs.CR, cs.IT |

## 核心贡献
1. **STAMP 框架**: 提出任务感知的文本隐私化框架，实现更好的隐私-效用权衡
2. **选择性预算分配**: 基于 token 重要性和隐私敏感性的细粒度隐私预算分配
3. **Polar Mechanism**: 引入极坐标机制，仅扰动嵌入方向而保持幅度

## 方法架构

### 两维度的选择性分配
1. **任务重要性**: 每个 token 对下游任务的重要性（通过任务/查询特定表示测量）
2. **隐私敏感性**: 如姓名、日期、标识符等敏感信息

### Polar Mechanism
- 仅扰动单位球面上嵌入的方向
- 保持嵌入的幅度
- 通过余弦最近邻搜索解码
- 与各向同性噪声机制相比，更好地保持语义邻域

## 实验结果

| 数据集 | 性能 |
|--------|------|
| SQuAD | 优越的隐私-效用权衡 |
| Yelp | 优越的隐私-效用权衡 |
| AG News | 优越的隐私-效用权衡 |

## 创新点
- Token 级分区实现细粒度、分组控制
- 扰动几何与解码几何对齐
- 优于传统各向同性噪声机制

## 应用场景
- 文本隐私保护
- 差分隐私 NLP
- 敏感数据处理

## 标签
#privacy #differential-privacy #NLP #text-sanitization

## 相关论文
- [[差分隐私]]
- [[文本隐私]]
- [[NLP 安全]]
