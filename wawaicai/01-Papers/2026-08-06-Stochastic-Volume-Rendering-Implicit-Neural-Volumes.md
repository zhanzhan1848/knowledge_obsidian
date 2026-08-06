---
tags: [几何, 体渲染, 神经隐式表示, 时变]
date: 2026-08-06
---

# Query-Efficient Stochastic Volume Rendering for Time-Varying Implicit Neural Volumes

## 核心方法

针对时变隐式神经表示 (INRs) 的高效随机体绘制框架，基于 delta tracking。

### 关键创新点

1. **四阶段管道**：利用异构并行性
   - 光线追踪核心用于遍历
   - 张量核心用于批量神经评估

2. **INR 查询减少策略**：
   - Ray budgeting
   - Query pruning

3. **实时性能**：~30-40 FPS @ 1024×1024 (RTX 4090)
4. **交互式时间探索**：时间步更新约 1-2ms

## 应用场景

- 动态 X-ray CT
- 科学体数据可视化

## 开源实现

- 待公布

## 链接

- arXiv: https://arxiv.org/abs/2607.28047
- PDF: https://arxiv.org/pdf/2607.28047
