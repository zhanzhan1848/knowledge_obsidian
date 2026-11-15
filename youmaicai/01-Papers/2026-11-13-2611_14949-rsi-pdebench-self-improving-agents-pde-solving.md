---
title: "RSI-PDEbench: A Benchmark for Self-Improving Agents in PDE Solving"
authors: ["Binghang Lu", "Lang Cao", "Changhong Mou", "Yige Sun", "Cindy Xiangrui Kong", "Zheyuan Deng", "Tian Yuan", "Bing Hu", "Runyu Zhang", "Na Lu", "Guang Lin"]
date: "2026-11-13"
arxiv: "2611.14949"
arxiv_url: "https://arxiv.org/abs/2611.14949"
pdf_url: "https://arxiv.org/pdf/2611.14949"
categories: ["cs.AI"]
tags: ["self-improving-agents", "pde", "scientific-computing", "benchmark", "recursive-self-improvement"]
venue: ""
status: "已读"
---

# RSI-PDEbench: A Benchmark for Self-Improving Agents in PDE Solving

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | RSI-PDEbench: A Benchmark for Self-Improving Agents in PDE Solving |
| 作者 | Binghang Lu, Lang Cao, Changhong Mou, Yige Sun, Cindy Xiangrui Kong, Zheyuan Deng, Tian Yuan, Bing Hu, Runyu Zhang, Na Lu, Guang Lin |
| 链接 | [原文](https://arxiv.org/abs/2611.14949) |
| arXiv | arXiv:2611.14949 |
| 分类 | cs.AI |
| 发表 | 未标注会议（comment 字段为空） |
| 篇幅 | 未标注（comment 字段为空） |
| 代码 | 未提及（摘要以 `\bench{}` 渲染占位，未给出链接） |

## 核心贡献
1. **提出 RSI-PDEbench**：面向 **PDE 求解**的自改进 agent 基准，含 **1,001 个 case**，覆盖 **42 个方程模板（equation templates）**，**既有经典 PDE 也有分数阶 PDE（fractional PDEs）**。
2. **设计三种评测设定**，分别考察精度、鲁棒性与分布外泛化：**Full**（无噪）、**Noisy**（高斯噪声）、**Hard-OOD**（未见模板 + 系数分布偏移）。
3. **提出 RSI-PDE**：一个**递归自改进（recursively self-improving）agent harness**，其核心机制包括：
   - 按 **residual loss** 筛选候选方程（shortlist）；
   - 用**相对 $L^2$ 反馈**同时精修**系数**与**数值求解器配置**；
   - 对 **policy 与 memory 的更新施加 validation gate**（验证门控）。
4. **首次在"经验证的自递归改进"框架下**对四个前沿模型、三个设定给出系统性对比，并同时报告**效果**与**模型调用成本**。

## 方法 / 技术细节
### 任务定义
从**采样得到的解数据（sampled solution data）**出发，识别并求解 PDE。这条工作流包含三类专家环节：
1. **方程发现（equation discovery）**；
2. **系数估计（coefficient estimation）**；
3. **数值求解器配置（numerical solver configuration）**。

作者的问题是：**LLM agent 能否自动化这一整条工作流，且既准确又高效？**

### 三种评测设定
| 设定 | 考察 |
|------|------|
| Full | 在无噪声解数据上的性能（精度上限） |
| Noisy | 对高斯噪声的鲁棒性，噪声 RMS = 干净信号 RMS 的 **50%** |
| Hard-OOD | 对**未见方程模板**与**偏移系数区间**的挑战性 OOD 泛化 |

### RSI-PDE harness 的三个机制
1. **Residual-loss shortlisting**：计算候选方程的残差损失，用作筛选信号（把候选空间从"全部模板"缩到 top-k），避免暴力枚举。
2. **Relative $L^2$ feedback**：以相对 $L^2$ 误差作为反馈信号，同时驱动**系数精修**与**数值求解器配置调整**——注意这意味着 agent 不只选方程，还要调求解器。
3. **Validation gate**：**对 policy 与 memory 的更新做验证门控**——只有通过验证的更新才被写入，从而实现"递归"自改进而不被错误经验污染。

### 对比基线
- **single-run baselines**（单次运行基线）；
- **native agent harnesses**：**Claude Code** 或 **Codex**；
- 跨 **4 个前沿模型**、**3 个设定**评测，共 **12 个 model–setting pairs**。

## 实验结果
- **相对 single-run baselines**：RSI-PDE 在三个设定上、跨 4 个模型平均的 **pass rate 相对提升 106.5%–181.9%**。
- **相对 native harnesses（Claude Code / Codex）**：pass rate 相对提升 **3.0%–19.6%**。
- **成本**：在全部 **12 个 model–setting pairs** 上，总记录模型调用数**减少 46.9%**。
- 结论：**经验证的递归自改进（validated recursive self-improvement）有潜力推进科学计算**。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 基准 case 数 | 1,001 |
| 方程模板数 | 42（含经典 PDE 与分数阶 PDE） |
| 评测设定 | 3（Full / Noisy / Hard-OOD） |
| Noisy 设定噪声强度 | RMS = 干净信号 RMS 的 50% |
| 评测模型数 | 4 个前沿模型 |
| model–setting pairs | 12 |
| vs single-run baselines（pass rate 相对提升） | +106.5% ~ +181.9% |
| vs native harnesses（pass rate 相对提升） | +3.0% ~ +19.6% |
| 模型调用数减少 | 46.9% |

## 局限性
- 摘要未披露：pass rate 的**绝对数值**、4 个模型的具体名称、Residual-loss shortlisting 的候选数 k、validation gate 的具体验证判据。
- **pass rate 的相对提升（106.5%–181.9%）在低基线上会被放大**，绝对意义需看原始分数（摘要未给）（推测）。
- 与 native harness 的差距仅 **3.0%–19.6%**，说明**增益的大部分来自"有验证门控的递归循环"这一工程结构，而非模型本身**，这既是优点（说明 harness 设计可迁移）也是限制（说明模型能力差异被掩盖）（推测）。
- Hard-OOD 需要"未见模板"，但基准只有 42 个模板，OOD 的多样性相对有限（推测）。
- 摘要中 `\bench{}` 为渲染占位，**基准与代码的公开发布地址未明确给出**，可复现性存疑。

## 与已有工作的关系 / 启示
这是把当下热议的 **recursive self-improvement（递归自我改进）** 落到一个**有客观 ground truth 的科学计算任务**上的尝试。相比在开放环境中做自我改进（难以验证），PDE 求解提供了一个天然的验证器（残差、$L^2$ 误差），这使得"validation gate"这类机制得以真正落地。它与 AI for Science 中"LLM 驱动的符号回归/方程发现"文献（如 PDE discovery 系列工作）直接衔接，但把**数值求解器配置**也纳入了 agent 的决策空间。

## 相关论文
- [[daVinci-Prover: Agent-Native Mid-Training for Formal Theorem Proving]]
- [[Turning Multi-Agent Communication into Token-Level Credit with On Policy Self Distillation]]
- [[ToolTurns: Benchmarking LLM Agents in Multi-Turn Dialogue]]

## 我的评注
这篇论文的框架设计得很漂亮：把"递归自改进"放到 **PDE 求解**这个有客观评判标准的领域，而不是让 agent 在模糊指标上自我迭代——residual loss 和相对 $L^2$ 天然就是 verifier，这解决了 self-improvement 领域最大的方法论难题（你拿什么验证你的自我改进是改进？）。**validation gate 同时管住 policy 与 memory 的更新**这一点尤其关键：很多自改进循环之所以陷入退化，正是因为一次错误的经验被写进记忆后不断自我强化。

但我要对 106.5%–181.9% 这个数字保持清醒：这是**相对提升**，在 pass rate 极低的基线上翻倍并不难，而且摘要没给绝对分数。与 native harness（Claude Code / Codex）只有 3.0%–19.6% 的差距，则说明**真正起作用的是 harness 结构而非模型**——好消息是这个结构（验证门控 + 残差筛选 + $L^2$ 反馈）可以套到任何有验证器的科学任务上；坏消息是我们其实还没证明"递归"本身有超出"精心设计的一次性流程"的额外价值，因为递归的部分被验证门控严格限制，很可能大部分时候只触发一次。

真正值得期待的其实是 **46.9% 的调用数下降**——在 agent 科学计算里，"更准且更省"同时成立是很少见的组合。如果 absolute pass rate 能站上一个体面的水平（比如 >50%），这个工作会是 self-improving agent 方向的一个标杆。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
