# What Context Does a Coding Agent Actually Need to Act?

## 元信息
| 标题 | What Context Does a Coding Agent Actually Need to Act? |
|------|-----|
| 作者 | Brian Sam-Bodden |
| 链接 | [原文](https://arxiv.org/abs/2607.09691) |
| arXiv | arXiv:2607.09691 |
| 日期 | 2026-07-14 |
| 分类 | cs.LG, cs.AI |

## 核心贡献

1. **研究问题**：编码 agent 编辑代码时实际需要什么上下文？
2. **关键发现**：答案是**极其简洁**——信号主要在待编辑的代码本身

## 实验设计

在 **SWE-bench Verified** 上，固定 localization（定位工作点），仅变化代码表示方式：
- **Oracle Localization**：精确定位编辑位置
- **变量**：代码表示方式（自然语言摘要、UML 骨架、压缩上下文等）
- **评估指标**：真实 issue 解决率

## 核心发现

### 1. 自然语言摘要几乎无用
- 代码的自然语言摘要能回答的行为问题：**4/45**
- 源码本身能回答的行为问题：**27/45**
- **差距来自表示方式，不来自 summarizer**——前沿模型和 3B 模型的摘要表现一样差

### 2. 周围上下文几乎无用
- 将文件其余部分渲染为 UML 骨架和签名 vs 直接删除文件其余部分：解决率**无差异**（N=70, exact McNemar p=0.75）

### 3. 压缩上下文表现与完整文件相当
- 压缩上下文在 **1/3 token 数** 下匹配完整文件的效果
- 解决一个 issue 实际只需 **19K context tokens**（而非 94K）

### 4. Temperature-0 API 推理存在噪声
- 相同 byte-identical 输入的多次运行中，约 **9%** 的实例结果会翻转
- 这是该基准上所有小效应报告的**噪声底限**

## 数据

| 上下文策略 | Token 成本 | Issue 解决率 |
|-----------|-----------|-------------|
| 完整文件 | 94K | 基线 |
| 压缩上下文 | ~31K (1/3) | 相当 |
| 直接删除 | ~19K | 略低但接近 |
| NL 摘要 | ~5K | 显著更低 |

## 关键启示

> 编码 agent 在需要编辑时，上下文主要来自被编辑的代码本身。周围代码和摘要几乎无用。

1. **RAG 和长上下文策略可能过度**：大部分上下文被浪费
2. **压缩是关键**：信息密度比上下文大小更重要
3. **评估噪声**：9% 的 API 推理噪声要求更大的样本量或更严格的设计
4. **注册假设**：作者预注册了所有假设，并公布了空假设

## 方法论亮点

- **Gold-validated environments**：每个参考编辑可从每个 arm 的上下文表达
- **Deterministic patch construction**：确定性补丁构建
- **Pre-registered hypotheses**：预注册假设 + 公布空假设

## 局限性

- SWE-bench Verified 覆盖范围有限
- 结论可能不适用于其他类型的 agent 任务（如多步骤规划、跨仓库推理）

## 标签
#CodingAgent #ContextWindow #RAG #SWE-bench #Agent #LLM

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-14*
