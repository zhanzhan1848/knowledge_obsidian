# 3M: Mental Model Management for LLM Memory

## 元信息
| 标题 | Mental Model Management: An Operator-Based Framework for LLM Memory |
|------|-----|
| 作者 | Oliver Kramer |
| 链接 | [原文](https://arxiv.org/abs/2608.15451) |
| arXiv | arXiv:2608.15451 |
| 领域 | cs.AI, cs.NE |

## 核心贡献
1. **3M 框架**：知识表示为心理模型（compact chunks），而非累积文本段落
2. **持续整合**：将新信息持续整合到现有概念表示，而非追加
3. **操作符集合**：提取、检索、添加/更新、重组织、检测不一致性、推导知识

## 核心操作符
| 操作符 | 功能 |
|--------|------|
| Extract | 从输入提取知识 |
| Retrieve | 检索相关心理模型 |
| Add/Update | 添加更新 chunks |
| Reorganize | 重组织表示 |
| Detect | 检测不一致性 |
| Derive | 推导新知识 |

## 核心思想
- **心理模型**：紧凑的概念块，而非文本段落
- **持续整合**：新信息融入现有表示，而非累积
- **操作符化**：模块化知识管理操作

## 演示：Evolution Strategies
- 用 Evolution Strategies 作为运行示例说明各操作

## 关键优势
- 紧凑表示 vs 文本段落累积
- 可检测不一致性
- 可主动推导新知识

## 局限性
- 论文为 position/methodology paper，具体实现细节有限
- 心理模型的具体表示形式需进一步定义
- 计算开销未评估

## URL
- arXiv: https://arxiv.org/abs/2608.15451
