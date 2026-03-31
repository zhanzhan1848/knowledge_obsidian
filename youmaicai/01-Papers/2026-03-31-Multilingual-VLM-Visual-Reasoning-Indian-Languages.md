# Do Multilingual VLMs Reason Equally? Cross-Lingual Visual Reasoning for Indian Languages

## 元信息
| 标题 | Do Multilingual VLMs Reason Equally? A Cross-Lingual Visual Reasoning Audit for Indian Languages |
|------|------|
| 作者 | Swastik R |
| 链接 | [原文](https://arxiv.org/abs/2603.26742) |
| arXiv | arXiv:2603.26742 |
| 代码 | https://github.com/QuantumByte-01/multilingual-vlm-reasoning-audit |
| 数据集 | https://huggingface.co/datasets/Swastikr/multilingual-vlm-reasoning |
| 发表 | arXiv, 2026-03-23 (announced 2026-03-31) |

## 核心贡献
1. **首个印度语言的跨语言视觉推理审计**
2. 将 980 道题（来自 MathVista, ScienceQA, MMMU）翻译为印地语、泰米尔语、泰卢固语、孟加拉语、卡纳达语、马拉地语
3. 使用 IndicTrans2 翻译 + Gemini 2.0 Flash 交叉验证（每语言 50 样本，翻译一致性 0.79-0.84）
4. 评测 8 个 VLM（从 7B 开源模型到 GPT-4o），覆盖 7 种语言，共 68,600 条推理记录

## 主要发现

### 性能下降
| 语言类型 | 准确率下降 |
|---------|-----------|
| 英语→印度语言 | 9.8-25 pp |
| Dravidian languages | 比 Indo-Aryan 多 13.2 pp |

### Chain-of-Thought 退化
- 孟加拉语：-14.4 pp（而非提升）
- 卡纳达语：-11.4 pp（而非提升）
- **揭示了英语中心的推理链问题**

### Aya-Vision-8B 表现
- 为 23 种语言构建，仍在 Dravidian 文字上下降 28.5 pp
- **多语言预训练本身不能迁移视觉推理**

## 评测设置
- 源基准：MathVista, ScienceQA, MMMU
- 翻译工具：IndicTrans2
- 评测 VLM：8 个（7B 开源 ~ GPT-4o）
- 语言：7 种（英语 + 6 种印度语言）
- 消融：text-only 和 chain-of-thought

## 关键洞察
1. 印度语言视觉推理存在显著性能差距
2. 链式思维提示在多种印度语言中反而降低性能
3. 多语言预训练不足以解决跨语言视觉推理问题
4. Dravidian 语言（Dravidian family）比 Indo-Aryan 语言面临更大挑战

## URL
- arXiv: https://arxiv.org/abs/2603.26742
- PDF: https://arxiv.org/pdf/2603.26742
- GitHub: https://github.com/QuantumByte-01/multilingual-vlm-reasoning-audit
- Dataset: https://huggingface.co/datasets/Swastikr/multilingual-vlm-reasoning

---
*🥬 油麦菜 · LLM/NLP · 2026-03-31*
