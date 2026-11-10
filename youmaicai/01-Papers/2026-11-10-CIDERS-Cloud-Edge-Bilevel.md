---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, cloud-edge, bilevel-optimization, personalization, federated-learning]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2609.15664
arxiv: 2609.15664
---

# CIDERS: Cloud-Edge LLM Collaborative Learning via Accelerating Personalized Bilevel Optimization

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | CIDERS: Cloud-Edge LLM Collaborative Learning via Accelerating Personalized Bilevel Optimization |
| **作者** | Victor H. Chen, Hairui Yu, Stella K. Chung, Hong Yan |
| **发表** | arXiv preprint（**作者已声明撤稿**：实验存在严重问题需修复，因修复耗时较长故先撤回） |
| **链接** | [原文](https://arxiv.org/abs/2609.15664) |
| **arXiv** | arXiv:2609.15664 |
| **分类** | cs.DC, cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 提出 **CIDERS**：首个把云边 LLM 协作形式化为**个性化双层优化（personalized bilevel optimization）**的框架——上层优化边缘侧个性化（messenger），下层治理云侧知识迁移（learnable backbone），并用**共识变量修正（consensus-variate correction）**把云端全局轨迹嵌入每一次本地个性化步骤，从而调和"个性化"与"共识"。

1. **新的形式化**：首次用 PBO 刻画云边 LLM 协作的双层结构——上层是 messenger 的客户端特定个性化（不同于传统联邦学习只优化全局精度而不关心"每个客户端适配得多快"），下层是通过面向任务的知识蒸馏（TAKD）让可学习 backbone 对齐冻结教师与下游任务流形。
2. **CIDERS 求解器**：把模型分解为**可学习 backbone**（云端，与冻结完整 backbone 做蒸馏）与**messenger**（边端轻量适配器，仅顶层若干层，LoRA rank 4）；边缘只上传**共识变量增量**而非原始 messenger 权重，从而在云端精确重建本地位移、降低通信开销并避免直接暴露本地优化轨迹。
3. **理论分析**：证明 CIDERS 对 PBO 具有**次线性收敛**到驻点邻域；给出局部轨迹的**几何刻画**——messenger 的有效方向位于"本地个性化梯度"与"全局共识方向"所连的**线段**上，从而显式揭示个性化与全局收敛之间的权衡结构；并给出两个诊断指标用于定量读出轨迹在"个性化—共识"谱系上的位置。
4. **实验**：在 Qwen2.5-3B/1.5B 上，数学推理取得 **3.1×** 增益、代码生成 **1.7×** 增益、指令指标 **10%** 相对增益；六个下游指标平均相对提升约 **12%**，单项最大增益 **11.15%**（GSM8K）。

> ⚠️ **重要提示**：作者在 arXiv comments 中明确写道"实验中存在若干严重问题需要修复，修复耗时较长，故先撤回"。因此上述所有实验数字**应视为未经确认**，框架与理论部分仍可作为思路参考。

---

## 技术方案

### 核心思想
主流工业 LLM 技术栈是"云 centric"的：预训练在超算集群、推理在云端服务、垂直领域适配靠集中收集的语料；边缘设备只做感知与交互终端，上传 prompt、接收输出。这在物理世界智能场景下存在结构性错配：往返网络延迟无法支撑自动驾驶决策、工业机器人闭环控制与野外边缘部署的硬实时需求；边缘侧传感日志与业务文档受合规与商业限制不可外传；带宽与算力开销随 token 量与 KV-cache 流量线性增长。更突出的是**个性化错配**：用于定制模型的用户轨迹、工业日志、传感文本样本源自边缘，而全部可修改参数都在云端。作者因此主张云边协作是架构必需而非性能优化，并给出两个范式：**云边协同推理**（把云与异构边缘节点视为可编程资源池，离线做刻画与规划、全局放置决策）与**云边协同学习**（让每个边缘节点在共享全局知识库的同时基于自己的本地数据与反馈演进模型）。CIDERS 的实现分三步：边缘初始化本地 messenger 为当前全局 messenger，取回历史共识变量；边缘做**共识修正的几何插值**更新 messenger（受本地元梯度、共识拉拽与近端约束三者耦合）；云端聚合 messenger 与共识变量，只上传单个低维共识增量，云端据此精确恢复平均后的本地 messenger 位移，再在固定聚合 messenger 的条件下对 learnable backbone 做面向任务的蒸馏。固定 messenger 条件化很关键——它保证 backbone 学到的表征既忠实于教师，又与当前个性化语境一致，避免 messenger 与 backbone 独立演化导致的错配。

### 关键公式
```math
\mathcal{F}_{\mathrm{rebound}}\big|_{\mathbf{K}=\mathbf{I}} \text{（不适用，见下）}
\quad\Longrightarrow\quad
\text{PBO: }\quad
\min_{\theta_M}\ \mathcal{L}_{\mathrm{local}}\big(\theta_M;\ \theta_B^{\star}(\theta_M)\big)
\quad\text{s.t.}\quad
\theta_B^{\star}(\theta_M)=\arg\min_{\theta_B}\ \mathcal{L}_{\mathrm{TAKD}}(\theta_B,\theta_M;\theta_{\text{teacher}})
```

（更正：上式为标准 PBO 记号，论文原文以下标 $\theta_M$（messenger）、$\theta_B$（learnable backbone）、$\theta_T$（冻结完整 backbone）表述；核心几何结论为：）

```math
\text{有效更新方向} \in \mathrm{conv}\{\nabla \mathcal{L}_{\mathrm{local}},\ \nabla \mathcal{L}_{\mathrm{consensus}}\}
\quad\text{（位于两端所连线段上；共识标量 } \alpha \text{ 决定权衡位置）}

\text{共识修正的本地更新：}\quad
\theta_M \leftarrow \theta_M - \eta\,\Big[(1-\alpha)\,\nabla \mathcal{L}_{\mathrm{local}}
+\alpha\,\nabla \mathcal{L}_{\mathrm{consensus}}\Big]
\quad\text{受近端约束 } \|\theta_M-\theta_M^{(0)}\|\le \delta
```

### 关键组件
- **模型分解**：冻结完整 backbone（云端教师）→ 可学习 backbone（边缘学生，做 TAKD）+ messenger（边缘本地适配器，取顶层若干层）。
- **个性化双层优化（PBO）**：上层 messenger 个性化，下层 backbone 知识迁移。
- **共识变量修正（consensus-variate correction）**：在边缘本地更新中注入全局共识方向，并只回传共识增量。
- **面向任务的知识蒸馏（TAKD）**：在固定聚合 messenger 条件下做下游任务感知的蒸馏，而非普通 KD。
- **几何诊断指标**：论文提出两个指标直接量化"轨迹落在个性化—共识谱系的何处"；实验显示方向性个性化被保留，而输出层面的专门化仍然微弱（可与方向性分量解耦）。
- **通信压缩**：仅上传低维共识增量（与 messenger LoRA 状态同维），不传输原始 messenger 权重。
- **协议设计**：Protocol A/B/C 分别测同域性能、压缩扫描（messenger 层数与 backbone 丢弃比例的存储-质量权衡）等。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 骨干模型 | Qwen2.5-3B、Qwen2.5-1.5B |
| 基准 | GSM8K（1,319 题）、Dolly（目标 token，用于 PPL）、Rosetta、HumanEval-X（164/语言）等 |
| 数学推理增益 | **3.1×**（相对基线） |
| 代码生成增益 | **1.7×**（相对基线） |
| 指令指标增益 | **10%** 相对增益 |
| 六指标平均 | 相对提升约 **12%** |
| 单项最大 | GSM8K **11.15%** |
| 机制归因 | 增益来自**早期共识修正的协同**与**面向任务的蒸馏** |
| 配置细节 | 六层 messenger，84 个可训练 LoRA 张量（attention + MLP 投影），rank 4；Qwen2.5-3B 教师侧 30/36 层、学生侧 24 层；Qwen2-1.5B 对应 22 层与 18 层 |
| 理论结论 | 次线性收敛到驻点邻域；局部轨迹几何刻画；共识标量设定个性化—全局化平衡，共识变量学习率控制过渡速度 |
| ⚠️ 状态 | **作者已声明撤回**，实验结论待修复后重发 |

---

## 局限性

- **作者已声明撤稿**："实验中存在若干严重问题需要修复…先撤回"。所有性能数字与机制归因目前均未经确认，不应直接引用。
- 上传/下载几何与梯度假设（如通信无噪声、同步更新）未在真实网络条件下验证。
- 边缘端仅训练 messenger 的 LoRA 参数，依赖"顶层若干层承载高层语义"这一架构假设，未验证不同模型/任务下的最优层数选择（论文仅做了压缩扫描）。
- 实验限于 Qwen2.5-3B/1.5B 两个小规模骨干，未在更大模型或多边缘异构配置下验证。
- 几何诊断显示"方向性个性化被保留但输出层专门化微弱"，说明论文声称的个性化收益在输出层面证据不足。
- 未评估隐私保护的实际强度（"避免直接暴露本地优化轨迹"是结构性论述，未做攻击实验）。

---

## 建议

- **是否推荐使用**：否（作为结论证据）；是（作为方法思路参考）
- **适用场景**：云边协同 LLM 的架构设计参考（backbone/messenger 分解与双层优化视角本身有启发性）；个性化联邦学习与元学习方法的综述入口。
- **值得复现**：否（原文已撤稿，等待修订版；若要复现需从头搭建协议并自建 PBO 基准，成本高）

---

**相关论文**：[[FedAvg]], [[FedBilevel]], [[Knowledge-Distillation-for-Edge-LLMs]]
**主题标签**：#LLM #NLP #Cloud-Edge #Bilevel-Optimization #Personalization
