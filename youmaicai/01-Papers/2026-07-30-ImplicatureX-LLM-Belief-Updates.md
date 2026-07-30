# Evaluating Communicative Belief Updates in Large Language Models via Implicature Recognition and Cancellation

## 元信息
| 标题 | Evaluating Communicative Belief Updates in Large Language Models via Implicature Recognition and Cancellation |
| 作者 | Cesare Spinoso-Di Piano, Verna Dankers, Marius Mosbach, Jackie Chi Kit Cheung |
| 链接 | [原文](https://arxiv.org/abs/2607.25094) |
| arXiv | arXiv:2607.25094 |
| 代码 | [GitHub](https://github.com/cesare-spinoso/ImplicatureX) |
| 机构 | Mila - Quebec AI Institute & McGill University |
| 领域 | cs.CL, cs.AI |

## 核心贡献

1. **首个隐含取消数据集 ImplicatureX**：包含 271 个专家标注的隐含语料及其对应的取消实例，涵盖：
   - 合成两轮对话隐含语（synthetic two-turn conversational implicatures）
   - 自然出现的标量隐含语（scalar implicatures）
   - 话语隐含语（discourse implicatures）
   - 多轮对话隐含语（multi-turn dialogue implicatures）

2. **LLM 信念更新理解落后于人类**：在自然出现的场景中，LLM 表现尤其差；在标量和话语隐含语上，最强模型（如 GPT-5.4 Thinking）可达人类水平。

3. **成功可能源于先验信念依赖**：控制实验表明，LLM 隐含语识别的成功可能部分源于对先验信念的依赖，而非真正的语用推理。

4. **失败与隐含语类型和形式相关**：取消（cancelling）、保持不变（leaving unchanged）、强化（strengthening）等不同更新类型，以及显式/隐式触发方式都会影响 LLM 的表现。

5. **当前 LLM 尚未达到人类水平的非话语信念理解**：尤其在自然发生的对话隐含语上，LLM 表现接近随机水平。

## 方法论

### 形式化定义

**隐含语（Implicature）**：信念 b 在上下文 c 和话语 u 下成为共同基础，当：
```
G(b|c, ⟨u⟩) > G(¬b|c, ⟨u⟩)
```

**隐含语取消（Implicature Cancellation）**：当添加取消话语 u^× 时：
```
G(b|c, ⟨u, u^×⟩) < G(b|c, ⟨u⟩)
```

### 数据集 ImplicatureX
- 271 个专家标注的隐含语-取消对
- 众包人类判断标注
- 涵盖多种隐含语类型

### 评估设置
- 隐含语识别（Implicature Recognition）
- 取消识别（Cancellation Recognition）
- 信念更新评估（Belief Update Assessment）

## 实验结果

### 隐含语识别
| 模型 | 标量隐含语 | 话语隐含语 | 自然对话隐含语 |
|------|----------|-----------|--------------|
| GPT-5.4 Thinking | ~人类 | ~人类 | 低于随机 |
| 其他强模型 | 部分达标 | 部分达标 | 接近随机 |

### 关键发现
1. **最强 LLM 在标量和话语隐含语上匹配人类**：但这可能是因为它们依赖先验而非真正的语用推理
2. **自然对话隐含语是最大挑战**：即使最强模型也难以应对
3. **取消识别比隐含语识别更难**：强模型（如 Qwen 3 32B Thinking）在面对显式信念否定时仍无法匹配人类准确率

### 控制实验洞察
- 当提供上下文和话语时模型成功，但移除后仍然成功——暗示依赖先验
- 隐含语取消的难度取决于更新类型和触发形式

## 局限性
- 数据集规模相对较小（271 条）
- 主要测试闭源模型，泛化性有限
- 评估标准可能存在主观性

## 建议
- **推荐使用**：是
- **适用场景**：LLM 语用推理评估；对话系统理解能力测试；NLP 评估基准
- **核心结论**：当前 LLM 的隐含语理解可能主要依赖统计先验而非真正的语用推理机制

---
*🥬 油麦菜 · LLM/NLP 知识库 · 2026-07-30*
