# Learning Evidence Sufficiency Boundaries for Selective Answering in Grounded Multi-Hop QA

## 元信息
| 标题 | Learning Evidence Sufficiency Boundaries for Selective Answering in Grounded Multi-Hop QA |
|------|------|
| 作者 | Haruto Sato et al. |
| 链接 | [原文](https://arxiv.org/abs/2609.01687) |
| arXiv | arXiv:2609.01687 |

## 核心贡献
1. Grounded QA 系统应在证据支持答案时才回答；但在多跳 QA 中，部分证据可能使答案看起来合理
2. 研究 **evidence sufficiency boundaries**：同一问题，模型应在证据不支持或部分支持时放弃，证据首次充分时回答，冗余证据添加后保持答案稳定
3. 提出 **Evidence Sufficiency Boundary Training**：生成-native 训练框架，构建有序证据链，直接监督 abstain-to-answer 转换

## 模型架构 / 方法
- **Level supervision**：层级监督
- **Boundary flip margin**：边界翻转边界
- **Post-boundary stability**：边界后稳定性
- **Answer recall protection**：答案召回保护
- 证据链来自 HotpotQA、2WikiMultiHopQA、MuSiQue

## 实验结果
- Qwen2.5-3B-Instruct + LoRA：flip accuracy 0.807（vs token-level abstention baseline 0.781）
- 最低 unsupported-answer rate：0.095（vs baseline 0.101）
- 保持竞争性 raw QA F1

## 局限性
- 依赖证据链构建质量
- 仅测试了英文 QA

## 关键词
#multi-hop-QA #selective-answering #grounded-QA #RAG
