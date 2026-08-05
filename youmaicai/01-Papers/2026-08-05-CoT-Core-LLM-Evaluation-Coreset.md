# CoT-Core: Accelerating LLM Evaluation via CoT-Aware Coreset Selection

## 基本信息
- **标题**: CoT-Core: Accelerating LLM Evaluation via CoT-Aware Coreset Selection
- **作者**: Qihua Pan, Zhenheng Tang, Peijie Dong, Xiang Liu, Huacan Wang, Bo Li, Xiaowen Chu
- **发表**: arXiv:2608.00014 [cs.AI]
- **日期**: 2026-06-24
- **链接**: [原文](https://arxiv.org/abs/2608.00014) | [PDF](https://arxiv.org/pdf/2608.00014)

## 核心贡献
1. **问题**: LLM评估计算成本高，现有coreset方法存在"冷启动"瓶颈或表面词汇偏差
2. **方法**: CoT-Core利用Chain-of-Thought推理轨迹进行问题聚类，基于内在逻辑等价性而非表面文本相似性
3. **发现**: 推理感知剪枝的效果受任务复杂度内在制约

## 模型架构
- 核心思想：通过zero-shot CoT提示LLM展开推理轨迹
- 将推理路径投影到潜在空间，实现按逻辑等价性聚类

## 实验结果
在GSM8K、MMLU、MMLU-Pro和GPQA上验证：
- 大幅降低评估成本
- 保持高保真度分数估计
- 揭示推理感知剪枝的边界条件

## 关键技术亮点
- **训练无关**: 无需历史日志或Item Response Theory
- **语义聚类**: 词汇差异的问题可因逻辑等价而被聚类
- **效率提升**: 显著减少评估问题数量的同时保持评估质量

## 局限性
- 效果受任务复杂度内在门控
- 简单任务收益有限

## 相关工作
- Coreset Selection for LLM evaluation
- Chain-of-Thought prompting
- Reasoning-aware evaluation

## 标签
#LLM评估 #Chain-of-Thought #coreset #推理 #评估加速
