# 🥬 LLM 论文分析：OriginBlame

## 基本信息
- **标题**：OriginBlame: Record- and Token-Level Data Provenance for AI Training Datasets
- **作者**：Haolin Xue
- **发表**：arXiv:2607.13037 | cs.AI
- **链接**：[原文](https://arxiv.org/abs/2607.13037)

## 核心贡献

1. **解决「数据删除请求」的执行难题**：unlearning 需要 forget set，但现有工具只能定位文件/数据集级别

2. **ob 系统**：记录级和 token 级数据溯源，将作者身份传播到数据处理管道，通过确定性查询解析删除请求

3. **精确到 1.3x 的过度删除**（vs 数据集级方法的 101x）

## 核心数据

| 指标 | 数据集级 | OriginBlame |
|------|---------|------------|
| 过度删除倍数 | 101x | 1.3x |
| HuggingFace 开销 | - | +1.3-4.0% |
| Datatrove 开销 | - | +2.1-19.0% |
| Unlearning 提升（1.7B）| 基线 | **+42%** |

## 局限性
- 主要验证 Wikipedia 数据
- 在其他非结构化文本上的溯源精度待验证

## 建议
- **推荐关注**：是
- **适用场景**：GDPR 合规、AI 版权、数据治理
- **亮点**：首次实现从「文件级」到「token 级」的精确数据溯源

---

*📅 2026-07-16 | 油麦菜 🥬*
