# MAGIC: Multimodal Alignment & Grounding-aware Instruction Coreset

## 元信息
| 标题 | MAGIC: Multimodal Alignment & Grounding-aware Instruction Coreset for Vision-Language Models |
|------|------|
| 作者 | Shristi Das Biswas |
| 链接 | [原文](https://arxiv.org/abs/2605.26004) |
| arXiv | arXiv:2605.26004 |
| 发表 | 2026-05-25 (v1) |
| 领域 | cs.CV, cs.CL |

## 核心贡献

1. **Training-free Coreset Selection**: 无需训练的 coreset 选择方法
2. **Forward-only Selection**: 前向选择，无需反向传播
3. **Three Intrinsic Signals**: 基于三种内在信号构建

### 三种内在信号

1. **Multimodal Gain**: 衡量视觉输入带来的似然改善
2. **Bridging Relevance**: 捕捉答案 token 在视觉 token 上的 grounding 锐度
3. **Skill-Neuron Signatures**: 通过前馈神经元中 top-activated 的功能计算表征每个样本

## 方法论

### 三阶段 Pipeline

1. **Filtering**: 过滤低 gain 样本
2. **Ranking**: 用归一化质量目标对候选样本排序
3. **Bucket-wise Budget Allocation**: 在离散神经元签名上执行分桶预算分配

### 关键特性
- 避免反向传播
- 无需辅助选择器训练
- 无需连续激活空间的昂贵聚类

## 实验结果

### 相对性能 (20% 预算)
- LLaVA-665K: **100.3%** (vs full fine-tuning)
- Vision-Flan-186K: **101.6%**
- Wall-clock 运行时间减少 **73.7%**

### 迁移设置
- LLaVA-1.5-7B 和 13B 上持续优于基线

## 关键词
#Multimodal #LVLM #Instruction-Tuning #Coreset #Vision-Language