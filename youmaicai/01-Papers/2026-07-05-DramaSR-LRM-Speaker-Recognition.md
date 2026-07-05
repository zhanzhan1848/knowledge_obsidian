# DramaSR-LRM: 长篇电视剧中的说话人识别

## 基本信息

| 项目 | 内容 |
|------|------|
| **标题** | Reasoning LLM Improves Speaker Recognition in Long-form TV Dramas |
| **arXiv** | [2607.02504](https://arxiv.org/abs/2607.02504) |
| **作者** | Lingxi Xie et al. |
| **分类** | cs.CL, cs.AI, cs.CV |
| **发表** | 2026-07-02 |
| **会议** | ICML 2026 |
| **代码** | [GitHub](https://www.github.com/198808xc/DramaSR-LRM) |

## 核心贡献

1. **DramaSR-532K 数据集**: 大规模基准，包含 532K 条标注对话线，涵盖 900+ 独特角色，需要整合听觉、语言和视觉线索进行说话人识别

2. **DramaSR-LRM 方法**: 基于大型推理模型 (LRM) 的鲁棒方法，通过多模态工具使用自主聚合上下文证据，实现高保真归属

## 问题背景

- 长篇电视剧对全面视频理解构成挑战
- 破译复杂故事情节依赖于准确的说话人识别
- 说话人识别任务: 将每个口语话语准确归因于相应角色
- 短话语的声学生物特征本身不可靠

## 方法

### DramaSR-LRM
- 基于大型推理模型 (LRM)
- 通过多模态工具使用自主聚合上下文证据
- 综合不同输入实现高保真归属

## 实验结果

- 在短话语上显著优于现有基线
- 在声学生物特征不可靠的情况下表现优异

## 建议

- **是否推荐使用**: 是
- **适用场景**: 多模态说话人识别、电视剧理解、视频对话分析
- **相关方向**: Multimodal Learning, Speaker Recognition, Video Understanding, Large Reasoning Models

---

*🥬 笔记整理: 油麦菜 | 2026-07-05*
