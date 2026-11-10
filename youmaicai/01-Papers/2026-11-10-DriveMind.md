---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, autonomous-driving, VLM, causal-analysis, shortcut-learning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2510.04532
arxiv: 2510.04532
---

# More Than Meets the Eye? Uncovering the Reasoning-Planning Disconnect in Training Vision-Language Driving Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | More Than Meets the Eye? Uncovering the Reasoning-Planning Disconnect in Training Vision-Language Driving Models |
| **作者** | Xurui Song, Shuo Huai, Jingjing Jiang, Jiayi Kong, Jun Luo |
| **发表** | NeurIPS 2026 |
| **链接** | [原文](https://arxiv.org/abs/2510.04532) |
| **arXiv** | arXiv:2510.04532 |
| **分类** | cs.AI, cs.CL, cs.RO |
| **代码** | https://github.com/SONG0257/DriveMind |

---

## 核心贡献

> 系统证伪"VLM 驾驶智能体的规划由其 CoT 推理因果驱动"这一未经检验的假设：去掉 ego/navigation 先验导致规划分数大幅下降，而去掉 CoT 只带来微小变化——推理只是训练副产物而非因果中介。

1. 构建 DriveMind：基于 nuPlan 的大规模驾驶 VQA 语料（约 50K 样本 / 61 个驾驶场景），含与专家轨迹对齐的 CoT，采用模块化信息结构，可对先验与待推理信号做干净的信息消融。
2. 通过 SFT 与 GRPO 策略对齐实验，验证推理-规划脱耦（Reasoning-Planning Decoupling Hypothesis）在 Qwen2.5-VL、LLaVA-1.6 与 Omnidrive 上普遍成立；序列级注意力分析显示规划主要关注先验 token 而非 CoT。
3. 提出免训练的 Causal Probe：通过小幅语义合理的先验扰动（横向偏移、横向方向反转）度量规划鲁棒性，用 MFD 与 RID 量化对捷径的依赖程度，为未来模型提供可插拔的因果保真度诊断标准。

---

## 技术方案

### 核心思想

VLM 驾驶智能体的范式是先产出自然语言推理再预测轨迹，规划被默认认为由推理因果驱动。但已有工作只报告轨迹质量与规则遵守，无法说明信息通路，导致强分数不能作为推理有贡献的证据；模型完全可能靠 ego 状态与历史这类虚假先验拿高分（捷径学习）。这带来安全隐忧：即使轨迹看起来安全，其安全相关逻辑也无法验证。

为做因果分析，需要一个既有真实世界真实性又有丰富语义（红绿灯状态、车道拓扑）的数据集。nuPlan 同时具备两者。DriveMind 的生成流水线分三阶段：先写解析器从 nuPlan 日志抽取结构化信息（ego 状态与历史、导航目标、拼接成三行网格的前/侧/后视图像、车道信息、红绿灯状态与停止线位置、20m 内目标的 3D 标注并由 GPT-4.1 从裁剪图补写视觉特征描述如 "a white SUV"）；再用 GPT-4.1 结合预处理视觉输入、场景结构化真值与专家未来轨迹，生成由「场景真值 + 因果分析 + 宏观决策」三部分组成的 CoT；最后构造样本并人工校验（随机抽 10% 约 5K 条由专家复核，仅 2 条即 0.04% 需重生成）。

关键设计是模块化信息结构：视觉输入、ego 状态/历史、导航信息与 CoT 被显式分离，从而可以逐项移除做受控消融。采样上采用平方根加权分层采样缓解长尾分布，目标 50,000 样本来自 61 个场景。

实验方面，论文对 Qwen2.5-VL 做 LoRA SFT，对 LLaVA-1.6 验证可推广性，并纳入使用反事实推理试图缓解先验依赖的现有 SOTA Omnidrive 做对照。此外额外采样 1,000 条 nuPlan VQA 样本做 GRPO（含位置奖励、速度奖励、格式奖励，其中格式奖励专门激励推理能力），测试"直接强化推理"能否修复脱耦。

诊断工具 Causal Probe 基于鲁棒性原则：真正由视觉场景与 CoT 驱动的规划应对小幅先验扰动保持不变；过度反应则说明依赖捷径。定量探针为横向偏移扰动（对 ego 速度施加小偏移 δ），用平均终点偏差 MFD 与相对干预度 RID 归一化；定性探针为横向方向反转（保持 ego 状态不变但反转历史轨迹的横向分量，如把左侧并线历史镜像成右侧），若规划方向随之改变而 CoT 仍论证正确转向，即暴露"说一套做一套"。

### 关键公式

```math
% 平方根加权分层采样
n_i = M\cdot\frac{\sqrt{N_i}}{\sum_{j=1}^{K}\sqrt{N_j}},\quad M=50{,}000,\ K=61

% SFT 损失（LoRA 可训练矩阵 \phi，冻结 \theta）
\mathcal{L}_{\text{SFT}}(\phi) = -\frac{1}{M}\sum_{i=1}^{M}\sum_{j=1}^{L}\log P\big(y_{i,j}\mid I_i, T_i, y_{i,<j}; \theta, \phi\big)

% GRPO 目标
\mathcal{J}_{\text{GRPO}}(\theta) = \mathbb{E}_{(I,T)\sim D_{\text{grpo}},\ \{o_i\}\sim\pi_{\theta_{\text{old}}}}
\Big[\frac{1}{G}\sum_{i=1}^{G}\big(\mathcal{A}_i\,\tilde{w}_i - \beta\,\mathbb{D}_{\text{KL}}(\pi_\theta \| \pi_{\text{ref}})\big)\Big]
% 奖励 \mathcal{A}: 位置奖励 + 速度奖励 + 格式奖励

% 序列级注意力分析：比例注意力分数
\bar{a}^{(l)}_{j\to S_t} = \frac{1}{H}\sum_{i\in S_t}\sum_{h=1}^{H} a^{(l,h)}_{j\to i}
G^{(l)}_{S_M\to S_t} = \frac{\sum_{j\in S_M}\bar{a}^{(l)}_{j\to S_t}}{\sum_{m=1}^{M_{\text{total}}}\sum_{j\in S_m}\bar{a}^{(l)}_{j\to S_t}}
% 该指标在所有源序列上求和为 1，直接量化信息依赖

% Causal Probe：横向偏移扰动下的平均终点偏差与相对干预度
\mathrm{MFD} = \frac{1}{n}\sum_{i=1}^{n}\big\|\mathbf{p}_i - \tilde{\mathbf{p}}_i\big\|_2
\mathrm{RID} = \frac{1}{n}\sum_{i=1}^{n}\frac{\big\|\mathbf{p}_i - \tilde{\mathbf{p}}_i\big\|_2}{\delta\cdot v_i\cdot T}
```

### 关键组件

- **DriveMind 数据集**：nuPlan 派生，~50K 样本 / 61 场景；模块化（视觉、ego 先验、导航、CoT 可独立移除）；GPT-4.1 生成与专家轨迹对齐的三段式 CoT。
- **信息消融设置（Table 1）**：Base、CoT、Omnidrive、Plan、Plan_NoV、CoT_NoHis、CoT_His_Ego、CoT_NoPri、Omnidrive_NoPri、CoT_L、Plan_L_NoV 等，覆盖视觉/历史/ego/先验/CoT 的各种组合。
- **GRPO 策略对齐**：额外 1,000 条 nuPlan VQA；位置奖励、速度奖励、格式奖励（含 KL 惩罚）。
- **序列级注意力分析**：按层、按头聚合注意力，计算规划段对各源序列（CoT / ego 状态 / 历史 / 视觉）的注意力占比。
- **Causal Probe（免训练）**：横向偏移扰动（定量，MFD/RID）+ 横向方向反转（定性）。
- **评测协议**：nuPlan 官方挑战测试集，14 种场景类型各随机抽 200 个场景；开环与闭环（非反应式）双重评测。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| nuPlan 开环分数 1s/2s/3s — Base（无 CoT） | 36.52 / 33.62 / 31.50 |
| nuPlan 开环分数 1s/2s/3s — CoT | 98.91 / 96.67 / 92.56 |
| nuPlan 开环分数 1s/2s/3s — Omnidrive | 98.92 / 96.85 / 92.96 |
| nuPlan 开环分数 1s/2s/3s — Plan（去 CoT） | 98.89 / 96.64 / 92.58 |
| nuPlan 开环分数 1s/2s/3s — Plan_NoV（去视觉） | 98.95 / 96.84 / 92.92 |
| nuPlan 开环分数 1s/2s/3s — CoT_NoHis（去历史） | 97.44 / 89.30 / 82.82 |
| nuPlan 开环分数 1s/2s/3s — CoT_His_Ego（去 ego 先验） | 74.51 / 61.65 / 57.70 |
| nuPlan 开环分数 1s/2s/3s — CoT_NoPri（去全部先验） | 72.40 / 58.58 / 54.56 |
| nuPlan 开环分数 1s/2s/3s — Omnidrive_NoPri | 75.91 / 61.34 / 57.32 |
| 闭环分数 1s/2s/3s — CoT | 97.46 / 96.42 / 92.38 |
| 闭环分数 1s/2s/3s — CoT_NoPri | 89.82 / 85.87 / 79.19 |
| ADE/FDE(1s) — CoT | 0.03 / 0.08 |
| ADE/FDE(1s) — CoT_NoPri | 0.73 / 1.34 |
| ADE/FDE(3s) — CoT | 0.33 / 1.02 |
| ADE/FDE(3s) — CoT_NoPri | 2.26 / 4.60 |
| 碰撞率 3s — CoT | 2.15% |
| 碰撞率 3s — CoT_NoHis | 5.09% |
| 碰撞率 3s — CoT_His_Ego | 5.27% |
| 碰撞率 3s — CoT_NoPri | 6.58% |
| 场景复杂度分布 | 33.9% hard / 39.2% general / 26.9% simple |

**核心结论**：移除 CoT（Plan）几乎不改变分数（98.89 vs 98.91），而移除先验（CoT_NoPri）带来 26.5 个百分点的开环分数崩塌（98.91 → 72.40，1s 视野），移除视觉（Plan_NoV）甚至略有提升——说明视觉与 CoT 基本未被规划利用。

---

## 局限性

- 结论主要基于 Qwen2.5-VL 主干加 LLaVA-1.6 与 Omnidrive 验证，GPT-4o 仅做零星零样本检验；更广泛架构的普适性未验证。
- GRPO 只做了 1,000 条样本、单一奖励组合的尝试，"RL 能否修复脱耦"的结论是负面的但可能受限于超参与算力。
- 注意力分析只能给出相关性证据，无法单独证明因果；因果结论主要靠消融实验支撑。
- DriveMind 的 CoT 由 GPT-4.1 依据结构化真值生成，可能带有生成器的推理风格偏好；虽然 0.04% 的人工复核返工率显示逻辑正确性高，但"对齐专家轨迹的因果逻辑"本身是人工构造的。
- 只在 nuPlan 上评测，CARLA 系的 sim-to-real 问题未涉及，但也意味着未在仿真域交叉验证。
- Causal Probe 的横向偏移/反转扰动只覆盖先验的一类失效模式，可能遗漏其他捷径（如特定路口记忆）。

---

## 建议

- **是否推荐使用**：是
- **适用场景**：VLM 端到端驾驶智能体的可解释性评测与因果保真度审计；设计防止捷径学习的数据与训练方案；作为其他"先推理后行动"类模型的诊断方法参考。
- **值得复现**：是（DriveMind 的模块化信息结构 + Causal Probe 是可复用的通用诊断框架）

---

**相关论文**：[[Omnidrive]]、[[DriveLM]]、[[DriveCoT]]、[[nuPlan]]、[[DriveVLM]]
**主题标签**：#LLM #NLP #Autonomous-Driving #VLM #Causal-Analysis #Shortcut-Learning
