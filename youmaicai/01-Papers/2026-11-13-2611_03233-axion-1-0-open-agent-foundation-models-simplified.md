---
title: "Axion 1.0: Open Agent Foundation Models, Simplified"
authors: ["Yuqi Jia", "Yunjie Tian", "Jiayu Zheng", "Yijun Liang", "Jingchen Sun", "Mengyu Zhao", "Di Fu"]
date: "2026-11-13"
arxiv: "2611.03233"
arxiv_url: "https://arxiv.org/abs/2611.03233"
pdf_url: "https://arxiv.org/pdf/2611.03233"
categories: ["cs.AI"]
tags: ["agentic-ai", "open-source", "supervised-fine-tuning", "reinforcement-learning", "tool-use", "reproducibility"]
venue: ""
status: "已读"
---

# Axion 1.0: Open Agent Foundation Models, Simplified

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Axion 1.0: Open Agent Foundation Models, Simplified |
| 作者 | Yuqi Jia, Yunjie Tian, Jiayu Zheng, Yijun Liang, Jingchen Sun, Mengyu Zhao, Di Fu |
| 链接 | [原文](https://arxiv.org/abs/2611.03233) |
| arXiv | arXiv:2611.03233 |
| 分类 | cs.AI |
| 发表 | 预印本（comment 为空，无会议信息） |
| 篇幅 | 摘要未标注 |
| 代码 | 摘要声明发布完整配方：数据构建、生成、过滤、验证、prompts 与训练代码 |

## 核心贡献
1. **发布 Axion 1.0**：一个 fully open 的 agent foundation model，强调**训练配方异常简洁**。
2. **仅三阶段训练**：两次轻量 SFT + 一次强化学习；**明确不使用** dedicated mid-training、**DPO**（直接偏好优化）与 **OPD**（on-policy distillation）——即在"agent 训练标配三件套"之外另起炉灶。
3. **第一阶段 SFT：自包含推理能力**，采用 **model-aware data construction**——依据**底座模型自身成功的解题策略**合成困难问题，并对这些难题做**对抗性增强**（adversarial strengthening）。
4. **第二阶段 SFT：工具依赖推理**，构建一条**可扩展 pipeline**，从**真实世界数据源**与**确定性计算**中构造多样且**自动可验证**的任务。
5. **第三阶段：强化学习**，进一步强化**长程推理**与**对外部工具和环境的交互**。
6. **超出于权重的开放**：完整开源数据构建 / 生成 / 过滤 / 验证流程、prompts 与训练代码，使整个开发过程**可复现、可扩展**。

## 方法 / 技术细节

### 三阶段配方
$$
\text{Base Model} \xrightarrow{\text{SFT-1: self-contained reasoning}} \xrightarrow{\text{SFT-2: tool-dependent reasoning}} \xrightarrow{\text{RL: long-horizon + environment interaction}} \text{Axion 1.0}
$$

### 阶段一：Model-Aware Data Construction
核心机制是以**底座模型自身**为参照物生成训练信号：
1. 先找出底座模型**已能成功求解**的问题类型/策略；
2. 基于这些成功策略**合成更困难的问题**（而非凭空出题）；
3. 对合成问题做**对抗性强化**（adversarial strengthening），例如改写条件、隐藏提示、增加干扰项等。

这与"用更强模型蒸馏生成难题"（如 on-policy distillation 的动机）思路相近，但**不需要一个更强教师模型**——教师信号来自底座自身成功轨迹，因此不依赖 OPD，也不需要 dedicated mid-training。

### 阶段二：可扩展的任务构造 pipeline
- 数据来源：**真实世界数据源**（real-world data sources）+ **确定性计算**（deterministic computation）；
- 任务性质：**多样**（diverse）+ **自动可验证**（automatically verifiable）——例如以可由代码/规则判定的结果作为 ground truth，无需人工标注。

### 阶段三：强化学习
目标为**长程推理（long-horizon reasoning）**与**工具/环境交互**能力的进一步强化。

### 明确的"反默认"设计
| 常见做法 | Axion 1.0 |
|----------|------------|
| dedicated mid-training | **不用** |
| DPO | **不用** |
| on-policy distillation (OPD) | **不用** |

## 实验结果
- 在**广泛的 agentic benchmark suite** 上取得**强劲表现**；
- 在**若干** benchmark 上与**领先商业模型**具备**竞争力**（competitive with leading commercial models on several of them）；
- **具体 benchmark 名称、分数、模型参数规模、base model**：摘要**未披露**。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 训练阶段数 | 3（两段轻量 SFT + 一次 RL） |
| 使用的技术 | SFT ×2, RLVR/RL, model-aware data construction, 自动验证任务构造 |
| 明确弃用的技术 | dedicated mid-training, DPO, OPD |
| 具体评测分数 | 摘要未披露 |
| 模型规模 | 摘要未披露 |
| 开源范围 | 数据构建/生成/过滤/验证流程 + prompts + 训练代码 + 权重 |

## 局限性
- 摘要**未显式声明**局限性。可推断（推测）：
  - **关键数字全缺**：未披露 base model、参数规模、具体 benchmark 与分数，"competitive with leading commercial models"缺乏可核验的量化支撑；
  - **"in several of them"的限定**暗示并非全面持平，实际差距可能显著（推测）；
  - **去掉 DPO 与 OPD 的代价**：偏好信号仅来自 RL 与 SFT，模型在风格/安全性/拒答对齐上的表现可能弱于常规 SFT+DPO 组合（推测）；
  - **model-aware data construction 的天花板**：由底座自身成功策略反推难题，对底座能力之外的领域（如真正需要外部知识的新学科）覆盖有限（推测）；
  - **第一阶段"自包含推理"与第二阶段"工具依赖推理"的显式分离**，可能存在阶段间能力干扰与分布漂移（推测）；
  - **自动可验证任务的选择偏置**：倾向可程序化判定的任务，对开放式、多解、需要人类判断的 agent 任务覆盖弱（推测）。

## 与已有工作的关系 / 启示
本文是当前 agent 训练范式的一次"减法"尝试，与 SkyRL / verl / OpenRLHF 类 RL-for-agents 路线、Qwen / DeepSeek 系列的 mid-training + SFT + RL 配方、以及各类 DPO/OPD 偏好优化工作形成鲜明对照。对研究者的启示是：**agent 能力的主要瓶颈可能在数据构造方式而非训练算法**——如果任务可自动验证且模型自身的成功轨迹足够丰富，两段 SFT + 一次 RL 可能就够了。

## 相关论文
- [[Agent Foundation Model 与工具使用训练]]
- [[强化学习与大模型后训练 (RLVR)]]
- [[直接偏好优化 (DPO)]]
- [[On-Policy Distillation]]
- [[合成数据构造与自动验证任务]]
- [[可验证奖励与可扩展任务环境]]

## 我的评注
这篇论文的立意是"少即是多"的路线宣言——当整个 agent 训练圈都在堆 mid-training、堆偏好优化阶段、堆蒸馏信号时，作者用**三阶段**（两段 SFT + 一次 RL）声称做到了同等竞争力，并明确列出三个**不用**的组件。这种"减法论文"在当下很有价值，因为它提供了必要的对照：此前所有结果都混杂着多阶段配方，很难归因到底是哪一环在起作用。
最值得琢磨的技术点是第一阶段的 **model-aware data construction**：不是用更强教师出题，而是**用底座模型自己的成功轨迹反推更难的题**再对抗性增强。这本质上是在底座能力边界内做"可控的自举"，绕开了蒸馏所需的更大教师模型——如果真的成立，这会是一条更便宜的开源 agent 复现路径，比拼教师模型性价比高得多。第二阶段用"真实数据源 + 确定性计算"构造可自动验证任务，则是另一条被低估的实用主义路线。
但必须指出摘要层面的严重短板：**没有一个具体数字**——没有模型规模、没有 base model、没有 benchmark 名称和分数，"competitive with leading commercial models on several of them" 属于无法核验的模糊表述，而这恰好是"减法配方"最需要证据的地方。实践建议：把这篇当作**方法假设**而非结论，先按其思路复现一个最小版本（SFT 自包含推理 → SFT 工具任务 → RL）验证收益归因，再决定是否要引入被它省略的 DPO/OPD。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
