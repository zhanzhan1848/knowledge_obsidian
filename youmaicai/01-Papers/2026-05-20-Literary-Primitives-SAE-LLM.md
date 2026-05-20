# Compositional Literary Primitives in Instruction-Tuned LLMs

## 元信息
| 标题 | Compositional Literary Primitives in Instruction-Tuned LLMs: Cross-Architectural SAE Features for Self, Style, and Affect |
|------|-----|
| 作者 | Joao Paulo Cavalcante Presa, Savio Salvarino Teles de Oliveira |
| 链接 | [原文](https://arxiv.org/abs/2605.18808) |
| arXiv | arXiv:2605.18808 |
| 发表 | 2026-05-11 |
| 代码 | - |

## 核心贡献

1. **通过 Sparse Autoencoders (SAE) 表征文学原语**: 在 Llama 3.1 8B-Instruct 和 Gemma 2 9B-IT 的中层残差流上使用 SAE，识别四类文学特征

2. **四类特征群**:
   - **Naming-gates**: 促进目标情感词法标记的激活
   - **Eleven-self cluster**: 第一人称 register 特征
   - **Stylistic register modulators**: show-don't-tell 和 defamiliarization
   - **Compositional emotions**: 仅通过多特征组合出现的情感

3. **跨架构覆盖**: Llama 达到 Cowen-Keltner 27 类情感全覆盖，Gemma 达到 23/27

## 模型架构

### 方法流程

1. **SAE 训练**: 在 mid-depth 残差流上训练稀疏自编码器
2. **特征发现**: 识别人类可解释的文学特征
3. **三级验证**: logit-lens → LLM-rate → 5-LLM judge

### 四类特征

#### Naming-gates
直接命名情感的词汇特征。例如，"sad" 直接出现在文本中触发悲伤命名门

#### Eleven-self cluster
第一人称 register 特征，涉及 "I", "me", "my" 等第一人称表达

#### Stylistic Register Modulators
- **Show-don't-tell**: 通过场景描写而非直接命名表达情感
- **Defamiliarization**: 使熟悉事物显得陌生化

#### Compositional Emotions
仅在多特征组合时才出现的情感，单一特征无法激活

### 跨架构差异

- **Llama**: 直接命名情感 (naming-gate 驱动)
- **Gemma**: 通过场景和意象间接唤起情感 (show-don't-tell 驱动)

两种架构都包含同时作为 register markers 和情感发射器的 self-features，包括一个最 RLHF-loaded 的 self-feature，在特定操作模式下强化 Helper-AI 角色

## 实验设置

### 情感分类任务

Cowen-Keltner 27 类情感 taxonomy，使用 5-LLM judge panel 强制选择

### 验证流程

1. **Logit-lens**: 探测激活空间
2. **LLM-rate**: 使用 LLM 评估生成质量
3. **5-LLM judge**: 强制选择最匹配的类别

### 统计显著性

- 随机判断下每个单元通过概率约 $10^{-3}$
- 期望的双种子假阳性数量可忽略

## 关键发现

1. **Llama 3.1 8B**: 27/27 情感全覆盖，通过 naming-gates + multi-feature recipes + single self-feature steering
2. **Gemma 2 9B**: 23/27 覆盖，adoration 作为唯一严格失败类别
3. **Self-feature 的双重作用**: 同时作为 register markers 和 emotion emitters

## 局限性

1. 单 GPU，约 15 分钟/情感-特征发现周期
2. 仅测试两个指令微调模型

## 建议

- **是否推荐使用**: 探索性研究，用于理解 LLM 的文学和情感表达能力
- **适用场景**: 可解释性研究，情感计算，文学风格分析

---

标签: #SAE #Interpretability #Emotion #Literary-Style #LLM-Analysis