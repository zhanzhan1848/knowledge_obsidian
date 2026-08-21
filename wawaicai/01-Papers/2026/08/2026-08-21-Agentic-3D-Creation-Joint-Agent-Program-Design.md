---
title: "Agentic 3D Creation via Joint Agent-Program Design"
authors: [Ruihuan Wang et al.]
date: 2026-08-18
tags: [几何, 程序化建模, 多智能体, aDSL]
arxiv: "2608.17975"
doi: "10.48550/arXiv.2608.17975"
subjects: [cs.GR, cs.CV]
---

# Agentic 3D Creation via Joint Agent-Program Design

## 核心方法

提出**面向智能体的领域特定语言 (aDSL)** 和**角色专业化多智能体系统**，用于程序化 3D 内容创建。

### 核心问题
依赖大语言模型（LLM）创作 3D 程序的智能体工作流仍然脆弱，无法将高级意图转化为一致的底层几何。

### 关键洞察
现有程序化接口与 LLM 的推理优势不匹配——LLM 偏好语义结构和空间关系，而非脆弱的数值选择。

### 核心技术

1. **aDSL 设计原则**
   - 桥接语义逻辑与几何约束
   - 强调**可组合性**和**空间推理**
   - 通过关系操作符而非绝对坐标操纵几何

2. **多智能体系统**
   - Plan-Execute-Critic 循环
   - 分解请求、合成代码、迭代修复错误和约束违规
   - 使用执行反馈

3. **关键应用**
   - 铰接物体创建
   - 结构化场景组合

### 开源代码
- https://github.com/sig-pku/aDSL

## 相关技术
- Programmatic 3D Modeling
- Multi-Agent System
- Domain-Specific Language
- LLM-based 3D Generation

## 可行性评估

**推荐度：⚠️ 谨慎评估**

- 程序化建模方法，专注于 LLM 集成
- 几何处理部分是传统方法
- aDSL 的几何操作接口设计有参考价值

## 会议信息
arXiv Submission, 2026-08-18
