# Global Merger-Arbitrage Forecasting with Language Models

## 元信息
| 标题 | Global Merger-Arbitrage Forecasting with Language Models |
|------|-----|
| 作者 | Hinal Jajal, Michal Mucha, Charles Sweat 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.09921) |
| arXiv | arXiv:2607.09921 |
| 发表 | ICML 2026 |
| 日期 | 2026-07-14 |
| 分类 | cs.CL |

## 核心贡献

1. **长程上下文金融预测系统**：首次将 LLM 应用于并购套利预测，需要推理数百页技术文档
2. **专家引导的上下文工程 + 历史 hindsight 推理轨迹微调**
3. **三分类输出**：按宣布条款成交 / 更高报价 / 交易终止

## 与之前工作的区别

| 之前 LLM 判断预测工作 | 本文 |
|----------------------|------|
| 广泛混合主题基准 | 专用高风险金融场景 |
| 短上下文（新闻片段） | **数百页技术文档** |
| 简单问答 | 结构化概率输出 |

## 系统设计

### 核心组件
1. **Expert-guided Context Engineering**：专家设计的上下文结构化方法
2. **Hindsight-guided Reasoning Traces**：从历史交易中提取 hindsight 推理轨迹
3. **Finetuning**：在推理轨迹上微调 LLM

### 输出
三个互斥结果的概率分布：
- 按宣布条款完成
- 更高报价
- 交易终止

## 实验

### 数据
- **400+** 大型交易（out-of-sample）
- **42 个国家**
- 时间跨度：历史数据

### 结果
| 方法 | Brier Score（越低越好）|
|------|------------------------|
| 校准市场隐含概率 | 0.198 |
| XGBoost | 0.186 |
| 前沿 LLM | 0.201–0.241 |
| **Finetuned 系统（本文）** | **0.151** |

- 比校准市场隐含概率低 **24%**
- 比 XGBoost 低 **19%**
- 比前沿 LLM 低 **25–42%**

## 关键发现

1. **Hindsight-based 监督至关重要**：从已知结果的交易中学习推理模式
2. **专家设计的上下文至关重要**：结构化文档上下文使模型能定位关键信息
3. **LLM 是** formatter（形式化者），而非 solver（求解器）——这是核心洞察
4. **专用领域 + 长上下文 + 微调** 是高风险决策场景的有效范式

## 消融实验洞察
- 去掉 hindsight traces → 性能显著下降
- 去掉专家上下文工程 → 性能显著下降
- 两者结合才能达到最优

## 局限性

- 仅覆盖 M&A 交易预测
- 对未见过的市场结构/监管环境泛化能力未知
- Finetuning 数据依赖历史并购案例质量

## 标签
#LLMFinance #LongContext #Finetuning #MergerArbitrage #ICML2026 #金融预测

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
