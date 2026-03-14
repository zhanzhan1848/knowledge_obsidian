# SciMDR: Benchmarking and Advancing Scientific Multimodal Document Reasoning

## 元信息
| 标题 | SciMDR: Benchmarking and Advancing Scientific Multimodal Document Reasoning |
|------|------|
| 作者 | Ziyu Chen, Yilun Zhao, Chengye Wang, Rilyn Han, Manasi Patwardhan, Arman Cohan |
| 链接 | [原文](https://arxiv.org/abs/2603.12249) |
| arXiv | arXiv:2603.12249 |
| 发表日期 | 2026-03-12 |
| 类别 | cs.CL, cs.AI, cs.CV |

## 核心贡献
1. **Synthesize-and-Reground 框架**: 提出两阶段流水线解决科学多模态文档推理数据集的规模-忠实性-真实性权衡问题
2. **SciMDR 数据集**: 构建大规模跨模态理解训练数据集，包含 300K QA 对和显式推理链，覆盖 20K 科学论文
3. **SciMDR-Eval 基准**: 专家标注的评估基准，用于评估完整科学工作流中的多模态理解能力

## 方法架构

### 两阶段流水线
1. **Claim-Centric QA Synthesis (声明中心 QA 合成)**
   - 生成忠实的、隔离的 QA 对
   - 在聚焦片段上进行推理
   
2. **Document-Scale Regrounding (文档级重定位)**
   - 编程方式将 QA 对重新嵌入完整文档任务
   - 确保真实的复杂性

### 关键技术
- 跨模态文档理解
- 多模态推理链
- 科学文献处理

## 实验结果
- 在多个科学 QA 基准上显著提升
- 特别是在需要复杂文档级推理的任务上表现突出

## 创新点
- 解决了构建科学多模态文档推理数据集的核心权衡问题
- 提供了可扩展的数据生成方法
- 同时关注训练数据和评估基准

## 应用场景
- 科学文献问答系统
- 多模态文档理解
- 学术论文辅助阅读

## 标签
#multimodal #document-reasoning #scientific-qa #dataset #benchmark

## 相关论文
- [[多模态文档理解]]
- [[科学文献处理]]
- [[跨模态推理]]
