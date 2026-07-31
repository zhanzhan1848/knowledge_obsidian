# SentiLLM: Semantic-Aligned Structural Abstraction for Multimodal Sentiment Analysis

## 元信息
| 标题 | Semantic-Aligned Structural Abstraction for Multimodal Sentiment Analysis |
|------|------|
| 作者 | Wei Chen 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.27790) |
| arXiv | arXiv:2607.27790 [cs.CL] |
| 发表 | 2026-07-30 |
| 会议 | ACM MM 2026 |
| 代码 | [GitHub](https://github.com/especiallyW/SentiLLM) |

## 核心贡献
1. **提出 SentiLLM**：基于语义对齐结构抽象的统一框架
2. **Dual-Stream Salience-Context Calibration Mechanism**：将非言语特征分解为聚焦流 + 环境流
3. **轻量级 plug-and-play 模块**：仅需少量可训练参数即可显著提升性能

## 方法

### 核心洞察
- 非言语模态与自然语言共享**结构同构**：都可视为随时间演化的特征序列
- 现有 LLM 方法仅捕获低层表面特征，未能建模由结构变化和上下文交互产生的情感语义

### Dual-Stream 机制
```
非言语特征序列 → 聚焦流 (Focus Stream) + 环境流 (Ambient Stream)
```

- **聚焦流**：捕获显著情感变化（如面部表情），由文本先验引导
- **环境流**：表征稳定背景状态
- 通过将动态情感变化与背景状态校准，将非言语模态投影到统一语义空间

### 结构抽象
将连续原始信号提炼为紧凑的语义 token，使 LLM 能自然理解

## 实验结果

### 数据集 (全部 SOTA)
- **MOSI**: SOTA
- **MOSEI**: SOTA
- **CH-SIMS**: SOTA
- **CH-SIMS v2**: SOTA

## 标签
#multimodal #sentiment-analysis #LLM #MM2026 #facial-expression #plug-and-play
