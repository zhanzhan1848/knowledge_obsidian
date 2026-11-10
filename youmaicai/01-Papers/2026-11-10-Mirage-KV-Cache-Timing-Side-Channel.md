---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, security, side-channel, kv-cache, serving]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10756
arxiv: 2611.10756
---

# Mirage: Provable Defense Against LLM KV Cache Timing Side Channels with Topology-Aware Isolation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Mirage: Provable Defense Against LLM KV Cache Timing Side Channels with Topology-Aware Isolation |
| **作者** | arXiv preprint（未在摘要页列出完整作者列表） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.10756) |
| **arXiv** | arXiv:2611.10756 |
| **分类** | cs.CR, cs.AI |
| **代码** | 未提供（实现于 SGLang 之上的即插即用模块） |

---

## 核心贡献

> 提出 Mirage：用"隐私里程表（Privacy Odometer）"计量前缀扇出的拓扑新颖度来识别探测攻击，一旦超阈值就在网关层做整条流的时间平移，在保住跨租户 KV cache 复用收益的前提下把时序侧信道压到接近随机猜测水平。

1. **拓扑感知检测替代内容分类**：核心洞察是——攻击者要恢复高熵私有前缀，每次探测最多泄露几比特，必须在同一前缀下开出大量候选分支，形成"单点高扇出"的独特拓扑模式。Mirage 证明了这个扇出量的 Fano 式下界，并把它变成控制面预算。
2. **Privacy Odometer**：持续追踪前缀扇出扩展的拓扑新颖度，区分激进探测与良性流量；前缀超出安全阈值即进入 emission lockdown。
3. **两阶段锁定策略 + 动态估计器**：锁定后从校准过的 cache-miss 分布采样目标延迟，计算真实到达时间与目标发出时间的常量偏移，并对**整条 token 流**（而非仅首 token）施加同一偏移——避免缓冲 token 突发释放造成的信息泄漏。
4. **可证明的时序均衡界**：用 equalization gap `δ_eq` 界定攻击者的残余优势，并设计动态尾分位数截断（tail-quantile clamp）；在 500 样本公共语料 × 3 个模型上把三种时序攻击的成功率压到随机猜测下限，同时显著低于隔离类防御的 TTFT。

---

## 技术方案

### 核心思想

多租户 LLM 服务为提升吞吐普遍启用跨请求前缀缓存（vLLM 的 block hash、SGLang 的 Radix Tree），这构成时序预言机：命中缓存的请求 TTFT 明显快于未命中，攻击者用 `P|c_i|R` 形式的探测即可逐 token 恢复他人的私有前缀。现有防御（Cache Partition、CacheSalt、SafeKV）靠"内容敏感性分类 + 隔离"实现，代价是牺牲跨租户复用、且分类器漏判即彻底泄漏。Mirage 的思路不同：不判断"这个 prompt 是否含秘密"，而是度量"攻击者不可避免的探索行为"——高熵秘密要求大量新颖候选，因此前缀下会积累大量拓扑新颖的出边。Privacy Odometer 按内容敏感性权重给风险累计速度加权（粗粒度分类只用于加速风险累积，而非决定隔离与否），随时间衰减。触发锁定后，网关在首个 token 产出后采样一个来自校准 cache-miss 分布的目标延迟，算出常量偏移 Δ，并把整个流平移：客户端观察到自然的 miss 样 TTFT 与自然的 ITL，而 GPU 全速服务其他请求不受影响。

### 关键公式

```math
# 用户可见延迟分解
\text{Latency}=\mathrm{TTFT}+\sum_{i=2}^{N}\mathrm{ITL}_i

# 扇出下界（Fano 式）
\text{扇出量}\ \ge\ \text{秘密熵}/\text{每次探测泄漏比特数}

# 时序均衡残余优势上界（equalization gap）
\text{Advantage}_{\mathrm{attacker}}\le \delta_{\mathrm{eq}}
\quad\text{（由动态尾分位数截断 + 全流平移保证）}
```

### 关键组件
- **Privacy Odometer**：持久追踪前缀 fan-out 扩展的拓扑新颖度，带时间衰减；越过安全预算即触发 lockdown。
- **Two-Phase Lockdown Policy**：先用动态估计器标定 cache-miss 延迟基线，再进入延迟填充阶段。
- **Stream-Level Time Shifting**：对整条 chunk 流施加同一常量偏移，而不是只延迟首 token。
- **Dynamic Tail-Quantile Clamp**：按服务器负载动态选择尾分位数目标，避免固定延迟在负载波动时失真。
- **Plug-and-Play SGLang Module**：不改引擎核心，作为上层策略模块接入。
- **攻击评测矩阵**：EarlyBird（幅度信道，467 个首 token 候选池）、InputSnatch（500×500 姓名-条件词典端到端恢复）、OptiLeak（顺序信道，批量 ≤50 候选、按预测排序至 rank 10,000）。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 语料 / 模型 | 500 样本公共语料 × 3 个模型（Qwen、DeepSeek、Llama 系） |
| 攻击基线 | EarlyBird（ASR@10k 达 **92%**，闭世界 96–99% vs 10% 基线）、InputSnatch、OptiLeak（ASR@10k **67%**） |
| 防御效果 | 三种攻击全部降至接近随机猜测下限（随机猜测基线 50% / 10% / 2% 依任务而定） |
| 隔离类基线代价 | Cache Partition 与 CacheSalt 使 DeepSeek-14B 的良性中位 TTFT 膨胀 **44–46%**，小模型上负载升高时更达数倍 |
| Mirage 吞吐 | 相对隔离类防御保留至多 **1.6×** 更高服务吞吐，内存开销近乎为零 |
| 健壮性 | 可抵御完全知晓机制的白盒自适应对手；同一原理可迁移到语义缓存（semantic caching）层 |
| 延迟惩罚范围 | 仅限正在被主动探测的敏感流量，良性公共前缀流量延迟不受影响 |

---

## 局限性

- 需要在网关层实现 token 流平移，对流式 API 的实现细节敏感（只挡首 token 会导致缓冲 token 突发释放）。
- 依赖可校准的 cache-miss 延迟分布，服务器负载剧烈波动时基线估计会失真。
- 防护完全建立在"攻击者必须产生大量新颖扇出"这一假设上；若攻击者能复用已缓存分支、或攻击目标本身低熵，检测信号会减弱。
- 部署前提是网关可控的架构，不适用于无法介入流式输出层的纯客户端-服务器部署。
- 论文未提供公开代码仓库，第三方复现 SGLang 集成的工作量较大。

---

## 建议

- **是否推荐使用**：是（对自建多租户 LLM 推理服务的安全团队价值极高）
- **适用场景**：共享 GPU 集群 / API 网关提供跨租户前缀缓存的服务；医疗、金融、代码助手等 prompt 含敏感信息的场景；需要在"不牺牲 cache 复用收益"与"防时序侧信道"之间取得平衡的生产部署。
- **值得复现**：是

---

**相关论文**：[[2026-11-10-DAWN-Dependency-Aware-dLLM-Inference]] [[2026-11-10-FOCUS-Retinal-Benchmark]]
**主题标签**：#LLM #NLP #Security #SideChannel #KVCache #Serving
