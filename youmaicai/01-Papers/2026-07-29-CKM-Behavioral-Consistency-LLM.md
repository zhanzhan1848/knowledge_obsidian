# Cognitive Kernel Model (CKM): Behavioral Consistency in LLMs

## 元信息
| 标题 | Measuring and Improving Behavioral Consistency in Large Language Models through Fact-Heuristic-Emotion State Enforcement |
|------|-----|
| 作者 | Gi-Hun Lee, Joong Yull Park |
| 链接 | [原文](https://arxiv.org/abs/2607.24765) |
| arXiv | arXiv:2607.24765 |
| 代码 | [GitHub](https://github.com/TeenyToolSoftware/cogos-behavioral-consistency) |

## 核心贡献
1. **Cognitive Kernel Model (CKM)**：无需改变模型权重的 prompt-level 状态强制层
2. 决策前，模型必须将输入分离为三个认知角色：
   - **Fact (F)**: 给定的或可验证的信息
   - **Heuristic (H)**: 推断或假设的信息
   - **Emotion (E)**: 评估性或优先级信号
3. CKM 维持结构化状态 $S_t = \{F_t, H_t, E_t\}$，由 transition function 更新
4. 在 26 个 LLM、4 家厂商、37,403 observations 上验证

## 实验设置
- **数据集**: Korean-language decision scenarios（模糊性、伦理冲突、资源分配、错误处理）
- **模型**: 26 LLMs from 4 vendors
- **观察数**: 37,403
- **实验设计**: 4 core experiments + 4-arm ablation + 5-arm sham-restriction ablation + temperature probe

## 主要发现
| 发现 | 效果 |
|------|------|
| (1) CKM 减少重复输出变异性 | Hedges' g=1.09, 95% CI [0.83, 1.35] |
| (2) 状态持久化削减决策翻转率（新型号） | 82% reduction, g=1.52 |
| (3) 效果非仅来自 JSON 格式化 | value-only recomputation, g=2.24 |
| (4) 固定锚状态下的内在随机性可忽略 | - |
| (5) 优势随采样随机性增长 | g=2.87 at temperature 0.7 |
| (6) Sham ablation: 45% gain 来自结构脚手架，55% 来自 F/H/E 内容 | - |

## 重要结论
- **CKM 不提升推理正确性**，仅提升行为一致性
- 行为一致性是可测量的，在不同模型间有差异
- 通过强制模型在决策前分离事实、假设和评估信号，可以部分改善一致性

## 公式
$$S_t = \{F_t, H_t, E_t\}$$

状态由 transition function 更新，维持 Fact/Heuristic/Emotion 三个维度

## 局限性
- 仅测试决策场景，泛化性待验证
- 不提升推理正确性，适用范围有限

## 关键词
#LLM #behavioral-consistency #decision-making #prompt-engineering #FHE-state #CKM
