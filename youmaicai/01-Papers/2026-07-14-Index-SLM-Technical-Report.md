# Index SLM Technical Report: Bilibili's 1.9B Small Language Models

## 元信息
| 标题 | Index SLM Technical Report |
|------|-----|
| 作者 | Lusheng Zhang, Shien He, Tianxing Yan 等（Bilibili） |
| 链接 | [原文](https://arxiv.org/abs/2607.09885) |
| arXiv | arXiv:2607.09885 |
| 代码 | [GitHub](https://github.com/bilibili/Index-1.9B) |
| 日期 | 2026-07-14 |
| 分类 | cs.CL |

## 核心贡献

1. **Index-1.9B 系列**：4 个变体的开源小语言模型系列
   - `Index-1.9B-Base`：基座模型，1.9B 非嵌入参数，2.8T tokens 预训练（中英文为主）
   - `Index-1.9B-Pure`：控制变体，严格过滤掉指令类数据
   - `Index-1.9B-Chat`：SFT + DPO 对齐后的对话模型
   - `Index-1.9B-Character`：RAG 增强的角色扮演定制模型

2. **Warmup-Stable-Decay 学习率调度**：decay 阶段大幅提升精选数据浓度

3. **Norm-Head 输出层**：大学习率下稳定训练

4. **Benchmark 性能**：Base 模型平均得分 64.92，可与数倍大小的开源模型竞争

## 预训练细节

```
模型参数: 1.9B (non-embedding)
训练 tokens: 2.8T
语言: 主要是中文和英文
学习率调度: Warmup → Stable → Decay (Decay 阶段提升精选数据浓度)
输出层: Norm-Head
```

## 模型系列

| 模型 | 描述 | 对齐方法 |
|------|------|----------|
| Index-1.9B-Base | 基座模型 | 无 |
| Index-1.9B-Pure | 严格过滤指令数据 | 无 |
| Index-1.9B-Chat | 对话模型 | SFT + DPO |
| Index-1.9B-Character | 角色扮演 | RAG + few-shot |

## 关键发现

- **Benchmark 意外提升**：在恒定学习率阶段中期出现 benchmark 性能的无法解释的激增
- **深度 vs 宽度**：控制研究探索模型深度、学习率 magnitude 和调度
- **学习率衰减与数据质量交互**：decay 阶段数据质量至关重要
- **预训练中指令数据的影响**：适量指令数据有助于下游任务

## 实验结果

- Index-1.9B-Base 在考试、推理、数学、代码等标准基准上平均得分 **64.92**
- 性能可与数倍大小的开源模型竞争

## 技术亮点

### Norm-Head
```python
# 稳定大学习率训练的输出层设计
# 传统: Linear(head_dim, vocab_size)
# Norm-Head: LayerNorm(embed_dim) → Linear(embed_dim, vocab_size)
```

### Warmup-Stable-Decay 调度
- **Warmup**: 标准预热
- **Stable**: 恒定大学习率
- **Decay**: 学习率衰减 + **大幅提升精选数据浓度**

## 局限性

- 仅中英文数据
- 1.9B 规模在某些复杂推理任务上仍有局限

## 标签
#SmallLanguageModel #SLM #预训练 #SFT #DPO #对齐 #Bilibili

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
