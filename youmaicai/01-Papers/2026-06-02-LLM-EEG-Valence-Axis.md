# 🥬 LLM-EEG Valence Axis: The Saturation Regularity

## 基本信息
- **标题:** A Shared Valence Axis Across Modern LLMs and Human EEG: The Saturation Regularity
- **作者:** Yousef A. Radwan, Xuhui Liu, Kilichbek Haydarov, Yuqian Fu, Mohamed Elhoseiny
- **链接:** [arXiv:2606.00129](https://arxiv.org/abs/2606.00129)
- **arXiv:** arXiv:2606.00129
- **分类:** cs.LG, cs.AI

## 核心创新点

1. **V-axis (Valence Axis)** — 从现代 LLMs 用 9 个情感诱发句子构建一维 valence direction
2. **跨模型一致性验证** — 14 个 LLMs 的跨模型一致性
3. **LLM-derived direction 映射到人脑** — 123 名受试者观看情感视频的 EEG 数据
4. **Saturation Regularity** — 25 种对齐策略（知识蒸馏、表示相似性、对比学习、地形损失）无一提升，16 种显著降低准确率
5. **Residual Ensemble** — 通过 residual diversity ensembling，FACED 上平衡准确率提升 10.5%

## 关键发现

1. **LLM valence direction 与人脑神经活动对齐** — 单一线性投影即可追踪刺激的 V-axis 位置
2. **36 个 EEG 情感分类器自发 rediscovers 相同方向** — 在没有 V-axis 监督的情况下
3. **Saturation Regularity** — 任务标签驱动网络到达目标方向后，额外监督反而扭曲已饱和的 basin
4. **改进方向** — 从 residual subspace 而非监督 basin 入手

## 实验结果

- **FACED**: 平衡准确率提升 10.5%（相比 prior best）
- **SEED-V**: 效果 replication

## 局限性

- 仅 valence 一个维度
- 需要 EEG 数据收集

## 建议
- **推荐程度:** ⭐⭐⭐⭐⭐
- **适用场景:** LLM 可解释性、神经科学与人机对齐、情感计算

---
*2026-06-02 收录自 arXiv cs.LG*