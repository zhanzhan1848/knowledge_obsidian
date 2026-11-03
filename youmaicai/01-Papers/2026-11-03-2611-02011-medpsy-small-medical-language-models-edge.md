# MedPsy: State-of-the-Art Small Medical Language Models for Efficient Edge Deployment

## 元信息
| 属性 | 值 |
|------|-----|
| 标题 | MedPsy: State-of-the-Art Small Medical Language Models for Efficient Edge Deployment |
| 作者 | Davide Vitabile, Alexandro Buffa, Akshay Nambiar, Amril Nazir |
| 链接 | [原文](https://arxiv.org/abs/2611.02011) |
| arXiv | arXiv:2611.02011 |
| 类别 | cs.CL |
| 发表时间 | 2026-11-01 |
| 会议 | Accepted at NeurIPS 2026 (main conference) |
| 评分 | 9 |

## 核心贡献
1. **MedPsy 模型家族**：纯文本的 1.7B 与 4B 医学语言模型，面向边缘设备部署，主攻"精度—生成—效率"三角权衡。
2. **合成医学数据管线**：基于 biology / medicine / health 种子生成合成数据，并配合来自 **235B 医学专用 LLM 教师**的 chain-of-thought 目标。
3. **四阶段后训练课程**：两个 SFT 阶段 + 两个 RL 阶段（含 hard-sample mining）。
4. **端侧部署评测**：覆盖多种 **GGUF 量化变体**，并在笔记本电脑与智能手机真机上做推理评测。

## 问题背景
医学语言模型有望提供专家级临床支持，但最强的开源 LLM 体积过大，无法部署到隐私敏感的边缘设备；而紧凑的医学模型在知识密集型与真实医疗任务上又明显落后。可装进边缘内存预算的推理模型会产生很长的 reasoning trace，进而推高顺序解码成本、端到端延迟、能耗与 KV-cache 显存压力。也就是说，现有路线要么装不下，要么装下了却慢。

## 方法
**模型规格**：MedPsy-1.7B 与 MedPsy-4B，纯文本（text-only）。基座为 **Qwen3** 系列 backbone（论文以 "Qwen3 backbones" 作为对照）。

**数据管线**
- 种子覆盖三个领域：**biology、medicine、health**；
- 通过**合成医学数据管线**扩充；
- CoT 目标由一位 **235B 的医学聚焦 LLM 教师**生成（蒸馏式监督）。

**四阶段后训练课程**
1. SFT 阶段 1
2. SFT 阶段 2
3. RL 阶段 1
4. RL 阶段 2 —— 配合 **hard-sample mining**（难样本挖掘）

**边缘部署评测设计**
- 多种 **GGUF 量化变体**（含 **Q4_K_M**）与 **BF16** 对照；
- 硬件覆盖：**laptop** 与 **smartphone** 真机推理；
- 指标覆盖准确率、回答长度、端到端中位延迟、每次回答的估计能耗、峰值 RAM、磁盘占用。

摘要未给出各阶段的具体数据量、RL 算法名称（是否为 GRPO/PPO 等）、奖励函数构成、学习率与 batch size 等超参细节。

## 实验结果
**1）七个闭式医学基准上的整体准确率**

| 模型 | 相对 MedGemma-1.5-4B | 相对 MedGemma-27B | 尺寸对比 |
|------|----------------------|--------------------|----------|
| MedPsy-4B | **+19.34 点** | **持平 (matches)** | 比 27B 小 **6.75×** |
| MedPsy-1.7B | **+11.42 点** | — | 体积**不足其一半** |

**2）HealthBench-Hard**

| 模型 | 相对 MedGemma-27B | 尺寸对比 |
|------|-------------------|----------|
| MedPsy-4B | **+15.33 点** | — |
| MedPsy-1.7B | **+11.66 点** | 比 27B 小 **~16×** |

**3）生成长度（相对自身 Qwen3 backbone）**

| 模型 | 平均回答长度缩减 |
|------|----------------|
| MedPsy-1.7B | **1.7×** 更短 |
| MedPsy-4B | **3.2×** 更短 |

**4）量化与磁盘占用**

| 配置 | 聚合分数 | 磁盘占用 |
|------|----------|----------|
| Q4_K_M vs BF16 | 差距 **在 1 分以内** | **~69% 更低** |

**5）真机推理（MedPsy-4B vs 其 Qwen3 backbone，同量化）**

| 指标 | 结果 |
|------|------|
| 端到端中位延迟 | **低 75%** |
| 每次回答估计能耗 | **低 75%** |
| 峰值 RAM | 在所测笔记本与手机配置下 **< 5 GB** |

摘要未列出七个闭式医学基准的具体名称与逐基准分数，也未给出延迟/能耗的绝对数值。

## 关键洞察
1. **"长度"是边缘部署的真实杠杆**：MedPsy-4B 相对 backbone 缩短 3.2× 回答长度，直接换来 75% 的中位延迟与能耗下降，而准确率反而更高——在端侧，缩短 CoT 比单纯加速解码更有效。
2. **小型模型可以超越大 16 倍的模型**：1.7B 在 HealthBench-Hard 上比 27B 高 11.66 分、体积小 ~16×，说明通用大模型在医学领域的知识优势被高参数量摊薄得比想象中厉害。
3. **量化鲁棒性支撑实用性**：Q4_K_M 与 BF16 分数差 <1 分、磁盘省 69%，意味着"部署可行"与"精度不塌"可以同时成立，边缘推理的门槛主要来自硬件而非精度妥协。
4. **RL + hard-sample mining 是关键环节**：四阶段课程（2×SFT + 2×RL）明显优于纯 SFT 蒸馏，反映医学长尾难题需要强化信号而非更多合成数据。

## 局限性
- 仅 1.7B 与 4B 两个尺寸，未做规模缩放趋势分析，外推性有限。
- 摘要未列七个基准名称与逐项分数，无法判断哪些任务受益、哪些未受益；HealthBench-Hard 只给了相对 MedGemma-27B 的差值。
- 真机测试仅覆盖"所测的 laptop 与 smartphone 配置"，机型/SoC 未披露，75% 的延迟降幅依赖硬件。
- 纯文本模型，无多模态/影像能力；不能用于放射学等依赖图像的任务。
- 临床可靠性未做前瞻性评估或医生评审，benchmark 分数不等于临床可用性。
- 235B 医学教师模型的来源、许可与数据合成流程的临床合规性未说明。
- 峰值 RAM <5 GB 的结论受量化格式与上下文长度影响，摘要未给出这两项设定。

## 适用场景
- 医院/诊所内网的私有化部署，敏感病历数据不出本地。
- 手机或平板端的健康助手、问诊预筛、临床知识速查。
- 需要低延迟边缘推理的现场医疗设备（床旁、急救车、偏远地区）。
- 在有限显存/算力预算下追求医学问答精度的研究团队，可直接取用 1.7B/4B 权重或复现其课程配方。

## 相关工作
- [[MedGemma]] · [[HealthBench]] · [[HealthBench-Hard]]
- [[Chain-of-Thought]]
- [[Supervised Fine-Tuning]] · [[Reinforcement Learning]]
- [[Hard Sample Mining]] · [[Distillation]]
- [[Quantization]] · [[GGUF]] · [[Q4_K_M]]
- [[Edge Inference]] · [[KV Cache]]
- [[Qwen3]]

---
#LLM #Research #Medical-LLM #Edge-Deployment #Quantization #arXiv-2611
