---
type: paper
created: 2026-04-27
updated: 2026-04-27
tags: [paper, implicit-surfaces, unsigned-distance, mesh-reconstruction, graphics]
status: processed
domain: geometry-processing, mesh-reconstruction
agent: shengcai
source: https://arxiv.org/abs/2604.19568
---

# Superpower Contouring of Unsigned Distance Data

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Superpower Contouring of Unsigned Distance Data |
| **作者** | Ningna Wang et al. |
| **发表** | arXiv cs.GR, 2026-04-21 |
| **链接** | [原文](https://arxiv.org/abs/2604.19568) |
| **DOI** | 10.48550/arXiv.2604.19568 |

---

## 核心贡献

> 解决从有限离散无符号距离数据重建任意曲面的问题，提出 superpower contour 概念并证明其收敛到真实曲面

1. **问题定义**：无符号距离函数允许曲面是开放的、非可定向的或非流形的，但现有方法依赖符号、精确梯度或训练数据
2. **Superpower Contour**：受 power diagram 启发，提出新理论概念，**证明在采样密度极限下收敛到真实曲面**
3. **算法**：使用 superpower contour 作为初始曲面代理，设计从任意未知几何生成多边形网格的算法

---

## 技术方案

### 背景

**有符号距离函数 (SDF)**：
- 需要曲面是封闭、可定向的
- 许多真实数据无法满足（如开放曲面、自交曲面）

**无符号距离函数 (UDF)**：
- 更灵活，允许任意曲面
- 但重建更困难

### 现有方法问题

现有从距离数据重建网格的方法依赖：
- 符号信息
- 精确梯度
- 连续距离函数
- 大规模数据相关训练

当输入是**离散+无符号**时均失效。

### 核心洞察

研究 **power diagram**（由距离样本生成），提出 **superpower contour** 新概念：
- 证明 superpower contour 在采样密度增加时收敛到真实曲面
- 作为初始曲面代理
- 基于此设计多边形网格生成算法

### 算法流程

```
1. 从无符号距离数据构建 power diagram
2. 计算 superpower contour
3. 迭代细化生成精确网格
```

---

## 实验结论

- 方法在离散无符号距离重建任务上**显著优于**其他可想到的策略
- 为这一**数学丰富的问题**的未来工作奠定了基础
- 适用于：开放曲面、非流形几何、自交曲面等难以用 SDF 表示的场景

---

## 可行性分析

| 维度 | 评估 |
|------|------|
| **创新性** | 高 — 新理论概念（superpower contour）+ 收敛性证明 |
| **实用性** | 中 — 适用于特殊曲面类型，非通用网格重建 |
| **代码可用性** | 待确认 |
| **与渲染管线关系** | 间接受益：更好的几何重建 → 更好的渲染输入 |

---

## 标签

#渲染 #几何处理 #隐式曲面 #网格重建 #2026
