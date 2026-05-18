# Quantization Undoes Alignment: Bias Emergence in Compressed LLMs

## 元信息
| 标题 | Quantization Undoes Alignment: Bias Emergence in Compressed LLMs Across Models and Precision Levels |
|------|------|
| 作者 | Plawan Kumar Rath, Rahul Maliakkal |
| 链接 | [原文](https://arxiv.org/abs/2605.15208) |
| arXiv | arXiv:2605.15208 |
| 发表 | IEEE Cloud Summit 2026 / cs.LG |

## 核心贡献
1. **问题发现**：后训练量化压缩会悄悄破坏语言模型的对齐，导致隐藏的偏见浮现。
2. **剂量-响应模式**：3-bit 量化导致 6-21% 原本无偏的项目产生新的刻板行为。
3. **关键发现**：标准质量指标（perplexity）完全无法检测这种公平性退化。
4. **实验规模**：3 个指令微调模型 × 5 个精度级别 × 12,148 BBQ 基准项 × 5 随机种子 = 911,100 推理记录。

## 实验设计
| 维度 | 设置 |
|------|------|
| 模型 | Qwen2.5-7B, Mistral-7B, Phi-3.5-mini |
| 精度 | BF16, 8-bit, 6-bit, 4-bit, 3-bit |
| 基准 | BBQ bias benchmark (12,148 items) |
| 种子 | 5 random seeds |
| 总推理 | 911,100 |

## 核心发现

### 偏见浮现
- 3-bit 量化：6-21% 无偏项目产生新刻板行为
- **"unknown" 答案选择意愿下降**: -17.4%
- **剂量-响应模式** confirmed via logistic regression

### 指标盲区
| 精度 | Perplexity 增量 | 新偏见项目比例 |
|------|----------------|----------------|
| 8-bit | <0.5% | invisible |
| 4-bit | <3% | 2.5-5.6% |
| 3-bit | >3% | 6-21% |

**关键洞察**：perplexity 增加 <0.5% (8-bit) 和 <3% (4-bit) 时，偏见已在 4-bit 下浮现 2.5-5.6%，但 perplexity 完全没有反映。

## 公平性危害
1. 刻板行为在压缩后浮现
2. 模型更少选择"未知"答案
3. 高风险决策场景尤其危险

## 建议
- 需要质量感知压缩协议
- 部署前显式测试偏见浮现
- 输出评估不足以保证公平性

## 标签
#quantization #alignment #bias #LLM-safety #compression #fairness