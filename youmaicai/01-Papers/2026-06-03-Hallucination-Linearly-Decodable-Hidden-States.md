# Hallucination Is Linearly Decodable from Mid-Layer Hidden States in Quantized LLMs

## 元信息
| 标题 | Hallucination Is Linearly Decodable from Mid-Layer Hidden States in Quantized LLMs |
|------|-----|
| 作者 | Aizierjiang Aiersilan |
| 链接 | [原文](https://arxiv.org/abs/2606.02628) |
| arXiv | arXiv:2606.02628 |
| 发表 | 2026-05-30 |
| 领域 | cs.LG, cs.CL |
| 代码 | 已开源 |

## 核心贡献
1. **核心发现**：开源 LLMs 在其隐藏状态中编码了线性可分离的真实性信号，且该信号在网络中间层最强。
2. **跨模型验证**：在三个 7B-8B instruction-tuned 模型（Llama-3.1-8B, Mistral-7B, Qwen2.5-7B）上验证，模型均使用 4-bit NF4 量化。
3. **检测方法对比**：对比四种检测方法：linear probes, MLP probes, INSIDE EigenScore, self-consistency, attention entropy。

## 方法细节

### 探测实验设置
- **数据集**：TruthfulQA, HaluEval-QA, FEVER, controlled synthetic set
- **隐藏状态提取**：提取每层的 per-layer hidden states
- **量化配置**：4-bit NF4 quantization on single 8GB GPU

### 关键发现
| 方法 | AUROC |
|------|-------|
| Linear probe (mid-layer) | **0.904 - 1.000** |
| MLP probe | ~Linear + 0.01 |
| Sampling-based detectors | ≤ 0.541 |

### 探测层位置
- **Llama/Mistral (32 层)**：blocks 13-18（中间偏后）
- **Qwen (28 层)**：blocks 19-25（中间偏后）
- 真相信号呈**近似线性**：MLP 探针相比线性探针提升不超过 0.01 AUROC

### 补充信号
- First-block attention entropy：在知识驱动场景下提供互补信号
- HaluEval-QA 上达到 **0.866 - 0.941** AUROC，无额外推理成本

## 核心创新点
- 首次证明幻觉可以在 4-bit 量化 LLMs 中通过单层线性探针高准确度检测
- 揭示采样方法低可辨别性的结构性原因：paired-label evaluation 与方法访问的信息之间存在结构不匹配

## 标签
#LLM #hallucination-detection #interpretability #probing #quantization