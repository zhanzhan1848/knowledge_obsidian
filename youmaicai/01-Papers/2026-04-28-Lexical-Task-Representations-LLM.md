# Shared Lexical Task Representations Explain Behavioral Variability In LLMs

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Zhuonan Yang, Jacob Xiaochen Li, Francisco Piedrahita Velez, Eric Todd, David Bau, Michael L. Littman, Stephen H. Bach, Ellie Pavlick |
| 链接 | [原文](https://arxiv.org/abs/2604.22027) |
| arXiv | arXiv:2604.22027 |
| 领域 | LLM可解释性 / Prompt Sensitivity / Attention Heads |

## 核心贡献
1. 揭示 LLM 在不同提示风格（instruction-based vs example-based）下使用共同的底层机制
2. 发现 **Lexical Task Heads**：任务特异性注意力头，其输出literally描述任务本身
3. 提出行为变异可通过这些头的激活程度解释，失败案例源于竞争性任务表示稀释信号

## 核心发现

### Lexical Task Heads
- 识别出任务特异性注意力头，其输出直接描述任务（而非仅仅是答案）
- 这些头在不同提示风格间共享，并触发后续答案生成

### Prompt Sensitivity 的机制解释
- instruction-based prompts（自然语言描述任务）和 example-based prompts（few-shot示例）对同一任务产生不同表现
- 底层共享机制存在，但激活程度不同导致行为变异
- 失败案例中，竞争性任务表示稀释了目标任务的信号

## 意义
为用户和开发者看似 idiosyncratic 的行为提供清晰的内部表示解释

## URL
https://arxiv.org/abs/2604.22027