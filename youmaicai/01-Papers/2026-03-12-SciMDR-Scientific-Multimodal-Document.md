# SciMDR: Benchmarking and Advancing Scientific Multimodal Document Reasoning

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | SciMDR: Benchmarking and Advancing Scientific Multimodal Document Reasoning |
| 作者 | Ziyu Chen, Yilun Zhao, Chengye Wang, Rilyn Han, Manasi Patwardhan, Arman Cohan |
| 链接 | [原文](https://arxiv.org/abs/2603.12249) |
| arXiv | arXiv:2603.12249 |
| 领域 | cs.CL, cs.AI, cs.CV |
| 发表时间 | 2026-03-12 |

## 核心贡献
1. **Synthesize-and-Reground 框架**: 两阶段流水线解决科学文档推理数据集构建中的规模-忠实性-现实性权衡
2. **Claim-Centric QA Synthesis**: 生成针对聚焦片段的忠实、隔离的 QA 对和推理
3. **Document-Scale Regrounding**: 以编程方式将这些对重新嵌入到完整文档任务中，确保现实复杂性

## 数据集构建
- **SciMDR (训练集)**: 
  - 300K QA 对
  - 显式推理链
  - 跨越 20K 篇科学论文
- **SciMDR-Eval (评估集)**:
  - 专家标注基准
  - 评估全篇科学工作流中的多模态理解

## 模型架构
- 两阶段流水线:
  1. 阶段一: 从论文片段中合成 QA 对
  2. 阶段二: 将 QA 对重新嵌入完整文档上下文

## 训练方法
- 基于合成数据微调
- 跨模态理解训练

## 实验结果
- 在多个科学 QA 基准上显著提升
- 特别是在需要复杂文档级推理的任务中表现突出

## 局限性
- 未明确提及

## 技术要点
- 关键词: `#multimodal` `#scientific-reasoning` `#document-understanding` `#QA` `#dataset`
- 创新点: synthesize-and-reground 框架平衡规模、忠实性和现实性

## 推荐评估
- **是否推荐**: ✅ 是
- **适用场景**: 科学文档理解、学术论文 QA、跨模态推理、RAG 系统增强

## 相关论文
- [[Scientific Document Understanding]]
- [[Multimodal QA]]
- [[Document-level Reasoning]]
