---
title: "Agentic 3D Creation via Joint Agent-Program Design"
authors: [Ruihuan Wang et al.]
date: 2026-08-18
status: 待读
tags: [几何, 3D创建, LLM, 程序化建模]
keywords: [3D creation, LLM, programmatic representation, multi-agent]
links:
  arXiv: https://arxiv.org/abs/2608.17975
  PDF: https://arxiv.org/pdf/2608.17975
  Code: https://github.com/sig-pku/aDSL
reviewDate: 2026-08-25
---

# Agentic 3D Creation via Joint Agent-Program Design

## 元信息
| 项目 | 内容 |
|------|------|
| 作者 | Ruihuan Wang et al. |
| 发表 | arXiv cs.GR, 2026-08-18 |
| 链接 | [arXiv](https://arxiv.org/abs/2608.17975) |

## 核心贡献

**aDSL (Agent-centric Domain-Specific Language)**：面向智能体的领域特定语言，弥合语义逻辑和几何约束。

**多智能体系统**：Plan-Execute-Critic 循环，训练无关（training-free）。

### 问题

现有程序化接口与 LLM 推理优势不匹配——LLM 偏好语义结构和空间关系，而非脆弱的数值选择。

### 解决方案

1. **aDSL**：强调可组合性和空间推理，通过关系运算符而非绝对坐标操作几何
2. **多智能体系统**：角色专业化（Plan-Execute-Critic 循环）

## 技术方案

### aDSL 特性

- **可组合性**：语义逻辑模块化
- **空间推理**：关系运算符操作几何
- **无需绝对坐标**：避免脆弱数值

### Plan-Execute-Critic 循环

```
Plan: 分解请求
  ↓
Execute: 合成代码
  ↓
Critic: 迭代修复错误和约束违反
  ↓
(loop)
```

## 实验结论

- 优于之前 LLM-based baselines（text-to-shape, image-to-shape）
- 保持显式结构、可编辑性和可解释性
- 支持铰接对象创建和结构化场景组合
- 提高鲁棒性、可控性和对用户意图的忠实度

## 实用性评估

- **创新性**：⭐⭐⭐⭐ LLM + 3D 程序化建模
- **实用性**：⭐⭐⭐⭐ 游戏/动画应用
- **实现难度**：中

## 应用场景

- 程序化 3D 资产生成
- LLM 驱动的 3D 创建
- 铰接对象创建
- 结构化场景组合
