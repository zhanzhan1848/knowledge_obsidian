# Accelerating LLM Inference via Vector Index Based Output Embeddings

## 元信息
| 标题 | Accelerating LLM Inference via Vector Index Based Output Embeddings |
|------|------|
| 作者 | Martin Loretz, Sepp Hochreiter |
| 链接 | [原文](https://arxiv.org/abs/2608.27460) |
| arXiv | arXiv:2608.27460 |
| 会议 | ICML 2026 - AdaptFM Workshop |

## 核心贡献
1. 将 LLM 输出嵌入矩阵的 top-k token 选择重新表述为最大内积搜索 (MIPS) 问题
2. 使用 HNSW 向量索引替代密集词表投影层，大幅减少内存带宽瓶颈
3. 在 CPU 推理上实现最高 82% 的端到端解码吞吐量提升

## 问题背景
- 大型输出嵌入矩阵在自回归解码时造成显著的内存带宽瓶颈
- 紧凑 LLMs（尤其是大词表的多语言模型）此问题尤为突出

## 方法
```
传统方式：output_proj → softmax → top-k
改进方式：output_proj → HNSW vector index (最大内积搜索) → scatter logits → top-k
```

- 将 token 嵌入存储在 HNSW 向量索引中
- 解码时通过近似最近邻搜索找回高得分 token 候选集
- 将检索到的 logit 散射回稀疏全词表张量，集成到现有解码 pipeline

## 实验结果
- **模型**: Gemma 3, Llama 3.2, Qwen 3
- **任务**: AlpacaEval 质量评估
- **吞吐量提升**: Gemma 3 270M 提升最高达 **82%**
- **质量保持**: 生成质量在 AlpacaEval 上保持不变

## 关键发现
- 近似检索是低延迟、小批量解码场景下密集输出投影的实际替代方案
- HNSW 索引可在 CPU 上高效运行，适合边缘部署

## 局限性
- 仅在 CPU 推理场景验证，GPU 场景未评估
- 对极大词表模型的效果仍有待进一步验证

## 建议
- **是否推荐使用**: 是
- **适用场景**: 边缘部署、低延迟推理、多语言模型
- **研究方向**: 与量化方法结合、GPU 部署探索

---
*关键词*: LLM推理优化, 向量索引, HNSW, 内存带宽, 词表投影
*研究领域*: cs.CL, cs.LG
