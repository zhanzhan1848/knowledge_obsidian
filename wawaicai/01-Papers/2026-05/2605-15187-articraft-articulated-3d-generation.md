---
title: "Articraft: An Agentic System for Scalable Articulated 3D Asset Generation"
authors: ["Shangzhe Wu et al."]
date: 2026-05-14
venue: "arXiv"
tags: [几何, 关节3D资产生成, LLM, 程序化建模]
paper_url: "https://arxiv.org/abs/2605.15187"
project: "https://articraft3d.github.io/"
---

## 核心方法

提出 **Articraft** 系统，利用 LLM 自动生成可关节化的 3D 资产。

### 核心思想
将关节化 3D 资产生成问题**简化为程序编写问题**

### 系统组成
1. **领域特定 SDK**: 定义零件、组合几何、指定关节、编写测试
2. **Agentic Harness**: 
   - 暴露受限工作空间和接口
   - 验证生成资产
   - 返回结构化反馈
3. **LLM**: 根据反馈迭代改进

### 产出
- **Articraft-10K**: 10K+ 关节化资产，覆盖 245 个类别
- 用于机器人仿真、虚拟现实等下游应用

---

## 算法复杂度
- 时间复杂度：LLM 推理主导
- 空间复杂度：待评估

---

## 开源实现
- 暂无开源代码（项目页面: articraft3d.github.io）

---

## 相关笔记
[[Articulated 3D Assets]]
[[LLM-based 3D Generation]]
[[Procedural Modeling]]

---

## 可行性分析

**推荐度**: ⭐⭐⭐⭐ (4/5)

### 优势
- 创新性强：首次使用 LLM 程序化生成关节资产
- 可扩展：Articraft-10K 数据集
- 应用广泛：机器人仿真、VR

### 挑战
- 依赖 LLM 能力
- 生成质量和一致性需进一步验证
- 关节定义可能需要领域专业知识

### 适用场景
- 机器人学仿真
- 游戏和虚拟现实资产批量生成
- 自动化 3D 内容创作