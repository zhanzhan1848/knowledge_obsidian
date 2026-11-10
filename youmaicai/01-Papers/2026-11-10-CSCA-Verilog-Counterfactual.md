---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Verilog Generation, Hardware Verification, DPO, Credit Assignment]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.11848
arxiv: 2611.11848
---

# Causal Signal Credit Assignment for Verilog Code Generation via Counterfactual Hardware Verification

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Causal Signal Credit Assignment for Verilog Code Generation via Counterfactual Hardware Verification |
| **作者** | 未提供（详见原文） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.11848) |
| **arXiv** | arXiv:2611.11848 |
| **分类** | cs.AI, cs.SE |
| **代码** | 未提供（基于 Icarus Verilog + CodeV 派生语料） |

---

## 核心贡献

> Verilog 生成的仿真反馈只有模块级 pass/fail，浪费了部分正确模块的证据；CSCA 用「信号级连续验证 + 五种反事实干预」把偏好监督定位到单条语句，再映射为 token 权重做严格加权 DPO。

1. **信号级连续验证**：不再把整个 RTL 模块压成二元标签，而是保留每个输出信号上的连续正确性分数，让「整体错但局部对」的模块仍能提供正向监督。
2. **反事实归因**：定位输出驱动的赋值语句跨度，构造 Zero / One / Hold / Invert / Delete 五种局部干预（保持其余模块与 testbench 不变），测量信号级错误数的变化，判定该语句是否真正对观测到的输出行为负责。
3. **语句级信用 → token 权重**：将行为一致性与反事实退化组合成连续语句信用，再映射为响应 token 权重实现「严格加权 DPO」，只强化被功能验证支持的语句，不整体强化一个错误回答。
4. **SOTA 结果**：以 Qwen2.5-Coder-7B-Instruct 为骨干，在 VerilogEval 2.0 与 RTLLM v2.0 上领先所有 7B 级模型，并与远大得多的 GPT-5.4-mini 相当。

---

## 技术方案

### 核心思想
现有 Verilog 生成的偏好优化有两个缺陷：(1) 仿真只给出模块级 pass/fail，模块中部分正确的语句其证据被完全丢弃；(2) 无法判断某条源语句是否对观测到的输出行为在功能上「负责」——静态的语法共现不足以支撑因果归因。CSCA 的思路是把偏好监督从「整个候选」下沉到「单条语句」。流程：先做全参数 SFT 得到具备 Verilog 生成能力的模型；然后对每个采样候选与其参考实现，在同一 testbench 上执行，保留**逐输出信号**的连续正确性分数而非二元标签；对于驱动目标信号的语句，构造五种局部干预变体（Zero 强制为逻辑 0、One 强制为逻辑 1、Hold 改为自赋值、Invert 取反、Delete 删除赋值），重新编译每个合法变体并测量信号级错误计数的变化；把「行为一致性」与「反事实退化」组合成连续语句信用 $w_i$，再把语句跨度映射为响应 token 权重，代入加权 DPO 的对数比目标。训练时若某语句没有有效干预变体，则回退使用行为分数作为信用（仍可参与偏好优化，但被标记为「无反事实证据」）。论文还系统评估了五种干预在仿真下的可靠性（Zero/One 失败率仅 0.12/0.13 每千次，Hold 0.28，Invert 2.99，Delete 22.44，主要来自删除驱动赋值导致的编译错误；失败样本直接丢弃而非当作因果证据）。

### 关键公式
```math
\textbf{行为一致性:}\quad
r_{\mathrm{beh}}^{i}(s) = \text{信号级正确度（连续，非二元）},\qquad
R_{\mathrm{mod}}(y)=\mathbb{I}\big[e_y(s_1)=0 \wedge e_y(s_2)=0\big]

\textbf{反事实贡献:}\quad
r_{\mathrm{cf}}^{i}(a_{i,s},s)=\frac{1}{|\mathcal{Q}_{i,s}|}\sum_{q\in\mathcal{Q}_{i,s}} d_i^{(q,a_{i,s})}(s)
\quad(\text{干预后信号级错误数变化})

\textbf{语句信用:}\quad
w_i(a_{i,s},s)=\operatorname{clip}\Big(\alpha\, r_{\mathrm{beh}}^{i}(s)+(1-\alpha)\, r_{\mathrm{cf}}^{i}(a_{i,s},s),\ 0,\ 1\Big)
\quad(\text{无可用干预时 } w_i = r_{\mathrm{beh}}^{i}(s))

\textbf{候选级奖励:}\quad
R_{\mathrm{CSCA}}(y_i)=\frac{1}{|\mathcal{A}_i|}\sum_{a_{i,s}\in\mathcal{A}_i} w_i(a_{i,s},s)

\textbf{严格加权 DPO:}\quad
\Delta_\theta(x,y,\boldsymbol{\omega})=\sum_{t=1}^{|y|}\omega_t \log\frac{\pi_\theta(y_t\mid x,y_{<t})}{\pi_{\mathrm{ref}}(y_t\mid x,y_{<t})}
\quad(\omega_t=1 \text{ 退化为标准 DPO})
```

### 关键组件
- **信号级行为验证**：在同一 testbench 上并行执行候选与参考实现，保留逐信号连续正确性。
- **五类反事实干预**：Zero / One / Hold / Invert / Delete，只改目标赋值语句，其余固定。
- **干预可靠性治理**：统计各干预的仿真失败率，失败样本丢弃而非计为正/负证据。
- **语句信用加权 DPO**：把 $w_i$ 展开到 token 位置（仅被认可的语句跨度获得权重，其余为 0）。
- **消融**：分别关闭行为项与反事实项，两者单独均优于 vanilla SFT；超参含采样温度 $T$ 与行为-反事实权衡系数 $\alpha$（默认 $T=0.8$）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| VerilogEval 2.0 Code Completion Pass@1（vs Qwen2.5-Coder-7B 基座） | 相对提升 **72.5%** |
| VerilogEval 2.0 Specification-to-RTL | 相对提升 **14.6%** |
| RTLLM v2.0 | 相对提升 **3.4%** |
| 与 GPT-5.4-mini 对比 | 在报告的 Verilog 生成基准上保持相当（尽管模型规模远小） |
| 干预可靠性（失败次数 / 1000 次） | Zero 0.12、One 0.13、Hold 0.28、Invert 2.99、Delete 22.44 |
| 五类干预整体成功率 | 四类 >99.7%；最差者 Delete 仍有 97.76% |
| 骨干 | Qwen2.5-Coder-7B-Instruct（统一 SFT 初始化） |
| 评测平台 | Icarus Verilog + CodeV 派生语料；VerilogEval 2.0 / RTLLM v2.0；贪心解码 $T=0$ 与采样 $T=0.8$ |

---

## 局限性

- 需要对每个候选执行多次反事实仿真（每条驱动语句 5 个变体），训练成本高，论文只给出 RQ6 的定性成本讨论。
- Delete 类干预失败率较高（2.244%），其在信用估计中的噪声未做系统性校正。
- 信用映射到 token 权重依赖语句跨度与 token 位置的精确对齐，代码补全场景下的对齐可靠性存在边界情况。
- 基准语料为 CodeV 派生，与 VerilogEval/RTLLM 的分布可能不同，泛化性验证不足。
- 未与 RLVR 类方法（如基于可验证奖励的 RL）在相同算力预算下对比。
- 代码未开源，复现门槛较高。

---

## 建议

- **是否推荐使用**：是（对任何需要细粒度信用分配的偏好优化任务都有方法论价值）
- **适用场景**：Verilog/RTL 生成、代码生成中「部分正确」样本的利用、需要因果归因的偏好优化研究。
- **值得复现**：是（信号级验证 + 局部干预的思路可迁移到其他可执行验证的代码任务）

---

**相关论文**：[[DPO]], [[VerilogEval]], [[RTLLM]], [[Weighted-DPO]], [[GRPO]]
**主题标签**：#LLM #NLP #Verilog #Hardware-Verification #DPO
