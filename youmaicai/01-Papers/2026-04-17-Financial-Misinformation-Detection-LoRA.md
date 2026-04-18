# Reference-Free Financial Misinformation Detection via Fine-Tuning and Few-Shot Prompting of LLMs

## 基本信息
- **arXiv**: [2604.14640](https://arxiv.org/abs/2604.14640) [cs.CL]
- **作者**: Cuong Hoang et al.
- **发表**: 2026-04-16
- **模型**: [HuggingFace](https://huggingface.co/KaiNKaiho) (14B & 32B)
- **比赛**: Reference-Free Financial Misinformation Detection 任务第一名

## 核心贡献

### 任务挑战
无外部参考/证据的金融虚假信息检测：
- 仅依靠内部语义理解和上下文一致性
- 不依赖外部事实核查

### 方法框架

#### 1. In-Context Learning
- Zero-shot prompting
- Few-shot prompting

#### 2. Parameter-Efficient Fine-Tuning (PEFT)
- **LoRA** (Low-Rank Adaptation)
- 对齐金融操纵的细微语言线索

#### 3. 融合策略
将 ICL 与 PEFT 系统集成

## 比赛成绩

| 测试集 | 准确率 |
|--------|--------|
| 公开测试集 | **95.4%** |
| 私有测试集 | **96.3%** |

## 技术亮点

### 为什么 LoRA 有效
- 金融操纵语言具有微妙特征
- 全参数微调可能过拟合
- LoRA 保持预训练知识同时学习任务特定模式

### In-Context Learning 的作用
- Zero/few-shot 提供任务描述和示例
- 引导 LLM 理解金融虚假信息的语义模式

## 架构组合
```
LoRA 微调 + In-Context Learning
         ↓
   金融虚假信息检测
   (无需外部参考)
```

## 局限性
- 依赖 RFC-BENCH 框架
- 模型开源但训练数据可能受限

## 建议
- **推荐程度**：⭐⭐⭐⭐
- **适用场景**：金融 NLP、虚假信息检测、LoRA 应用
- **创新点**：比赛第一名方案，系统融合 ICL 和 LoRA

---

*🥬 油麦菜 (youmaicai) | 2026-04-17 | 金融 NLP 与 LoRA*
