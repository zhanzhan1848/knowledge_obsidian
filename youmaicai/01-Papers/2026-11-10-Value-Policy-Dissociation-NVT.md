---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, mechanistic-interpretability, agents, steering]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10457
arxiv: 2611.10457
---

# Represented but Not Used: Value-Policy Dissociation in LLM Agents

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Represented but Not Used: Value-Policy Dissociation in LLM Agents |
| **作者** | Yuzhang Luo, Mohamed Aghzal, Liangming Pan, Ziyu Yao（北大 / George Mason University） |
| **发表** | arXiv preprint（19 页，5 图；代码与数据将发布） |
| **链接** | [原文](https://arxiv.org/abs/2611.10457) |
| **arXiv** | arXiv:2611.10457 |
| **分类** | cs.AI |
| **代码** | 未提供（论文声明"The source code and data will be released"） |

---

## 核心贡献

> LLM 智能体内部能线性解码出候选动作的"前瞻价值"，但策略选择往往不采纳这些价值——作者称之为"价值-策略分离"（value-policy dissociation）；并提出 Natural Value Transport（NVT）作为更有效的干预方向。

1. **系统刻画"表示了却没用"**：在 Qwen2.5-7B-Instruct、Qwen2.5-32B-Instruct、GPT-OSS-20B 上跨 Grid（部分可观测导航）与 WebShop（模拟网购）两个环境，证明前瞻动作价值可从中间层隐状态线性解码，且在策略选错动作的状态上依然成立。
2. **量化不对称错配**：Grid 中"策略错而探针对"占 34.2%–58.3% 的决策状态，反向仅 0.1%–1.8%；WebShop 对应为 39.8%–43.9% vs 8.3%–12.7%。
3. **提出 NVT**：不沿探针方向 steering，而是从"价值差异 ↔ 隐状态差异"的自然对应中学习一个映射 $B_\ell$，用 value-projected 的激活变化作为 steering 向量；对比探针方向、same-norm 探针、shuffled NVT、random 四个对照。
4. **闭环"传感器+执行器"控制器**：以价值 readout 作 sensor、NVT 作 actuator，在交互中干预，显著提升任务结果（Qwen2.5-32B 在 WebShop 上奖励 0.358 → 0.452）。

---

## 技术方案

### 核心思想
以往机制可解释性工作多关注"模型内部表示了什么世界状态"，但这解释不了"为什么选了更差的动作"。本文转向 RL 中的 action value：候选动作对未来回报的评估。核心问题是两个——(Q1) 选错动作时是否连价值都没算对？(Q2) 若价值算对了，它与动作选择是什么关系、能否被利用来改进决策？做法上：在两个环境上定义可验证的价值目标（Grid 用当前部分地图上的最短路距离；WebShop 用策略条件续延价值 $Q^\pi$，由 40 次采样续延估计），在每层对隐状态拟合线性 readout；再在相同决策状态上把贪心策略选择与 readout 选择做四象限交叉分类，直接暴露"探针对、策略错"的状态。干预上，比较两类方向：沿 readout 方向 steering（Probe-calibrated）与 NVT。NVT 的动机是——既然动作价值变化天然伴随某些隐状态变化，那就直接学这个"运输"映射；训练样本是反事实构造的动作对（Grid 用同一格子 blocked vs free 的匹配观测，WebShop 用采样续延价值差的动作对），拟合带 ridge 的最小二乘 $B_\ell$，推理时把目标价值差 $\delta\boldsymbol v$ 投影成编辑向量。最后把 readout（sensor）与 NVT（actuator）组合成闭环控制器，在真实 rollout 中做价值引导 steering。

### 关键公式
```math
（1）价值目标定义：
Grid：V(s,a) = -\, d_{\mathcal{M}(s)}(s_a, g)，d 为当前部分地图上的最短路距离（受阻格与未揭示格处理不同）
WebShop：Q^\pi(s,a) = \mathbb{E}[R \mid s_t=s, a_t=a, \pi \text{ 之后}]，\ \widehat{Q}^\pi(s,a) = \frac{1}{C}\sum_{c=1}^{C} R^{(c)}(s,a),\ C=40

（2）线性 readout：
\widehat{\mathbf{V}}_\ell(s) = W_\ell h_\ell(s) + b_\ell \in \mathbb{R}^{|\mathcal{A}(s)|}
（Grid 取最终 prompt token 的激活；WebShop 取候选动作在 "Allowed click targets" 中 token span 的均值激活）

（3）NVT 拟合（ridge 加权最小二乘）：
B_\ell = \arg\min_{B} \sum_i w_i \|\Delta\boldsymbol{h}_{\ell,i} - B\,\Delta\boldsymbol{v}_i\|_2^2 + \lambda_B \|B\|_F^2
（Grid：\Delta v_i \in \mathbb{R}^4，四个动作距离差；WebShop：\Delta v_i \in \mathbb{R}，\widehat{Q}^\pi 差）

（4）推理时的 steering 编辑：
\boldsymbol{d}_\ell^{\mathrm{NVT}} = B_\ell\,\delta\boldsymbol{v}
对照：\boldsymbol{d}_\ell^{\mathrm{probe-cal}} = P_\ell \delta\boldsymbol{v}（Grid 用四输出 readout 的伪逆；WebShop 投影到 pairwise probe 方向）
norm 对照：\boldsymbol{d}_\ell^{\mathrm{probe-norm}} = \|\boldsymbol{d}_\ell^{\mathrm{NVT}}\|_2 \widetilde{\boldsymbol{u}}_\ell

（5）策略响应（steering slope）：
\text{slope} = \frac{d}{d\alpha}\Big[\log\pi_{\ell,\alpha}(a^+ \mid s) - \log\pi_{\ell,\alpha}(a^- \mid s)\Big]
```

### 关键组件
- **环境**：Grid（部分可观测、含障碍、可绕行）；WebShop（真实网页购物模拟）。
- **模型**：Qwen2.5-7B-Instruct、Qwen2.5-32B-Instruct、GPT-OSS-20B。
- **价值 readout**：逐层线性 probe；Grid 评估标准为"能否把 gold 最高价值动作排第一"，基线为 Manhattan 距离（不考虑障碍）。
- **NVT**：逐层 ridge 回归 $B_\ell$，从反事实动作对学"价值差 → 激活差"的映射。
- **对照**：Probe(same-norm)、Shuffled NVT、Random 同范数方向——用于区分"方向"与"扰动幅度"的作用。
- **WebShop 候选选择**：在至少有 2 个合法商品 ID 且模型贪心动作是合法商品点击的状态上，采 48 个样本（温度 0.7、top-p 0.9），要求 ≥8 个合法样本、至少 1 个与贪心一致、至少 1 个不同替代，保留贪心动作 + 最多 2 个最高频替代。
- **闭环控制**：readout 作 sensor（可与 NVT 位于不同层），NVT 作 actuator，在 rollout 中对动作偏好做价值引导编辑。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| Grid：策略错而探针对（Qwen2.5-7B-Instruct） | 58.3% 的决策状态 |
| Grid：策略错而探针对（GPT-OSS-20B / Qwen2.5-32B-Instruct） | 37.5% / 34.2% |
| Grid：探针错而策略对 | 仅 0.1%–1.8% |
| WebShop：策略错而探针对 | 39.8%–43.9%（三个模型） |
| WebShop：探针错而策略对 | 8.3%–12.7% |
| Grid steering：Qwen2.5-7B-Instruct 成功率 | 0.140 → 0.300，loop 85.0% → 64.0%，flip rate 24.2% |
| Grid steering：GPT-OSS-20B | 0.580 → 0.640，loop 43.0% → 38.0%，flip 16.9% |
| Grid steering：Qwen2.5-32B-Instruct | 0.590 → 0.680，loop 41.0% → 32.0%，flip 37.3% |
| WebShop steering：Qwen2.5-7B-Instruct | 奖励 0.473 → 0.501，loop 7.2% → 6.1%，flip 42.3% |
| WebShop steering：GPT-OSS-20B | 0.417 → 0.458，loop 15.5% → 14.9%，flip 16.5% |
| WebShop steering：Qwen2.5-32B-Instruct | 0.358 → 0.452，loop 2.0% → 1.8%，flip 55.1% |
| WebShop 价值 readout 成对排序准确率 | 约 80% |
| NVT vs 探针方向 | Probe(calibrated) 几乎无策略响应；NVT 在晚层呈一致的正 steering slope |
| 对照实验 | Shuffled NVT 与 Random 无法复现 NVT 的晚层规律 → 方向本身起关键作用 |
| 非法动作率（steering 前后） | Grid 7B 0.0%→0.17%，其余基本不变；WebShop 7B 0.0%→1.0%、GPT-OSS-20B 0.1%→0.4%、32B 9.7%→6.2% |
| 评测规模 | Grid n=100；WebShop n=671 / 503 / 454 |

---

## 局限性

- 只覆盖两个模型家族、三个模型、两个环境（Grid + WebShop），向其他智能体架构与决策域的泛化性未验证（作者自述首要局限）。
- 价值目标本身是任务依赖的构造：Grid 用环境导出的最短路距离，WebShop 用采样的策略条件续延价值，不是模型自身的真实价值函数。
- WebShop 的 readout 成对排序准确率仅约 80%，错误的价值估计可能抵消部分 steering 收益。
- WebShop 的 loop 降幅相对有限，说明价值引导主要改善奖励而非行为结构。
- steering 虽未持续抬高非法动作率，但部分模型上仍有轻微上升（Grid 7B 0.17%、WebShop 7B 1.0%）。
- 依赖固定的白盒激活访问（hook 隐藏状态），无法直接迁移到闭源 API 场景。

---

## 建议

- **是否推荐使用**：是（研究价值高，工程可用性待验证）
- **适用场景**：诊断 LLM 智能体"为什么明明知道更好选项却选错"；构建价值引导的 steering/控制层；为智能体加"传感器 + 执行器"式的内部信号回路；机制可解释性方向的研究生写作参考。
- **值得复现**：是（Grid 环境简单、无需重训，可快速复现 probe-vs-policy 四象限分析；NVT 的 ridge 拟合实现成本低）

---

**相关论文**：[[2026-03-12-CoT-Feature-Transformation]]
**主题标签**：#LLM #NLP #mechanistic-interpretability #agents #steering
