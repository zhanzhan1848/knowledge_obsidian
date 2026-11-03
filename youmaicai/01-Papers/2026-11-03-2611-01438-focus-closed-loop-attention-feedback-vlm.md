# FOCUS: Closed-Loop Attention Feedback for Efficient Vision-Language Understanding

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | FOCUS: Closed-Loop Attention Feedback for Efficient Vision-Language Understanding |
| 作者 | Akul Santhosh, Aastha Jhunjhunwala |
| 链接 | [原文](https://arxiv.org/abs/2611.01438) |
| arXiv | arXiv:2611.01438 |
| 类别 | cs.AI, cs.CV |
| 发表时间 | 2026-11-01 |
| 会议 | arXiv preprint |
| 评分 | 8 |

## 核心贡献
1. **FOCUS**：一个**免训练（training-free）**的三层框架，同时减少 VLM 调用**次数**并把每次调用**导向重要内容**。
2. **时间门控（Temporal gating）**：在**同族更小 VLM 的 patch-embedding 空间**中度量帧间差异性，仅当场景发生**语义上有意义的变化**时触发 burst 采集。
3. **空间焦点图（spatial focus map）**：把 patch 级差异性沿 burst 累积，并与**自顶向下注意力先验**融合，编码"运动与语义相关性重合"的位置。
4. **注意力反馈闭环**：焦点图在生成过程中**校准 VLM 的 value cache**，渐进放大任务相关区域的视觉 token、衰减离目标 token——**不删除上下文中的任何 token**；每次响应后，从解码器抽取 **text-to-vision 交叉注意力**反馈为下一次 burst 的先验，使系统**在连续观测中收敛**到语义重要区域。
5. **实证**：在 500 视频的 EgoSchema 子集上流式评测，以 **25.4 次 VLM 调用**达到 **74.8%** 准确率（对比均匀采样 55 次调用 74.6%、BOLT 55 次调用 74.2%）；在四个领域的自我中心视频描述任务上，与最佳基线质量持平但**少 57% 调用**。

## 问题背景
把视频的每一帧都送进 VLM 会带来巨大的推理开销，并限制模型理解实时视频的能力。现有两类方案都不够：其一，**均匀子采样帧**——忽略内容，错过重要事件；其二，在 VLM **内部剪枝视觉 token** 以降低单次调用成本——但仍然对每个采样到的帧都调用一次模型。也就是说，**调用次数**这一维度的开销没有被任何现有方案真正削减。FOCUS 的目标是两条同时推进：减少调用次数，并让每次调用都聚焦到真正重要的内容上。

## 方法

### 三层框架总览
```
输入视频流
   ↓
[1] 时间门控 (Temporal gating)      —— 小型同族 VLM 的 patch embedding 空间
   │                                    帧间差异性 → 触发 burst 采集
   ↓
[2] 空间焦点图 (Spatial focus map)  —— patch 级差异性沿 burst 累积
   │                                    ⊕ 自顶向下注意力先验
   ↓
[3] 注意力校准 (Attention calibration) —— 校准 VLM value cache（不删 token）
   ↓
生成响应
   ↓
[闭环] 抽取 text-to-vision 交叉注意力 → 作为下一次 burst 的先验
```

### 第一层：时间门控（Temporal Gating）
- 在**同族更小 VLM** 的 **patch-embedding 空间**中计算**帧间差异性**（inter-frame dissimilarity）。
- 只有当场景发生**语义上有意义的变化**时，才**触发 burst 采集**（burst capture）——即连续采集若干帧作为一个 burst。
- 设计要点：使用"小模型的表示空间"作为廉价的语义变化检测器，避免调用大 VLM 本身。这是 **cost-aware 的语义门控**，而非像素差/光流阈值。

### 第二层：空间焦点图（Spatial Focus Map）
- 将 burst 内各帧的 **patch 级差异性累积**（accumulate across the burst），得到空间上"哪里在动"的信号；
- 与**自顶向下注意力先验（top-down attention prior）**融合，得到最终焦点图；
- 焦点图编码的是**运动与语义相关性重合（where motion and semantic relevance coincide）**的位置——只有既在动、又语义相关的位置才被标记。

### 第三层：注意力校准（Attention Calibration）
- 焦点图用于**校准 VLM 的 value cache**，在生成过程中**渐进地（progressively）放大**任务相关区域的视觉 token，**衰减**离目标区域的 token；
- **关键约束：不从上下文中移除任何 token**。这与 token pruning 类方法根本不同——上下文保持完整，避免了剪枝造成的分布偏移与信息不可逆损失，同时仍能通过 value 缩放实现"聚焦"效果。

### 闭环：注意力反馈（Closed-Loop Attention Feedback）
- 每次生成响应后，从解码器中**抽取 text-to-vision 交叉注意力**（即文本 token 对视觉 token 的注意力权重）；
- 将其作为**下一次 burst 的先验**喂回系统；
- 因此先验不是固定的，而是**随观测历史自我演化**——系统**在连续观测中收敛**（converge）到语义上重要的区域。

这一闭环是本文与所有开环方法（均匀采样、一次性剪枝）的根本区别：FOCUS 把"上一轮看到了什么、关注了什么"变成下一轮的先验，形成自我强化的聚焦。

## 实验结果

### EgoSchema 流式评测
| 方法 | VLM 调用数/clip | 准确率 |
|------|------|---------|
| **FOCUS** | **25.4** | **74.8%** |
| 均匀子采样 | 55 | 74.6% |
| BOLT | 55 | 74.2% |

- 数据集：**EgoSchema 的 500 视频子集**，streaming 模式。
- 骨干：所有方法**共享同一个 Qwen3-VL-8B 骨干**（对比公平）。

### 自我中心视频描述（四个领域）
| 指标 | 结果 |
|------|------|
| 质量 | 与最佳基线**持平（matches the best baseline's quality）** |
| 调用次数 | 相比均匀采样**减少 57%** |

## 关键洞察
1. **"少调用 + 每次都准"比"多调用 + 每次都全"更优，且几乎无损**：FOCUS 用 25.4 次调用达到 74.8%，比 55 次调用的均匀采样（74.6%）还高 0.2 个百分点——这说明被跳过的帧大部分确实是冗余的，同时更聚焦的注意力分布带来了轻微的净收益。**调用次数减半（约 54%）而准确率不降**，是罕见的强正向结果。
2. **value cache 校准而非 token 剪枝，是一个更安全的等价路径**：在 VLM 内部"重新加权"视觉 token 可以在**不改变上下文长度**的前提下实现聚焦，从而规避了剪枝带来的不可逆信息损失与分布偏移。这对"上下文压缩"类研究有方法论启示。
3. **闭环先验带来的是免费的自我改进**：把 text-to-vision 交叉注意力回灌，使"聚焦"从一次性启发式变成随时间收敛的过程。这是本文最有辨识度的机制，代价只是每轮多抽一次注意力矩阵。
4. **小模型做语义门控是高效的工程折中**：用同族小 VLM 的 patch-embedding 空间检测"语义有意义的变化"，比像素/光流阈值更鲁棒，又比调用大模型廉价——但代价是需要额外加载一个小模型（摘要未讨论这一额外显存开销）。

## 局限性
- **免训练但依赖注意力可解释性假设**：value cache 校准与 text-to-vision 交叉注意力抽取都假定"注意力权重反映语义重要性"，这一假设在 VLM 中并未普遍成立，论文未做相关验证。
- **评测规模有限**：EgoSchema 只用了 **500 视频子集**；描述任务覆盖四个领域，但摘要未列出具体领域名称与规模。
- **仅在单个骨干（Qwen3-VL-8B）上评测**，跨模型泛化性未验证；"同族更小 VLM"这一要求也限制了模型选择（必须存在同族轻量版）。
- 摘要未给出消融实验（各层分别贡献多少）、门控阈值、burst 长度的超参设置，以及 FPS/延迟的实际墙钟收益。
- 未与其它 pruner / 关键帧选择方法（如 FastV、token 剪枝、其它 burst 触发策略）做直接对比，仅对比了 BOLT。
- 流式设定下的**首帧延迟**与"重要事件完全落在被跳过帧上"的失败模式未被讨论。

## 适用场景
- **实时/长视频理解**：直播分析、辅助驾驶、监控、具身智能的持续感知。
- **成本敏感的 VLM 视频 API**：在保证质量的前提下把 VLM 调用数削减约一半。
- **自我中心视频（egocentric）应用**：可穿戴设备、助盲、第一人称交互。
- **需要在不丢上下文的前提下做视觉聚焦的场景**：长视频多轮问答中逐步收敛到关键区域。

## 相关工作
- [[Vision-Language Models]] — Qwen3-VL 与通用 VLM 骨干
- [[Video Understanding]] — 长视频/流式视频理解任务
- [[Token Pruning]] — 视觉 token 剪枝路线（本文的对比方案）
- [[EgoSchema]] — 自我中心视频理解基准
- [[BOLT]] — 流式视频理解基线方法
- [[KV Cache]] — value cache 校准的机制基础
- [[Cross-Attention]] — text-to-vision 交叉注意力作为先验
- [[Video Captioning]] — 自我中心视频描述任务
- [[Efficient Inference]] — 推理成本优化

---
#LLM #Research #Vision-Language-Model #Video-Understanding #Efficient-Inference #arXiv-2611
