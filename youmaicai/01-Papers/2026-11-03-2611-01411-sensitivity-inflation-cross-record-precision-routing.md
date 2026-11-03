# Sensitivity Inflation from Cross-Record Precision Routing in Private Quantized Fine-Tuning

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | Sensitivity Inflation from Cross-Record Precision Routing in Private Quantized Fine-Tuning |
| 作者 | Annan Zhang, Shengjie Song, Wenshuai Yao, Lihao Zhang, Tianmiao |
| 链接 | [原文](https://arxiv.org/abs/2611.01411) |
| arXiv | arXiv:2611.01411 |
| 类别 | cs.LG |
| 发表时间 | 2026-11-01 |
| 会议 | 13 pages, 5 figures |
| 评分 | 8 |

## 核心贡献
1. **识别并形式化"跨记录精度路由"导致的敏感度膨胀**：指出私有微调栈（DP-SGD + 冻结量化backbone + LoRA适配器）普遍隐含一个前提——冻结层的裁剪梯度只是单条记录自身的函数；本文证明 **LLM.int8 打破该前提**，因为它用整批次的并集来路由离群激活列到高精度路径，使得一条记录决定了其他所有记录激活的计算方式，尽管权重是冻结的、量化scale是按行（per-row）的。
2. **给出敏感度膨胀的上界 + "记录隔离契约"（record-isolation contract）**：提出一个契约来恢复标准敏感度界（标准 DP 界 C），并定义**记录自有的精度分派（record-owned precision dispatch）**——它用与批量 LLM.int8 **完全相同的 GEMM** 满足该契约，因此隔离不需要任何额外算术开销。
3. **对原生 CUDA 栈（bitsandbytes, PEFT, Opacus）做实证审计**：构造的 LoRA-Opacus witness 达到 add/remove 界的 **15.0×**；在 OPT-125M 自然文本上，batch size = 16 时其他记录会改变 **20%** 的逐记录层精度划分。
4. **给出可行的审计范式**：证明"直接检查敏感度契约"比"增加抽样次数估计 ε"更实用——后者在发布层面解决如此微小的超出需要约 **200 倍** 的抽样量，而契约检查只需几次原生运行即可暴露问题。

## 问题背景
私有微调 LLM 越来越多地采用 DP-SGD 配合冻结量化 backbone 上的低秩适配器（LoRA）。这类栈都继承了一个未被言明的前提：冻结层保证每条记录的裁剪梯度只是该记录自身的函数，因此加性/移除（add/remove）敏感度界可以直接套用到训练管线。然而 LLM.int8 的混合精度设计使用**整个批次的并集**来确定哪些激活列被视为离群并送往高精度路径，这意味着单条记录会间接影响其他记录的梯度计算，从而破坏 DP 的裁剪敏感度分析基础。此前关于 DP-SGD 敏感度的理论与实现审计工作都聚焦于梯度裁剪、批处理方式、LoRA 等组件，没有系统性地审查量化/混合精度执行路径中的跨记录耦合。

## 方法
### 1. 敏感度膨胀的形式化
设私有微调中的加/移除敏感度界为标准界 $C$（对应"裁剪梯度是单记录函数"的假设）。论文证明 LLM.int8 类路由机制会破坏这一前提，产生**敏感度膨胀（sensitivity inflation）**：批内单条记录的离群激活决策会改变其他记录的激活计算路径，从而放大实际敏感度。

- 关键机制：LLM.int8 通过**批次并集（union over the whole batch）**识别离群激活列，被路由到更高精度（如 FP16）路径；而量化scale是 **per-row** 的、权重是**冻结**的，因此跨记录影响纯粹来自路由决策而非scale共享。
- 论文给出"由跨记录精度路由导致的敏感度膨胀"的**上界（bound）**。

### 2. 记录隔离契约（record-isolation contract）
论文提出一个契约（contract），其语义为：任一记录的裁剪梯度必须只依赖于该记录自身的激活/梯度，从而恢复标准的加/移除敏感度界 $C$。

### 3. 记录自有精度分派（record-owned precision dispatch）
- 满足上述契约的**正确做法**：把精度分派决策改为**按记录独立**计算（每条记录自行判定其离群列），而非批次并集。
- 关键工程结论：该方案可以使用与批量 LLM.int8 **完全相同的 GEMM** 实现，因此**隔离不需要额外算术开销**——这是该方法相对"改用其他量化方案"的实用优势。
- 验证性证据：论文构造了一个"forcing one layer's outlier mask"的对照实验，强制某层的离群mask后超出消失（见实验结果），说明膨胀确实由路由机制而非其他因素引起。

### 4. 审计流程与四个匹配对照（four matched controls）
- 审计对象：原生 CUDA 栈 —— **bitsandbytes + PEFT + Opacus**（真实的 LLM.int8 实现路径）。
- 设置 **四个 matched controls** 作为对照。
- **构造的 LoRA-Opacus witness** 达到 $15.0\times$ 的 add/remove 界。
- **探索性 re-clipping 分析**：在每个梯度都被裁剪之后，64 个候选邻居中有 **10 个** 仍高于界（"above the bound"）；top pair 经原生复验达到 $1.065C$，而**所有对照均保持在 $C$ 以内**。
- **发布层面的 ε 审计**：对已发布的适配器做 **两百万次抽样（two-million-draw audit）**，得到 ε 的下界在 $\delta=10^{-5}$ 时为 **3.25**，低于所声称的保证值 **4.38**。

## 实验结果
| 审计项 | 数值 / 结论 |
|------|------|
| 构造的 LoRA-Opacus witness 相对 add/remove 界 | **15.0×** |
| OPT-125M 自然文本，batch size = 16 | 其他记录改变 **20%** 的逐记录层精度划分 |
| Re-clipping 分析（64 个候选邻居） | **10 个** 邻居在裁剪后仍高于界；top pair 原生复验达 **1.065C** |
| 对照组（四个 matched controls） | 全部保持在 **C 以内** |
| 发布适配器的 ε 下界（两百万次抽样，$\delta=10^{-5}$） | **3.25**（声称保证为 **4.38**，即实测下界低于承诺） |
| 解决该微小超出所需抽样量 | 约 **200 倍**更多抽样 |
| 契约检查所需成本 | **几次原生运行**即可暴露 |

## 关键洞察
1. **"冻结权重"并不等于"梯度是单记录函数"**：DP 敏感度分析常把"权重冻结"当作隔离性的充分条件，但真正的隔离性取决于**执行路径（GEMM 的精度路由）**，而 LLM.int8 的批次并集路由在数学上引入了跨记录耦合。这是一个容易被"工程直觉"掩盖的理论漏洞。
2. **攻击面大小与检测难度严重不对称**：观测到的实际超出只有 $1.065C$（约 6.5%），若想在发布层面靠统计抽样把它验出来，需要约 200 倍抽样量；而直接做**敏感度契约检查**（几次原生运行）就能定位问题。这把"审计方法"的选择从统计学问题变成了工程可检性问题——契约检查是更实用的常规审计手段。
3. **修复可以是零成本的**：通过 record-owned precision dispatch 恢复标准界，不需要额外的 GEMM、不需要换量化方案，说明隐私预算的正确性不必以牺牲吞吐为代价——问题出在**分派语义**（union vs. per-record），而非算力成本。

## 局限性
- 摘要**未给出敏感度膨胀上界的具体表达式**，也未给出完整的数学推导形式（上界以符号形式引用）。
- 实证结论集中在 **OPT-125M** 与自然文本、batch size = 16 这一配置上；更大模型、更长上下文、更高 batch size 下的膨胀幅度**摘要未说明**。
- "另外记录改变 20% 逐记录层精度划分"是行为层面的耦合度量，**摘要未给出**这与 $1.065C$ 超额之间的定量因果映射。
- ε 审计仅针对**已发布适配器**与 $\delta=10^{-5}$；其他 $\delta$、其他数据集、差分隐私其他变体（sub-sampled Gaussian 等）**摘要未覆盖**。
- Re-clipping 分析被作者自己描述为 **exploratory**（探索性），10/64 邻居超界的统计显著性未在摘要中说明。
- 修复方案（record-owned precision dispatch）虽声称零额外算术，但**摘要未给出**在真实吞吐下的实测延迟/速度数据。
- 审计针对 bitsandbytes/PEFT/Opacus 的**原生 CUDA 栈**；其他量化实现（GPTQ/AWQ/AutoRound 等）是否同样受影响**摘要未涉及**。

## 适用场景
- 审计同时使用 **DP-SGD + 量化 backbone + LoRA** 的私有微调管线，验证其隐私预算声明。
- 使用 **LLM.int8 / bitsandbytes** 混合精度推理作为冻结 backbone 的研究或产品团队。
- 需要在**不牺牲推理吞吐**的前提下修复敏感度膨胀的工程团队（record-owned dispatch 方案）。
- 为隐私工程提供**可操作的审计契约**，替代不可行的统计性 ε 抽样验证。

## 相关工作
- [[DP-SGD]] - 差分隐私随机梯度下降
- [[Differential Privacy]] - 差分隐私与加/移除敏感度界
- [[LLM.int8]] - 混合精度离群值路由量化方案
- [[LoRA]] - 低秩适配器
- [[Quantization]] - 模型量化
- [[PEFT]] / [[Opacus]] / [[bitsandbytes]] - 微调与隐私实现栈
- [[Sensitivity Analysis]] - 敏感度分析

---
#LLM #Research #Differential-Privacy #Quantization #DP-SGD #arXiv-2611
