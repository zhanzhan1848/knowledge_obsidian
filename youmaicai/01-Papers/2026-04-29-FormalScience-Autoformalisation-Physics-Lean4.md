# FormalScience: Scalable Human-in-the-Loop Autoformalisation of Science with Agentic Code Generation in Lean

## 元信息
| 标题 | FormalScience: Scalable Human-in-the-Loop Autoformalisation of Science with Agentic Code Generation in Lean |
|------|------|
| 作者 | Jordan Meadows, Lan Zhang, Andre Freitas |
| 链接 | [原文](https://arxiv.org/abs/2604.23002) |
| arXiv | arXiv:2604.23002 |
| 发表 | ACL 2026 / cs.AI, cs.CL |

## 核心贡献
1. **FormalScience**: 领域无关的人机协作 agentic pipeline，使单一领域专家（无需深厚形式语言经验）能以低成本产出语法正确且语义对齐的形式化证明
2. **FormalPhysics 数据集**: 200 道大学级别 LaTeX 物理问题（主要为量子力学和电磁学）及对应的 Lean4 形式化表示
3. **首个系统性语义漂移 (semantic drift) 表征**: 提出 notation collapse 和 abstraction elevation 概念
4. **完美形式有效性**: 相比现有形式数学 benchmark，FormalPhysics 达到完美形式有效性

## 核心问题
将非形式数学推理形式化为可验证代码是 LLM 的重大挑战。物理领域的额外挑战：
- Dirac 符号
- 向量微积分
- 物理特有的表示约定

## 方法架构

### FormalScience Pipeline
1. **领域专家**: 提供 LaTeX 格式的物理问题
2. **Multi-stage Agentic Approach**: 
   - Zero-shot prompting
   - Self-refinement with error feedback
   - Multi-stage agentic approach（主要方法）
3. **Lean4 验证**: 形式语言验证语法和语义正确性
4. **Human-in-the-loop**: 专家提供反馈循环

### FormalPhysics 数据集
- 200 大学物理问题（量子力学 + 电磁学）
- LaTeX → Lean4 形式化
- 难度高于现有形式数学 benchmark

## 语义漂移分析

### Notational Collapse
形式语言无法区分某些在自然语言中有区别的表示，如：
$$\bra{\psi}A\ket{\phi} \text{ vs } \bra{\psi}B\ket{\phi}$$
两种不同算符的表达式在形式化时可能 collapse 成同一表示。

### Abstraction Elevation
低层物理直觉提升到高层数学抽象时，某些物理约束信息丢失。

## 核心洞察
> 当无法实现完全语义保持时，形式语言验证的是语法正确性而非物理正确性。这是理解 autoformalization 局限性的关键。

## 实验结论
- LLM 在物理 autoformalization 上仍有明显局限
- 多阶段 agentic 方法优于 zero-shot 和简单 self-refinement
- 语义漂移是系统性问题，需要专门处理

## 相关标签
#autoformalization #Lean4 #LLM-reasoning #physics #ACL2026
