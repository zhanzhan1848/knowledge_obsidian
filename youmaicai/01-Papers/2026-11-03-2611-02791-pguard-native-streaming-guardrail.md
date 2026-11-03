# PGuard: A Native, Streaming, and Plug-in Guardrail for Multimodal Large Language Models

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | PGuard: A Native, Streaming, and Plug-in Guardrail for Multimodal Large Language Models |
| 作者 | Junyu Lin, Mengjie Wu, Yonghao Dong, Yuchuan Fu, Jinfeng Li, Xiaodan Li, Xiaohan Yuan, Yicheng Liu, Yuefeng Chen, Hui Xue, Jingyi Wang, Yitong Yang, Jiyuan Fu, Qinga He |
| 链接 | [原文](https://arxiv.org/abs/2611.02791) |
| arXiv | arXiv:2611.02791 |
| 类别 | cs.CL |
| 发表时间 | 2026-11-02 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **PGuard**：**原生（native）、流式（streaming）、可插拔（plug-in）**的护栏，把安全监控从**外部服务依赖**转变为**骨干模型的内生能力**。
2. **复用骨干中间表征**：直接利用 backbone 的 intermediate representations 做 **token 级安全检测**，**不改变原有推理路径与生成行为**。
3. **动态层门控（dynamic layer gating）**：在 prefill 与自回归解码两个阶段，选择性聚合残差流（residual-stream）跨层表征以提取安全相关信号。
4. **多种表征建模架构**：轻量**无状态（stateless）变体** + 基于**多尺度因果 EMA-attention** 与 **GRU 循环模块**的序列感知（sequence-aware）变体，在精度与算力间权衡。
5. **工程适配**：考虑 LLM serving 框架（如 **SGLang**）的执行特性，优化计算与数据访问以最小化额外运行时与同步开销。
6. **部署时可控**：支持按类别配置阈值（category-specific thresholds）与处置动作（enforcement actions）。

## 问题背景
随着**流式生成（streaming generation）**成为文本与多模态 LLM 的主流服务范式，如何在整个生成过程中保证安全已成为关键挑战。现有护栏通常是**外部服务依赖**——独立的审核模型拦截输入输出，带来额外延迟、成本、部署复杂度，且在流式场景下难以做到 token 级同步检测。

## 方法
**核心思路**：不新增模型、不修改主模型参数，直接在骨干模型的内部表征上"搭"一个安全探头。

**1. 中间表征复用**
- 利用 backbone 的 **intermediate representations** 做 token 级安全检测；
- **不改变**原始推理路径（inference pathway）或生成行为；
- 好处：零额外模型、零额外 decode 开销、检测与生成同构。

**2. 动态层门控（dynamic layer gating）**

```text
for each layer l in selected set:
    h_l = residual stream representation at layer l
z = gated_aggregate(h_l)   # selectively aggregate across layers
-> safety signal used by downstream detector
```

- 选择性聚合**跨层**的残差流表征；
- 在 **prefill**（预填充）与 **autoregressive decoding**（自回归解码）两个阶段均生效（流式的关键）。

**3. 表征建模架构（精度/效率可调）**
- **轻量无状态变体**：逐 token 独立判定，开销最低、无序列依赖；
- **序列感知变体 A**：**多尺度因果 EMA-attention**（multi-scale causal EMA attention），捕捉不同时间尺度的上下文依赖；
- **序列感知变体 B**：**GRU-based 循环模块**，递推式建模序列状态。

```math
% 概念式表示（非论文原式）
h^{gate}_t = \text{Gate}(h_t, \{h_l\}_{l \in \mathcal{S}})
z_t = \text{Detector}(h^{gate}_t)  % -> safety score per token
```

**4. Serving 框架适配**
- 针对 **SGLang** 等 LLM serving 框架的执行特性（调度、批处理、KV 管理）做计算与数据访问优化；
- 目标：最小化额外运行时开销与同步开销（同步开销在流式场景尤其昂贵）。

**5. 部署期配置**
- 支持**按安全类别**设定阈值；
- 支持配置**处置动作**（如拦截/改写/放行）。

摘要未给出具体检测头结构、门控机制的实现（是否为学习得到的 gate）、各变体的精度-开销具体数值、token 级与句子级检测的评估区分方式。

## 实验结果
**1）端到端开销**

| 骨干模型 | Serving 框架 | 额外端到端开销 |
|---|---|---|
| **Qwen3.5-122B-A10B**（千亿级 MoE） | **SGLang** | **0.82% – 2.26%** |

**2）检测效果**
- 在**超过 30 个基准**上评估，覆盖：
  - 文本安全与多模态安全
  - **越狱（jailbreak）**
  - **网络与 CBRN 风险**（cyber / CBRN risks）
  - **多语言场景**
  - **真实世界流量（real-world traffic）**
- 结果：在**原生护栏（native guardrails）**中达到 **SOTA 表现**。

**3）文本查询下的具体指标**

| 配置 | 平均 F1 |
|------|---------|
| PGuard + Qwen3.5-9B，文本查询 | **0.836** |

- 接近**专用外部护栏（dedicated external guardrails）**的水平。

摘要未给出逐基准的 F1 / AUROC、未给出越狱攻击成功率下降幅度、未给出多模态（图像）部分的独立指标与 CBRN/cyber 子集分数，也未给出 stateless vs. EMA-attention vs. GRU 三变体的对比数值。

## 关键洞察
1. **护栏的最优形态是"内生"而非"外挂"**：用骨干中间表征做检测，使开销降到 0.82–2.26% 这种"几乎免费"的量级，同时完全避免外部审核服务带来的延迟与部署负担——外部护栏的经济性在流式场景基本不成立。
2. **token 级流式检测需要序列上下文，但不必重模型**：多尺度因果 EMA-attention 与 GRU 提供从"无状态"到"序列感知"的连续谱，说明可以在极小成本下按部署预算选型。
3. **不干预生成路径是"可插拔"的关键约束**：护栏若必须改生成（如重写输出）就无法保持流式低开销；PGuard 选择"旁路检测 + 部署期动作配置"，在不改模型行为的前提下实现拦截。
4. **MoE 骨干上开销更低**：122B-A10B 上仅 0.82–2.26%，说明护栏开销随骨干规模被摊薄——大模型场景几乎免费，这是小模型时代不具备的经济性。

## 局限性
- 仅在 Qwen3.5 系列（9B、122B-A10B）上验证，跨模型族（Llama、Gemma、闭源模型）的迁移性未证。
- 未说明安全检测器是否需要针对每个 backbone **重新训练**——"原生护栏"若需 per-model 训练，部署成本会显著上升（摘要未说明是否 training-free 或需少量校准数据）。
- 流式场景的核心指标是**时间点检测延迟**（在生成第 k 个 token 时能否及时拦截），摘要未给出该延迟数据，仅给整体吞吐开销。
- 摘要未报告 unsafe completion rate / 越狱成功率等"拦截后是否真拦住"的指标，仅报告 F1。
- "SOTA among native guardrails" 的比较对象范围与公平性（是否与同预算的专用护栏同等条件对比）未说明。
- CBRN / cyber 风险检测涉及高敏感类别，评估基准与指标未公开说明，存在评估局限。
- 多模态部分（图像/音视频输入）的检测机制与效果基本未展开；F1 0.836 仅针对文本查询。

## 适用场景
- 流式部署的 LLM 服务（chatbot、copilot、API 网关）中嵌入低开销安全层。
- 多模态内容平台（图像 + 文本）的内容安全审核。
- 需要按业务类别定制阈值与处置动作的合规场景（金融、医疗、政务）。
- 对延迟敏感、无法承担外部审核服务的生产环境。
- SGLang 等 serving 框架上的生产级安全加固。

## 相关工作
- [[LLM Safety]] · [[Guardrail Model]] · [[Jailbreak Defense]]
- [[Multimodal LLM]]
- [[Streaming Generation]] · [[Token-Level Detection]]
- [[Residual Stream]] · [[Intermediate Representations]]
- [[Mechanistic Interpretability]] · [[Linear Probe]]
- [[SGLang]] · [[LLM Serving]] · [[MoE]]
- [[CBRN Safety]] · [[Multilingual Safety]]

---
#LLM #Research #AI-Safety #Guardrail #Streaming #arXiv-2611
