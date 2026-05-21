---
title: "Conformal Geometric Algebra as a Symbolic Interface for LLM-Driven 3D Scene Editing"
citation: "arXiv:2605.16308"
date: 2026-05-15
tags: [共形几何代数, LLM, 3D编辑, 符号接口, 自然语言]
---

# CGA 作为 LLM 驱动的 3D 场景编辑符号接口

## 研究问题

**什么符号格式应该让 LLM 发出用于从自然语言进行可靠的 3D 场景编辑？代数结构是否除了紧凑语法还提供帮助？**

## 方法对比

评估**共形几何代数 (CGA)** 作为紧凑符号接口，对比：
- 冗余 Euclidean 4×4 矩阵基线
- 非 CGA 紧凑 SE3 控制

在自然语言 3D 编辑流水线中进行受控提示和确定性几何执行的评估。

## 主要结果：组合保真度

**顺序指令链**的压力测试 (20 模板，6 次试验，n=120 输出每方法)：
- Simple CGA 和 Compact SE3 均达到 100% 解析有效性
- Simple CGA 更可靠地保持精确有序操作链（97.5% vs 90.0%，p=0.016）
- Simple CGA 的完成 token 成本更低（112.6 vs 133.6 tokens）

## 确认结果：硬语义套件

(n=100 每方法)：紧凑表示（Simple CGA 45.0%, Compact SE3 42.0%, Shenlong 44.0%）均超过 Euclidean 4×4 基线 (24.0%)。

## 结论

- 紧凑符号接口驱动可靠性和成本收益
- CGA motor 组合在有序指令链上提供额外优势
- 解析有效性与几何正确性分离揭示了仅语法指标不可见的显著优化空间

## 标签

#共形几何代数 #LLM #3D编辑 #符号接口 #自然语言界面