# Giga-Embeddings: Mixture-of-Experts Encoders for High-Throughput Text Embeddings

## 元信息
| 标题 | 值 |
|------|-----|
| 论文 | Giga-Embeddings: Mixture-of-Experts Encoders for High-Throughput Text Embeddings |
| 作者 | Egor Kolodin et al. |
| 链接 | [原文](https://arxiv.org/abs/2608.23806) |
| arXiv | arXiv:2608.23806 [cs.CL] |
| 发表 | 2026-08-24 |

## 核心贡献

1. **Giga-Embeddings 家族**: 结合强检索质量与高效服务的文本嵌入模型家族

2. **最大成员规格**:
   - **稀疏 10B 参数 MoE encoder**
   - 每 token 约 **1.8B 激活参数**
   - 总参数量大但每次前向激活参数量小

3. **性能**:
   - 在英语、俄语、多语言和代码 MTEB 基准上，家族内最高性能
   - **114.5k tokens/s** 吞吐量（vLLM benchmark, 1024-token inputs）
   - 比 dense 3B 模型高 **25%** 吞吐量
   - 比外部评估系统高 **1.56-2.65x** 吞吐量

4. **其他成员**:
   - **Dense 3B encoder**: 平衡性能和效率
   - **Distilled 480M encoder**: 紧凑模型，用于更严格资源限制
     - 使用 dimension-agnostic objective 训练，对齐 teacher 和 student 相似分布
     - Russian MTEB 70.98 分，超越 FRIDA，参数减少 42%

5. **架构创新**: 稀疏 MoE 在 embedding 模型中的成功应用，兼顾质量和效率

## 建议

- **是否推荐**: ⭐⭐⭐⭐
- **适用场景**: 高吞吐量检索系统；RAG 系统；embedding 模型研究和应用
- **必读理由**: 稀疏 MoE 在 embedding 领域的成功案例；性能和质量双重突破
