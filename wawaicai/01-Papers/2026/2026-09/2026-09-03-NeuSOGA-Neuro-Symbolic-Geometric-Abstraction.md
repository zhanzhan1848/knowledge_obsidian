---
tags: [神经符号AI, 几何抽象, 点云, 符号表示]
date: 2026-09-03
category: cs.GR/cs.AI
source: arXiv
---

# NeuSOGA: Neuro-Symbolic Geometric Abstraction

## 核心方法

**NeuSOGA** (Neuro-Symbolic Geometric Abstraction) 将观测逐步转换为拓扑抽象、几何抽象，最终到符号数学表示。

**架构四步骤：**
1. **拓扑引导结构发现**：使用欧几里得距离变换
2. **基础模型感知**：Segment Anything 模型
3. **自适应多尺度几何抽象**
4. **符号合成**：隐式面积样条 (Implicit Area Splines)

**输出表示：**
- 解析隐式模型
- 支持任意阶光滑性
- 可加性组合
- 闭式求值

**特点：**
- 可解释、可编辑、数学显式
- 不同于神经隐编码，生成的表示保持可解释性

**实验数据集：**
- ModelNet40 点云
- 任意视角投影
- 分割的光学观测

## 算法复杂度

- 拓扑发现：O(n) 距离变换
- 符号合成：依赖于符号回归复杂度

## 实现难度

- **算法复杂度**：高 (神经符号系统)
- **数值稳定性**：分段处理 + 符号回归
- **依赖项**：SAM, 符号回归库

## 推荐结论

⚠️ 谨慎评估 - 创新性强但实现复杂

## 开源参考

- Code: https://github.com/QL-UoHull/NeuSOGA
- 相关库：符号回归 (Eureka 等)

## 相关笔记

[[几何-符号表示]] [[点云-抽象]] [[神经符号AI]]
