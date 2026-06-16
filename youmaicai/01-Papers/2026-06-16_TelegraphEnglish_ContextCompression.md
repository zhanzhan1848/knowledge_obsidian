# Context Compression Is Not One Thing: Telegraph English

## 元信息
| 标题 | Context Compression Is Not One Thing: Readable Symbolic Re-expression vs. Coherent Summary at Matched Budget |
|------|-----|
| 作者 | Sisong Bei, Mikhail L. Arbuzov, Ziwei Dong, Dmitri Kalaev, Alexey Shvets |
| 链接 | [原文](https://arxiv.org/abs/2606.14875) |
| arXiv | arXiv:2606.14875 |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **Telegraph English**：一种可读的符号格式，将检索到的段落重写为结构化实体-关系语句
2. 在匹配 token 预算下，Telegraph English 在所有数据集上超越：
   - 字符级删除 (character-level deletion)
   - 截断 (truncation)
   - 随机子采样 (random sub-sampling)
   - 一致性 prose 摘要 (coherent prose summary)
3. **F1 提升 13-20 个百分点**

## 核心问题
上下文压缩研究通常将不同方法混为一谈：删除 vs. 摘要 vs. 符号重表达实际上有本质区别。

## Telegraph English 格式示例
将自然语言段落重写为实体-关系三元组结构，例如：
```
[ENTITY: X] [RELATION: Y] [ENTITY: Z]
[ENTITY: X] [ATTRIBUTE: is_A]
```
保留推理证据但以更低 token 成本。

## 实验
### 数据集
- MuSiQue (多跳问答)
- TwoWiki
- HotpotQA

### 结果
| 方法 | F1 提升 vs. Telegraph English |
|------|------|
| Character-level deletion | -13~20 pp |
| Truncation | -13~20 pp |
| Random sub-sampling | -13~20 pp |
| Coherent prose summary (同编码器) | -在最难数据集上落后 |

### 深度交互假设（预注册）
**假设**: 优势随推理深度增加而增长
**结果**: Null — 优势不随推理深度增长
**解释**: 可读符号重表达在匹配 token 预算下比自然语言或一致性摘要保留**实体内容密度**更高

## 结论
- 上下文压缩不是单一概念：符号重表达 vs. 摘要有本质区别
- Telegraph English 在 token 预算约束下实现更好的实体内容密度
- 对多跳问答和检索增强系统的上下文管理有直接应用价值

## 关键词
`Context Compression` `Retrieval-Augmented Generation` `Multi-hop QA` `Symbolic Representation` `Entity-Relation Format`
