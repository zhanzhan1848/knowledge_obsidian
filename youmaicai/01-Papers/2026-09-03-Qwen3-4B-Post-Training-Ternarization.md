# Post-Training Ternarization of Qwen3-4B: Capability, Effective Bit Budget, Storage Compression, and Deployment

## 元信息
| 标题 | Post-Training Ternarization of Qwen3-4B: Capability, Effective Bit Budget, Storage Compression, and Deployment |
|------|------|
| 作者 | Anirudh Malik et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.01962) |
| arXiv | arXiv:2609.01962 |

## 核心贡献
1. 研究 Qwen (instruction-tuned 4B) 的端到端后训练三值化：KOTMS rotation + E2M-ATQ ternarization + GPTQ-style error compensation
2. 评估有效比特记账、任务能力保留、困惑度、校准敏感性、checkpoint 组成和部署行为
3. Weight-only：激活保持 16-bit 精度，未使用 ILA-AMP

## 实验结果
- 量化线性权重有效比特：**1.641 bits/weight**，81.62% 模型参数被量化
- 10 项能力比较准确率从 64.5% 降至 54.7%
- 退化不均匀：BoolQ 保留 84.6% teacher 表现；ARC-Challenge 仅保留 43.8%
- 困惑度变化：WikiText-2 13.639 → 18.748；PTB 24.700 → 31.992；C4 19.831 → 28.966
- Packing 后模型大小从 8.29 GiB 降至 **3.96 GiB**（Triton GEMV microbenchmark 慢 4.6x）

## 局限性
- 不声称压缩带来更快推理
- 端到端生成吞吐量和任务准确率尚未 benchmark

## 关键词
#quantization #ternarization #model-compression #Qwen #post-training
