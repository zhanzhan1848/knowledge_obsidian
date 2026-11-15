---
title: "Large Language Continuous Diffusion Models"
authors: ["Zhihan Yang", "Wei Guo", "Jean-Marie Lemercier", "Simon Welker", "Mohammad Mahdi Kamani", "Yonggan Fu", "Sajad Norouzi", "Julius Berner", "Tomas Geffner", "Karsten Kreis", "Yongxin Chen", "Molei Tao", "John Thickstun", "Pavlo Molchanov", "Ante Jukić", "Arash Vahdat", "Morteza Mardani"]
date: "2026-11-13"
arxiv: "2610.02665"
arxiv_url: "https://arxiv.org/abs/2610.02665"
pdf_url: "https://arxiv.org/pdf/2610.02665"
categories: ["cs.CL", "cs.AI", "cs.LG"]
tags: ["continuous-diffusion", "language-model", "few-step-distillation", "speculative-decoding", "steerability"]
venue: ""
status: "已读"
---

# Large Language Continuous Diffusion Models

## 元信息
| 项目 | 内容 |
|------|------|
| 标题 | Large Language Continuous Diffusion Models |
| 作者 | Zhihan Yang, Wei Guo, Jean-Marie Lemercier, Simon Welker, Mohammad Mahdi Kamani, Yonggan Fu, Sajad Norouzi, Julius Berner, Tomas Geffner, Karsten Kreis, Yongxin Chen, Molei Tao, John Thickstun, Pavlo Molchanov, Ante Jukić, Arash Vahdat, Morteza Mardani（NVIDIA 系） |
| 链接 | [原文](https://arxiv.org/abs/2610.02665) |
| arXiv | arXiv:2610.02665（published 2026-10-02，updated 2026-11-12） |
| 分类 | cs.CL, cs.AI, cs.LG |
| 发表 | 摘要与 comment 均未标注会议/期刊 |
| 篇幅 | 摘要未披露 |
| 代码 | 模型权重已公开：https://huggingface.co/collections/nvidia/nemotron-labs-sigma |

## 核心贡献
1. **Nemotron-Labs-Sigma**：首个大规模（**3B / 8B**）**连续扩散语言模型（continuous dLLM）**家族，基于**可操纵（steerable）、低维的 ODE/SDE latent 轨迹**。
2. **动机**：离散 dLM 虽能快速并行解码，但其**非平滑、高维空间**妨碍了对轨迹的操纵（trajectory steering），从而限制了推理能力与推理加速。
3. **训练范式**：blockwise 似然优化，同时学习一个**最优 embedding 几何（optimal embedding geometry）**；利用预训练**自回归（AR）权重 warm-start**。
4. **推理侧**：识别出 **classifier-free guidance** 与 **score temperature** 是保证高保真推理与编码质量的关键。
5. **两项离散 dLLM 独有的结构性质**：
   - **平滑轨迹在低 NFE 下优雅退化**，支持高效的少步蒸馏：distribution matching 最优，数学任务约 **8×**、编码任务约 **4×** 加速（每次前向 8 / 4 个 token），精度损失可忽略且**多样性保持**；此外在（pre-SFT）蒸馏后的 8B 模型上做**一步 speculative decoding**，相对 AR 对应模型再获约 **3.5×** 吞吐提升（在 **GB200** 上），优于 masked dLM 基线。
   - **embedding 空间操纵**控制"质量–多样性"权衡，带来强 **pass@$k$**，且随 $k$ 增大持续提升。

## 方法 / 技术细节

### 从离散到连续
离散 dLM（masked dLM）在 token 类别空间上做离散去噪，**离散、非平滑、维度高**；而连续 dLLM 在**连续的 embedding 空间**中做去噪，去噪过程被建模为 **ODE/SDE**，因而：
- 轨迹**低维**（latent trajectory），可被外部信号**操纵（steerable）**；
- 轨迹**平滑**，因此在**低 NFE（number of function evaluations）** 下退化是"优雅"的——这是少步蒸馏成立的前提。

### 训练
- **Blockwise 似然优化**：分块进行似然最大化，避免全序列训练的显存/计算瓶颈。
- **联合学习 embedding 几何**：模型在去噪 Gaussian 扰动 token embedding 的同时，**一并优化 embedding 空间的几何结构**——即 embedding 不是固定的外部编码，而是模型内可训练的表征基底。这是与"离散 dLM + 固定 tokenizer embedding"的根本差异。
- **AR warm-start**：复用预训练自回归模型权重初始化，显著降低训练成本。

### 推理
- **Classifier-free guidance (CFG)**：无条件分支引导，摘要明确指其为高保真推理与编码的**必要**条件（continuous diffusion 的 CFG 行为与图像扩散不同，需专门调参）。
- **Score temperature**：控制去噪过程中的噪声尺度，是另一个必需超参。
- 二者共同决定了 CFG / temperature 的组合对推理与代码任务的保真度。

### 蒸馏与加速
1. **少步蒸馏**：研究多种蒸馏方法，**distribution matching** 在所研究方法中最强。效果：
   - 数学任务约 **8×** 加速（每次前向 **8 tokens**）
   - 编码任务约 **4×** 加速（每次前向 **4 tokens**）
   - 精度损失可忽略（negligible accuracy loss），且**多样性保留**（preserved diversity）
2. **一步 speculative decoding**：在 **pre-SFT** 的蒸馏 8B 模型上实现单步推测解码，相对 AR 对应模型获得额外约 **3.5×** 吞吐增益（在 **GB200** 硬件上），并**超过 masked dLM 基线**。

### 质量–多样性权衡
通过 **embedding 空间操纵**（在 embedding 空间施加 steerable 信号）直接控制生成的多样性水平，从而获得强劲的 **pass@$k$**，且 $k$ 增大时性能持续提升——这是离散 dLM 难以做到的（离散空间不可微、轨迹不连续）。

## 实验结果
- **预训练后**在标准 benchmark 上超过 SOTA 离散对应方法与 AR 基线：**GSM8K、Minerva、HumanEval、MBPP**。
- **SFT 后**在困难推理任务上领先：**MATH-500、AIME**。
- **最大且一致的增益出现在编码任务**。
- 少步蒸馏：**数学 ~8×**、**编码 ~4×**，精度损失可忽略，多样性保持。
- 一步 speculative decoding（pre-SFT 蒸馏 8B）：相对 AR 约 **3.5×** 吞吐提升（GB200），优于 masked dLM 基线。
- pass@$k$ 随 $k$ 持续提升。

## 关键数字速览
| 指标 | 数值 |
|------|------|
| 模型规模 | 3B / 8B |
| 少步蒸馏加速（数学） | ~8×（8 tokens/forward） |
| 少步蒸馏加速（编码） | ~4×（4 tokens/forward） |
| 一步 speculative decoding 额外吞吐 | ~3.5×（8B pre-SFT，GB200） |
| 最优蒸馏方法 | distribution matching |
| 精度损失 | negligible |
| 预训练评测 | GSM8K, Minerva, HumanEval, MBPP |
| SFT 后评测 | MATH-500, AIME |
| 推理必需超参 | classifier-free guidance, score temperature |

## 局限性
- 摘要未给出任何 benchmark 上的**具体分数或百分比**，全部为定性表述（"outperforms"、"largest consistent gains on coding"）——这是本文摘要的显著短板。
- 蒸馏加速数字（8×/4×）是**相对 AR 基线的吞吐倍数**，但因每次前向并行输出 8 / 4 个 token，需与 masked dLM 的同等倍数做等效率对比才能判断真实优势（推测）。
- 蒸馏实验在 **pre-SFT** 模型上进行（speculative decoding 部分明确说明 pre-SFT），而 accuracy 领先的部分依赖 SFT，**两者不在同一模型状态**，结论拼接需要谨慎。
- 加速数字在 **GB200**（数据中心 Blackwell）上测得，与消费级 GPU 的实际收益差距可能很大（推测）。
- 训练需要"联合学习 embedding 几何"与 blockwise 似然优化，**总训练成本**未在摘要中披露——warm-start 降低了门槛但无法消除（推测）。
- CFG 与 score temperature 成为必需超参，意味着**推理时需要引导分支**，可能带来接近 2× 的额外计算；摘要未讨论该开销如何计入上面的加速倍数（推测）。
- 尚未与连续 diffusion 之外的第三条路线（如 flow matching 之外的 energy-based LLM）做对比（推测）。

## 与已有工作的关系 / 启示
本文是离散扩散语言模型（dLFM）路线的正面回应与推进：作者的核心论点不是"连续比离散更快"，而是"**离散性本身才是障碍**"——离散空间不可微且轨迹不连续，所以既无法 steer，也无法高效蒸馏。连续 dLLM 通过把去噪搬到低维连续 embedding 空间，一次性解锁了轨迹操纵与少步蒸馏两件事，这也解释了为什么本文能同时给出"低 NFE 优雅退化"与"pass@$k$ 随 k 提升"这两类离散方法很难同时具备的性质。NVIDIA 官方开源权重也使这条路线具备较高复现可能。

## 相关论文
- [[DRAMA]]
- [[Towards Robust Vision-Language Reasoning]]
- [[TraceKV]]
- [[Large Language Continuous Diffusion Models]]

## 我的评注
这篇的野心在于做一条**路线级**的转变，而不是又一个 SOTA +0.5% 的增量：把语言模型的生成过程从离散 token 空间搬到连续 embedding 空间，用可微性换取"steerable + distillable"这两个离散路线难以企及的性质。真正让我信服的是两个结构性质而非 benchmark 数字——低 NFE 下"优雅退化"是少步蒸馏能成立的前提，而"优雅退化"恰恰是连续轨迹平滑性的直接推论，这个论证链条是自洽的。问题是论文的写作把最能说明问题的东西全放在了定性形容词里：一个没有具体分数的摘要，反而让我怀疑 SFT 后 MATH-500/AIME 的优势是否经得起同预算比较——AR 模型同样可以在这两个集上做大规模 SFT。另一个隐性风险是 CFG 的计算代价：连续扩散的 CFG 通常需要无条件分支，若这近 2× 开销没有计入 8×/4× 的分母，那么真实净收益要打折。不过考虑到这来自 NVIDIA 且权重已开源，这个工作值得有人认真复现——尤其是"联合学习 embedding 几何"这一步，它把 tokenizer embedding 从固定表升级为可训练基底，可能是比"连续 vs 离散"更可迁移的洞见。

---
*采集时间：2026-11-13 | 油麦菜 🥬 自动精读*
