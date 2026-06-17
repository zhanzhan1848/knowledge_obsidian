# PromptMN: Pseudo Prompting Language

## 元信息
| 标题 | PromptMN: Pseudo Prompting Language |
|------|-----|
| 作者 | Enkhzol Dovdon |
| 链接 | [原文](https://arxiv.org/abs/2606.17164) |
| arXiv | arXiv:2606.17164 |
| 领域 | cs.CL, cs.AI, cs.HC, cs.PL, cs.SE |

## 核心贡献
1. 提出 **PromptMN**：伪提示领域特定语言，使用 **%-前缀类型指令**标注自然语言
2. 覆盖角色、目标、需求、优先级、约束、计划、输入、输出
3. 语义解析允许任意顺序编写，模型按功能解释指令

## 核心问题
- 自然语言提示脆弱：角色、目标、约束通常埋在文本中或隐含
- Agent 和软件开发流程中，上下文歧义导致的失败占很大比例
- 需要更清晰、可检查、可复用的提示方式

## 方法
### PromptMN 语法
- %-前缀类型指令
- 支持结构：角色、目标、需求、优先级、约束、计划、输入、输出
- 语义解析按功能解释，书写顺序无关

### 特性
- 介于非正式提示和编程风格伪代码之间
- 足够结构化以检查和复用
- 足够轻量适用于分析师、管理者、开发者等

### 逆向提示工程
- 让模型将期望结果重述为 PromptMN
- 检查推断的角色、目标、约束和缺失假设
- 减少修复周期，产生可复用 artifacts

## 实验结果
### Frontier 模型测试
- Claude Fable 5, Claude Opus 4.8, Gemini 3.1 Pro, GPT-5.5
- 正确解析 PromptMN 指令，包括复杂结构（重复、条件、方法、素数检查任务）
- 无需微调

### SDLC 场景
- 新代码库、维护、重设计场景中词汇相同

## 结论
- PromptMN 是更清晰、更可检查的人机交互的实用步骤
- 支持跨软件开发生命周期的检查和对齐

## 关键词
`Prompt Engineering` `Domain-Specific Language` `PromptMN` `Human-AI Interaction` `Agent` `Software Development