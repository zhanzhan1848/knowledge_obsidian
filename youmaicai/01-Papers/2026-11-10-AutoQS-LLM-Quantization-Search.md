---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, quantization, LLM-driven-search, efficient-inference]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.11975
arxiv: 2611.11975
---

# AutoQS: Automated Quantization Strategy Design with Large Language Models

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | AutoQS: Automated Quantization Strategy Design with Large Language Models |
| **作者** | Zhen Liu, Zhiqin Yang, Yonggang Zhang, Jianyi Liu, Jinjun Wang, Jingwen Fu（西安交大 / 港科大 / 中关村学院） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.11975) |
| **arXiv** | arXiv:2611.11975 |
| **分类** | cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 用 LLM 驱动搜索自动设计"异构量化分组策略"：固定权重精度，搜索各层各算子的 group size，用廉价代理评估广泛探索、用周期性真实量化校准，从而在有限预算内提升量化质量与存储效率。

1. **自动化的异构分配搜索框架**：固定权重位宽 $b$，在 $4L$ 个决策（$L$ 层 × 4 个算子组）上搜索 group size，合法取值 $\{-1,16,32,64,128\}$。
2. **受约束的 LLM 提案 + 确定性校验**：LLM 拿到父分配、历史评测结果与候选库，提出可同时改动多个算子决策的稀疏编辑；随后做合法性/兼容性校验、等价分配检测与确定性的"新颖性修复"，避免重复与非法提案。
3. **多保真度评测 + 周期性 checkpoint 反馈**：每个合法未见候选先过廉价 Stage-1 代理打分；每 5 轮迭代选一个候选做真实的 GPTQ 量化，在 ARC-C/PIQA/BoolQ 上评测并测量 checkpoint 大小，结果反馈给后续搜索；100 轮内最多 20 次真实量化机会。
4. **策略分析与跨模型迁移**：分析发现的分配结构（G=128 仍占主导，但相当比例模块采用其他分组），并展示策略可零样本迁移到相关 checkpoint。

---

## 技术方案

### 核心思想
量化不仅取决于位宽，也取决于"量化粒度"——group size 决定多少权重共享一组 scale/zero-point；小组更精细但元数据更大。已有方法（GPTQ/AWQ/OmniQuant/SmoothQuant）改进的是"怎么量化"，HAQ 类工作说明按评测反馈选配置有价值，但都是启发式分配。而 LLM 驱动搜索（FunSearch/EvoPrompt 类）提供了"反复提案—评测—反馈"范式。把这二者结合到量化上有两个额外难点：（1）提案必须先变成合法可执行的分配——不同算子有共享配置约束，表达方式不同可能编码同一分配；（2）完整保真评估需要真正构建并测试量化 checkpoint，代价高昂，而廉价代理又不直接反映量化后表现。AutoQS 的应对：把 LLM 限制在"提出结构化稀疏编辑"这一步，用确定性校验器兜底合法性，用候选库保留多样化的替代分配供后续提案参考（FunSearch 式种群维持），并用周期性真实量化把"代理分数"锚定到真实 checkpoint 质量与存储上。默认协议 100 轮搜索、最多 20 次真实量化；策略冻结后再做七任务评估（不回流搜索）。

### 关键公式
```math
（1）可行分配空间：
\Pi_b = \Big\{ \pi = (g_{\ell,u}) \in \mathcal{G}^{L\times|\mathcal{U}|} \;\Big|\; \mathcal{C}_b(\pi) = 1 \Big\},\qquad
\mathcal{G} = \{-1, 16, 32, 64, 128\},\quad |\mathcal{U}| = 4
决策组：\mathcal{U} = \{\mathrm{QKV}, \mathrm{Out}, \mathrm{GateUp}, \mathrm{Down}\}
每个 policy 含 4L 个决策；\mathcal{C}_b 校验固定精度、合法 group size、模型结构与算子兼容性

（2）评测目标：
Macro3 = unweighted mean{ARC-Challenge, PIQA, BoolQ}（搜索期，用于真实量化评估）
Macro7 = unweighted mean{MMLU, HellaSwag, ARC-Easy, ARC-Challenge, PIQA, WinoGrande, BoolQ}（搜索后，不回流）

（3）调度：
每轮迭代 → 合法未见候选 → Stage-1 廉价代理打分 + 诊断统计 + 存储估计 → 入候选库
每 K = 5 轮 → 从当前 5 轮窗口中选"最新可用候选"（独立于代理分数排序）→ 真实 GPTQ 量化 → 测 Macro3 与 checkpoint 大小 → 反馈后续搜索
预算：T = 100 轮，最多 20 次真实量化
```

### 关键组件
- **结构化策略空间**：4 个算子决策组（QKV / Out / GateUp / Down），耦合算子共享同一决策以保持分组要求。
- **LLM 提案器**：默认 Qwen-Plus，输入为父分配 + 既往评测结果 + 候选库，输出稀疏编辑。
- **确定性校验器**：合法性检查、兼容性检查、等价分配检测（基于规范化表示）、确定性新颖性修复（找一个未见合法替代）。
- **候选库（candidate repository）**：保留已评测候选与多样化分配模式，用于父代选择与后续提案的"上下文种群"。
- **Stage-1 低成本代理**：对每个合法未见候选打分并给诊断统计与存储估计。
- **周期性真实量化**：全新 GPTQ 量化 + 任务准确率 + checkpoint 存储测量。
- **基线**：RTN、GPTQ、AWQ、OmniQuant、CALDERA、SVDQuant、FBQuant（全部 group size 128）；FP16 作为上界。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| Qwen2.5-7B 4-bit Macro7（AutoQS，Mixed group） | 74.21（MMLU 70.43 / HellaSwag 78.69 / ARC-E 80.35 / ARC-C 56.57 / PIQA 79.54 / WinoGrande 68.43 / BoolQ 85.44） |
| 同表最强外部 4-bit 基线 | SVDQuant 73.85、OmniQuant 73.41、AWQ 73.15、GPTQ 72.09、RTN 71.55、CALDERA 68.78、FBQuant 67.21 |
| ARC-Challenge 最大增益 | 56.57 vs 最强外部基线 51.88 |
| FP16 上界 Macro7 | 74.25 |
| Qwen2.5-7B-Instruct | AutoQS Macro7 75.16（dense 75.12，uniform-G128 GPTQ 74.46） |
| 相对 uniform-group GPTQ / AWQ 的七任务平均提升 | +0.70 / +1.12 个百分点（Qwen2.5-7B-Instruct） |
| 匹配种子消融（seed 1234，Qwen2.5-7B W4） | Full：最佳 iter 100，Best Macro3 73.8521，Iter-100 73.8521，平均策略变更 26.53% |
| 消融：No-feedback | 最佳 iter 45，Best Macro3 72.5777，Iter-100 72.2177，平均变更 29.23% |
| 消融：Random proposer | 最佳 iter 15，Best Macro3 73.4465，Iter-100 72.0465，平均变更 11.91% |
| 策略结构 | G=128 占主导，但相当比例模块采用其他 group size |
| 跨模型策略迁移 | LLaMA-7B 上搜到的策略零样本迁移到相关 checkpoint，与目标模型专属 uniform W4-G128 基线相差在 0.15 Macro7 分以内 |
| 硬件 | 1× NVIDIA GeForce RTX 3090 24GB（物理评估 batch size 1） |

---

## 局限性

- Macro7 不是完全留出的评测集：ARC-Challenge、PIQA、BoolQ 同时参与搜索期 Macro3 目标，作者自陈"Macro7 应被理解为搜索后汇总而非完全 held-out 基准"。
- 增益幅度很小（4-bit 下 74.21 vs 74.25 的 FP16 上界，相对最强外部基线约 +0.4 分），且外部基线数字取自 FBQuant 论文的表 8（非同环境重跑），对比公平性存在不确定性。
- 依赖商业 LLM（Qwen-Plus）作为提案器，搜索不可完全离线复现；"相对人工设计的时间节省"论文明确表示无法给出可靠数值估计（仅为自动化优势主张）。
- 搜索空间巨大（$5^{4L}$），100 轮迭代 + 20 次真实量化只是极小采样，策略可能远未最优。
- 评测的模型规模偏小（7B 级别），未验证在更大模型（如 30B/70B）与更高/更低位宽下的收益与成本比。
- 部分模型（如 Qwen2.5-7B-Instruct）的冻结策略产物未能找回，其模块级分配未纳入结构对比。

---

## 建议

- **是否推荐使用**：是（作为"LLM 驱动系统化设计 + 多保真评测"的范式参考），但直接采用的收益需自行验证
- **适用场景**：需要在固定位宽下进一步压榨量化质量/存储、且能承受真实量化开销的团队；研究 LLM 驱动的程序/启发式自动设计（FunSearch 范式）的迁移案例；构建"廉价代理 + 周期性真实评估"搜索框架的参考实现。
- **值得复现**：否（商业 LLM 依赖 + 增益幅度小于噪声量级）；但"代理分数 + 周期性真实评估"的调度设计值得借鉴。

---

**相关论文**：[[2026-03-12-EBFT-Energy-Based-Fine-Tuning]]
**主题标签**：#LLM #NLP #quantization #LLM-driven-search #efficiency
