# FLeX: Fourier-based Low-rank EXpansion for Multilingual Transfer

## 元信息
| 标题 | FLeX: Fourier-based Low-rank EXpansion for multilingual transfer |
|------|------|
| 作者 | Gaurav Narasimhan |
| 链接 | [原文](https://arxiv.org/abs/2604.06253) |
| arXiv | arXiv:2604.06253v1 |
| 领域 | cs.LG, cs.AI, cs.PL |
| 来源 | Stanford CS224N Custom Project |

## 核心贡献
1. 研究参数高效微调方法 + 优化器增强，是否能改进 Python → Java 的跨语言代码生成迁移
2. 在 Code Llama 7B 上使用 LoRA 微调，比较 Adam 和 Sophia 优化器
3. 探索**傅里叶域正则化技术**（Fourier-based regularization）
4. 关键成果：
   - LoRA + MBPP 高质量小数据集微调可超过更广泛微调的 Code Llama-Python-7B（40.1% vs 38.4% pass@1）
   - Sophia 收敛更快，但最终 pass@1 差异不大
   - **Fourier 正则化显著改进跨语言迁移**：Java 任务 42.1% pass@1（基线 34.2%）

## 训练配置
- 基座模型：Code Llama 7B
- PEFT 方法：LoRA（低秩适配）
- 优化器：Adam vs Sophia
- 数据集：MBPP（Python）
- 目标：跨语言迁移到 Java

## 核心发现
1. 小规模高质量数据集 + LoRA 可超越大规模通用微调
2. **Fourier 正则化是关键**：在频域添加正则化显著改善跨语言 transfer
3. 优化器选择对收敛速度有影响，但对最终性能影响有限

## 跨语言代码生成的实际意义
- 企业环境中多编程语言共存，单独微调每个语言 LLM 计算成本高昂
- 单语言 LLM 高效适配多语言能力具有重要实用价值

## 建议
- **是否推荐阅读**：是
- **适用场景**：代码 LLM、参数高效微调、跨语言迁移、Fourier 正则化应用
