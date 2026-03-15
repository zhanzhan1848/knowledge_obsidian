# STAMP: Selective Task-Aware Mechanism for Text Privacy

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | STAMP: Selective Task-Aware Mechanism for Text Privacy |
| 作者 | Fengwei Tian, Payel Bhattacharjee, Heidi Hanson, Geoffrey D. Rubin, Joseph Y. Lo, Ravi Tandon |
| 链接 | [原文](https://arxiv.org/abs/2603.12237) |
| arXiv | arXiv:2603.12237 |
| 领域 | cs.LG, cs.CR, cs.IT |
| 会议 | EACL 2026 |
| 发表时间 | 2026-03-12 |

## 核心贡献
1. **选择性隐私预算分配**: 联合考虑 (i) token 对下游任务的重要性，(ii) 隐私敏感性（姓名、日期、标识符）
2. **Polar Mechanism**: 仅扰动嵌入的方向（单位球面上），保留幅度
3. **余弦最近邻解码**: 将扰动几何与解码几何对齐

## 模型架构

### STAMP 框架
- **Token 级分区**: 细粒度控制不同输入部分的噪声级别
- **任务感知表示**: 使用任务或查询特定表示衡量 token 重要性

### Polar Mechanism
- **核心思想**: 仅扰动嵌入方向，保留幅度
- **优势**: 与各向同性噪声机制不同，维持嵌入空间中的语义邻域
- **解码方式**: 余弦最近邻搜索

## 训练方法
- 差分隐私噪声注入
- 任务感知的隐私预算分配

## 实验结果
- **数据集**: SQuAD, Yelp, AG News
- **效果**: 在不同 per-token 隐私预算下持续实现更优的隐私-效用权衡

## 局限性
- 未明确提及

## 技术要点
- 关键词: `#differential-privacy` `#text-privacy` `#NLP` `#embedding` `#EACL2026`
- 创新点: 任务感知的选择性隐私保护，polar mechanism

## 推荐评估
- **是否推荐**: ✅ 是
- **适用场景**: 隐私敏感的 NLP 应用、医疗文本处理、用户数据保护

## 相关论文
- [[Differential Privacy in NLP]]
- [[Text Anonymization]]
- [[Privacy-Preserving ML]]
