---
type: paper
created: 2026-11-10
updated: 2026-11-10
tags: [paper, LLM, NLP, Visual Reasoning, Turkish, SFT, Model Collapse]
status: processed
domain: llm-nlp
agent: youmaicai
source: https://arxiv.org/abs/2611.10831
arxiv: 2611.10831
---

# Multimodal Models Can See, But Can They Think? A Study of Turkish Visual Reasoning

## 元信息

| 字段 | 内容 |
|------|------|
| **标题** | Multimodal Models Can See, But Can They Think? A Study of Turkish Visual Reasoning |
| **作者** | 未提供（详见原文） |
| **发表** | arXiv preprint |
| **链接** | [原文](https://arxiv.org/abs/2611.10831) |
| **arXiv** | arXiv:2611.10831 |
| **分类** | cs.AI |
| **代码** | 未提供 |

---

## 核心贡献

> 用多语言多源评测框架系统考察 VLM 的抽象视觉推理能力：SFT 能把准确率从 24.7% 提到 48.8%，但也暴露出「正确答案不等于有效推理链」以及 **SFT 引发的模型崩溃**（无限循环/空输出）风险。

1. **多语言多源评测框架**：整合 5,240 个样本，来源为 BİLSEM（806）、MM-IQ（2,268）、Visual Puzzles（466）、PuzzleVQA（1,700），同时包含土耳其语与英语问题。
2. **数据混合策略与 SFT 的系统分析**：最佳 SFT 配方（PuzzleVQA + MMIQ(3pro)）把基线 24.7% 提升到 **48.8%**（近两倍），但同时回答了「哪些数据组合会破坏模型一致性」。
3. **LLM-as-a-Judge 推理质量评估**：从逻辑一致性、简洁清晰度、与参考答案一致性三个维度评估推理链质量，显式识别「答案对但推理错」的样本。
4. **模型崩溃的实证**：SFT 可导致「思考循环」（无限重复同一段文本）与高比例空输出；基线模型在部分配置下反而比 SFT 后更稳定。

---

## 技术方案

### 核心思想
VLM 在图案补全、抽象逻辑、关系推理等高层认知任务上仍显不足，问题不在「选出正确选项」而在「找出底层规则并保持中间步骤一致」。本文构建一个包含土耳其语与英语的多源评测框架：BİLSEM 取自土耳其科学艺术中心（天才儿童）备考材料，约 883 道原题（人工补全解题路径）；PuzzleVQA（2,000 题，人类均准 91%）带三段式推理标注（Caption / Explanation / Deduction）；MM-IQ（人类均准 51%）与 Visual Puzzles（人类均准 75%）仅有题目与选项。为把文本、图像、选项整合为模型友好的单图，作者开发了基于 OpenCV 的图像拼接管线（垂直布局：土耳其语题干在上、图在中、选项在下），英文源数据集用 LLM 翻译成土耳其语。评测分两层：多选题准确率 + LLM-as-a-Judge 推理链打分（正确性/逻辑一致性、简洁性与清晰度、与参考解的一致性）。训练阶段先用 Gemini 3 Pro 合成答案做 SFT（比较 Qwen3VL-8B 与 Gemma3-12B、各数据混合比例），再固定最佳基线尝试数据增强（MultiSFT 等），并追踪模型崩溃（无限文本循环、空输出率、输出长度）。

### 关键公式
```math
\textbf{评测框架规模:}\quad
|\mathcal{D}| = 5{,}240
= \underbrace{806}_{\text{BİLSEM}} + \underbrace{2{,}268}_{\text{MM-IQ}}
+ \underbrace{466}_{\text{Visual Puzzles}} + \underbrace{1{,}700}_{\text{PuzzleVQA}}

\textbf{数据划分与评测子集:}\quad
\text{各数据集独立 } 80{:}20 \text{ 划分};\quad
|\mathcal{D}_{\mathrm{eval}}| = 400 \ (\text{统一评测子集})

\textbf{三段式推理标注（PuzzleVQA）:}\quad
\text{Caption} \rightarrow \text{Explanation} \rightarrow \text{Deduction}

\textbf{LLM-as-a-Judge 三维度:}\quad
J = \mathrm{judge}(\text{逻辑一致性},\ \text{简洁清晰度},\ \text{与参考解一致性})\in[0,1]
```

### 关键组件
- **多源多语言评测框架**：BİLSEM + MM-IQ + Visual Puzzles + PuzzleVQA，含人工补全的解题路径。
- **OpenCV 图像拼接管线**：把题干/图像/选项合成为单张垂直布局图。
- **LLM 翻译 + 合成答案**：英文数据集先由 LLM 翻译成土耳其语，答案由 Gemini 3 Pro 批量生成（Batch API）。
- **LLM-as-a-Judge 评分**：三维度评估推理链而非只看答案。
- **模型崩溃追踪**：统计空输出率、平均输出长度、无限循环（thinking loop）现象。
- **成本核算**：Qwen3-VL-Flash 输入 4,929,410 / 输出 14,968,788 token，合计 6.2337 USD；Gemini 侧约 4,000 次请求按批处理价估算。

---

## 实验结果

| 基准/指标 | 结果 |
|-----------|------|
| 评测框架 | 5,240 样本（BİLSEM 806 / MM-IQ 2,268 / Visual Puzzles 466 / PuzzleVQA 1,700），统一测试子集 400 样本 |
| 基线准确率 | **24.7%** |
| 最佳 SFT（Qwen3VL-8B + PuzzleVQA+MMIQ(3pro)） | **48.8%**（48.75%）——近两倍提升 |
| 模型选择 | Qwen3VL-8B 在所有数据混合下均优于 Gemma3-12B |
| 数据增强对比 | MultiSFT 最强（合并数据 40.50%、QwenFlash 单独 32.00%），但仍不及选定基线 48.75% |
| 加入 Qwen3VL-Flash 数据（标准 SFT） | 反而退化至 **32.25%**（3pro+QwenFlash）与 **30.50%**（仅 QwenFlash） |
| 模型崩溃（SFT 3pro） | 48.8% 成功率、**1.00%** 空输出、平均输出长度仅 215.3 词（较稳定） |
| LLM-as-a-Judge | Qwen3-VL-Flash 准确率 89%，但「简洁清晰度」落后 Gemini 3 Pro **54.15 分** |
| 各数据集人类水平 | PuzzleVQA 91%、Visual Puzzles 75%、MM-IQ 51% |

---

## 局限性

- 数据规模与模型规模有限（Qwen3VL-8B / Gemma3-12B），结论向更大模型的外推性未知。
- 英文数据集的翻译由 LLM 完成，翻译噪声与土耳其语母语表达习惯差异未做验证。
- MM-IQ 与 Visual Puzzles 缺少步骤化解题路径，限制了训练与评判的推理链标注质量。
- LLM-as-a-Judge 的可靠性依赖评审模型（GPT-4o-mini 类），存在偏差与不稳定风险。
- 模型崩溃的观察基于特定超参与数据混合，未系统定位触发阈值。
- 结论整体为负向/警示性的（当前 VLM 抽象视觉推理仍不足），缺乏强正向方法。

---

## 建议

- **是否推荐使用**：是（作为「视觉推理瓶颈」与「SFT 副作用」的实证参考）
- **适用场景**：研究抽象视觉推理的评测与数据构建；土耳其语等低资源语言的 VLM 能力评估；为 SFT 超参与数据混合决策提供风险提示。
- **值得复现**：是（评测框架与数据混合消融成本可控）

---

**相关论文**：[[MM-IQ]], [[PuzzleVQA]], [[MaRs-VQA]], [[LLM-as-a-Judge]]
**主题标签**：#LLM #NLP #Visual-Reasoning #Turkish #SFT #Model-Collapse
