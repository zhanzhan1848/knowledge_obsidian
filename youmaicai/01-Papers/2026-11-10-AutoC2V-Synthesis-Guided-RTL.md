---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, HLS, Verilog Generation, Reinforcement Learning, Hardware]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10824
arxiv: 2611.10824
---

# AutoC2V: Synthesis-Guided LLM Training for QoR-Optimized C++-to-Verilog Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AutoC2V: Synthesis-Guided LLM Training for QoR-Optimized C++-to-Verilog Generation |
| **作者** | 未提供（详见原文） |
| **发表** | arXiv preprint（14 页，7 图，4 表） |
| **链接** | [原文](https://arxiv.org/abs/2611.10824) |
| **arXiv** | arXiv:2611.10824 |
| **分类** | cs.AR, cs.LG |
| **代码** | 未提供 |

---

## 核心贡献

> 用真实 HLS 综合结果构造训练数据（34,078 个设计点），配合 QoR 预测奖励模型让 LLM 直接生成 QoR 优化的 Verilog RTL，在功能通过率与延迟/资源优化上全面超越商业大模型与 HLS 优化工具。

1. **综合驱动的数据构造**：从可综合 C++ 内核出发，做区域级分解、pragma 空间探索与真实综合评估，得到 34,078 个标注了延迟与 DSP/BRAM/LUT/FF 的设计样本（源自 201 个可独立综合的区域）。
2. **两阶段训练**：SFT 学会「C++ 内核 + 优化目标 → 完整 Verilog 层级」的映射；GRPO 在功能门控 + 合成感知奖励下进一步精炼生成策略。
3. **QoR 预测奖励模型（QoR RM）**：用 Dewey 长上下文嵌入表示 RTL（2048 维）+ XGBoost 回归器预测相对基线的延迟/资源变化，替代 GRPO 中昂贵的真实综合调用，提供低成本连续奖励。
4. **SOTA 结果**：Syn@1 80.5%、Func@1 66.9%，延迟/资源 QoR 优于 HLSPilot、LLM-DSE、AutoDSE 及 Claude Opus 4.8 / GPT-5.5 / Gemini 3.1 Pro / DeepSeek v4 Pro / GLM-5.2。

---

## 技术方案

### 核心思想
HLS 把 C/C++ 内核转为 RTL，但优质硬件需要大量手工 pragma 调优与反复综合。本文让 LLM **直接生成 RTL**（推理时不调用 HLS），把硬件优化知识从离线综合设计点中学到模型里。数据构造流程：先用 GPT-5.5 沿完整循环嵌套、函数边界、算法阶段把内核分解为区域级 C++，检查独立可综合性，得到 201 个可综合区域；用 libclang 抽取循环、数组、函数边界、内存访问等结构信息，构造 PIPELINE / UNROLL / ARRAY_PARTITION 三类 pragma 的候选空间；再通过「单点筛选 → 精英变异 → 交互扩展 → QoR 区间修复 → 随机探索」的**真实综合引导多样化采样**枚举 pragma 空间，每个候选编译为完整 Verilog 层级并用 Vitis HLS 综合，得到延迟与资源指标。QoR 归一化用「候选 vs 去除全部 pragma 的基线」的对数比值 $r_m=\log\frac{q_m+1}{b_m+1}$，裁剪到 $[-c,c]$ 后映射为延迟效用 $U_{\mathrm{lat}}$ 与资源效用 $U_{\mathrm{res}}$（$\kappa=2.0$，范围 $[0.01,0.99]$；资源权重 DSP 0.35 / BRAM 0.25 / LUT 0.25 / FF 0.15；延迟/资源目标权重 0.8/0.2）。训练上先 SFT 建立输出格式，再用 GRPO：每个候选先过**功能门控**（失败奖励为 0），通过者用 QoR RM 预测的 QoR 折算成目标相关奖励。

### 关键公式
```math
\textbf{QoR 归一化:}\quad
r_m = \log\frac{q_m+1}{b_m+1}, \qquad
\widetilde{r}_m = \mathrm{clip}_{[-c,c]}(r_m)

\textbf{分量效用:}\quad
U_{\mathrm{lat}} = \mathrm{clip}_{[u_{\min},u_{\max}]}\big(\sigma(-\kappa \widetilde{r}_{\mathrm{latency}})\big),\quad
U_{\mathrm{res}} = \mathrm{clip}_{[u_{\min},u_{\max}]}\big(\sigma(-\kappa \widetilde{r}_{\mathrm{res}})\big)

\textbf{目标得分:}\quad
S_{\mathrm{lat}} = 0.8\,U_{\mathrm{lat}} + 0.2\,U_{\mathrm{res}}, \qquad
S_{\mathrm{res}} = 0.8\,U_{\mathrm{res}} + 0.2\,U_{\mathrm{lat}}
\quad (\kappa=2.0,\ [u_{\min},u_{\max}]=[0.01,0.99])

\textbf{QoR RM 预测:}\quad
\widetilde{\mathbf{r}} = [\widetilde{r}_{\mathrm{latency}},\widetilde{r}_{\mathrm{DSP}},
\widetilde{r}_{\mathrm{BRAM}},\widetilde{r}_{\mathrm{LUT}},\widetilde{r}_{\mathrm{FF}}],
\qquad \text{特征} = \mathrm{Dewey}(\text{RTL}) \in \mathbb{R}^{2048}

\textbf{GRPO 奖励:}\quad
R(v) =
\begin{cases}
0, & F(x,v)=0 \ (\text{功能门控失败})\\
\widehat{S}_{\mathrm{lat}}(v), & F(x,v)=1,\ o=\mathrm{latency}\\
\widehat{S}_{\mathrm{res}}(v), & F(x,v)=1,\ o=\mathrm{resource}
\end{cases}
```

### 关键组件
- **区域级分解**：用 GPT-5.5 拆解内核为 201 个可独立综合的区域，暴露更细粒度的程序结构。
- **pragma 空间真实综合探索**：PIPELINE / UNROLL / ARRAY_PARTITION 的多策略多样化采样，产生多样 QoR 水平的设计点。
- **QoR RM**：Dewey 长上下文嵌入 + XGBoost 回归，预测 5 维相对 QoR，让 GRPO 无需每次调用真实综合。
- **功能门控奖励**：功能检查失败的候选直接给 0 奖励，保证「效率优化必须建立在功能正确之上」。
- **目标条件化提示**：latency / resource 两种提示共享同一内核，仅优化目标不同。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| HLS-Eval 留出内核 | 59 个 |
| Syn@1（综合通过率） | **80.5%**（较 SFT-only +10.2 pt） |
| Func@1（功能通过率） | **66.9%**（较 SFT-only +44.9 pt；超 Claude Opus 4.8 的 30.5% 达 36.4 pt） |
| 延迟导向得分 / 资源导向得分 | 0.7442 / 0.5973，均为对比模型最高；延迟效用 0.8355，资源效用 0.6747 |
| 对比 Claude Opus 4.8 / GPT-5.5 / Gemini 3.1 Pro | 延迟目标下 win/tie/loss = 12/1/3、10/0/2、7/1/2，平均分差 0.0526 / 0.0501 / 0.1345 |
| 对比 DeepSeek v4 Pro / GLM-5.2 | 五个共同内核全胜（平均差 0.2104）；GLM-5.2 上 6 胜 3 负（平均差 0.0908） |
| 训练数据规模 | 34,078 个设计点 / 201 个可综合区域 |
| 骨干模型 | Qwen3-Coder-30B-A3B-Instruct（LoRA，NVIDIA A800 80GB） |

---

## 局限性

- 代码未公开，数据构造流程（需大规模真实综合）复现成本极高。
- 训练集仅 201 个区域，领域覆盖有限（主要来自 HLStrans 的算子内核），向真实复杂工程内核的外推性未验证。
- QoR RM 是对真实综合的**代理**，其预测误差直接引入奖励偏差，论文未给出代理误差的系统性分析。
- 资源偏好权重（DSP 0.35 等）与目标权重（0.8/0.2）是人为设定而非普适模型，作者已声明。
- 延迟由 RTL 仿真测得、资源由 Vivado OOC 综合测得，与真实布局布线后的时序/功耗表现存在差距。

---

## 建议

- **是否推荐使用**：是（学术参考价值高，工程落地需自建数据管线）
- **适用场景**：HLS / FPGA 加速器设计自动化；研究「LLM + 代理奖励模型 + 真实硬件反馈」范式的团队。
- **值得复现**：部分（方法论值得借鉴：真实反馈驱动的数据构造 + 代理奖励降本；完整复现需 EDA 工具链与算力）

---

**相关论文**：[[AutoDSE]], [[HLSPilot]], [[LLM-DSE]], [[DeepRTL2]], [[IronMan-Pro]]
**主题标签**：#LLM #NLP #HLS #Verilog #Reinforcement-Learning
