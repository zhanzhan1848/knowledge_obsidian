# 📅 2026-05-07 LLM/NLP 论文日报

> 🥬 油麦菜 | 搜索范围: arXiv cs.CL, cs.AI, cs.LG | 扫描时间: 2026-05-07

---

## 📋 今日概览

| 类别 | 篇数 | 关键词 |
|------|------|--------|
| cs.CL | ~6篇新发表 | RL, Reasoning, Hallucination, Medical LLM |
| cs.AI | ~6篇新发表 | LLM Memory, Speculative Decoding, Neuro-symbolic |
| cs.LG | ~6篇新发表 | Optimizer, MoE, continual learning, NAS |

---

## 🔥 重点论文 (按相关性排序)

---

### 1. FREIA: Free Energy-Driven RL with Adaptive Advantage Shaping
**arXiv: [2605.04065](https://arxiv.org/abs/2605.04065)** | ACL 2026

**作者**: Yiming Huang, Zhenbo Shi et al. (哈工大深圳, 鹏城实验室, 香港中文大学)

**核心贡献**:
- **问题**: 现有无监督 RL 方法无法适应模型不断进化的推理能力，导致策略优化误导
- **方案**: 提出 FREIA，两大创新:
  1. **FER (Free Energy-Driven Reward)**: 基于自由能原理 (FEP)，将自改进分解为"共识对齐"与"探索新路径"的平衡
  2. **AAS (Adaptive Advantage Shaping)**: 根据奖励分布的统计特征自适应调整 advantage signal，区分弱共识/强共识阶段

**关键公式**:
- Belief Sharpening: $w_i = \text{Softmax}(\alpha \cdot \log(f_i)) = \frac{f_i^\alpha}{\sum_k f_k^\alpha}$
- Group Confidence: $C_G = 1 - \frac{H(W)}{\log M}$ (高共识→1，高不确定→0)

**实验结果**:
- 9个数据集，3类推理任务
- DeepSeek-R1-Distill-Qwen-1.5B 上，数学推理 Pass@1 提升 0.5~3.5 分

**标签**: #RLHF #无监督学习 #reasoning #ACL2026

---

### 2. APMPO: Adaptive Power-Mean Policy Optimization
**arXiv: [2605.04066](https://arxiv.org/abs/2605.04066)** | ACL 2026 (Findings)

**作者**: Yiming Huang, Zhenbo Shi et al. (哈工大深圳)

**核心贡献**:
- **问题**: 现有 RLVR 方法使用静态目标函数（算术均值 GRPO / 几何均值 GMPO），无法适应训练动态
- **方案**: APMPO，两大创新:
  1. **PMPO (Power-Mean Policy Optimization)**: 引入幂均值目标，自适应在算术均值(信号放大)和几何均值(一致性强化)间切换
  2. **FAC (Feedback-Adaptive Clipping)**: 根据实时奖励统计稳定性自适应调整 clipping bounds

**实验结果**:
- Qwen2.5-3B-Instruct 上，数学推理平均 Pass@1 较 GRPO 提升 3.0 分
- 9个数据集，3类推理任务

**标签**: #RLVR #PPO #reasoning #ACL2026

---

### 3. Not All That Is Fluent Is Factual: Hallucinations in Academic Writing
**arXiv: [2605.04171](https://arxiv.org/abs/2605.04171)**

**作者**: Humam Khan, Shahab Saquib Sohail 等

**核心贡献**:
- 评测 ChatGPT, Grok, Gemini, Copilot 在学术写作中的幻觉
- 4类任务: 参考文献生成, 事实解释, 摘要生成, 写作改进
- 提出 **Hallucination Index (HI)** 加权指标
- **发现**: Grok/Copilot 参考文献生成更好(HI=0.67/0.70)，Gemini/ChatGPT 语气控制更强但事实性更差(HI=0.53/0.57)

**标签**: #hallucination #evaluation #academic writing

---

### 4. Are LLMs Ready for Conflict Monitoring? (West Africa)
**arXiv: [2605.04177](https://arxiv.org/abs/2605.04177)**

**作者**: Hoffmann Muki, Olukunle Owolabi

**核心贡献**:
- 评测 LLM 在西非冲突事件分类上的表现（对比 ACLED gold-standard）
- 评测模型: Gemma 3 4B, Llama 3.2 3B, Mistral 7B, OLMo 2 7B, AfroConfliBERT, AfroConfliLLAMA
- **关键发现**:
  - Gemma 产生 18.29% 的 False Illegitimation 偏差
  - 领域适应模型接近方向中性
  - 但所有模型都存在 actor-based selection bias（国家行为体被美化36.5%）
  - 地理词汇干扰导致高达66.7%的flip rate

**结论**: 当前模型不适合无监督部署于冲突监测

**标签**: #LLM #evaluation #fairness #domain-adaptation

---

### 5. MedFabric & EtHER: Medical LLM Fabrication Detection
**arXiv: [2605.04180](https://arxiv.org/abs/2605.04180)**

**作者**: Tung Sum Thomas Kwok, Qian Qian et al.

**核心贡献**:
- 提出 **MedFabric**: 数据驱动流水线，生成真实词级 fabricated 内容（保留句法风格，引入微妙事实偏差）
- 提出 **ETHER**: 模块化医学幻觉检测器（Text2Table 分解 + 词掩码填充 + 混合句子对评估）
- 词级幻觉检测较 SOTA 提升 15%+

**标签**: #medical #hallucination #detection #factuality

---

### 6. LCM: Lossless Context Management
**arXiv: [2605.04050](https://arxiv.org/abs/2605.04050)**

**作者**: Clint Ehrlich, Theodore Blackman

**核心贡献**:
- 超越 Claude Code 的长上下文记忆架构
- 两大机制:
  1. **Recursive Context Compression**: 分层摘要 DAG，自动压缩旧消息但保留到每个原始消息的无损指针
  2. **Recursive Task Partitioning**: LLM-Map 等引擎管理的并行原语替代模型自写的循环
- 在 OOLONG 评测（32K~1M tokens）全面超越 Claude Code
- 类似于从 GOTO 到结构化控制流的演进

**标签**: #long-context #agent #memory #coding

---

### 7. PARSE: Parallel Prefix Verification for Specul性 Generation
**arXiv: [2605.04263](https://arxiv.org/abs/2605.04263)**

**作者**: Yuncheng Yao

**核心贡献**:
- 提出 **PARSE** (PArallel pRefix Speculative Engine)
- 现有推测解码受限于 token 级等价验证，接受长度短
- PARSE 在语义/段落级验证，但通过**并行前缀验证**而非顺序验证
- 单次 forward pass 即可找出最长有效前缀（自定义 attention mask）
- 可与 token 级方法（EAGLE-3）组合

**性能**: 吞吐量提升 1.25x~4.3x；与 EAGLE-3 组合提升 1.6x~4.5x

**标签**: #inference #speculative-decoding #optimization

---

### 8. SPARK: Structured Progressive Knowledge Activation for LLM-Driven NAS
**arXiv: [2605.04057](https://arxiv.org/abs/2605.04057)**

**作者**: Zhen Liu, Yuhan Liu, Jingwen Fu

**核心贡献**:
- LLM 辅助 NAS 面临 **functional entanglement** 问题（局部修改引发非局部性能变化）
- 提出 **SPARK**: 显式选择要修改的 functional factor，并以此为条件进行编辑
- CLRS-DFS 上 OOD 精度相对提升 22.9%，采样效率提升 28.1x

**标签**: #NAS #LLM #AutoML

---

### 9. MetaAdamW: Self-Attentive Optimizer with Group-Adaptive Rates
**arXiv: [2605.04055](https://arxiv.org/abs/2605.04055)**

**作者**: JiangBo Zhao, ZhaoXin Liu

**核心贡献**:
- AdamW 对所有参数组应用统一超参数
- 提出 **MetaAdamW**: 用轻量 Transformer 编码器动态调制每组学习率和权重衰减
- 5个任务验证: 时间序列/语言建模/机器翻译/图像分类/情感分析
- 训练时间减少 17.11% 或性能提升 11.08%

**标签**: #optimizer #AdamW #meta-learning

---

### 10. MP-ISMoE: Mixed-Precision Interactive Side MoE
**arXiv: [2605.04058](https://arxiv.org/abs/2605.04058)**

**作者**: Yutong Zhang, Zimeng Wu et al.

**核心贡献**:
- 参数高效迁移学习 (PETL) 的内存开销问题
- 提出 **MP-ISMoE**: 结合 GNP-IQ 量化 + Interactive Side MoE
- GNP-IQ 将权重量化到低位减少量化误差
- ISMoE 通过与 frozen backbone 的特征交互选择最优 expert

**标签**: #MoE #parameter-efficient #quantization #transfer-learning

---

## 📊 今日主题分布

```
RL/Reasoning:    ████████████████████ FREIA, APMPO, SPARK
Hallucination:   ████████████████ MedFabric, Hallucination study
Long Context:    █████████████ LCM
Inference Speed: ████████████ PARSE
Domain Adapt:    ███████████ Conflict Monitoring, Medical
Optimizers:      ██████████ MetaAdamW, MP-ISMoE
```

---

## 🔗 相关链接

- [arXiv cs.CL](https://arxiv.org/list/cs.CL/recent)
- [arXiv cs.AI](https://arxiv.org/list/cs.AI/recent)
- [arXiv cs.LG](https://arxiv.org/list/cs.LG/recent)
- [RSS Feed: cs.CL](https://rss.arxiv.org/rss/cs.CL)

---

*由 🥬 油麦菜 自动生成于 2026-05-07*
