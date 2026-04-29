# GAIA-v2-LILT: Multilingual Adaptation of Agent Benchmark beyond Translation

## 元信息
| 标题 | GAIA-v2-LILT: Multilingual Adaptation of Agent Benchmark beyond Translation |
|------|------|
| 作者 | Yunsu Kim, Kaden Uhlig, Joern Wuebker |
| 链接 | [原文](https://arxiv.org/abs/2604.24929) |
| arXiv | arXiv:2604.24929 |
| 数据 | [HuggingFace](https://huggingface.co/datasets/Fujitsu-FRE/MAPS/viewer/GAIA-v2-LILT) |
| 代码 | [GitHub](https://github.com/lilt/gaia-v2-lilt) |
| 发表 | cs.CL |

## 核心贡献
1. **超越机器翻译的工作流**: 提出功能对齐、文化对齐、难度校准三维度 benchmark 适配方法
2. **GAIA-v2-LILT**: GAIA 的多语言扩展，覆盖5种非英语语言
3. **显著提升**: 相比最小化翻译版本，agent 成功率提升最高 32.7%
4. **揭示 benchmark 诱导的测量误差**: 多语言性能差距中相当一部分来自 benchmark 本身，而非模型能力

## 核心问题
Agent benchmark 仍以英语为中心，多语言版本通常只是机器翻译 + 少量后期编辑。这种简化工作流会因 query-answer 错位或文化偏离上下文而轻易破坏 benchmark 有效性。

## 方法框架

### 三维度对齐
1. **功能对齐 (Functional Alignment)**: 任务逻辑在各语言中等价
2. **文化对齐 (Cultural Alignment)**: 文化和上下文在各语言中适当
3. **难度校准 (Difficulty Calibration)**: 各语言任务难度一致

### 质量保障
- 自动化检查 + 人工审查结合
- 迭代式验证和调整
- 明确的审计标准

## 实验结果
- 相比最小翻译版本，成功率提升 **最高 32.7%**
- 最接近英语的审计设置与英语性能差距缩小到 **3.1%** 以内
- 但许多其他情况仍有显著差距

## 核心洞察
> 多语言性能差距中有相当一部分是 benchmark 诱导的测量误差，激励跨语言适应时进行任务级对齐。

## 数据集信息
- 作为 MAPS 包的一部分发布
- 5 种非英语语言
- 人工重新审核的多语言 GAIA 任务

## 相关标签
#multilingual #agent-benchmark #GAIA #evaluation #LLM-agent
