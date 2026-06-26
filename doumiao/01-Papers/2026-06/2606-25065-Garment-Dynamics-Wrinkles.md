# Self-supervised Garment Dynamics with Persistent Wrinkles

## 论文信息
- **arXiv**: [2606.25065](https://arxiv.org/abs/2606.25065)
- **标题**: Self-supervised Garment Dynamics with Persistent Wrinkles
- **作者**: Xiaoyuan Yang
- **会议**: ECCV 2026
- **日期**: 2026-06-23 (v1), 2026-06-25 (v2)
- **标签**: #cloth-simulation #self-supervised #wrinkles

## 核心创新点

### 问题
- 现有自监督神经 garment simulator 高效、视觉真实、不依赖训练数据
- 但极大简化了 fabric 的机械性能
- 忽略了由塑性引起的持久褶皱 (persistent wrinkles caused by plasticity)
- 缺乏可信褶皱影响视觉真实感

### 解决方案
- 首个显式建模持久褶皱的自监督神经 garment simulator
- 提出 novel physics-inspired loss function
- 将学习转化为 moving energy minimization 问题以模拟塑性
- 提出 physics-inspired curriculum learning scheme
  - 学习目标从纯弹性逐渐过渡到弹塑性
  - 允许 loss function 和可学习参数共同收敛

### 技术贡献
1. **Physics-inspired loss function**: 模拟塑性的 moving energy minimization
2. **Curriculum learning scheme**: 逐步从弹性过渡到弹塑性
3. **自然持久褶皱生成**: 首次自监督学习模型能生成自然持久褶皱

## 相关工作
- 属于 [[cloth simulation]] 领域
- 相关技术：[[self-supervised learning]], [[energy minimization]], [[plasticity]]

## URL
- Paper: https://arxiv.org/abs/2606.25065
- PDF: https://arxiv.org/pdf/2606.25065

## 评估日期
- 2026-06-26