---
title: "Agentic 3D Creation via Joint Agent-Program Design"
authors: Ruihuan Wang et al.
date: 2026-08-18
tags: [几何, 程序化建模, DSL, 几何约束, 3D程序生成]
categories: [Programmatic Modeling, DSL, Agentic 3D Creation]
arxiv: "2608.17975"
conference: arXiv cs.GR
---

# Agentic 3D Creation via Joint Agent-Program Design

## 核心方法

共同设计**面向Agent的领域特定语言（aDSL）** 和**角色专业化多Agent系统**，弥合程序化接口与LLM推理能力之间的差距。

### 问题背景

- 程序化表示提供细粒度编辑、可解释性、结构控制
- 现有Agent工作流依赖LLM生成3D程序，脆弱
- 根本原因：程序接口与LLM推理强项不匹配

### 解决方案

**aDSL设计原则：**
- 组合性（Composability）：语义逻辑 + 几何约束
- 空间推理：关系操作符而非脆弱的绝对坐标
- Agent通过关系操作符操作几何

**多Agent系统：Plan-Execute-Critic 循环**
1. Plan：分解请求
2. Execute：合成代码
3. Critic：迭代修复错误和约束违反

## 应用场景

- Text-to-Shape
- Image-to-Shape  
- 关节物体创建（articulated object creation）
- 结构化场景组合（structured scene composition）

## 关键创新

- **aDSL**：首个为LLM Agent设计的3D编程DSL
- **Joint Design**：语言+系统协同设计
- **无需训练**：纯规则驱动

## 项目链接

- GitHub: https://github.com/sig-pku/aDSL

## 相关技术

- Domain-Specific Language (DSL)
- Programmatic 3D Modeling
- Multi-Agent System
- LLM-based Code Generation
- Spatial Reasoning
- Relational Operators

## 关联笔记

[[程序化建模]]
[[DSL设计]]
[[3D生成]]
[[几何约束求解]]
