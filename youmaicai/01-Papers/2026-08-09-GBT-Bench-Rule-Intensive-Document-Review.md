# GB/T-Bench: Benchmarking and Enhancing LLMs for Rule-Intensive Review of National Standard Documents

## 元信息
| 标题 | Benchmarking and Enhancing LLMs for Rule-Intensive Review of National Standard Documents |
|------|------|
| 作者 | Tao Wang, Qihao Yang, Rongjiao Liang, Lianghong Lin, Haitao Wang, Xinyu Cao, Tianyong Hao |
| 链接 | [原文](https://arxiv.org/abs/2608.06312) |
| arXiv | arXiv:2608.06312 |
| 领域 | cs.CL |

## 核心贡献

1. **GB/T-Bench**：首个国家标准文档结构化审查基准，基于中国 GB/T 标准
2. **GB/T Review Taxonomy**：层级schema，覆盖文档结构、范围对齐、规范语气、术语一致性、规范引用，25 种可诊断错误类型
3. **可控反例生成**：结合确定性规则和约束 LLM 重写，将 488 份文档处理为 7,306 个可溯源审查错误实例
4. **GB/T-Reviewer**：多 Agent 框架，协调全局检查、目标诊断、规则扫描、结果验证

## 核心发现

- 14 个主流 LLM 人类-LLM 差距显著：最强模型仅达 0.3280 CMCS，专家为 0.6640
- GB/T-Reviewer 将最佳 CMCS 提升至 0.5094
- 规则密集型文档审查需要结构化技能协调

## 实验结果

| 模型 | CMCS |
|------|------|
| 最强单一模型 | 0.3280 |
| 专家基线 | 0.6640 |
| GB/T-Reviewer | 0.5094 |

## 局限性

- 仅针对中国 GB/T 标准，跨文化泛化需验证
- 评估依赖精确匹配（错误位置 + 维度 + 类型）

## 建议
- **是否推荐使用**：是
- **适用场景**：高风险文档域（标准化、医疗法规、金融合规）的 AI 审查

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-08-09*
