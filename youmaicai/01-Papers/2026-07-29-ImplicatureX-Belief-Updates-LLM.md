# ImplicatureX: LLM 中的信念更新评估

## 元信息
| 标题 | Evaluating Communicative Belief Updates in Large Language Models via Implicature Recognition and Cancellation |
|------|-----|
| 作者 | Cesare Spinoso-Di Piano 等 |
| 链接 | [原文](https://arxiv.org/abs/2607.25094) |
| arXiv | arXiv:2607.25094 |
| 代码 | [GitHub](https://github.com/cesare-spinoso/ImplicatureX) |

## 核心贡献
1. 首个专家标注的 **implicature cancellation** 数据集
2. 评估 LLM 对以下能力的理解：
   - **Implicature recognition**: 识别通过 implicature 表达的非字面意图
   - **Implicature cancellation**: 理解话语隐含意义的弱化或否定（语用现象）

## 背景
- 人类语言由未说出的信念和信念更新驱动
- 对 LLM 成功通信来说，建模这些至关重要
- **Implicature cancellation**: 话语隐含意义被弱化或否定的语用现象

## 数据集
- 专家标注的 implicature cancellation 数据集
- 收集人类对 implicatures 及其 cancellations 的判断

## 主要发现
1. **LLM 信念更新理解落后于人类**，尤其在自然发生场景中
2. LLM 成功案例可能部分源于对 **prior beliefs 的依赖**
3. 信念更新失败取决于其**类型**和**形式**

## 核心结论
> "Current LLMs have not yet reached human-level understanding of unspoken beliefs and belief updates."

当前 LLM 尚未达到对未说出信念和信念更新的人类理解水平。

## 关键词
#LLM #pragmatics #implicature #belief-updates #dialogue #ImplicatureX
