# A Layer-wise Analysis of Supervised Fine-Tuning

## 元信息
| 标题 | A Layer-wise Analysis of Supervised Fine-Tuning |
|------|-----|
| 作者 | Qinghua Zhao, Xueling Gong, Xinyu Chen, Zhongfeng Kang, Xinlu Li |
| 链接 | [原文](https://arxiv.org/abs/2604.11838) |
| arXiv | arXiv:2604.11838 |
| 代码 | [anonymous.4open.science](https://anonymous.4open.science/r/base_sft) |
| 发表 | ACL 2026 Main conference |

## 核心贡献
1. 系统分析了 SFT 过程中指令遵循能力的层级涌现机制
2. 发现深度相关的模式：**中间层 (20%-80%) 稳定，最终层高度敏感**
3. 提出 **Mid-Block Efficient Tuning**，选择性更新关键中间层

## 方法

### 发现
- **Middle layers (20%-80%)**: 稳定
- **Final layers**: 高敏感性
- 使用信息论、几何和优化指标进行跨模型规模 (1B-32B) 分析

### Mid-Block Efficient Tuning
- 选择性更新关键中间层，而非全部层
- 减少参数开销同时提升性能

## 实验结果
- 在 GSM8K (OLMo2-7B) 上比标准 LoRA 提升达 **10.2%**
- 证明有效的对齐是局部化（localized）而非分布式（distributed）的

## 相关领域
- Supervised Fine-Tuning (SFT)
- LoRA
- Catastrophic Forgetting
- Instruction Following

## 关键词
#fine-tuning #SFT #LoRA #catastrophic-forgetting #ACL2026
