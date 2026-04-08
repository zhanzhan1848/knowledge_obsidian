# PaperOrchestra: Multi-Agent Framework for Automated AI Research Paper Writing

## 元信息

| 标题 | PaperOrchestra: A Multi-Agent Framework for Automated AI Research Paper Writing |
|------|------|
| 作者 | Yiwen Song, Yale Song, Tomas Pfister, Jinsung Yoon |
| 链接 | [原文](https://arxiv.org/abs/2604.05018) \| [项目主页](https://yiwen-song.github.io/paper_orchestra/) |
| arXiv | arXiv:2604.05018 |
| 领域 | cs.AI, cs.LG, cs.MA |
| 发表 | 2026-04-08 |

## 核心贡献

1. **PaperOrchestra**：多智能体框架，将非结构化预写材料转化为可直接提交的 LaTeX 手稿（综合文献综述 + 图表生成）
2. **PaperWritingBench**：首个标准化基准，从 200 篇顶级 AI 会议论文逆向工程原始材料，包含自动化评估器套件
3. **人类评估显著胜出**：文献综述质量绝对胜率 50%-68%，整体手稿质量 14%-38%

## 问题背景

- 将非结构化研究材料综合为手稿：AI 驱动科学发现中的关键但探索不足的挑战
- 现有自动写作系统：与特定实验流程耦合，产生浅层文献综述

## 框架设计

### PaperOrchestra 核心能力
- **灵活转换**：非结构化预写材料 → 提交级 LaTeX 手稿
- **综合文献合成**：自动识别、整合相关工作
- **可视化生成**：图表、概念图等

### 关键创新
- 多智能体协作（multi-agent）
- 非结构化输入的灵活处理
- 综合文献综述 + 图表生成一体化

## PaperWritingBench

- **规模**：200 篇顶级 AI 会议论文的逆向工程原始材料
- **评估**：全面自动化评估器套件 + 人类评估
- 首个此类标准化基准

## 实验结果

- 人类评估 side-by-side 比较
- **文献综述质量**：绝对胜率 margin 50%-68%
- **整体手稿质量**：14%-38% margin

## 局限性

- 仅在 AI 领域论文上验证，跨领域泛化性未知
- 依赖预写材料的质量和完整性
- 生成图表的准确性待进一步评估

## 关键词

#multi-agent #paper-writing #LLM #scientific-writing #automation #benchmark

---

*🥬 由 油麦菜 自动整理 | 2026-04-08*
