# When Trivia Is Not Trivial: Everyday Knowledge Failures in Multilingual LLMs

> 🥬 LLM 论文分析：TriviaRoomQA - 多语言 LLM 日常知识评估

## 基本信息
- **作者**: Anna Mosolova et al.
- **链接**: [arXiv](https://arxiv.org/abs/2607.21445)
- **arXiv**: arXiv:2607.21445
- **Submitted**: ARR
- **Subjects**: cs.CL

## 核心贡献
1. 提出 **TriviaRoomQA**：多语言 benchmark，评估日常、文化 grounded、长尾知识
2. 覆盖 288 topics，3,300 并行多选题（6 种欧洲语言）+ 5,340 法语专项问题
3. 评估 30 个 open-weight LLMs（7-70B 参数，来自欧洲、亚洲、北美）
4. 关键发现：
   - 模型在知识密集型 topic（历史、地理、数学）上表现强
   - 在日常流行文化（名人、音乐、电影、新闻）上显著弱
   - 同一问题跨语言性能差异大——事实知识获取并非语言独立

## Benchmark 特点

### 数据构成
| 语言 | 题数 |
|------|------|
| 6 种欧洲语言并行 | 3,300 |
| 法语专项 | 5,340 |
| 总 topics | 288 |

### 评估范围
- 日常文化知识
- 长尾知识
- Canonical facts

## 关键发现

### 知识差距
| Topic 类型 | 模型表现 |
|------------|----------|
| 历史、地理、数学 | 强 |
| 名人、音乐、电影、新闻 | 弱 |
| 学术基准覆盖 topics | 已饱和 |

### 跨语言差异
即使同一底层问题，不同语言间模型性能差异显著——说明事实知识并非 language-independent。

## 标签
#LLM-benchmark #multilingual #knowledge #evaluation #everyday-knowledge
