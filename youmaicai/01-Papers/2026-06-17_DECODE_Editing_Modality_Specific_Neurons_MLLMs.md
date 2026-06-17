# DECODE: Decoupling and Editing Modality-Specific Neurons in MLLMs

## 元信息
| 标题 | Correct When Paired, Wrong When Split: Decoupling and Editing Modality-Specific Neurons in MLLMs |
|------|-----|
| 作者 | Tingchao Fu, Wenkai Wang, Fanxiao Li, Huadong Zhang, Jinhong Zhang, Dayang Li, Yunyun Dong, Renyang Liu, Wei Zhou |
| 链接 | [原文](https://arxiv.org/abs/2606.17057) |
| arXiv | arXiv:2606.17057 |
| 领域 | cs.LG, cs.AI, cs.CL |

## 核心贡献
1. 发现 MLLM 知识编辑中的**编辑解耦失败**问题：多模态输入时可更新知识，但拆分为单模态后知识回退
2. 揭示实体知识在 MLLM 中不是统一表示，而是分布在**解耦的模态特定路径**中
3. 提出 **DECODE** 方法，明确解耦和定位模态特定神经元组进行目标知识编辑

## 核心问题
- 知识编辑方法在多模态大语言模型（MLLMs）中存在编辑解耦失败
- 多模态查询时知识可更新，但拆分为单模态查询时回退到编辑前状态
- 原因：知识分布在解耦的模态特定通路中，多模态偏向的更新无法有效传播到单模态电路

## 方法
### DECODE 架构
- 明确解耦模态特定神经元组
- 定位目标知识相关神经元
- 针对不同模态触发器进行编辑

### 核心洞察
- 实体知识在 MLLM 中分布在解耦的模态特定通路
- 多模态更新偏向无法有效传播到单模态电路
- 需要定位并针对特定模态神经元进行编辑

## 实验结果
- DECODE 在不同模态触发器下都能实现有效知识更新
- 缓解编辑解耦失败问题

## 结论
- 知识编辑需要考虑模态特定神经元分布
- DECODE 通过解耦定位实现跨模态一致性编辑

## 关键词
`Multimodal LLM` `Knowledge Editing` `Modality-Specific Neurons` `DECODE` `MLLM