# Scute: Exact Batched Serving for PEFT Adapters Beyond LoRA

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Scute: Exact Batched Serving for PEFT Adapters Beyond LoRA |
| 作者 | Thomas Walker, Richard Baraniuk |
| 链接 | [原文](https://arxiv.org/abs/2611.01089) |
| arXiv | arXiv:2611.01089 |
| 类别 | cs.LG |
| 发表时间 | 2026-10-31 |
| 会议 | arXiv preprint |
| 评分 | 7 |

## 核心贡献
1. **指出 serving 系统的能力缺口**：现有 LLM serving 系统能在单 GPU 上批量服务多个不同的 LoRA adapter，但**拒绝**来自其他 PEFT 方法的 adapter，如 **DoRA、(IA)、VeRA、OFT**。
2. **指出既有解法的代价**：把其他 PEFT adapter **转换为 LoRA** 可行，但会带来**显著的内存与精度代价**。
3. **统一正规形（normal form）**：证明在一定修改下，一个**批量的 LoRA kernel** 可以**精确（exactly）且高效地**服务全部这些方法——即把每种方法写成"一种 LoRA 计算，带六个槽位（six slots）存放该 adapter 自身的向量与矩阵"。
4. **槽位合并与成本预测**：部分槽位可在**加载时合并进 adapter 的权重**，其余槽位保持"活的（live）"并引入额外成本；论文给出高效支付该成本的方法，以及**从零参数字节模型（zero-parameter byte model）预测成本**的方法。
5. **系统实现 Scute**：构建于 **vLLM** 之上，支持全部五种方法（Hugging Face PEFT 库提供的 checkpoint）在**同一批次**中服务。
6. **高吞吐优势**：同一 GPU 上可服务 **64 到 1,024** 个 (IA)/VeRA adapter，请求速率达到其 LoRA 转换版本的 **1.5x 到至少 2.5x**。

## 问题背景
多租户 LLM 服务的一个常见部署模式是：单个 GPU 上同时服务大量**参数高效微调（PEFT）**的 adapter，每个租户一份 LoRA。现行 serving 系统（如 vLLM 的多 LoRA 支持）能高效批处理**多个不同的 LoRA**。但 PEFT 家族已不止 LoRA：**DoRA**（权重分解）、**(IA)**（提示注入式低秩适配）、**VeRA**（共享冻结基向量 + 可学习缩放）、**OFT**（正交微调）等方法各自有独特的结构，现有 kernel 无法直接处理，因而被**拒绝**。已有的绕行方案是把这批 adapter **转换成 LoRA 权重**，但转换会**丢失精度**（adapter 的效果被近似）并**增加内存开销**（LoRA 表示可能比原方法更大）。本文主张：这些方法可以**被精确地**（而非近似地）在一个批量 LoRA kernel 内服务。

## 方法
### 统一正规形：一个带六个槽位的 LoRA 计算
论文的核心技术结果是：每种 PEFT 方法都可以写成**一种 LoRA 计算**，其中包含**六个槽位**用于存放该 adapter 自身的向量与矩阵。设基础权重为 $W$，adapter 贡献可统一写为：
$$W' = W + \underbrace{\Delta W}_{\text{adapter effect}}$$
其中 $\Delta W$ 在六槽位框架下可分解为若干可分解的向量-矩阵乘积项（低秩项 + 缩放项 + 逐元素项等的组合）。摘要未给出六槽位的精确形式与各方法到该形式的映射细节，但明确指出：

- **有些槽位可以在加载时合并进 adapter 的权重**（merge into the adapter's weights at load time）——这部分**零运行时成本**；
- **其余槽位保持 live**，并在每个控制/解码步引入额外计算成本。

### 成本模型
论文给出两种手段：
1. **高效支付该成本的方法**（efficient ways to pay this cost）——摘要未说明具体是 kernel 层面的融合、批内分组还是其它优化；
2. **零参数字节模型（zero-parameter byte model）**：一个**不需要任何可学习参数**的**字节级模型**，用于**预测**每个 adapter 的运行时成本。这在实践中很有价值：可提前估算混合 adapter 批次的显存与延迟预算。

### 精度保证
Scute 服务全部五种方法（**Hugging Face PEFT 库**提供的 checkpoint），在**同一批次**中，并与该库（原生实现）对照，**平均误差不超过每个 adapter 效果的 1.5%**（mean error of at most 1.5% of each adapter's effect）。

### 系统集成
Scute 构建在 **vLLM** 之上。

## 实验结果
### 精度（对照 Hugging Face PEFT 库）

| 指标 | 数值 |
|---|---|
| 服务方法数 | **5 种**（LoRA、DoRA、(IA)、VeRA、OFT） |
| 单批内服务 | 全部五种方法可在**同一批次**中服务 |
| 与 HF PEFT 库的平均误差 | **≤ 每个 adapter 效果的 1.5%** |

### 性能（RTX A6000，突发请求负载）

| 指标 | 数值 |
|---|---|
| 混合方法 vs 同数量 LoRA adapter 的解码时间开销 | **多 5% – 17%** |
| (IA) 与 VeRA 的 adapter 数量（同一 GPU） | **64 – 1,024** |
| 相对其 LoRA 转换版本的请求速率 | **1.5x – 至少 2.5x** |

**对照口径**："a mix of these methods takes 5-17% more decode time than the same number of LoRA adapters"——即混合批次的额外解码时间代价是 5%–17%（相对纯 LoRA 批次）。而收益是：(IA)/VeRA 版本的 adapter 可服务数量为 64–1,024，请求速率是 LoRA 转换版的 1.5x–2.5x。

摘要未给出：绝对吞吐（tokens/s）、显存占用数字、LoRA 转换方案的具体内存与精度代价数字（仅定性说"significant"）、各方法单独的吞吐表、成本模型预测误差、批大小设置、以及硬件之外的其它配置。

## 关键洞察
1. **"精确服务"与"近似服务"的服务质量差距被量化了**：通过统一正规形，Scute 避免了"把 DoRA/(IA)/VeRA/OFT 转成 LoRA"这一常见做法的精度损失（误差 ≤ adapter 效果的 1.5%）。对那些**每个 adapter 都承载不同客户微调**的多租户服务，1.5% 的误差虽小，但在换权重这种操作上意味着**客户的微调行为被静默改变**——这在合规敏感场景下是实质问题。
2. **统一正规形是一个可复用的"kernel 兼容性"范式**：与其为每种 PEFT 方法写专用 kernel（工程负担重、无法批处理异构 adapter），不如找到所有方法的共同数学骨架，把差异降级为"哪些槽位可预合并、哪些必须 live"。这个思路可推广到任何"结构不同的低秩/稀疏适配器混部"的场景。
3. **成本可预测性本身就是系统贡献**：零参数字节模型使得运维方能在部署前估出混合 adapter 批次的资源占用，而不必实测——这对需要同时服务上千个异构 adapter 的平台是刚需。
4. **吞吐收益的结构性来源清晰**：1.5x–2.5x 的请求速率来自 (IA)/VeRA 的**参数体积极小**（VeRA 只训练缩放系数，(IA) 只训练注入向量），而 LoRA 转换会把它们**放大**成完整低秩矩阵，占用带宽与显存。精确服务因此同时省内存与提速，而转换方案在两方面都吃亏。
5. **5%–17% 的额外解码时间是诚实的代价陈述**：说明精确服务的"精确"并非免费——live 槽位仍有真实开销。但相对精度损失与转换方案的内存/速度双重劣势，这笔账是划算的。

## 局限性
- 摘要未给出**绝对**性能数字（tokens/s、显存 GB、延迟 ms），因此 1.5x–2.5x 与 5%–17% 的相对收益难以评估在不同硬件与 batch size 下的稳定性。
- 精度误差 "mean error of at most 1.5% of each adapter's effect" 是**平均值**，**未给出最坏情况**与分布；对个别 adapter 显著更差的情形未说明。
- **成本模型未给出预测误差指标**，只说"predict it from a zero-parameter byte model"；模型的准确性未经数字验证。
- "efficient ways to pay this cost" 的具体机制未公开，无法判断这套成本在**极高并发或极小 batch**场景下是否仍然成立。
- 实验仅在**单张 RTX A6000**（一张消费/工作级卡，非 A100/H100）上进行，未验证多卡张量并行、流水线并行或更大模型的场景。
- 摘要未说明对 MoE 架构模型、量化（INT8/FP8）权重、prefix caching 与 chunked prefill 的兼容性——这些是现代 serving 系统的标配，缺失会影响实际可用性。
- 仅覆盖 Hugging Face PEFT 库的五种方法；其他 PEFT 变体与自定义 adapter 格式是否可归入六槽位正规形未讨论。
- 未涉及多模态/Embedding 模型或非 transformer 架构。

## 适用场景
- **多租户 LLM serving 平台**：需要为不同客户同时提供各自的 DoRA/(IA)/VeRA/OFT 微调，而不强迫客户改用 LoRA。
- **PEFT 研究者的实验基础设施**：想在推理栈里精确复现非 LoRA 微调的效果（转换方案会引入误差）。
- **大规模 adapter 池**：数百到上千个 (IA)/VeRA adapter 的同一 GPU 部署，可获得 1.5x–2.5x 的请求速率提升。
- **精度敏感的微调分发**：把训练好的 adapter 直接上线而不做有损转换。
- **资源规划**：用零参数字节模型预估混合 adapter 批次的显存/延迟预算。

## 相关工作
- [[LoRA]] - 低秩适配
- [[PEFT]] - 参数高效微调
- [[DoRA]] - 权重分解低秩适配
- [[VeRA]] - 共享基向量的可学习缩放
- [[IA3]] - 提示注入式适配
- [[OFT]] - 正交微调
- [[LLM Serving]] - LLM 服务系统
- [[vLLM]] - vLLM 推理引擎
- [[Multi-LoRA Serving]] - 多 LoRA 批处理
- [[KV Cache]] - 推理缓存

---
#LLM #Research #PEFT #Serving-Infrastructure #arXiv-2611
