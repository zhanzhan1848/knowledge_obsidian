# PEML: 参数高效多任务学习

## 元信息
| 标题 | PEML: Parameter-efficient Multi-Task Learning with Optimized Continuous Prompts |
|------|------|
| 作者 | Anjir Ahmed Chowdhury, Syed Zawad, Xiaolong Ma, Xu Dong, Feng Yan |
| 链接 | [原文](https://arxiv.org/abs/2605.14055) |
| arXiv | arXiv:2605.14055 |
| 领域 | cs.CL, cs.AI |

## 核心贡献
1. 提出 **PEML**（Parameter-Efficient Multi-task Learning），联合优化连续提示和低秩适配
2. 开发 **PrefixNAS**，通过神经架构搜索自动优化统一连续提示架构
3. 平均准确率提升**6.67%**，个别任务峰值提升**10.75%**
4. 单个 adapter 部署，无需 adapter 切换

## 背景问题
- 单任务PEFT方法（LoRA、Prefix Tuning）不适用于多任务场景
- 部署多个任务特定adapter增加内存和计算成本
- 任务间知识共享受限

## 方法

### PEML 架构
```
输入 → [Prefix Vectors] → LoRA(K,V) → Transformer层 → 输出
```
- **LoRA**：应用于所有投影层，负责模型适配
- **Prefix Vectors**：仅添加到 Key 和 Value 投影，负责输入对齐
- 联合优化：多任务学习作为联合优化问题

### PrefixNAS
- 通过神经架构搜索自动生成和优化统一连续提示
- 自动调优前缀架构和超参数
- 无需手动调整

### 关键设计
- **单adapter部署**：只需部署一个adapter，无需任务路由
- **任务间知识共享**：提示对齐提高多任务泛化
- **推理高效**：无额外延迟开销

## 实验
### 基准
- GLUE、SuperGLUE
- Massive Multitask Language Understanding (MMLU)
- Commonsense Reasoning

### 对比方法
- MTL-LoRA、MultiLoRa、C-Poly、MoE

### 结果
- 平均准确率提升 6.67%
- 单任务峰值提升 10.75%

## 局限性
- 固定架构对新任务泛化能力有限
- 需要预训练阶段

## 相关工作
- LoRA, Prefix Tuning, Adapter-based, Multi-task Learning
- MTL-LoRA, MultiLoRA, C-Poly, MPT, UniPELT