# GB/T-Bench: LLM for National Standard Document Review

## 元信息
| 标题 | Benchmarking and Enhancing LLMs for Rule-Intensive Review of National Standard Documents |
|------|-------|
| 作者 | (Multiple authors) |
| 链接 | [原文](https://arxiv.org/abs/2608.06312) |
| arXiv | arXiv:2608.06312 |
| 领域 | cs.CL |

## 核心贡献
1. 提出 **GB/T-Bench**：首个国家标准文档结构化审查基准
2. **GB/T Review Taxonomy**：层次化错误分类，覆盖文档结构、范围一致性、规范措辞、术语一致性、规范引用 5 大维度，25 种可诊断错误类型
3. **GB/T-Reviewer**：多 agent 框架，将审查知识转化为专门技能，协调全局检查、定向诊断、规则扫描、结果验证

## 方法
- 可控反例生成机制：结合确定性规则 + 约束 LLM 重写，将 488 份文档扩展为 7,306 个可溯源审查错误实例
- 评估协议：要求错误位置、审查维度、错误类型三重精确匹配

## 实验结果
- 14 个主流 LLM 评测：最强模型 CMCS 仅 0.3280 vs 人类专家 0.6640（巨大差距）
- GB/T-Reviewer 将最佳 CMCS 提升至 0.5094

## 关键洞察
高规则密度专业文档审查是 LLM 的明显短板，多 agent 技能协调是可行方向
