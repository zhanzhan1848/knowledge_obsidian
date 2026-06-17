# MODE: Modality-Decomposed Expert-Level Mixed-Precision Quantization for MoE MLLMs

## 元信息
| 标题 | MODE: Modality-Decomposed Expert-Level Mixed-Precision Quantization for MoE Multimodal LLMs |
|------|-----|
| 作者 | Yuanteng Chen, Peisong Wang, Zhilei Liu, Nanxin Zeng, Yuantian Shao, Shiqiang Lang, Tao Liu, Chuangyi Li, Qinghao Hu, Gang Li, Jing Liu, Jian Cheng |
| 链接 | [原文](https://arxiv.org/abs/2606.17118) |
| arXiv | arXiv:2606.17118 |
| 领域 | cs.LG, cs.AI |

## 核心贡献
1. 发现 MoE-MLLM 量化中两个被忽视的偏差：
   - **跨模态层面**：视觉 token 的数量优势主导专家选择频率，掩盖文本关键专家
   - **模态内视觉层面**：冗余视觉 token 进一步歪曲频率统计
2. 提出 **MODE** 框架，将专家选择频率按模态分解，过滤冗余 token，获取去噪视觉频率
3. 使用整数线性规划（ILP）在给定预算下分配 per-expert 比特宽度

## 核心问题
- MoE-MLLM 性能出色但 GPU 内存成本过高，压缩必要
- 专家级混合精度量化对 MoE-LLM 有效，但对 MoE-MLLM 效果显著下降
- 原因：专家重要性估计存在两个偏差

## 方法
### MODE 框架
1. **模态分解**：将专家选择频率按模态分解
2. **去噪视觉频率**：过滤冗余视觉 token
3. **量化敏感性评估**：作为频率估计的互补信号
4. **ILP 优化**：分配 per-expert 比特宽度

### 关键洞察
- 视觉 token 数量多，掩盖了文本关键专家
- 冗余视觉 token 歪曲频率统计，掩盖信息性视觉内容关键专家

## 实验结果
- W3A16 配置下，平均性能损失限制在 **2.9%** 以内
- 极端 2-bit 设置下收益更大

## 结论
- 模态分解对 MoE-MLLM 量化至关重要
- 考虑模态特异性可有效减少性能损失

## 关键词
`MoE` `Multimodal LLM` `Quantization` `Mixed-Precision` `Expert-Level` `MODE` `Model Compression