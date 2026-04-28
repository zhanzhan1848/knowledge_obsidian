# LARS: Parameter Efficiency Is Not Memory Efficiency

## 元信息
| 标题 | ... |
|------|-----|
| 作者 | Irene Tenison, Stella Ahn, Miriam Kim, Ebtisam Alshehri, Lalana Kagal |
| 链接 | [原文](https://arxiv.org/abs/2604.22783) |
| arXiv | arXiv:2604.22783 |
| 领域 | PEFT / On-Device LLM / 内存优化 |

## 核心贡献
1. 挑战广泛假设：**参数效率 ≠ 内存效率**
2. LoRA/IA3 等方法虽减少可训练参数，但中间张量随序列长度线性增长，常导致设备 OOM
3. 提出 **LARS (Low-memory Activation-Rank Subspace)**：将内存消耗与序列长度解耦

## 问题背景
- PEFT 已成为 LLMs 适配的标准方法
- 但 LoRA、IA3 等方法受限于随序列长度线性增长的中间张量
- 在设备上常触发内存不足错误

## LARS 核心设计
- 之前 PEFT 方法对模型参数施加低秩约束
- LARS 改为对**训练时使用的激活子空间**施加约束
- 直接针对内存消耗的主要来源，从根本上压平内存增长曲线

## 实验结果
- GPU 上内存减少平均 33.54%，CPU 上减少 51.95%（对比 LoRA）
- 涵盖推理、理解、长上下文数据集
- 在 Raspberry Pi 和消费级 CPU 上部署验证
- 保持有竞争力的准确率和吞吐量

## 意义
为资源受限硬件和边缘设备上的复杂 LLM 个性化提供可行路径

## URL
https://arxiv.org/abs/2604.22783