# MER-TRANS 2026: 西班牙语易读性生成的多智能体简化

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | HULAT2 at MER-TRANS 2026: Governed Multi-Agent Simplification for Spanish Easy-to-Read Generation |
| **arXiv** | [2607.02381](https://arxiv.org/abs/2607.02381) |
| **作者** | Lourdes Moreno et al. |
| **分类** | cs.CL |
| **发表** | 2026-07-02 |
| **比赛** | MER-TRANS 2026 |

## 核心贡献

1. **MER-TRANS 2026 参赛**: 三种全自动西班牙语 runs 提交

2. **多智能体工作流**: 基于 LangGraph 的多智能体工作流，结合 Gemini 2.5 Flash 和 RigoChat-7B-v2

3. **RUN1 最佳**: SARI 44.0543 分 (最佳 HULAT2 run)

## 方法

### RUN1 & RUN2
- 基于 LangGraph 的多智能体工作流
- 并行生成策略
- 内部质量信号
- Event-Condition-Action 路由
- 可控编辑和可追溯决策

### RUN2 额外层
- 基于词汇表和词汇资源的词汇支持层

### RUN3
- RigoChat 的 generate-evaluate-regenerate 基线
- prompt engineering
- LoRA-based adaptation

## 结果

| Run | SARI |
|-----|------|
| RUN1 | 44.0543 |
| RUN2 | 43.1049 |
| RUN3 | 38.5136 |

### 关键发现
- 信号引导的多智能体路由优于线性再生基线
- 添加词汇支持并未自动改善参考分数

## 建议

- **是否推荐使用**: 是 (多智能体系统研究)
- **适用场景**: 多智能体系统、文本简化、易读性生成
- **相关方向**: Multi-Agent Systems, Text Simplification, Easy-to-Read, NLP Applications

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
