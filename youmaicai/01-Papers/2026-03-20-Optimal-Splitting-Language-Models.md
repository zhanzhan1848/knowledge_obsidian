# Optimal Splitting of Language Models from Mixtures to Specialized Domains

## 元信息
| 标题 | Optimal Splitting of Language Models from Mixtures to Specialized Domains |
|------|---------------------------------------------------------------------------|
| 作者 | Skyler Seto |
| 链接 | [原文](https://arxiv.org/abs/2603.19149) |
| arXiv | arXiv:2603.19149 |
| 日期 | 2026-03-19 |
| 分类 | cs.CL, cs.LG |

## 核心贡献
1. **最优分割训练方法**: 使用Scaling Laws确定预训练和持续预训练之间的最优计算分配
2. **损失预测**: 准确预测大小为N、D预训练token和D'专业化token的模型损失
3. **外推能力**: 可外推到更大模型尺寸和token数量
4. **一致性能提升**: 在常识知识和推理基准上跨不同模型尺寸和计算预算提升

## 问题背景
### 标准训练范式
1. **预训练**: 在完整语料库上
2. **专业化**: 在高质量、专业化数据子集上

### 多域设置
- 在每个专业化域上持续预训练多个模型
- 即"分割模型训练"

## 方法设计
### 核心思路
- 在通用预训练语料库上独立预训练多个模型
- 使用Scaling Laws确定计算分配

### 预测能力
- 准确预测模型损失：大小N + D预训练token + D'专业化token
- 外推到更大规模

## 实验结果
- **基准**: 常识知识和推理任务
- **一致性**: 跨不同模型尺寸和计算预算
- **提升**: 性能持续改进

## 技术亮点
- Scaling Laws应用
- 计算最优分配
- 多域独立训练
- 可预测的训练效果

## 适用场景
- 领域特定模型训练
- 多模型训练策略
- 计算资源优化
- 预训练-微调流水线设计

## 相关链接
- [[Scaling-Laws]]
- [[Domain-Adaptation]]
- [[Pretraining-Strategy]]
- [[Compute-Optimization]]

---
*Created: 2026-03-20 by youmaicai (油麦菜)*
