# GradeSQL: Test-Time Verification for Text-to-SQL via Outcome Reward Models

## 元信息
| 标题 | Test-Time Verification for Text-to-SQL via Outcome Reward Models |
|------|------|
| 作者 | Mattia Tritto, Giuseppe Farano, Dario Di Palma, Gaetano Rossiello, Fedelucio Narducci, Dharmashankar Subramanian, Tommaso Di Noia |
| 链接 | [原文](https://arxiv.org/abs/2606.30851) |
| arXiv | arXiv:2606.30851 [cs.CL] |
| 发表 | 2026-06-29 |
| 会议 | ACL 2026 SURGeLLM Workshop |

## 核心贡献

1. **提出 GradeSQL 框架**：使用 Outcome Reward Models (ORM) 作为 learned semantic scoring function 进行 Text-to-SQL 测试时验证
2. **解决现有 test-time inference 策略的局限性**：Best-of-N 和 Majority Voting 依赖 execution success 或 output frequency，对语义区分度有限
3. **自动化 ORM 训练**：通过 automated candidate generation 和 execution-based labeling，无需人工标注

## 核心问题

Text-to-SQL 的测试时推理面临挑战：
- **Execution success**：SQL 能跑≠语义正确
- **Output frequency**：多数投票忽略语义质量
- **Complex queries**：简单启发式在复杂查询上表现差

## GradeSQL 方法

### ORM 训练流程

1. **Candidate Generation**：使用目标 LLM 生成 N 个候选 SQL
2. **Execution-based Labeling**：执行所有候选，根据执行结果（正确/错误）自动标注
3. **ORM Training**：训练一个语义评分模型来预测每个候选的质量
4. **Verification-driven Best-of-N**：用 ORM 重新排序候选，选择最高分

### 关键创新

- **无需人工标注**：所有标签来自自动执行反馈
- **语义评分**：学习 SQL 的语义质量，而非仅依赖能否执行
- **可扩展**：支持任意 LLM 家族

## 实验结果

| Benchmark | ORM vs Best-of-N | ORM vs Majority Voting |
|-----------|-----------------|------------------------|
| BIRD | **+4.33%** | 显著提升 |
| Spider | **+2.10%** | 显著提升 |

### 缩放特性
- ORM 在更大 candidate set 上效果更好
- 对复杂查询的改进更显著

## 建议

- **是否推荐使用**：是
- **适用场景**：Text-to-SQL 任务、任何需要测试时验证的结构化推理任务
- **使用建议**：可与现有 RAG/CoT 方法结合

## 标签
#LLM-reasoning #Text-to-SQL #test-time-inference #ORM #Best-of-N
