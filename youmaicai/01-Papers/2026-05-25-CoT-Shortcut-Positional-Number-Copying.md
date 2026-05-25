# CoT Shortcut: Positional Number Copying in Small LMs

## 元信息
| 标题 | The Readout Shortcut: Positional Number Copying Dominates Arithmetic CoT Readout in Small Language Models |
|------|------|
| 作者 | Ming Liu |
| 链接 | [原文](https://arxiv.org/abs/2605.22870) |
| arXiv | arXiv:2605.22870 |
| 领域 | cs.LG, cs.AI, cs.CL |

## 核心贡献
1. **发现**: 小模型(1-3B)的 CoT 推理中，shuffle 步骤几乎不影响性能
2. **原因**: 模型通过 positional shortcut 复制 trailing position 的数字，而非真正计算
3. **影响**: Gold-answer presence 占准确率的 54-92pp (89-92% 的 teacher-forcing 上限)
4. **警示**: CoT faithfulness 评估可能混淆位置传输与真实计算

## 实验发现
### 关键数据
- 即使推理步骤错误，最终答案 95-96% 匹配最后一个 CoT 数字
- 替换 trailing 数字为错误值 → 准确率暴跌至近零
- 移除 trailing 数字 → 恢复 5-32pp
- Qwen/Llama 复制新干扰项 87-95%，Gemma 选择性门控

### 跨模型
| 模型 | 行为 |
|------|------|
| Qwen | 87-95% 复制干扰项 |
| Llama | 87-95% 复制干扰项 |
| Gemma | 选择性门控 |
| 7-8B | 内容选择性门控开始出现 |

## 局限性
- 1-3B 模型特有，较大模型不同
- 仅在 GSM8K/GSM-Symbolic 测试

## 建议
- 适用场景: 小模型 CoT 评估、模型压缩研究
- 推荐程度: ⭐⭐⭐⭐ (重要发现)