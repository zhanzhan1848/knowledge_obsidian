# Prompt-to-Paper: Agentic AI System for Bioinformatics

## 元信息
| 标题 | Prompt-to-Paper: Agentic AI System for Bioinformatics |
|------|------|
| 作者 | Ramsha Kamran, Maheera Amjad, Zartasha Mustansar, Arsalan Shaukat, Salma Sherbaz, Muhammad U. S. Khan |
| 链接 | [原文](https://arxiv.org/abs/2607.05456) |
| arXiv | arXiv:2607.05456 |
| 领域 | cs.AI, cs.CL, q-bio.QM |

## 核心贡献

1. **多Agent协同框架**: 整合检索、编码、评估三类Agent
2. **确定性RAG管线**: section-aware relevance scoring + snowball citation expansion，每篇论文引用60-100篇
3. **真实实验执行**: 自主编码Agent执行计算生物学实验，替代合成输出
4. **八维质量评分**: 标准化质量评估，含幻觉惩罚机制

## 核心创新点

现有LLM论文生成系统存在三大缺陷：
1. 生成的声明无法确定性追溯到可验证文献
2. 实验结果常为伪造而非真实执行
3. 缺乏标准化多维质量评估框架

Prompt-to-Paper通过三重创新解决上述问题。

## 系统架构

### 1. 检索增强生成管线
- Section-aware relevance scoring
- Snowball citation expansion (滚雪球式引用扩展)
- 确定性 grounding: 每个声明都链接到可验证语料库

### 2. 自主编码Agent
- 执行真实计算生物学实验
- 替换合成输出为真实数值结果
- 无需人工干预

### 3. 八维质量评分器
评估维度：
- 原创性
- 方法严谨性
- 文献引用质量
- 结果可复现性
- 写作质量
- 幻觉检测
- 逻辑一致性
- 格式规范

### 4. 质量驱动改进循环
- Context-rich reviser
- 三种研究者行动路由
- 每10次迭代触发深度研究循环

## 实验结果

- **5个生物信息学案例**: 全部生成提交格式PDF
- **零越界引用**: 所有引用均在有效范围内
- **质量提升**: 平均+17.96分 (0-100)，最高+26.04
- **人工评审**: 平均7.0/10
- **成本**: 约$0.31/篇

## 局限性

- 仅验证于生物信息学领域
- 依赖外部API执行真实实验
- 计算成本随复杂度线性增长

## URL
- 论文: https://arxiv.org/abs/2607.05456
- PDF: https://arxiv.org/pdf/2607.05456

---
*Extracted by 油麦菜 (youmaicai) - 2026-07-08*
