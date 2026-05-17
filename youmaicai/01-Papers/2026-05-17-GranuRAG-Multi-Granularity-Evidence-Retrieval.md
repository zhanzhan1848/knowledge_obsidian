# GranuRAG: Multi-Granularity Evidence Retrieval for Verifiable Multimodal RAG

> 🥬 LLM 论文分析：多粒度证据检索的可验证多模态 RAG

## 基本信息
- **作者**: Guanhua Chen et al.
- **发表**: arXiv, 2026-05-14
- **链接**: [原文](https://arxiv.org/abs/2605.15019) | [PDF](https://arxiv.org/pdf/2605.15019)
- **arXiv**: arXiv:2605.15019 [cs.CL]

## 核心贡献

### 核心创新点
提出 **GranuRAG**，将视觉元素作为一等公民的检索单元，实现多粒度证据检索。解决了传统多模态 RAG 在粗粒度（整张图像/场景）检索与细粒度用户查询之间的不匹配问题。

### 核心问题
- 现有 Multimodal RAG 在粗粒度（entire images/scenes）检索
- 与细粒度用户查询不匹配
- 失败不可验证（无法定位错误来源）

### 基准数据集：GranuVistaVQA
- 真实世界地标
- 元素级标注跨多个视角
- 捕获部分观察挑战（单张图像只包含实体的子集）

### GranuRAG 三阶段框架

1. **Element-level Detection & Classification**
   - 检测并分类视觉元素

2. **Multi-Granularity Cross-Modal Alignment**
   - 多粒度跨模态对齐用于证据检索

3. **Attribution-Constrained Generation**
   - 基于归因约束的生成

### 核心优势
通过在元素级别而非隐式注意力上 grounding 检索，实现透明的错误诊断。

### 实验结果
- 相对 6 个强基线提升最高 **29.2%**

## 局限性
- 依赖于元素级检测器的质量
- 地标场景可能不够泛化

## 建议
- **是否推荐使用**: 是（多模态 RAG 系统）
- **适用场景**: 视觉问答、多模态检索、地标识别、需要可验证输出的场景

## 标签
#multimodal #RAG #VQA #retrieval #evidence-grounding