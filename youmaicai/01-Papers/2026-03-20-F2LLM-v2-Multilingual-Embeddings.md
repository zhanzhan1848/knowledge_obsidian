# F2LLM-v2: Inclusive, Performant, and Efficient Embeddings for a Multilingual World

## 元信息
| 标题 | Inclusive, Performant, and Efficient Embeddings for a Multilingual World |
|------|--------------------------------------------------------------------------|
| 作者 | Ziyin Zhang et al. |
| 链接 | [原文](https://arxiv.org/abs/2603.19223) |
| arXiv | arXiv:2603.19223 |
| 日期 | 2026-03-19 |
| 分类 | cs.CL, cs.AI |

## 核心贡献
1. **多语言嵌入模型家族**: 发布8种尺寸（80M到14B参数）的通用多语言嵌入模型
2. **覆盖200+语言**: 特别关注之前服务不足的中低资源语言
3. **训练技术创新**: 结合两阶段LLM嵌入训练流水线 + Matryoshka学习 + 模型剪枝 + 知识蒸馏
4. **开源发布**: 完全开源所有模型、数据、代码和中间检查点

## 模型架构
- 基于LLM的嵌入模型
- Matryoshka表示学习（支持可变维度）
- 两阶段训练流水线

## 训练方法
- **数据**: 6000万高质量公开数据样本
- **技术栈**:
  - 两阶段LLM嵌入训练
  - Matryoshka学习
  - 模型剪枝
  - 知识蒸馏

## 实验结果
- **F2LLM-v2-14B**: 在11个MTEB基准测试中排名第一
- **小模型**: 在资源受限应用中创造新的SOTA
- 相比之前的LLM嵌入模型更高效

## 技术亮点
- 高效性与性能的平衡
- 对低资源语言的特别优化
- 完整的开源生态

## 适用场景
- 多语言语义搜索
- 跨语言检索
- 文本嵌入生成
- 低资源语言NLP任务

## 相关链接
- [[LLM]]
- [[Embedding-Model]]
- [[Multilingual-NLP]]
- [[Matryoshka-Learning]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*
