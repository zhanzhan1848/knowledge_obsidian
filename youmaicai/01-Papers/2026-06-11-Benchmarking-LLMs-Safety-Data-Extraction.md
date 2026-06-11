# Benchmarking LLMs for Safety Data Extraction

## 元信息
| 标题 | Benchmarking Large Language Models for Safety Data Extraction |
|------|-----|
| 作者 | Jonas Grill, Thomas Bayer, Soren Berlinger |
| 链接 | [原文](https://arxiv.org/abs/2606.11204) |
| arXiv | arXiv:2606.11204 |
| 领域 | LLM Benchmarking · Industrial Safety · Data Extraction |

## 核心贡献

1. **系统性基准评测**：对四种主流 LLM（Gemini 1.5 Pro、GPT-4o、Claude 3.7 Sonnet、Llama 3.1-70B）进行安全数据表（SDS）提取评测
2. **文本 vs. 多模态对比**：系统比较文本和多模态处理流水线
3. **三种提示策略**：Zero-shot、Few-shot、Chain-of-Thought
4. **大规模评估**：评估超过 **50,000 个提取数据字段**

## 核心发现

### 模型性能排名
| 模型 | 最高准确率 | 提示策略 |
|------|-----------|---------|
| Gemini 1.5 Pro | **84%** | Chain-of-Thought |
| GPT-4o | 81% | Chain-of-Thought |
| Claude 3.7 Sonnet | 79% | Chain-of-Thought |

### 关键发现
- **文本提取持续优于多模态提取**（所有指标）
- Chain-of-Thought 提示效果最佳
- **没有模型超过 90% 准确率门槛**（工业可靠部署要求）

## 局限性
- 通用 LLM 尚未达到工业无监督使用的鲁棒性要求
- 需要任务特定微调

## 建议
- **是否推荐使用**：是（LLM 在工业数据提取场景的基准参考）
- **适用场景**：工业安全数据提取、文档理解
- **后续方向**：领域自适应训练、模型校准、Human-in-the-Loop 验证

## 相关概念
- [[LLM Benchmarking]]
- [[Chain-of-Thought]]
- [[Industrial NLP]]
- [[Safety Data Extraction]]