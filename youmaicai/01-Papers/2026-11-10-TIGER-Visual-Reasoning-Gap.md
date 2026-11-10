---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Visual Reasoning, GRPO, MLLM]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10552
arxiv: 2611.10552
---

# Seeing Isn't Enough: Unlocking Visual Reasoning by Bridging the Reasoning-Access Gap with TIGER

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Seeing Isn't Enough: Unlocking Visual Reasoning by Bridging the Reasoning-Access Gap with TIGER |
| **作者** | 未提供（详见原文） |
| **发表** | NeurIPS 2026（Accepted） |
| **链接** | [原文](https://arxiv.org/abs/2611.10552) |
| **arXiv** | arXiv:2611.10552 |
| **分类** | cs.AI, cs.CV, cs.LG |
| **代码** | https://github.com/minhngh/Tiger |

---

## 核心贡献

> MLLM 的视觉推理短板不是「看不懂」，而是「看懂了却不会用推理机制」——TIGER 通过挖掘「文本会做、渲染成图就做不对」的模态反事实样本并用 GRPO 后训练，把视觉通路对齐到文本推理状态。

1. **推理接入鸿沟的诊断**：用模态反事实（把纯文本推理题渲染成图）把感知、定位、抽象、推理解耦；模型 OCR 准确率高、能读出文字，但图像输入下推理能力显著下降（MathVerse、EMMA、MMMU 等）。Qwen3-VL-8B 在 MATH-500-I 上 92.36% 的错误答案**是在文字被正确提取的情况下**产生的。
2. **TIGER 训练框架**：自动把文本原生推理数据渲染成图，分别以文本与图像两种模态查询模型，挖掘「文本成功 / 图像失败」的样本作为监督信号，用图像输入的 GRPO 后训练（并给出 SFT、DPO、GRPO_text 变体对照）。
3. **零多模态标注的泛化**：训练只用合成渲染文本图（无任何多模态标注），却能提升 MathVerse、EMMA、MMMU、ChartQAPro、RoboSpatial-Home 等真实视觉基准。
4. **机理分析**：推理子空间激活（RSA）分析 + 激活修补（activation patching）证明 TIGER 让视觉表征更贴近文本推理状态。

---

## 技术方案

### 核心思想
MLLM 从语言骨干继承了强大的文本推理能力，但在视觉输入上无法调用同样的推理能力。作者设计**模态反事实**来隔离这一现象：取 MATH-500 等纯文本推理题，把文字渲染成图（黑字白底），语义完全相同、只换输入模态。对每道题定义三种输入：原文本 $q^t_i$、渲染图 $q^v_i$、以及模型自己 OCR 转写出的文本 $\tilde q^t_i$，对应准确率 $\mathrm{acc}^t$（文本）、$\mathrm{acc}^v$（图像）、$\mathrm{acc}^{ext}$（提取文本）。$\mathrm{acc}^{ext}$ 是**感知对照**：若 $\mathrm{acc}^{ext}\approx\mathrm{acc}^t>\mathrm{acc}^v$ 且 OCR 准确率高，则说明模型具备所需推理能力、也能从图中恢复内容，只是图像通路没能接入推理机制——这就是**推理接入鸿沟**。TIGER 据此构造训练数据：自动渲染文本推理题为图，分别用文本/图像查询模型并用可验证答案校验，只保留「文本对、图像错」的实例（文本成功/图像失败），再用**图像输入**的 GRPO 对这些实例做后训练。关键消融显示 GRPO 比 GRPO_text 平均高 3.1 分，说明增益必须来自在视觉条件下优化策略；SFT 与 DPO 虽在合成基准上有提升，却常在真实基准上退化（如 Qwen3-VL-8B 的 MathVision、EMMA 下降）。机理层面，定义推理子空间 $\mathcal{R}$ 为对比差分 $\{h^c_i - h^n_i\}$ 的 top-k 主成分张成空间，用 RSA $=\|\mathbf{P}_{\mathcal{R}}h^u_i\|_2/\|h^u_i\|_2$ 度量图像条件表征落在文本推理子空间的比例；TIGER（尤其 GRPO）显著提升 RSA，且 RSA 与答案正确性呈稳定正相关（$r_{pb}\approx0.37$–0.43）。

### 关键公式
```math
\textbf{三种输入与准确率:}\quad
\mathrm{acc}^t=\mathrm{acc}(x^t_i\mid q^t_i),\quad
\mathrm{acc}^v=\mathrm{acc}(x^v_i\mid q^v_i),\quad
\mathrm{acc}^{ext}=\mathrm{acc}(x^v_i\mid \tilde q^t_i),\quad
\mathrm{acc}^{OCR}=\mathrm{acc}(\tilde q^t_i,\ q^t_i)

\textbf{感知控制鸿沟:}\quad
\mathrm{Gap}_{\mathrm{perc}}=\mathrm{acc}^t-\mathrm{acc}^{ext}
\qquad
\textbf{推理接入鸿沟:}\quad
\mathrm{Gap}_{\mathrm{reason}}=\mathrm{acc}^{ext}-\mathrm{acc}^{v}

\textbf{判定条件:}\quad
\mathrm{acc}^{ext}\approx\mathrm{acc}^t>\mathrm{acc}^v,\ \ \mathrm{且}\ \mathrm{acc}^{OCR}\ \text{高}
\ \Longrightarrow\ \text{推理接入鸿沟（非感知失败）}

\textbf{推理子空间与 RSA:}\quad
\mathcal{R}=\mathrm{span}\{\text{top-}k\ \mathrm{PC}\ \text{of } \{h^c_i-h^n_i\}_{i=1}^{m}\}
,\qquad
\mathrm{RSA}(h^u_i)=\frac{\|\mathbf{P}_{\mathcal{R}}h^u_i\|_2}{\|h^u_i\|_2}
```

### 关键组件
- **模态反事实构造**：把文本推理题渲染为图，作为诊断与训练数据生成的基础设施。
- **反事实样本挖掘**：文本对 / 图像错 的实例筛选，作为「能力已在但通路未接通」的直接监督。
- **图像条件 GRPO**：在视觉输入分布上做策略优化（对比 GRPO_text 是关键消融）。
- **SFT / DPO 对照变体**：证明不同优化目标对真实基准泛化的差异。
- **推理子空间激活（RSA）分析**：量化视觉表征与文本推理状态的对齐程度。
- **激活修补（activation patching）**：把后训练模型的视觉表征换入冻结基座，验证其携带可用的推理信息（干预性证据）。
- **与 RLVR 方法互补**：可叠加在现有 SOTA 视觉推理 RLVR 方法之上获得额外增益。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 诊断：MATH-500-I（渲染为图） | 各模型图像输入准确率平均下降 **7.2 分**（Qwen2.5-VL-3B 降幅最大）；方比例（MATH-500-SI）下差距更大 |
| 诊断：Qwen3-VL-8B 错误归因 | **92.36%** 的错误发生在 OCR 正确提取的前提下 |
| GRPO（Qwen2.5-VL-7B） | MathVerse 43.9 → **47.5**；EMMA 22.2 → **25.7** |
| GRPO（Qwen3-VL-8B） | MathVerse 54.5 → **65.8**（相对基座最高约 **+15%**） |
| GRPO（InternVL3.5-1B） | MATH-500-I 37.3 → **49.9 (+12.6)**；BBH-I 31.6 → **37.8 (+6.2)** |
| 真实基准平均增益（Tab.5） | **0.9–2.3 分**（MMStar、MMMU_VAL、ChartQAPro、RoboSpatial-Home） |
| 显著性 | 单侧 Wilcoxon 符号秩检验 p = **4e-7**（跨 4 模型 × 8 数据集） |
| GRPO vs GRPO_text | GRPO 平均高 **3.1 分** |
| SFT / DPO | 在合成基准常提升，但真实基准常退化（Qwen3-VL-8B 的 MathVision、EMMA 下降） |
| RSA | SFT/DPO 提升有限，GRPO_text 次之，GRPO 提升最大；RSA 与正确性点二列相关 $r\approx0.37$–0.43 |
| 激活修补 | 用 GRPO 的图像条件激活替换基座激活带来最大提升，佐证视觉-推理通路对齐 |

---

## 局限性

- 训练数据全为合成渲染文本图，视觉推理能力提升主要来自「把已有文本推理能力接到视觉通路」，对真正需要视觉感知的新能力（如细粒度 3D 感知）帮助有限。
- 渲染图与真实视觉输入（几何图、图表、真实场景）存在域差距，真实基准增益幅度（0.9–2.3 分）远小于合成基准。
- 需要模型先能正确读出图中文字，OCR 失败的样本无法进入训练闭环。
- RSA 分析只识别与文本推理相关的经验子空间，作者明确说明这不等同于因果识别全部推理机制。
- 需要 GRPO 训练开销（采样 + 可验证答案校验），复现成本不低。

---

## 建议

- **是否推荐使用**：是（诊断视角独特，训练数据可自造，代码已开源）
- **适用场景**：提升现有 MLLM 的视觉推理能力（几何图、图表、科学题、空间推理）；诊断「模型看得见却想不通」类问题；改进 RLVR 视觉推理流水线。
- **值得复现**：是（模态反事实诊断本身即可独立复用，成本低）

---

**相关论文**：[[GRPO]], [[MathVerse]], [[MMMU]], [[RLVR-Visual-Reasoning]], [[Activation-Patching]]
**主题标签**：#LLM #NLP #Visual-Reasoning #GRPO #MLLM
