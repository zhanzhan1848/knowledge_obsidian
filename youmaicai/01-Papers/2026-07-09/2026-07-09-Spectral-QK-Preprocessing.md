# 🥬 LLM 论文分析：Spectral Preprocessing of Q/K Projections

## 基本信息
- **作者**: Athanasios Zeris et al.
- **发表**: arXiv cs.LG/cs.CL | Wed, 8 Jul 2026
- **链接**: [arXiv:2607.07478](https://arxiv.org/abs/2607.07478)
- **关键词**: Transformer, Attention, Spectral Analysis, Q/K Projections

---

## 核心贡献

1. **问题**: 标准 dot-product attention 在字符级语言建模上的局限性

2. **方法**: FFT-based 频谱预处理 Q/K 投影

3. **结果** (TinyShakespeare 字符级建模):

| 方法 | Val Perplexity | Delta |
|------|---------------|-------|
| 固定随机频谱滤波器 | 1.031 | +0.443 |
| 单学习频率 (段落尺度) | 0.608 | +0.867 |
| **4 个学习频率 (段落-词尺度)** | **0.309** | **+1.166 (79%↓)** |

4. **多尺度频率收敛**: 四个频率收敛到近几何级数排序 (49, 27, 10, 6 tokens/cycle)，分别对应段落、子段落、短语、词尺度

5. **关键发现**:
   - 随机正交/非正交 Q/K 投影无改善 → 收益来自全局频域混合而非度量扭曲
   - 因果滤波器 (Gaussian, Mexican Hat, Morlet) 在字符级 tokenizer 下无改善
   - 双边 FFT 核本质非因果，耦合所有位置到未来 token

6. **与 FNet 的区别**: FNet 用 Fourier 替换 attention；本文只对 Q/K 投影做频谱预处理，保留完整 attention score 结构

---

## 局限性

- 字符级 tokenizer 特化，未在词级 tokenizer 上验证 (有配套论文 MorletQK)
- 计算开销待评估

## 建议
- **是否推荐**: ⭐⭐⭐⭐ (4/5)
- **适用场景**: 字符级建模、形态丰富语言、代码建模
