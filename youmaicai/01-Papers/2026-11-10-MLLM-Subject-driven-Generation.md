---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Subject-driven Generation, Diffusion Transformer, MLLM]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2605.26111
arxiv: 2605.26111
---

# Squeezing Capacity from Multimodal Large Language Models for Subject-driven Generation

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Squeezing Capacity from Multimodal Large Language Models for Subject-driven Generation |
| **作者** | 未提供（详见原文） |
| **发表** | NeurIPS 2026（42 页，18 图） |
| **链接** | [原文](https://arxiv.org/abs/2605.26111) |
| **arXiv** | arXiv:2605.26111 |
| **分类** | cs.CV, cs.AI, cs.GR, cs.LG, cs.MM |
| **代码** | 项目页 https://zsh2000.github.io/squeeze-mllm-subject-gen/ |

---

## 核心贡献

> 让扩散模型以 MLLM（而非仅 VAE）作为主体条件源：用 Dual Layer Aggregation 聚合 MLLM 全部层的文本/视觉特征，配合 VAE 身份条件与多阶段去噪，兼顾指令遵循与身份保持，大幅缓解 copy-paste 伪影。

1. **MLLM 联合编码条件**：用 MLLM 同时编码文本与参考图（而非分别编码），使扩散模型获得跨模态推理能力，同时保留文本对齐。
2. **Dual Layer Aggregation (DLA)**：用两个独立的 Layerwise Attention Pooling (LAP) 模块分别聚合 MLLM 的文本 token 与图像 token，取自**全部** transformer 层而非仅最后一层，挖掘浅层外观信息与深层语义信息。
3. **多阶段去噪策略**：早期步只启用 MLLM 条件建立全局语义，中期同时启用 MLLM+VAE，后期只启用 VAE 精修身份细节；配合两阶段训练策略避免 VAE 提前吞没身份学习。

---

## 技术方案

### 核心思想
主体驱动生成（subject-driven generation）需同时满足「保留身份」与「遵循指令」。现有路线：DreamBooth/Textual Inversion 需逐主体微调；IP-Adapter / BLIP-Diffusion 用参考编码器但文本与图像分开编码；UNO / UMO / USO / DreamO 用 VAE token 条件做零样本泛化，但易产生 **copy-paste 伪影**（姿势与参考图完全一致、无法适配新场景）与复杂 prompt 下的身份漂移；DreamEngine / Qwen-Image / EasyRef 把 MLLM 接进扩散解码器，但只用 MLLM 最后一层特征（或用标量混合 ViT 特征与末层输出），忽略细粒度视觉线索，身份保持不足。论文观察到 MLLM 的视觉表征随层深从「低层外观」漂移到「高层语义」，**没有任何单层能同时提供文本对齐所需的语义完整性与身份保持所需的细粒度保真**，这是「表征错配」。为此设计 DLA：两个参数独立的 LAP 分别对文本 token 与图像 token 做逐层注意力池化，允许每个模态独立学习该用哪些层（text LAP 偏语义与 prompt，image LAP 偏外观与身份一致性）；由于 MLLM 中间层已完成跨模态信息流动，DLA 无需再做冗余的多模态融合。VAE 与 MLLM 的表征存在重叠，直接拼接会冲突，故设计多阶段去噪：$t\ge\tau_1$ 只用 MLLM，$t$ 中间区间两者并用，$t\le\tau_2$ 只用 VAE；训练时对参考图做随机丢弃，保证任一分支缺失时系统仍可工作。训练采用两阶段：先只训 MLLM-DiT 让 MLLM 充分学习多模态推理与身份线索，再联合训练全部组件。

### 关键公式
```math
\textbf{多阶段去噪:}\quad
\hat{\bm{x}}_{t-1} = f_\theta\big(\bm{x}_t,\ \bm{c}_{\text{MLLM}}\!\cdot\! M_{\text{MLLM}}(t),\ \bm{c}_{\text{VAE}}\!\cdot\! M_{\text{VAE}}(t)\big)

M_{\text{MLLM}}(t), M_{\text{VAE}}(t) =
\begin{cases}
(1,0), & t \ge \tau_1 \quad (\text{早期: 语义/布局})\\
(1,1), & \tau_2 < t < \tau_1 \quad (\text{中期: 平衡控制})\\
(0,1), & t \le \tau_2 \quad (\text{晚期: 身份细节})
\end{cases}

\textbf{LAP / DLA:}\quad
\bm{c}_{\text{MLLM}} = \mathrm{DLA}\big(\{\bm{h}^{\ell}\}_{\ell=1}^{M},\ \text{text tokens}\big),\qquad
\bm{c}_{\text{MLLM}}^{\text{img}} = \mathrm{DLA}\big(\{\bm{h}^{\ell}\}_{\ell=1}^{M},\ \text{image tokens}\big)
\quad(\text{两分支参数独立})

\textbf{推理超参:}\quad \tau_1=0.95,\ \tau_2=0.85,\ \text{CFG}=2.5
```

### 关键组件
- **Layerwise Attention Pooling (LAP)**：受 UniFusion 启发的逐层注意力池化，把 MLLM 各层特征聚合为扩散可用的条件 token。
- **Dual Layer Aggregation (DLA)**：两个参数独立的 LAP（文本/图像），解耦模态间的层级选择需求；实验显示早层偏外观、晚层偏语义。
- **多阶段去噪**：以时间步掩码 $M(t)$ 编排 MLLM 与 VAE 两条条件分支，粗到细地对齐扩散过程。
- **两阶段训练**：先 MLLM-DiT（25K 步）后联合 MLLM+VAE+DiT（10K 步），防止 VAE 提前吸收全部身份学习、导致早期步结构已定却无法挽回。
- **骨干**：FLUX.1-dev（DiT，rectified flow）+ InternVL3-8B（MLLM），DiT 注意力块 LoRA rank 512，MLLM 与 DiT 其余权重冻结。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 训练数据 | UNO-1M（过滤后约 400K 图像对），8× NVIDIA H100，batch 16，lr 1e-5，25K+10K 步 |
| DreamBench DINO-I | 0.7482（与 UNO† 0.6860、UNO 0.7484 相当；OmniGen2 0.7323、XVerse 等为对照） |
| DreamBench CLIP-I | 0.8443（最高档：0.8354 UNO、0.8268 OmniGen2） |
| DreamBench CLIP-T | 0.3010 |
| Copy-paste 缓解（方位角/极角变化） | Azimuth 与 Polar 变化量优于 OmniGen2（22.6/7.0）、DreamO（22.1/9.6）、USO（20.8/9.6） |
| 平均 "Recall" 率（越低越好） | 显著低于 OmniGen2 (0.486)、DreamO (0.372)、USO |
| MLLM-only（第一阶段）模型 | 与相同数据条件下训练的 UNO 性能持平，证明 DLA 能从 MLLM 中提取身份与多模态特征 |
| 完整模型（MLLM+VAE） | 与 SOTA 主体驱动方法可比，且完全使用公开数据 |
| 其他基准 | XVerseBench、多主体 LAMICBench（见附录） |

---

## 局限性

- 骨干选用了 FLUX.1-dev + InternVL3-8B 的私有/受限组件，完整训练管线（400K 数据、8×H100）复现成本高。
- DreamBench 上 DINO-I/CLIP-I 与最强基线差距很小（0.7482 vs 0.7484），主要优势体现在 copy-paste 缓解与人工偏好，而非全面数值领先。
- MLLM 在高层丢失细粒度纹理这一根本限制未被解决，只是通过 VAE 分支做了补偿。
- 两阶段训练策略的顺序敏感，作者指出若从头联合训练会导致 VAE 吞没身份学习——这对超参敏感。
- $\tau_1,\tau_2$ 阈值需要按数据集调参，作者提供了身份保真/姿态变化/画质之间的手动权衡控制。

---

## 建议

- **是否推荐使用**：是（方法设计有启发性，尤其 DLA 与多阶段去噪可直接迁移）
- **适用场景**：主体驱动图像生成、参考图驱动的可控编辑、需要跨模态推理+身份保持的生成任务。
- **值得复现**：部分（DLA 的逐层注意力池化思想可在更小的 DiT 上低成本验证）

---

**相关论文**：[[FLUX]], [[UNO]], [[DreamO]], [[USO]], [[UMO]], [[IP-Adapter]], [[UniFusion]], [[Qwen-Image]]
**主题标签**：#LLM #NLP #Subject-Driven-Generation #Diffusion #MLLM
