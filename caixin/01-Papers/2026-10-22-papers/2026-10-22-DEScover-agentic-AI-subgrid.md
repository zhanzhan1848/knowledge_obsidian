---
type: paper
arxiv_id: 2610.29850
title: "Automated Discovery of Physically Interpretable Subgrid Length Scales for Detached Eddy Simulation via Agentic AI"
date: 2026-10-21
cats: [physics.flu-dyn]
tags: [DES, turbulence-modeling, LLM-agent, automated-discovery, subgrid-scale]
agent: caixin
status: processed
---

# DEScover: 用 Agentic AI 自动发现 DES 亚格子尺度

- **arXiv**: [2610.29850](https://arxiv.org/abs/2610.29850) (v1, 2026-10-21 15:09 UTC)
- **作者**: Jiawei Chen, Xiang I. A. Yang, Ping He
- **链接**: https://arxiv.org/abs/2610.29850

## 动机

传统湍流模型开发严重依赖专家知识、耗时。

## 框架：DEScover

用户**只提供一个建模想法**：长度尺度取"垂直于局部涡轴方向的网格宽度"。

随后 4 个 LLM agent 协同：**提出 → 评审 → 实现 → 评估**候选公式，并自动生成 CFD 仿真脚本。

- **Discovery Agent**：从多种涡识别方法（vortex identification criteria）推断涡轴

## 算例与结果

4 个算例：平板、后向台阶、自由剪切层、结冰翼型。

- 所有算例中，最优候选**一致优于**基于最大网格尺寸的标准长度尺度
- 精度与专家设计的**剪切层自适应**长度尺度相当或略优
- 单次 agentic discovery 运行约 **25 分钟**（不含 CFD 仿真本身）

## 🥢 流体力学视角评述

- DES 的核心争议一直是亚格子长度尺度 $\ell$ 的选取（Shinhyeob/Sharma 的 $C_{\mathrm{DES}}\Delta$ vs 自适应混合模型）。本文让 LLM 在**专家给定的物理骨架**（涡轴法向网格宽度）内做搜索，思路比"让 LLM 自由发明模型"稳健得多——这是可复用的方法论范式。
- ⚠️ 关键风险：**LLM agent 评估可能用与最终评估不同的判据优化**（"reward hacking"）。若 agent 自行跑 CFD 并挑选最优，则同一批算例既是训练集又是测试集，泛化性存疑。需关注是否留有 hold-out。
- 涡轴识别方法（CVC / λ-λ2 / Q）在剪切层中的表现差异会影响 $\ell$，Discovery Agent 处理多种方法的策略值得细读。
- 工程价值：25 分钟/候选 vs 传统人工迭代，**降阶诊断工具化**的潜力很大。

## 关联

- [[2026-10-22-neural-operator-anisotropic-Boussinesq]]
- [[turbulence-modeling]] [[DES-LES-hybrid]]
