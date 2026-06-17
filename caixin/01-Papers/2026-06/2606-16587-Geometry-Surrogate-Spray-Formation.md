# Learning Interface Breakup: Geometry-Conditioned Latent Surrogate for Spray Formation

## 论文信息
- **arXiv**: [2606.16587](https://arxiv.org/abs/2606.16587)
- **日期**: 2026-06-15
- **作者**: Nausheen Basha Dr
- **会议**: ICML AI4Physics 2026
- **领域**: physics.flu-dyn, cs.AI, cs.LG, physics.comp-ph

## 摘要 (Abstract)
设计喷嘴需要预测几何形状如何影响瞬态两相破碎，但高保真 VOF 模拟与自适应网格细化 (AMR) 计算成本太高，无法用于迭代设计探索。

**挑战**: 标准替代模型也面临困难——液气界面和底层自适应离散化随时间和几何形状演化。

## 方法创新
**Geometry-conditioned Latent Surrogate**:
- 训练数据: 797 个两相喷嘴模拟
- 编码 AMR 单元密度场（而非完整多通道流状态）作为紧凑代理
- 从该表示重建瞬态密度演化和喷嘴几何
- 轻量级第二阶段恢复剩余流变量

## 性能
- **推理时间**: 0.045 秒/轨迹
- **加速比**: 超过 6×10⁴ 倍（相对于 Basilisk CFD）

## 核心结论
AMR 细化结构可作为瞬态两相流几何条件替代建模的紧凑可学习表示。

## 数值方法
- **基础求解器**: Basilisk (自适应网格细化 VOF)
- **替代模型**: 几何条件潜在代理
- **应用**: 两相流喷雾形成

## 关键词
- Surrogate model
- Two-phase flow
- VOF method
- Adaptive mesh refinement
- Spray formation
- Machine learning

## URL
https://arxiv.org/abs/2606.16587
