# MIRROR: Learning from the Other View for Multi-Modal Reasoning

## 元信息
| 标题 | MIRROR: Learning from the Other View for Multi-Modal Reasoning |
|------|------|
| 作者 | Wen Ye, Yuxiao Qu, Aviral Kumar, Xuezhe Ma |
| 链接 | [原文](https://arxiv.org/abs/2607.21552) |
| arXiv | arXiv:2607.21552 |
| 领域 | cs.AI, cs.LG |

## 核心贡献
1. **问题发现**：VLM在视觉推理上存在不一致——同一问题可能文本成功但图表失败，反之亦然
2. **ODA-Data数据集**：高质量配对多模态几何数据集，包含：
   - 文本主导视图
   - 图像主导视图
   - 组合图像+文本视图
3. **MIRROR方法**：Modality-Informed Reciprocal Reasoning Optimization
   - 强化学习方法，通过自我监督提升多模态推理
   - 选择最佳表现视图作为teacher
   - 用reverse-KL目标训练其他视图

## 方法
- **数据集**：ODA-Data（同问题的不同模态视图）
- **训练策略**：
  - 对每个问题评估所有视图
  - 选择最佳表现视图作为teacher
  - 用reverse-KL散度训练其他视图向teacher学习

## 实验结果
- 在几何推理基准测试上超越标准RL
- 在不同模态间产生更准确和一致的行为

## 关键洞察
- 不同视图暴露互补的推理路径和失败模式
- 标准多模态后训练未能充分利用这种互补性

## 相关工作
- Vision-Language Models
- Multi-Modal Reasoning
- Reinforcement Learning for VLM

## 标签
#VLM #多模态推理 #强化学习 #几何推理 #MIRROR
